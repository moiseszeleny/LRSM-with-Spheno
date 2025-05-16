from sympy import Symbol, init_printing, conjugate, sin, cos, factor, Matrix
from sympy import lambdify, Symbol, symbols
from sympy.physics.quantum import Dagger
from LFVXD.numeric.qcdloop_pv import B1_0, B2_0, B1_1, B2_1, B12_0, C0_, C1_, C2_

from diagram_v2 import all_diagrams
from LFVXD.PaVe2 import D as Dim

from DLRSM1.block_diagonalization_iss import ULmni, URmni, USmni, I3, eigenvalsMnu, mNi_changes, epsilon, mNi
from DLRSM1.block_diagonalization_iss import dict_Mii2, dict_muii, dict_Mii2_sqrt, dict_sqrt_muii_MDi, dict_Mii, mns_dummys, dummys_mns
from DLRSM1.block_diagonalization_iss import Unu

from DLRSM1.potential_senjanovic_HiggsDoublets import alpha13, alpha12, alpha23, lamb12, rho1, k1, vR, mHR, mH10
from DLRSM1.Gauge_Higgs_senjanovic_HiggsDoublets import mW1, mW2, g

from DLRSM1.FeynmanRules_senjanovic_H10_Z1_GM import QL, QR, TRL, K, J, OmegaRL, OmegaSR, ml, mn, i, j, a, b

from neutrinos import UpmnsStandardParametrization, NuOscObservables
Nudata = NuOscObservables

import mpmath as mp
mp.dps = 120; mp.pretty = True

# light neutrino data
th12,th13,th23 = symbols(r'\theta_{12}, \theta_{13}, \theta_{23}')
mixing_angles = Nudata().substitutions(th12,th13,th23)

Upmns_val = UpmnsStandardParametrization(th12,th13,th23).subs(mixing_angles)
###

URmat = URmni
URT = URmat.T
URc = conjugate(URmat)
URDagger = Dagger(URmat)
ULmat = ULmni
ULT = ULmat.T
ULc = conjugate(ULmat)
ULDagger = Dagger(ULmat)
USmat = USmni
UST = USmat.T
USc = conjugate(USmat)
USDagger = Dagger(USmat)
Vl = I3

eigenvalsMnu = eigenvalsMnu.subs(mNi_changes)

GRLmat = (URT*conjugate(URmat)*(eigenvalsMnu)*ULDagger*ULc).applyfunc(
    lambda x:x.factor()
).subs(dict_Mii2).subs(dict_muii).subs(dict_Mii2_sqrt).applyfunc(
    lambda x:x.factor(deep=True)
).subs(mns_dummys).simplify().subs(dummys_mns)

GSRmat = (USDagger*USc*(eigenvalsMnu)*URDagger*URc).applyfunc(
    lambda x:x.factor()
).subs(dict_Mii2).subs(dict_muii).subs(dict_Mii2_sqrt).applyfunc(
    lambda x:x.factor(deep=True)
).subs(mns_dummys).simplify().subs(dummys_mns)

OmegaRLmat = (GRLmat + GRLmat.T).applyfunc(factor)
OmegaSRmat = (GSRmat + GSRmat.T).applyfunc(factor)

#Gamma_mat = (GRLmat - ((alpha13)/(2*rho1))*epsilon**2*Dagger(GSRmat)).subs(mns_dummys).simplify().subs(dummys_mns).applyfunc(
#    lambda x: x.subs(sin(epsilon)**2, epsilon**2).factor(deep=True)
#)

#Omega_mat = (Gamma_mat + Gamma_mat.T).applyfunc(lambda x:x.expand().collect(rho1, factor))

QLDagger = (ULDagger*Vl).subs(mns_dummys).simplify().subs(dummys_mns)
QLmat = Dagger(QLDagger).subs(mns_dummys).simplify().subs(dummys_mns)

QRDagger = (URT*Vl).subs(mns_dummys).simplify().subs(dummys_mns)
QRmat = Dagger(QRDagger).subs(mns_dummys).simplify().subs(dummys_mns)

SRLmat = (QRmat*(eigenvalsMnu)*ULDagger*ULmat).applyfunc(
    lambda x:x.factor()
).subs(dict_Mii2).subs(dict_muii).subs(dict_Mii2_sqrt).applyfunc(
    lambda x:x.factor(deep=True)
).subs(mns_dummys).simplify().subs(dummys_mns)

TRLmat = (URT*URc*(eigenvalsMnu)*QLDagger).applyfunc(
    lambda x:x.factor()
).subs(dict_Mii2).subs(dict_muii).subs(dict_Mii2_sqrt).applyfunc(
    lambda x:x.factor(deep=True)
).subs(mns_dummys).simplify().subs(dummys_mns)
TRLDagger = Dagger(TRLmat).subs(mns_dummys).simplify().subs(dummys_mns)

TSRmat = (USDagger*USc*(eigenvalsMnu)*URDagger*Vl).applyfunc(
    lambda x:x.factor()
).subs(dict_Mii2).subs(dict_muii).subs(dict_Mii2_sqrt).applyfunc(
    lambda x:x.factor(deep=True)
).subs(mns_dummys).simplify().subs(dummys_mns)
TSRDagger = Dagger(TSRmat).subs(mns_dummys).simplify().subs(dummys_mns)

Kmat = (SRLmat - epsilon**2*TSRDagger).applyfunc(
    lambda x:x.factor()
).subs(dict_Mii2).subs(dict_muii).subs(dict_Mii2_sqrt).applyfunc(
    lambda x:x.factor(deep=True)
).subs(mns_dummys).simplify().subs(dummys_mns)
KDagger = Dagger(Kmat).subs(mns_dummys).simplify().subs(dummys_mns)


Jmat = (TSRDagger + SRLmat).applyfunc(
    lambda x:x.factor()
).subs(dict_Mii2).subs(dict_muii).subs(dict_Mii2_sqrt).applyfunc(
    lambda x:x.factor(deep=True)
).subs(mns_dummys).simplify().subs(dummys_mns)
JDagger = Dagger(Jmat).subs(mns_dummys).simplify().subs(dummys_mns)

# symbolic variables to replace
mla, mlb, mni, mnj = symbols('m_{l_a}, m_{l_b}, m_{n_i}, m_{n_j}', positive=True)

QLai = symbols('Q_{Lai}')
QLbi = symbols('Q_{Lbi}')
QLbj = symbols('Q_{Lbj}')
QLaic = symbols(r'\overline{Q_{Lai}}')
QLbic = symbols(r'\overline{Q_{Lbi}}')
QLbjc = symbols(r'\overline{Q_{Lbj}}')
QRai = symbols('Q_{Rai}')
QRbi = symbols('Q_{Rbi}')
QRbj = symbols('Q_{Rbj}')
QRaic = symbols(r'\overline{Q_{Rai}}')
QRbic = symbols(r'\overline{Q_{Rbi}}')
QRbjc = symbols(r'\overline{Q_{Rbj}}')
TRLib = symbols('T_{RLib}')
TRLjb = symbols('T_{RLjb}')
TRLia = symbols('T_{RLia}')
TRLiac  = symbols(r'\overline{T_{RLia}}')
TRLibc  = symbols(r'\overline{T_{RLib}}')
TRLjbc  = symbols(r'\overline{T_{RLjb}}')
Jai = symbols('J_{ai}')
Jbi = symbols('J_{bi}')
Jbj = symbols('J_{bj}')
Jaic = symbols(r'\overline{J_{ai}}')
Jbic = symbols(r'\overline{J_{bi}}')
Jbjc = symbols(r'\overline{J_{bj}}')
Kai = symbols('K_{ai}')
Kbi = symbols('K_{bi}')
Kbj = symbols('K_{bj}')
Kaic = symbols(r'\overline{K_{ai}}')
Kbic = symbols(r'\overline{K_{bi}}')
Kbjc = symbols(r'\overline{K_{bj}}')
OmegaRLij = symbols(r'\Omega_{RLij}')
OmegaRLijc = symbols(r'\overline{\Omega_{RLij}}')
OmegaSRij = symbols(r'\Omega_{SRij}')
OmegaSRijc = symbols(r'\overline{\Omega_{SRij}}')

# Symbolic changes
symbolic_changes = {
    ml[a]:mla,
    ml[b]:mlb,
    mn[i]:mni,
    mn[j]:mnj,
    QL[a,i]:QLai,
    QL[b,i]:QLbi,
    QL[b,j]:QLbj,
    conjugate(QL[a, i]):QLaic,
    conjugate(QL[b, i]):QLbic,
    conjugate(QL[b, j]):QLbjc,
    QR[a,i]:QRai,
    QR[b,i]:QRbi,
    QR[b,j]:QRbj,
    conjugate(QR[a, i]):QRaic,
    conjugate(QR[b, i]):QRbic,
    conjugate(QR[b, j]):QRbjc,
    TRL[i, a]:TRLia,
    TRL[i, b]:TRLib,
    TRL[j, b]:TRLjb,
    conjugate(TRL[i, a]):TRLiac,
    conjugate(TRL[i, b]):TRLibc,
    conjugate(TRL[j, b]):TRLjbc,
    J[a,i]:Jai,
    J[b,i]:Jbi,
    J[b,j]:Jbj,
    conjugate(J[a,i]):Jaic,
    conjugate(J[b,i]):Jbic,
    conjugate(J[b,j]):Jbjc,
    K[a,i]:Kai,
    K[b,i]:Kbi,
    K[b,j]:Kbj,
    conjugate(K[a,i]):Kaic,
    conjugate(K[b,i]):Kbic,
    conjugate(K[b,j]):Kbjc,
    OmegaRL[i, j]:OmegaRLij,
    conjugate(OmegaRL[i,j]):OmegaRLijc,
    OmegaSR[i, j]:OmegaSRij,
    conjugate(OmegaSR[i,j]):OmegaSRijc,
    Dim:4,
}
#symbolic form factors
bubbles = ['ni_GL', 'GL_ni', 'ni_GR', 'GR_ni', 'ni_HR', 'HR_ni', 'ni_W1', 'W1_ni', 'ni_W2', 'W2_ni']
bubble_diagrams = {interaction:all_diagrams[interaction] for interaction in bubbles}
symbolic_formfactor_bubble = {
    interaction:{
        'AL':diagram.AL().factor().subs(symbolic_changes),
        'AR':diagram.AR().factor().subs(symbolic_changes)
    } for interaction, diagram in bubble_diagrams.items()
}

triangles_onefermion = [
    'ni_GLp_GLm', 'ni_GRp_GRm', 'ni_HRp_HRm', 'ni_W1p_W1m',  'ni_W2p_W2m',
    'ni_GRp_HRm', 'ni_HRp_GRm', 'ni_W1p_GLm', 'ni_W2p_GRm', 'ni_W2p_HRm',
    'ni_GLp_W1m', 'ni_GRp_W2m', 'ni_HRp_W2m'
]
triangle_diagrams_onefermion = {interaction:all_diagrams[interaction] for interaction in triangles_onefermion}
symbolic_formfactor_triangle_onefermion = {
    interaction:{
        'AL':diagram.AL().expand().collect(
            [rho1], factor
        ).subs(symbolic_changes),
        'AR':diagram.AR().expand().collect(
            [rho1], factor
        ).subs(symbolic_changes)
    } for interaction, diagram in triangle_diagrams_onefermion.items()
}

triangles_twofermion = [
    'GL_ninj', 'GR_ninj', 'HR_ninj', 'W1_ninj', 'W2_ninj'
]
triangle_diagrams_twofermion = {interaction:all_diagrams[interaction] for interaction in triangles_twofermion}
symbolic_formfactor_triangle_twofermion = {
    interaction:{
        'AL':diagram.AL().factor().subs(symbolic_changes),
        'AR':diagram.AR().factor().subs(symbolic_changes)
    } for interaction, diagram in triangle_diagrams_twofermion.items()
}

symbolic_formfactor = {
    **symbolic_formfactor_bubble,
    **symbolic_formfactor_triangle_onefermion,
    **symbolic_formfactor_triangle_twofermion
}

# Passarino-Veltman functions definitions
pv_functions = {
    'B1_0':B1_0,
    'B2_0':B2_0,
    'B1_1':B1_1,
    'B2_1':B2_1,
    'B12_0':B12_0,
    'C0': C0_,
    'C1': C1_,
    'C2': C2_
}

# Helper map from string keys in _interaction_configs to actual SymPy symbols
# This is used to programmatically build the argument lists for lambdify.
symbol_map_from_config_keys = {
    'mW1_val': mW1, 'mW2_val': mW2, 'mHR_val': mHR, 'mH10_val': mH10,
    'k1_val': k1, 'vR_val': vR, 'g_val': g,
    'rho1_val': rho1, 'alpha13_val': alpha13, 'alpha12_val': alpha12,
    'alpha23_val': alpha23, 'lamb12_val': lamb12, 'epsilon_val': epsilon
}

# Helper function to create lambdified form factor pairs
def _create_lambdified_ff_pair(al_expr, ar_expr, arg_symbols_list, pv_funcs_dict):
    """Creates a pair of lambdified functions for AL and AR."""
    return {
        'AL': lambdify(arg_symbols_list, al_expr, modules=[pv_funcs_dict, 'mpmath']),
        'AR': lambdify(arg_symbols_list, ar_expr, modules=[pv_funcs_dict, 'mpmath'])
    }

# Common symbolic arguments for form factors
_common_ff_args_sym = [mni, mla, mlb]
_common_ff_args_sym_GL_ninj = [mni, mnj, mla, mlb] # For GL_ninj

# mixing matrix numeric
Unu_changes = {
        Unu[i,j]:Upmns_val[i,j] for i in range(3) for j in range(3)
    }

QL_lamb = lambdify([epsilon, mNi[3], mNi[4], mNi[5], mNi[6], mNi[7], mNi[8]], QLmat.subs(
    Unu_changes
), 'mpmath')
QR_lamb = lambdify([epsilon, mNi[3], mNi[4], mNi[5], mNi[6], mNi[7], mNi[8]], QRmat, 'mpmath')
TRL_lamb = lambdify([epsilon, mNi[3], mNi[4], mNi[5], mNi[6], mNi[7], mNi[8]], TRLmat.subs(
    Unu_changes
), 'mpmath')
J_lamb = lambdify([epsilon, mNi[3], mNi[4], mNi[5], mNi[6], mNi[7], mNi[8]], Jmat.subs(
    Unu_changes
), 'mpmath')
K_lamb = lambdify([epsilon, mNi[3], mNi[4], mNi[5], mNi[6], mNi[7], mNi[8]], Kmat.subs(
    Unu_changes
), 'mpmath')
OmegaRL_lamb = lambdify([epsilon, mNi[3], mNi[4], mNi[5], mNi[6], mNi[7], mNi[8]], OmegaRLmat.subs(
    Unu_changes
), 'mpmath')
OmegaSR_lamb = lambdify([epsilon, mNi[3], mNi[4], mNi[5], mNi[6], mNi[7], mNi[8]], OmegaSRmat.subs(
    Unu_changes
), 'mpmath')

# Configuration for _calculate_interaction_formfactors
_interaction_configs = {
    'ni_GL': {
        'ordered_coupling_symbols': [QLai, QLbic, TRLib, TRLiac],
        'couplings': [
            {'matrix_name': 'QL', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QL', 'idx_keys': ('b', 'i'), 'conj': True},
            {'matrix_name': 'TRL','idx_keys': ('i', 'b'), 'conj': False},
            {'matrix_name': 'TRL','idx_keys': ('i', 'a'), 'conj': True}
        ],
        'boson_mass_key': 'mW1_val',
        'extra_param_keys': ['k1_val']
    },
    'GL_ni': {
        'ordered_coupling_symbols': [QLbi, QLaic, TRLia, TRLibc],
        'couplings': [
            {'matrix_name': 'QL', 'idx_keys': ('b', 'i'), 'conj': False},
            {'matrix_name': 'QL', 'idx_keys': ('a', 'i'), 'conj': True},
            {'matrix_name': 'TRL','idx_keys': ('i', 'a'), 'conj': False},
            {'matrix_name': 'TRL','idx_keys': ('i', 'b'), 'conj': True}
        ],
        'boson_mass_key': 'mW1_val',
        'extra_param_keys': ['k1_val']
    },
    'ni_GR': {
        'ordered_coupling_symbols': [QRai, QRbic, Jai, Jbic],
        'couplings': [
            {'matrix_name': 'QR', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QR', 'idx_keys': ('b', 'i'), 'conj': True},
            {'matrix_name': 'J',  'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'J',  'idx_keys': ('b', 'i'), 'conj': True}
        ],
        'boson_mass_key': 'mW2_val',
        'extra_param_keys': ['k1_val', 'vR_val']
    },
    'GR_ni': {
        'ordered_coupling_symbols': [QRbi, QRaic, Jbi, Jaic],
        'couplings': [
            {'matrix_name': 'QR', 'idx_keys': ('b', 'i'), 'conj': False},
            {'matrix_name': 'QR', 'idx_keys': ('a', 'i'), 'conj': True},
            {'matrix_name': 'J',  'idx_keys': ('b', 'i'), 'conj': False},
            {'matrix_name': 'J',  'idx_keys': ('a', 'i'), 'conj': True}
        ],
        'boson_mass_key': 'mW2_val',
        'extra_param_keys': ['k1_val', 'vR_val']
    },
    'ni_HR': {
        'ordered_coupling_symbols': [QRai, QRbic, Kai, Kbic],
        'couplings': [
            {'matrix_name': 'QR', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QR', 'idx_keys': ('b', 'i'), 'conj': True},
            {'matrix_name': 'K',  'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'K',  'idx_keys': ('b', 'i'), 'conj': True}
        ],
        'boson_mass_key': 'mHR_val',
        'extra_param_keys': ['k1_val']
    },
    'HR_ni': {
        'ordered_coupling_symbols': [QRbi, QRaic, Kbi, Kaic],
        'couplings': [
            {'matrix_name': 'QR', 'idx_keys': ('b', 'i'), 'conj': False},
            {'matrix_name': 'QR', 'idx_keys': ('a', 'i'), 'conj': True},
            {'matrix_name': 'K',  'idx_keys': ('b', 'i'), 'conj': False},
            {'matrix_name': 'K',  'idx_keys': ('a', 'i'), 'conj': True}
        ],
        'boson_mass_key': 'mHR_val',
        'extra_param_keys': ['k1_val']
    },
    'ni_W1': {
        'ordered_coupling_symbols': [QLai, QLbic],
        'couplings': [
            {'matrix_name': 'QL', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QL', 'idx_keys': ('b', 'i'), 'conj': True}
        ],
        'boson_mass_key': 'mW1_val',
        'extra_param_keys': ['k1_val', 'g_val']
    },
    'W1_ni': {
        'ordered_coupling_symbols': [QLbi, QLaic],
        'couplings': [
            {'matrix_name': 'QL', 'idx_keys': ('b', 'i'), 'conj': False},
            {'matrix_name': 'QL', 'idx_keys': ('a', 'i'), 'conj': True}
        ],
        'boson_mass_key': 'mW1_val',
        'extra_param_keys': ['k1_val', 'g_val']
    },
    'ni_W2': {
        'ordered_coupling_symbols': [QRai, QRbic],
        'couplings': [
            {'matrix_name': 'QR', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QR', 'idx_keys': ('b', 'i'), 'conj': True}
        ],
        'boson_mass_key': 'mW2_val',
        'extra_param_keys': ['k1_val', 'g_val']
    },
    'W2_ni': {
        'ordered_coupling_symbols': [QRbi, QRaic],
        'couplings': [
            {'matrix_name': 'QR', 'idx_keys': ('b', 'i'), 'conj': False},
            {'matrix_name': 'QR', 'idx_keys': ('a', 'i'), 'conj': True}
        ],
        'boson_mass_key': 'mW2_val',
        'extra_param_keys': ['k1_val', 'g_val']
    },
    'ni_GLp_GLm': {
        'ordered_coupling_symbols': [QLai, QLbic, TRLib, TRLiac],
        'couplings': [
            {'matrix_name': 'QL', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QL', 'idx_keys': ('b', 'i'), 'conj': True},
            {'matrix_name': 'TRL','idx_keys': ('i', 'b'), 'conj': False},
            {'matrix_name': 'TRL','idx_keys': ('i', 'a'), 'conj': True}
        ],
        'boson_mass_key': ['mW1_val', 'mH10_val'],
        'extra_param_keys': ['k1_val', 'rho1_val', 'alpha13_val', 'lamb12_val']
    },
    'ni_GRp_GRm': {
        'ordered_coupling_symbols': [QRai, QRbic, Jai, Jbic],
        'couplings': [
            {'matrix_name': 'QR', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QR', 'idx_keys': ('b', 'i'), 'conj': True},
            {'matrix_name': 'J','idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'J','idx_keys': ('b', 'i'), 'conj': True}
        ],
        'boson_mass_key': ['mW2_val', 'mH10_val'],
        'extra_param_keys': ['k1_val', 'vR_val', 'rho1_val', 'alpha13_val', 'lamb12_val']
    },
    'ni_HRp_HRm': {
        'ordered_coupling_symbols': [QRai, QRbic, Kai, Kbic],
        'couplings': [
            {'matrix_name': 'QR', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QR', 'idx_keys': ('b', 'i'), 'conj': True},
            {'matrix_name': 'K','idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'K','idx_keys': ('b', 'i'), 'conj': True}
        ],
        'boson_mass_key': ['mHR_val', 'mH10_val'],
        'extra_param_keys': ['k1_val', 'vR_val', 'rho1_val', 'alpha13_val', 'alpha12_val', 'alpha23_val', 'lamb12_val']
    },
    'ni_W1p_W1m': {
        'ordered_coupling_symbols': [QLai, QLbic],
        'couplings': [
            {'matrix_name': 'QL', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QL', 'idx_keys': ('b', 'i'), 'conj': True}
        ],
        'boson_mass_key': ['mW1_val', 'mH10_val'],
        'extra_param_keys': ['k1_val', 'g_val']
    },
    'ni_W2p_W2m': {
        'ordered_coupling_symbols': [QRai, QRbic],
        'couplings': [
            {'matrix_name': 'QR', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QR', 'idx_keys': ('b', 'i'), 'conj': True}
        ],
        'boson_mass_key': ['mW2_val', 'mH10_val'],
        'extra_param_keys': ['k1_val', 'g_val', 'rho1_val', 'alpha13_val']
    },
    'ni_GRp_HRm': {
        'ordered_coupling_symbols': [QRai, QRbic, Kai, Jbic],
        'couplings': [
            {'matrix_name': 'QR', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QR', 'idx_keys': ('b', 'i'), 'conj': True},
            {'matrix_name': 'K','idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'J','idx_keys': ('b', 'i'), 'conj': True}
        ],
        'boson_mass_key': ['mW1_val', 'mW2_val', 'mHR_val', 'mH10_val'],
        'extra_param_keys': ['k1_val', 'vR_val', 'rho1_val', 'alpha13_val', 'alpha12_val', 'alpha23_val', 'lamb12_val']
    },
    'ni_HRp_GRm': {
        'ordered_coupling_symbols': [QRai, QRbic, Jai, Kbic],
        'couplings': [
            {'matrix_name': 'QR', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QR', 'idx_keys': ('b', 'i'), 'conj': True},
            {'matrix_name': 'J','idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'K','idx_keys': ('b', 'i'), 'conj': True}
        ],
        'boson_mass_key': ['mW2_val', 'mHR_val', 'mH10_val'],
        'extra_param_keys': ['k1_val', 'vR_val', 'rho1_val', 'alpha13_val', 'alpha12_val', 'alpha23_val', 'lamb12_val']
    },
    'ni_W1p_GLm': {
        'ordered_coupling_symbols': [QLai, QLbic, TRLiac],
        'couplings': [
            {'matrix_name': 'QL', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QL', 'idx_keys': ('b', 'i'), 'conj': True},
            {'matrix_name': 'TRL', 'idx_keys': ('i', 'a'), 'conj': True}
        ],
        'boson_mass_key': ['mW1_val', 'mH10_val'],
        'extra_param_keys': ['k1_val', 'g_val']
    },
    'ni_W2p_GRm': {
        'ordered_coupling_symbols': [QRai, QRbic, Jai],
        'couplings': [
            {'matrix_name': 'QR', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QR', 'idx_keys': ('b', 'i'), 'conj': True},
            {'matrix_name': 'J', 'idx_keys': ('a', 'i'), 'conj': False}
        ],
        'boson_mass_key': ['mW2_val', 'mH10_val'],
        'extra_param_keys': ['k1_val', 'vR_val', 'g_val', 'rho1_val', 'alpha13_val']
    },
    'ni_W2p_HRm': {
        'ordered_coupling_symbols': [QRai, QRbic, Kai],
        'couplings': [
            {'matrix_name': 'QR', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QR', 'idx_keys': ('b', 'i'), 'conj': True},
            {'matrix_name': 'K', 'idx_keys': ('a', 'i'), 'conj': False}
        ],
        'boson_mass_key': ['mW2_val', 'mHR_val', 'mH10_val'],
        'extra_param_keys': ['k1_val', 'vR_val', 'g_val', 'rho1_val', 'alpha13_val']
    },
    'ni_GLp_W1m': {
        'ordered_coupling_symbols': [QLai, QLbic, TRLib],
        'couplings': [
            {'matrix_name': 'QL', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QL', 'idx_keys': ('b', 'i'), 'conj': True},
            {'matrix_name': 'TRL', 'idx_keys': ('i', 'b'), 'conj': False}
        ],
        'boson_mass_key': ['mW1_val', 'mH10_val'],
        'extra_param_keys': ['k1_val', 'g_val']
    },
    'ni_GRp_W2m': {
        'ordered_coupling_symbols': [QRai, QRbic, Jbic],
        'couplings': [
            {'matrix_name': 'QR', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QR', 'idx_keys': ('b', 'i'), 'conj': True},
            {'matrix_name': 'J', 'idx_keys': ('b', 'i'), 'conj': True}
        ],
        'boson_mass_key': ['mW2_val', 'mH10_val'],
        'extra_param_keys': ['k1_val', 'vR_val', 'g_val', 'rho1_val', 'alpha13_val']
    },
    'ni_HRp_W2m': {
        'ordered_coupling_symbols': [QRai, QRbic, Kbic],
        'couplings': [
            {'matrix_name': 'QR', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QR', 'idx_keys': ('b', 'i'), 'conj': True},
            {'matrix_name': 'K', 'idx_keys': ('b', 'i'), 'conj': True}
        ],
        'boson_mass_key': ['mW2_val', 'mHR_val', 'mH10_val'],
        'extra_param_keys': ['k1_val', 'vR_val', 'g_val', 'rho1_val', 'alpha13_val']
    },
    'GL_ninj': {
        'ordered_coupling_symbols': [
            QLai, QLbjc, TRLjb, TRLiac, 
            OmegaRLij, OmegaRLijc, OmegaSRij, OmegaSRijc
        ],
        'couplings': [
            {'matrix_name': 'QL', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QL', 'idx_keys': ('b', 'j'), 'conj': True},
            {'matrix_name': 'TRL','idx_keys': ('j', 'b'), 'conj': False},
            {'matrix_name': 'TRL','idx_keys': ('i', 'a'), 'conj': True},
            {'matrix_name': 'OmegaRL','idx_keys': ('i', 'j'), 'conj': False},
            {'matrix_name': 'OmegaRL','idx_keys': ('i', 'j'), 'conj': True},
            {'matrix_name': 'OmegaSR','idx_keys': ('i', 'j'), 'conj': False},
            {'matrix_name': 'OmegaSR','idx_keys': ('i', 'j'), 'conj': True}
        ],
        'boson_mass_key': ['mW1_val', 'mH10_val'],
        'extra_param_keys': ['k1_val', 'rho1_val', 'alpha13_val', 'epsilon_val']
    },
    'GR_ninj': {
        'ordered_coupling_symbols': [
            QRai, QRbjc, Jai, Jbjc,  
            OmegaRLij, OmegaRLijc, OmegaSRij, OmegaSRijc
        ],
        'couplings': [
            {'matrix_name': 'QR', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QR', 'idx_keys': ('b', 'j'), 'conj': True},
            {'matrix_name': 'J','idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'J','idx_keys': ('b', 'j'), 'conj': True},
            {'matrix_name': 'OmegaRL','idx_keys': ('i', 'j'), 'conj': False},
            {'matrix_name': 'OmegaRL','idx_keys': ('i', 'j'), 'conj': True},
            {'matrix_name': 'OmegaSR','idx_keys': ('i', 'j'), 'conj': False},
            {'matrix_name': 'OmegaSR','idx_keys': ('i', 'j'), 'conj': True}
        ],
        'boson_mass_key': ['mW2_val', 'mH10_val'],
        'extra_param_keys': ['k1_val', 'vR_val', 'rho1_val', 'alpha13_val', 'epsilon_val']
    },
    'HR_ninj': {
        'ordered_coupling_symbols': [
            QRai, QRbjc, Kai, Kbjc,  
            OmegaRLij, OmegaRLijc, OmegaSRij, OmegaSRijc
        ],
        'couplings': [
            {'matrix_name': 'QR', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QR', 'idx_keys': ('b', 'j'), 'conj': True},
            {'matrix_name': 'K','idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'K','idx_keys': ('b', 'j'), 'conj': True},
            {'matrix_name': 'OmegaRL','idx_keys': ('i', 'j'), 'conj': False},
            {'matrix_name': 'OmegaRL','idx_keys': ('i', 'j'), 'conj': True},
            {'matrix_name': 'OmegaSR','idx_keys': ('i', 'j'), 'conj': False},
            {'matrix_name': 'OmegaSR','idx_keys': ('i', 'j'), 'conj': True}
        ],
        'boson_mass_key': ['mHR_val', 'mH10_val'],
        'extra_param_keys': ['k1_val', 'rho1_val', 'alpha13_val', 'epsilon_val']
    },
    'W1_ninj': {
        'ordered_coupling_symbols': [
            QLai, QLbjc, TRLjb, TRLiac, 
            OmegaRLij, OmegaRLijc, OmegaSRij, OmegaSRijc
        ],
        'couplings': [
            {'matrix_name': 'QL', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QL', 'idx_keys': ('b', 'j'), 'conj': True},
            {'matrix_name': 'TRL','idx_keys': ('j', 'b'), 'conj': False},
            {'matrix_name': 'TRL','idx_keys': ('i', 'a'), 'conj': True},
            {'matrix_name': 'OmegaRL','idx_keys': ('i', 'j'), 'conj': False},
            {'matrix_name': 'OmegaRL','idx_keys': ('i', 'j'), 'conj': True},
            {'matrix_name': 'OmegaSR','idx_keys': ('i', 'j'), 'conj': False},
            {'matrix_name': 'OmegaSR','idx_keys': ('i', 'j'), 'conj': True}
        ],
        'boson_mass_key': ['mW1_val', 'mH10_val'],
        'extra_param_keys': ['k1_val', 'g_val', 'rho1_val', 'alpha13_val', 'epsilon_val']
    },
    'W2_ninj': {
        'ordered_coupling_symbols': [
            QRai, QRbjc, 
            OmegaRLij, OmegaRLijc, OmegaSRij, OmegaSRijc
        ],
        'couplings': [
            {'matrix_name': 'QR', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QR', 'idx_keys': ('b', 'j'), 'conj': True},
            {'matrix_name': 'OmegaRL','idx_keys': ('i', 'j'), 'conj': False},
            {'matrix_name': 'OmegaRL','idx_keys': ('i', 'j'), 'conj': True},
            {'matrix_name': 'OmegaSR','idx_keys': ('i', 'j'), 'conj': False},
            {'matrix_name': 'OmegaSR','idx_keys': ('i', 'j'), 'conj': True}
        ],
        'boson_mass_key': ['mW2_val', 'mH10_val'],
        'extra_param_keys': ['k1_val', 'g_val', 'rho1_val', 'alpha13_val', 'epsilon_val']
    },
}

two_neutrino_interactions = ['GL_ninj', 'GR_ninj', 'HR_ninj', 'W1_ninj', 'W2_ninj']
# Lambdify symbolic form factors
function_formfactors = {}
for int_key, config in _interaction_configs.items():
    al_expr = symbolic_formfactor[int_key]['AL']
    ar_expr = symbolic_formfactor[int_key]['AR']

    # Construct the ordered list of symbols for lambdify's arguments
    current_lambdify_args_syms = []
    
    # 1. Coupling symbols (defined in config)
    current_lambdify_args_syms.extend(config['ordered_coupling_symbols'])
    
    # 2. Boson mass symbols
    boson_mass_keys = config['boson_mass_key']
    if isinstance(boson_mass_keys, list):
        for k_val_str in boson_mass_keys:
            current_lambdify_args_syms.append(symbol_map_from_config_keys[k_val_str])
    else:
        current_lambdify_args_syms.append(symbol_map_from_config_keys[boson_mass_keys])
        
    # 3. Fermion mass symbols
    if int_key in two_neutrino_interactions:
        current_lambdify_args_syms.extend(_common_ff_args_sym_GL_ninj)
    else:
        current_lambdify_args_syms.extend(_common_ff_args_sym)
    
    # 4. Extra parameter symbols
    for k_val_str in config['extra_param_keys']:
        current_lambdify_args_syms.append(symbol_map_from_config_keys[k_val_str])

    # Validation: Check if all free symbols in the expressions are covered
    module_symbols = {Symbol(name) for name in pv_functions.keys()}
    actual_free_symbols = al_expr.free_symbols.union(ar_expr.free_symbols)
    provided_symbols_set = set(current_lambdify_args_syms)
    
    missing_symbols = actual_free_symbols - provided_symbols_set - module_symbols
    if missing_symbols:
        raise ValueError(
            f"For interaction '{int_key}', the following symbols are in the expressions "
            f"but not in the generated argument list for lambdify: {missing_symbols}.\n"
            f"AL free symbols: {al_expr.free_symbols}\nAR free symbols: {ar_expr.free_symbols}\n"
            f"Generated arg list: {current_lambdify_args_syms}"
        )

    function_formfactors[int_key] = _create_lambdified_ff_pair(al_expr, ar_expr, current_lambdify_args_syms, pv_functions)

import concurrent.futures

def _single_ff_args(args):
    # Unpack all arguments
    (
        interaction_key, two_neutrino_interactions, couplings, boson_mass_key, extra_param_keys,
        ff_AL, ff_AR, matrix_values, param_values, mni_masses, ml_a_val, ml_b_val, a_idx, b_idx, args_indices
    ) = args

    if interaction_key in two_neutrino_interactions:
        i, j = args_indices
        mni_val = mni_masses[i]
        mnj_val = mni_masses[j]
        current_ff_args = []
        for c in couplings:
            mat = matrix_values[c['matrix_name']]
            idx = tuple(
                a_idx if k == 'a' else b_idx if k == 'b' else i if k == 'i' else j
                for k in c['idx_keys']
            )
            val = mat[idx]
            if c['conj']:
                val = mp.conj(val)
            current_ff_args.append(val)
        # Boson mass
        if isinstance(boson_mass_key, list):
            current_ff_args.extend(param_values[k] for k in boson_mass_key)
        else:
            current_ff_args.append(param_values[boson_mass_key])
        # Particle masses
        current_ff_args.extend([mni_val, mnj_val, ml_a_val, ml_b_val])
        # Extra params
        current_ff_args.extend(param_values[k] for k in extra_param_keys)
        return ff_AL(*current_ff_args), ff_AR(*current_ff_args)
    else:
        i = args_indices
        mni_val = mni_masses[i]
        current_ff_args = []
        for c in couplings:
            mat = matrix_values[c['matrix_name']]
            idx = tuple(
                a_idx if k == 'a' else b_idx if k == 'b' else i
                for k in c['idx_keys']
            )
            val = mat[idx]
            if c['conj']:
                val = mp.conj(val)
            current_ff_args.append(val)
        if isinstance(boson_mass_key, list):
            current_ff_args.extend(param_values[k] for k in boson_mass_key)
        else:
            current_ff_args.append(param_values[boson_mass_key])
        current_ff_args.extend([mni_val, ml_a_val, ml_b_val])
        current_ff_args.extend(param_values[k] for k in extra_param_keys)
        return ff_AL(*current_ff_args), ff_AR(*current_ff_args)

def _calculate_interaction_formfactors(
    interaction_key, num_neutrinos,
    QL_val, TRL_val, QR_val, J_val, K_val, OmegaRL_val, OmegaSR_val,
    mW1_val, mW2_val, mHR_val, mH10_val,
    k1_val, vR_val,
    g_val, rho1_val, alpha13_val, alpha12_val, alpha23_val, lamb12_val, epsilon_val,
    mni_masses, ml_a_val, ml_b_val,
    a_idx, b_idx,
    verbose=False,
    parallel=False,  # new argument
    max_workers=None # new argument
):
    """Helper function to sum form factor contributions for a given interaction type."""
    al_sum = mp.mpf(0)
    ar_sum = mp.mpf(0)

    config = _interaction_configs[interaction_key]
    ff_AL = function_formfactors[interaction_key]['AL']
    ff_AR = function_formfactors[interaction_key]['AR']

    # Pre-resolve matrix and parameter values for faster access
    matrix_values = {
        'QL': QL_val, 'TRL': TRL_val, 'QR': QR_val, 'J': J_val, 'K': K_val,
        'OmegaRL': OmegaRL_val, 'OmegaSR': OmegaSR_val
    }
    param_values = {
        'mW1_val': mW1_val, 'mW2_val': mW2_val, 'mHR_val': mHR_val,
        'k1_val': k1_val, 'vR_val': vR_val, 'g_val': g_val, 'mH10_val': mH10_val,
        'rho1_val': rho1_val, 'alpha13_val': alpha13_val, 'alpha12_val': alpha12_val, 
        'alpha23_val': alpha23_val, 'lamb12_val': lamb12_val, 'epsilon_val': epsilon_val
    }
    couplings = config['couplings']
    boson_mass_key = config['boson_mass_key']
    extra_param_keys = config['extra_param_keys']

    if parallel:
        if interaction_key in two_neutrino_interactions:
            index_pairs = [(i, j) for i in range(num_neutrinos) for j in range(num_neutrinos)]
        else:
            index_pairs = list(range(num_neutrinos))
        # Prepare argument tuples for each job
        job_args = [
            (
                interaction_key, two_neutrino_interactions, couplings, boson_mass_key, extra_param_keys,
                ff_AL, ff_AR, matrix_values, param_values, mni_masses, ml_a_val, ml_b_val, a_idx, b_idx, idx
            )
            for idx in index_pairs
        ]
        # Use ThreadPoolExecutor instead of ProcessPoolExecutor to avoid pickling errors
        with concurrent.futures.ThreadPoolExecutor(max_workers=max_workers) as executor:
            results = list(executor.map(_single_ff_args, job_args))
        for ffL, ffR in results:
            al_sum += ffL
            ar_sum += ffR
    else:
        if interaction_key in two_neutrino_interactions:
            for i, mni_val in enumerate(mni_masses):
                for j, mnj_val in enumerate(mni_masses):
                    ffL, ffR = _single_ff_args((
                        interaction_key, two_neutrino_interactions, couplings, boson_mass_key, extra_param_keys,
                        ff_AL, ff_AR, matrix_values, param_values, mni_masses, ml_a_val, ml_b_val, a_idx, b_idx, (i, j)
                    ))
                    al_sum += ffL
                    ar_sum += ffR
        else:
            for i, mni_val in enumerate(mni_masses):
                ffL, ffR = _single_ff_args((
                    interaction_key, two_neutrino_interactions, couplings, boson_mass_key, extra_param_keys,
                    ff_AL, ff_AR, matrix_values, param_values, mni_masses, ml_a_val, ml_b_val, a_idx, b_idx, i
                ))
                al_sum += ffL
                ar_sum += ffR
    return {'AL': al_sum, 'AR': ar_sum}

def formfactors_neutrino_sum(
    mns_vals, ml_vals_list, rho1_val, alpha13_val, alpha12_val, alpha23_val, lamb12_val,
    idx_a, idx_b, k1_val=mp.mpf('246'), vR_val=mp.mpf('5000'), mW1_val=mp.mpf('80.3692'),
    mH10_val=mp.mpf('125'), mHR_val=mp.mpf('1600'), verbose=False,
    parallel=False, max_workers=None
):
    """
    Calculates the sum of form factors for different interactions.
    Optimized: precompute all matrix elements for all neutrino indices.
    """
    epsilon_val = k1_val / vR_val
    g_val = 2 * mW1_val / k1_val
    mW2_val = mp.sqrt((mW1_val**2 / k1_val**2) * (k1_val**2 + vR_val**2))

    if len(mns_vals) < 9:
        raise ValueError(
            f"mns_vals must contain at least 9 neutrino masses in ISS (3 light, and 6 heavy for mNi[3]..mNi[8]). Received {len(mns_vals)}."
        )
    mns_heavy_args = mns_vals[3:9]

    # Precompute all mixing matrices
    QL_val = QL_lamb(epsilon_val, *mns_heavy_args)
    TRL_val = TRL_lamb(epsilon_val, *mns_heavy_args)
    QR_val = QR_lamb(epsilon_val, *mns_heavy_args)
    J_val = J_lamb(epsilon_val, *mns_heavy_args)
    K_val = K_lamb(epsilon_val, *mns_heavy_args)
    OmegaRL_val = OmegaRL_lamb(epsilon_val, *mns_heavy_args)
    OmegaSR_val = OmegaSR_lamb(epsilon_val, *mns_heavy_args)

    num_total_neutrinos = len(mns_vals)
    all_form_factors = {}

    # Precompute all matrix elements for all indices
    # Each matrix is assumed to be indexable by [i, j] or [i] as needed
    matrix_cache = {
        'QL': QL_val,
        'TRL': TRL_val,
        'QR': QR_val,
        'J': J_val,
        'K': K_val,
        'OmegaRL': OmegaRL_val,
        'OmegaSR': OmegaSR_val
    }

    # Precompute all possible matrix elements for all relevant indices
    # This avoids repeated indexing and conjugation in the inner loops
    matrix_elements = {}
    for name, mat in matrix_cache.items():
        # Try to cache all possible 2D and 1D accesses
        try:
            shape = mat.shape
            if len(shape) == 2:
                matrix_elements[name] = {(i, j): mat[i, j] for i in range(shape[0]) for j in range(shape[1])}
            elif len(shape) == 1:
                matrix_elements[name] = {i: mat[i] for i in range(shape[0])}
            else:
                matrix_elements[name] = mat
        except Exception:
            matrix_elements[name] = mat

    common_calc_args = {
        "num_neutrinos": num_total_neutrinos,
        "QL_val": QL_val, "TRL_val": TRL_val, "QR_val": QR_val, "OmegaRL_val": OmegaRL_val, "OmegaSR_val": OmegaSR_val,
        "J_val": J_val, "K_val": K_val,
        "mW1_val": mW1_val, "mW2_val": mW2_val, "mHR_val": mHR_val, 'mH10_val': mH10_val,
        "k1_val": k1_val, "vR_val": vR_val, "g_val": g_val,
        'rho1_val': rho1_val, 'alpha13_val': alpha13_val, 'alpha12_val': alpha12_val, 'alpha23_val': alpha23_val, 'lamb12_val': lamb12_val, 'epsilon_val': epsilon_val,
        "mni_masses": mns_vals,
        "ml_a_val": ml_vals_list[idx_a], "ml_b_val": ml_vals_list[idx_b],
        "a_idx": idx_a, "b_idx": idx_b,
        "verbose": verbose
    }

    interaction_types = [
        'ni_GL', 'GL_ni', 'ni_GR',
        'GR_ni', 'ni_HR', 'HR_ni',
        'ni_W1', 'W1_ni', 'ni_W2',
        'W2_ni', 'ni_GLp_GLm', 'ni_GRp_GRm',
        'ni_HRp_HRm', 'ni_W1p_W1m', 'ni_W2p_W2m',
        'ni_GRp_HRm', 'ni_HRp_GRm', 'ni_W1p_GLm',
        'ni_W2p_GRm', 'ni_W2p_HRm', 'ni_GLp_W1m',
        'ni_GRp_W2m', 'ni_HRp_W2m'
    ] + two_neutrino_interactions

    # Optionally, parallelize this loop if you want (requires more code)
    for int_key in interaction_types:
        if verbose:
            print(f"Calculating form factors for interaction type: {int_key}")
        all_form_factors[int_key] = _calculate_interaction_formfactors(
            interaction_key=int_key,
            parallel=parallel,
            max_workers=max_workers,
            **common_calc_args
        )

    return all_form_factors

if __name__ == '__main__':

    # Numeric benchmark
    k1_val = mp.mpf('246')
    vR_val = mp.mpf('5000')
    mW1_val = mp.mpf('80.3692')
    epsilon_val = k1_val/vR_val
    mW2_squared_val = (mW1_val**2/k1_val**2)*(k1_val**2 + vR_val**2)
    mW2_val = mp.sqrt(mW2_squared_val)

    rho1_val = mp.mpf('0.1')
    alpha13_val = mp.mpf('0.1')
    alpha12_val = mp.mpf('0.1')
    alpha23_val = mp.mpf('0.1') # alpha2 - alpha3 > 0
    lamb12_val = mp.mpf('0.1')
    #alpha2_3 = mp.mpf('0.2') # alpha2 - alpha3 > 0
    mHR_squared_val = (alpha23_val)*(k1_val**2 + vR_val**2)
    mHR_val = mp.sqrt(mHR_squared_val)
    mH10_val = mp.mpf('125')

    d21 = mp.mpf(str(Nudata.squareDm21.central))*mp.mpf('1e-18')# factor to convert eV^2 to GeV^2
    d31 = mp.mpf(str(Nudata.squareDm31.central))*mp.mpf('1e-18')
    mn1_val = mp.mpf('1e-12')  #GeV 
    mn2_val = mp.sqrt(mn1_val**2 + d21)
    mn3_val = mp.sqrt(mn1_val**2 + d31)
    mn4_val = mp.mpf('1000')
    mn5_val = mp.mpf('2000')
    mn6_val = mp.mpf('3000')
    mn7_val = mn4_val + epsilon_val
    mn8_val = mn5_val + epsilon_val
    mn9_val = mn6_val + epsilon_val 
    mni_vals = [
        mn1_val,
        mn2_val,
        mn3_val,
        mn4_val,
        mn5_val,
        mn6_val,
        mn7_val,
        mn8_val,
        mn9_val
    ]
    me_val = mp.mpf('0.001')
    mmu_val = mp.mpf('0.105')
    mtau_val = mp.mpf('1.776')
    ml_vals = [
        me_val,
        mmu_val,
        mtau_val
    ]
    

    ff = formfactors_neutrino_sum(mni_vals, ml_vals, rho1_val, alpha13_val, alpha12_val, alpha23_val, lamb12_val, idx_a=1, idx_b=2, k1_val=k1_val, vR_val=vR_val, mHR_val=mHR_val, verbose=True, parallel=True, max_workers=4)

    ALsum = 0
    ARsum = 0
    for interaction, formfactor in ff.items():
        ffL = formfactor['AL']
        ffR = formfactor['AR']
        print('Diagram: ', interaction)
        print(f'AL = {ffL}')
        print(f'AR = {ffR}')
        ALsum += ffL
        ARsum += ffR
    #print('ALsum: ', ALsum)
    #print('ARsum: ', ARsum)