"""Utilities for diagram-wise LFV Higgs decay contributions.

This module provides helpers to:
- build per-diagram symbolic form factors
- sum over neutrino indices per diagram
- evaluate diagram amplitudes numerically
- group diagrams into SM vs new-field sets
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Dict, Iterable, List, Tuple

import numpy as np
from sympy import Matrix, Symbol, conjugate, cos, factor, lambdify, sin, symbols

from neutrinos import UpmnsStandardParametrization, NuOscObservables

from DLRSM1.potential_senjanovic_HiggsDoublets import (
    rho1, k1, vR, epsilon, alpha13, alpha12, alpha23, lamb12, mHR, mH10
)
from DLRSM1.Gauge_Higgs_senjanovic_HiggsDoublets import mW1, mW2, g
from DLRSM1.mixing_matrix_iss1 import (
    GRLmat, GSRmat, OmegaRLmat, OmegaSRmat, QLmat, QLDagger, QRmat, QRDagger,
    SRLmat, TRLmat, TSRmat, Kmat, Jmat, muX, Unu,
    m1, m2, m3, M1m, M2m, M3m, M1p, M2p, M3p,
    unitarity_conditions_UnuDaggerUnu, unitarity_conditions_UnuUnuDagger
)
from DLRSM1.FeynmanRules_senjanovic_H10_Z1_GM import (
    OmegaRL, OmegaSR, QL, QR, TRL, K, J, ml, mn, i, j, a, b
)

from LFVXD.numeric.looptools_pv import (
    B1_0, B2_0, B1_1, B2_1, B12_0, C0_, C1_, C2_, C00, C11, C12, C22
)
import LFVXD.PaVe2 as PaVe
from LFVXD.PaVe2 import D as Dim

from diagram_v2 import all_diagrams


ONE_FERMION_DIAGRAMS = [
    "ni_GL", "GL_ni", "ni_GR", "GR_ni", "ni_HR", "HR_ni",
    "ni_W1", "W1_ni", "ni_W2", "W2_ni",
    "ni_GLp_GLm", "ni_GRp_GRm", "ni_HRp_HRm", "ni_W1p_W1m", "ni_W2p_W2m",
    "ni_GRp_HRm", "ni_HRp_GRm", "ni_W1p_GLm", "ni_W2p_GRm", "ni_W2p_HRm",
    "ni_GLp_W1m", "ni_GRp_W2m", "ni_HRp_W2m",
]

TWO_FERMION_DIAGRAMS = ["GL_ninj", "GR_ninj", "HR_ninj", "W1_ninj", "W2_ninj"]

DEFAULT_SM_TOKENS = ("W1", "GL")
DEFAULT_NEW_TOKENS = ("W2", "GR", "HR")

NEUTRINO_MODE_ALL = "all"
NEUTRINO_MODE_LIGHT = "light"
LIGHT_NEUTRINO_INDICES = tuple(range(3))
ALL_NEUTRINO_INDICES = tuple(range(9))


@dataclass
class StandardModelParameters:
    """Standard Model parameters (all masses in GeV)."""
    me: float = 0.000511
    mmu: float = 0.105
    mtau: float = 1.776
    mW: float = 80.3692
    mZ: float = 91.1876
    mH: float = 125.0
    g: float = 0.653
    k1: float = 246.0

    @property
    def lepton_masses(self) -> np.ndarray:
        return np.array([self.me, self.mmu, self.mtau])


@dataclass
class DLRSMParameters:
    """DLRSM-specific parameters."""
    vR: float = 1e5
    YR: float = 1.0
    muX: float = 1e-3
    alpha12: float = 3.5455 + 4.6905
    alpha13: float = 3.5455 + 1.5826
    alpha23: float = 4.6905 - 1.5826
    rho1: float = 0.6641

    def __post_init__(self) -> None:
        if self.vR <= 0:
            raise ValueError("vR must be positive")
        if self.YR <= 0:
            raise ValueError("YR must be positive")

    @property
    def epsilon(self) -> float:
        return 246.0 / self.vR


@dataclass
class NeutrinoParameters:
    """Neutrino sector parameters."""
    dm21_sq: float = 7.42e-5
    dm31_sq: float = 2.515e-3
    m1: float = 1e-12

    @property
    def masses_eV(self) -> np.ndarray:
        m1_eV = self.m1 * 1e9
        m2_eV = np.sqrt(m1_eV ** 2 + self.dm21_sq)
        m3_eV = np.sqrt(m1_eV ** 2 + self.dm31_sq)
        return np.array([m1_eV, m2_eV, m3_eV])

    @property
    def masses_GeV(self) -> np.ndarray:
        return self.masses_eV * 1e-9


class NeutrinoMixingManager:
    """Manage neutrino mass matrices and mixing."""

    def __init__(self, nu_params: NeutrinoParameters) -> None:
        self.nu_params = nu_params
        self.mass_degeneracy = {
            M2m: M1m, M3m: M1m,
            M1p: M1m, M2p: M1m, M3p: M1m
        }
        self.pmns_matrix = self._setup_pmns_matrix()
        self.mixing_matrices = self._setup_mixing_matrices()

    def _setup_pmns_matrix(self) -> Matrix:
        nudata = NuOscObservables()
        th12, th13, th23 = symbols(r"theta_{12}, theta_{13}, theta_{23}")
        mixing_angles = nudata.substitutions(th12, th13, th23)
        pmns = UpmnsStandardParametrization(th12, th13, th23).subs(mixing_angles)
        self.unu_substitutions = {Unu[i, j]: pmns[i, j] for i in range(3) for j in range(3)}
        return pmns

    def _setup_mixing_matrices(self) -> Dict:
        def simplify_matrix(mat):
            return mat.subs(self.mass_degeneracy).applyfunc(
                lambda x: factor(x.subs(unitarity_conditions_UnuDaggerUnu)
                                 .subs(unitarity_conditions_UnuUnuDagger))
            )

        matrices = {}
        matrices["QL"] = QLmat.subs(self.mass_degeneracy)
        matrices["QR"] = QRmat.subs(self.mass_degeneracy)
        matrices["TRL"] = simplify_matrix(TRLmat)
        matrices["K"] = simplify_matrix(Kmat.applyfunc(lambda x: x.collect([muX], factor)))
        matrices["J"] = simplify_matrix(Jmat.applyfunc(lambda x: x.collect([muX], factor)))
        matrices["OmegaRL"] = simplify_matrix(OmegaRLmat)
        matrices["OmegaSR"] = simplify_matrix(OmegaSRmat)
        return matrices


class FormFactorManager:
    """Manage symbolic form factors for LFV decays."""

    def __init__(self) -> None:
        self.mla, self.mlb, self.mni, self.mnj = symbols(
            "m_la, m_lb, m_ni, m_nj", positive=True
        )
        self.symbolic_elements = self._define_symbolic_elements()
        self.symbolic_changes = self._build_substitution_dict()
        self.h_mutau_diagrams = all_diagrams

    def _define_symbolic_elements(self) -> Dict:
        elements = {}
        for suffix in ["ai", "bi", "bj"]:
            elements[f"QL{suffix}"] = symbols(f"Q_L{suffix}")
            elements[f"QL{suffix}c"] = symbols(f"Q_L{suffix}c")
        for suffix in ["ai", "bi", "bj"]:
            elements[f"QR{suffix}"] = symbols(f"Q_R{suffix}")
            elements[f"QR{suffix}c"] = symbols(f"Q_R{suffix}c")
        for suffix in ["ia", "ib", "jb"]:
            elements[f"TRL{suffix}"] = symbols(f"TRL{suffix}")
            elements[f"TRL{suffix}c"] = symbols(f"TRL{suffix}c")
        for matrix in ["J", "K"]:
            for suffix in ["ai", "bi", "bj"]:
                elements[f"{matrix}{suffix}"] = symbols(f"{matrix}{suffix}")
                elements[f"{matrix}{suffix}c"] = symbols(f"{matrix}{suffix}c")
        elements["OmegaRLij"] = symbols("OmegaRLij")
        elements["OmegaRLijc"] = symbols("OmegaRLijc")
        elements["OmegaSRij"] = symbols("OmegaSRij")
        elements["OmegaSRijc"] = symbols("OmegaSRijc")
        return elements

    def _build_substitution_dict(self) -> Dict:
        sub_dict = {
            ml[a]: self.mla,
            ml[b]: self.mlb,
            mn[i]: self.mni,
            mn[j]: self.mnj,
            Dim: 4,
        }

        elements = self.symbolic_elements
        sub_dict.update({
            QL[a, i]: elements["QLai"],
            QL[b, i]: elements["QLbi"],
            QL[b, j]: elements["QLbj"],
            conjugate(QL[a, i]): elements["QLaic"],
            conjugate(QL[b, i]): elements["QLbic"],
            conjugate(QL[b, j]): elements["QLbjc"],
        })
        sub_dict.update({
            QR[a, i]: elements["QRai"],
            QR[b, i]: elements["QRbi"],
            QR[b, j]: elements["QRbj"],
            conjugate(QR[a, i]): elements["QRaic"],
            conjugate(QR[b, i]): elements["QRbic"],
            conjugate(QR[b, j]): elements["QRbjc"],
        })
        sub_dict.update({
            TRL[i, a]: elements["TRLia"],
            TRL[i, b]: elements["TRLib"],
            TRL[j, b]: elements["TRLjb"],
            conjugate(TRL[i, a]): elements["TRLiac"],
            conjugate(TRL[i, b]): elements["TRLibc"],
            conjugate(TRL[j, b]): elements["TRLjbc"],
        })
        for matrix_sym, matrix_name in [(J, "J"), (K, "K")]:
            sub_dict.update({
                matrix_sym[a, i]: elements[f"{matrix_name}ai"],
                matrix_sym[b, i]: elements[f"{matrix_name}bi"],
                matrix_sym[b, j]: elements[f"{matrix_name}bj"],
                conjugate(matrix_sym[a, i]): elements[f"{matrix_name}aic"],
                conjugate(matrix_sym[b, i]): elements[f"{matrix_name}bic"],
                conjugate(matrix_sym[b, j]): elements[f"{matrix_name}bjc"],
            })
        sub_dict.update({
            OmegaRL[i, j]: elements["OmegaRLij"],
            conjugate(OmegaRL[i, j]): elements["OmegaRLijc"],
            OmegaSR[i, j]: elements["OmegaSRij"],
            conjugate(OmegaSR[i, j]): elements["OmegaSRijc"],
        })
        return sub_dict

    def process_h_lalb_formfactors(self) -> Dict:
        formfactors = {}
        for interaction in ONE_FERMION_DIAGRAMS + TWO_FERMION_DIAGRAMS:
            diagram = self.h_mutau_diagrams[interaction]
            formfactors[interaction] = {
                "AL": self._factor_pv_functions(diagram.AL().factor().subs(self.symbolic_changes)),
                "AR": self._factor_pv_functions(diagram.AR().factor().subs(self.symbolic_changes)),
            }
        return formfactors

    def _factor_pv_functions(self, expr):
        pv_funcs = list(expr.atoms(PaVe.PaVeFunction))
        if pv_funcs:
            expr = expr.expand().collect(pv_funcs, lambda x: factor(x))
        return expr


class DiagramContributionSummation:
    """Sum neutrino indices per diagram for h -> la lb."""

    def __init__(self, formfactors: Dict, mixing_manager: NeutrinoMixingManager,
                 ff_manager: FormFactorManager) -> None:
        self.formfactors = formfactors
        self.mixing = mixing_manager
        self.ff_mgr = ff_manager
        self.neutrino_masses = [m1, m2, m3, M1m, M2m, M3m, M1p, M2p, M3p]
        self.lepton_a = 1
        self.lepton_b = 2

    def sum_diagram(self, diagram_key: str, neutrino_mode: str = NEUTRINO_MODE_ALL) -> Tuple[Symbol, Symbol]:
        if diagram_key in ONE_FERMION_DIAGRAMS:
            return self._sum_one_fermion(diagram_key, neutrino_mode)
        if diagram_key in TWO_FERMION_DIAGRAMS:
            return self._sum_two_fermion(diagram_key, neutrino_mode)
        raise KeyError(f"Unknown diagram key: {diagram_key}")

    def _sum_one_fermion(self, diagram_key: str, neutrino_mode: str) -> Tuple[Symbol, Symbol]:
        ff = self.formfactors[diagram_key]
        AL_total = 0
        AR_total = 0
        for nu_idx in self._neutrino_indices(neutrino_mode):
            subs = self._one_neutrino_substitutions(nu_idx)
            AL_total += ff["AL"].subs(subs)
            AR_total += ff["AR"].subs(subs)
        return AL_total, AR_total

    def _sum_two_fermion(self, diagram_key: str, neutrino_mode: str) -> Tuple[Symbol, Symbol]:
        ff = self.formfactors[diagram_key]
        AL_total = 0
        AR_total = 0
        indices = self._neutrino_indices(neutrino_mode)
        for nu_i in indices:
            for nu_j in indices:
                subs = self._two_neutrino_substitutions(nu_i, nu_j)
                AL_total += ff["AL"].subs(subs)
                AR_total += ff["AR"].subs(subs)
        return AL_total, AR_total

    def _neutrino_indices(self, neutrino_mode: str) -> Tuple[int, ...]:
        if neutrino_mode == NEUTRINO_MODE_LIGHT:
            return LIGHT_NEUTRINO_INDICES
        if neutrino_mode == NEUTRINO_MODE_ALL:
            return ALL_NEUTRINO_INDICES
        raise ValueError(f"Unknown neutrino_mode: {neutrino_mode}")

    def _one_neutrino_substitutions(self, nu_idx: int) -> Dict:
        a_idx, b_idx = self.lepton_a, self.lepton_b
        elements = self.ff_mgr.symbolic_elements
        mixing = self.mixing.mixing_matrices
        return {
            self.ff_mgr.mla: ml[a_idx],
            self.ff_mgr.mlb: ml[b_idx],
            self.ff_mgr.mni: self.neutrino_masses[nu_idx],
            elements["Kai"]: mixing["K"][a_idx, nu_idx],
            elements["Kbi"]: mixing["K"][b_idx, nu_idx],
            elements["Kaic"]: conjugate(mixing["K"][a_idx, nu_idx]),
            elements["Kbic"]: conjugate(mixing["K"][b_idx, nu_idx]),
            elements["QRai"]: mixing["QR"][a_idx, nu_idx],
            elements["QRbi"]: mixing["QR"][b_idx, nu_idx],
            elements["QRaic"]: conjugate(mixing["QR"][a_idx, nu_idx]),
            elements["QRbic"]: conjugate(mixing["QR"][b_idx, nu_idx]),
            elements["QLai"]: mixing["QL"][a_idx, nu_idx],
            elements["QLbi"]: mixing["QL"][b_idx, nu_idx],
            elements["QLaic"]: conjugate(mixing["QL"][a_idx, nu_idx]),
            elements["QLbic"]: conjugate(mixing["QL"][b_idx, nu_idx]),
            elements["TRLia"]: mixing["TRL"][nu_idx, a_idx],
            elements["TRLib"]: mixing["TRL"][nu_idx, b_idx],
            elements["TRLiac"]: conjugate(mixing["TRL"][nu_idx, a_idx]),
            elements["TRLibc"]: conjugate(mixing["TRL"][nu_idx, b_idx]),
            elements["Jai"]: mixing["J"][a_idx, nu_idx],
            elements["Jbi"]: mixing["J"][b_idx, nu_idx],
            elements["Jaic"]: conjugate(mixing["J"][a_idx, nu_idx]),
            elements["Jbic"]: conjugate(mixing["J"][b_idx, nu_idx]),
        }

    def _two_neutrino_substitutions(self, nu_i: int, nu_j: int) -> Dict:
        a_idx, b_idx = self.lepton_a, self.lepton_b
        elements = self.ff_mgr.symbolic_elements
        mixing = self.mixing.mixing_matrices
        return {
            self.ff_mgr.mla: ml[a_idx],
            self.ff_mgr.mlb: ml[b_idx],
            self.ff_mgr.mni: self.neutrino_masses[nu_i],
            self.ff_mgr.mnj: self.neutrino_masses[nu_j],
            elements["Kai"]: mixing["K"][a_idx, nu_i],
            elements["Kbjc"]: conjugate(mixing["K"][b_idx, nu_j]),
            elements["QRai"]: mixing["QR"][a_idx, nu_i],
            elements["QRbjc"]: conjugate(mixing["QR"][b_idx, nu_j]),
            elements["QLai"]: mixing["QL"][a_idx, nu_i],
            elements["QLbjc"]: conjugate(mixing["QL"][b_idx, nu_j]),
            elements["TRLjb"]: mixing["TRL"][nu_j, b_idx],
            elements["TRLiac"]: conjugate(mixing["TRL"][nu_i, a_idx]),
            elements["Jai"]: mixing["J"][a_idx, nu_i],
            elements["Jbjc"]: conjugate(mixing["J"][b_idx, nu_j]),
            elements["OmegaRLij"]: mixing["OmegaRL"][nu_i, nu_j],
            elements["OmegaRLijc"]: conjugate(mixing["OmegaRL"][nu_i, nu_j]),
        }


class DiagramNumericalEvaluator:
    """Create lambdified functions for per-diagram form factors."""

    def __init__(self, diagram_formfactors: Dict[str, Dict[str, Symbol]],
                 sm_params: StandardModelParameters,
                 dlrsm_params: DLRSMParameters) -> None:
        self.sm = sm_params
        self.dlrsm = dlrsm_params
        self.diagram_formfactors = diagram_formfactors
        self.pv_functions = {
            "B1_0": B1_0, "B2_0": B2_0, "B1_1": B1_1,
            "B2_1": B2_1, "B12_0": B12_0,
            "C0": C0_, "C1": C1_, "C2": C2_,
            "C00": C00, "C11": C11, "C12": C12, "C22": C22,
        }
        self._lambdified = self._create_lambdified()

    def _apply_numerical_subs(self, expr):
        lamb12_val = (self.sm.mH ** 2 / (8 * self.sm.k1 ** 2) +
                      self.dlrsm.alpha13 ** 2 / (4 * self.dlrsm.rho1))
        subs = {
            alpha12: self.dlrsm.alpha12,
            alpha13: self.dlrsm.alpha13,
            alpha23: self.dlrsm.alpha23,
            lamb12: lamb12_val,
            rho1: self.dlrsm.rho1,
            g: self.sm.g,
            k1: self.sm.k1,
            mH10: self.sm.mH,
            ml[0]: self.sm.me,
            ml[1]: self.sm.mmu,
            ml[2]: self.sm.mtau,
            epsilon: k1 / vR,
        }
        expr = expr.subs({
            M2m: M1m, M3m: M1m, 
            M1p: M1m, M2p: M1m, M3p: M1m,
        })
        nudata = NuOscObservables()
        th12, th13, th23 = symbols(r"theta_{12}, theta_{13}, theta_{23}")
        mixing_angles = nudata.substitutions(th12, th13, th23)
        pmns = UpmnsStandardParametrization(th12, th13, th23).subs(mixing_angles)
        unu_subs = {Unu[i, j]: pmns[i, j] for i in range(3) for j in range(3)}
        return expr.subs(subs).subs(unu_subs)

    def _create_lambdified(self):
        args = (m1, m2, m3, M1m, mW1, mW2, mHR, vR, muX)
        lambdified = {}
        for name, ff in self.diagram_formfactors.items():
            AL_num = self._apply_numerical_subs(ff["AL"])
            AR_num = self._apply_numerical_subs(ff["AR"])
            lambdified[name] = {
                "AL": lambdify(args, AL_num, modules=[self.pv_functions, "numpy"]),
                "AR": lambdify(args, AR_num, modules=[self.pv_functions, "numpy"]),
            }
        return lambdified

    def evaluate(self, diagram_name: str, vR_val: float, YR_val: float, muX_val: float,
                 mn_vals: np.ndarray) -> Dict[str, complex]:
        if len(mn_vals) != 3:
            raise ValueError(f"Expected 3 neutrino masses, got {len(mn_vals)}")
        M1m_val = YR_val * vR_val / np.sqrt(2)
        mW2_val = np.sqrt((self.sm.mW ** 2 / self.sm.k1 ** 2) * (self.sm.k1 ** 2 + vR_val ** 2))
        mHR_val = np.sqrt(self.dlrsm.alpha23 * (self.sm.k1 ** 2 + vR_val ** 2))
        funcs = self._lambdified[diagram_name]
        AL = funcs["AL"](mn_vals[0], mn_vals[1], mn_vals[2], M1m_val,
                         self.sm.mW, mW2_val, mHR_val, vR_val, muX_val)
        AR = funcs["AR"](mn_vals[0], mn_vals[1], mn_vals[2], M1m_val,
                         self.sm.mW, mW2_val, mHR_val, vR_val, muX_val)
        return {"AL": AL, "AR": AR}

    def evaluate_sum(self, diagram_names: Iterable[str], vR_val: float, YR_val: float,
                     muX_val: float, mn_vals: np.ndarray) -> Dict[str, complex]:
        AL_total = 0.0
        AR_total = 0.0
        for name in diagram_names:
            res = self.evaluate(name, vR_val, YR_val, muX_val, mn_vals)
            AL_total += res["AL"]
            AR_total += res["AR"]
        return {"AL": AL_total, "AR": AR_total}


def compute_partial_width(AL: complex, AR: complex, mH: float, ml_a: float, ml_b: float) -> float:
    mh, ma, mb = abs(mH), abs(ml_a), abs(ml_b)
    if mh <= ma + mb:
        return 0.0
    maij = (1 - ((ma + mb) ** 2) / (mh ** 2)) * (1 - ((ma - mb) ** 2) / (mh ** 2))
    if maij <= 0:
        return 0.0
    phase_space_sqrt = np.sqrt(maij)
    amp_sq_term = (
        (mh ** 2 - ma ** 2 - mb ** 2) * (np.abs(AL) ** 2 + np.abs(AR) ** 2) -
        4 * ma * mb * np.real(AL * np.conj(AR))
    )
    width = (mh / (8 * np.pi)) * phase_space_sqrt * amp_sq_term
    return float(np.nan_to_num(width))


def compute_br_from_width(
    width: float,
    sm_width: float = 4.07e-3,
    lfv_total_width: float = 0.0,
    total_width: float | None = None,
) -> float:
    if total_width is None:
        total_width = sm_width + max(0.0, lfv_total_width)
    if total_width <= 0:
        return 0.0
    return float(width / total_width)


def classify_diagram(name: str, sm_tokens: Tuple[str, ...] = DEFAULT_SM_TOKENS,
                      new_tokens: Tuple[str, ...] = DEFAULT_NEW_TOKENS) -> str:
    is_sm = any(token in name for token in sm_tokens)
    is_new = any(token in name for token in new_tokens)
    if is_sm and not is_new:
        return "sm"
    if is_new and not is_sm:
        return "new"
    if is_sm and is_new:
        return "mixed"
    return "other"


def group_diagrams(names: Iterable[str], sm_tokens: Tuple[str, ...] = DEFAULT_SM_TOKENS,
                   new_tokens: Tuple[str, ...] = DEFAULT_NEW_TOKENS) -> Dict[str, List[str]]:
    groups = {"sm": [], "new": [], "mixed": [], "other": []}
    for name in names:
        groups[classify_diagram(name, sm_tokens, new_tokens)].append(name)
    return groups
