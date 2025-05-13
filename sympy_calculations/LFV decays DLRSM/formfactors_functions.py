from sympy import Symbol, init_printing, conjugate, sin, cos, factor, Matrix
from sympy import lambdify, Symbol, symbols
from sympy.physics.quantum import Dagger
from LFVXD.numeric.qcdloop_pv import B1_0, B2_0, B1_1, B2_1, C0_, C1_, C2_

from diagram_v2 import all_diagrams
from LFVXD.PaVe2 import D as Dim

from DLRSM1.block_diagonalization_iss import ULmni, URmni, USmni, I3, eigenvalsMnu, mNi_changes, epsilon, mNi
from DLRSM1.block_diagonalization_iss import dict_Mii2, dict_muii, dict_Mii2_sqrt, dict_sqrt_muii_MDi, dict_Mii, mns_dummys, dummys_mns
from DLRSM1.block_diagonalization_iss import Unu

from DLRSM1.potential_senjanovic_HiggsDoublets import alpha1, alpha2, alpha3, lamb1, lamb2, rho1, k1, vR, mHR, mH10
from DLRSM1.Gauge_Higgs_senjanovic_HiggsDoublets import mW1, mW2, g

from DLRSM1.FeynmanRules_senjanovic_H10_Z1_GM import QL, QR, TRL, K, J, Omega, ml, mn, i, j, a, b

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

a13 = alpha1 + alpha3
Gamma_mat = (GRLmat - ((a13)/(2*rho1))*epsilon**2*Dagger(GSRmat)).subs(mns_dummys).simplify().subs(dummys_mns).applyfunc(
    lambda x: x.subs(sin(epsilon)**2, epsilon**2).factor(deep=True)
)

Omega_mat = (Gamma_mat + Gamma_mat.T).applyfunc(lambda x:x.expand().collect(rho1, factor))

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
mla, mlb, mni = symbols('m_{l_a}, m_{l_b}, m_{n_i}', positive=True)

QLai = symbols('Q_{Lai}')
QLbi = symbols('Q_{Lbi}')
QLaic = symbols(r'\overline{Q_{Lai}}')
QLbic = symbols(r'\overline{Q_{Lbi}}')
QRai = symbols('Q_{Rai}')
QRbi = symbols('Q_{Rbi}')
QRaic = symbols(r'\overline{Q_{Rai}}')
QRbic = symbols(r'\overline{Q_{Rbi}}')
TRLib = symbols('T_{RLib}')
TRLia = symbols('T_{RLia}')
TRLiac  = symbols(r'\overline{T_{RLia}}')
TRLibc  = symbols(r'\overline{T_{RLib}}')
Jai = symbols('J_{ai}')
Jbi = symbols('J_{bi}')
Jaic = symbols(r'\overline{J_{ai}}')
Jbic = symbols(r'\overline{J_{bi}}')
Kai = symbols('K_{ai}')
Kbi = symbols('K_{bi}')
Kaic = symbols(r'\overline{K_{ai}}')
Kbic = symbols(r'\overline{K_{bi}}')
alpha13 = symbols(r'\alpha_{13}') # alpha1 + alpha3
lamb12 = symbols(r'\lambda_{12}') # lamb1 + lamb2
alpha12 = symbols(r'\alpha_{12}') # alpha1 + alpha2 > 0
alpha23 = symbols(r'\alpha_{23}') # alpha2 - alpha3 > 0

# Symbolic changes
symbolic_changes = {
    ml[a]:mla,
    ml[b]:mlb,
    mn[i]:mni,
    QL[a,i]:QLai,
    QL[b,i]:QLbi,
    conjugate(QL[a, i]):QLaic,
    conjugate(QL[b, i]):QLbic,
    QR[a,i]:QRai,
    QR[b,i]:QRbi,
    conjugate(QR[a, i]):QRaic,
    conjugate(QR[b, i]):QRbic,
    TRL[i, a]:TRLia,
    TRL[i, b]:TRLib,
    conjugate(TRL[i, a]):TRLiac,
    conjugate(TRL[i, b]):TRLibc,
    J[a,i]:Jai,
    J[b,i]:Jbi,
    conjugate(J[a,i]):Jaic,
    conjugate(J[b,i]):Jbic,
    K[a,i]:Kai,
    K[b,i]:Kbi,
    conjugate(K[a,i]):Kaic,
    conjugate(K[b,i]):Kbic,
    Dim:4,
    alpha1 + alpha3: alpha13,
    alpha2 - alpha3: alpha23,
    alpha1 + alpha2: alpha12,
    2*lamb1 + 2*lamb2: 2*lamb12,
    lamb1 + lamb2: lamb12
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
#triangles_onefermion = ['ni_GLp_GLm', 'ni_GRp_GRm']
#triangle_diagrams_onefermion = {interaction:all_diagrams[interaction] for interaction in triangles_onefermion}
#symbolic_formfactor_triangle_onefermion = {
#    interaction:{
#        'AL':diagram.AL().expand().collect([rho1], factor).subs(symbolic_changes),
#        'AR':diagram.AR().expand().collect([rho1], factor).subs(symbolic_changes)
#    } for interaction, diagram in triangle_diagrams_onefermion.items()
#}
#symbolic_formfactor = {
#    **symbolic_formfactor_bubble,
#    **symbolic_formfactor_triangle_onefermion
#}
triangles_onefermion = ['ni_GLp_GLm', 'ni_GRp_GRm', 'ni_W1p_W1m']
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

symbolic_formfactor_triangle_onefermion['ni_HRp_HRm'] = {}
symbolic_formfactor_triangle_onefermion['ni_HRp_HRm']['AL'] = all_diagrams['ni_HRp_HRm'].AL().expand().collect(
            [rho1], lambda x: x.collect([vR], lambda x:x.factor())
        ).subs(symbolic_changes)
symbolic_formfactor_triangle_onefermion['ni_HRp_HRm']['AR'] = all_diagrams['ni_HRp_HRm'].AR().expand().collect(
            [rho1], lambda x: x.collect([vR], lambda x:x.factor())
        ).subs(symbolic_changes)

symbolic_formfactor = {
    **symbolic_formfactor_bubble,
    **symbolic_formfactor_triangle_onefermion
}

# Passarino-Veltman functions definitions
pv_functions = {
    'B1_0':B1_0,
    'B2_0':B2_0,
    'B1_1':B1_1,
    'B2_1':B2_1,
    'C0': C0_,
    'C1': C1_,
    'C2': C2_
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

# Lambdify symbolic form factors
function_formfactors = {
    'ni_GL': _create_lambdified_ff_pair(
        symbolic_formfactor['ni_GL']['AL'],
        symbolic_formfactor['ni_GL']['AR'],
        [QLai, QLbic, TRLib, TRLiac, mW1] + _common_ff_args_sym + [k1],
        pv_functions  # Assuming pv_functions is suitable for all
    ),
    'GL_ni': _create_lambdified_ff_pair(
        symbolic_formfactor['GL_ni']['AL'],
        symbolic_formfactor['GL_ni']['AR'],
        [QLbi, QLaic, TRLia, TRLibc, mW1] + _common_ff_args_sym + [k1],
        pv_functions
    ),
    'ni_GR': _create_lambdified_ff_pair(
        symbolic_formfactor['ni_GR']['AL'],
        symbolic_formfactor['ni_GR']['AR'],
        [QRai, QRbic, Jai, Jbic, mW2] + _common_ff_args_sym + [k1, vR],
        pv_functions
    ),
    'GR_ni': _create_lambdified_ff_pair(
        symbolic_formfactor['GR_ni']['AL'],
        symbolic_formfactor['GR_ni']['AR'],
        [QRbi, QRaic, Jbi, Jaic, mW2] + _common_ff_args_sym + [k1, vR],
        pv_functions
    ),
    'ni_HR': _create_lambdified_ff_pair(
        symbolic_formfactor['ni_HR']['AL'],
        symbolic_formfactor['ni_HR']['AR'],
        [QRai, QRbic, Kai, Kbic, mHR] + _common_ff_args_sym + [k1],
        pv_functions
    ),
    'HR_ni': _create_lambdified_ff_pair(
        symbolic_formfactor['HR_ni']['AL'],
        symbolic_formfactor['HR_ni']['AR'],
        [QRbi, QRaic, Kbi, Kaic, mHR] + _common_ff_args_sym + [k1],
        pv_functions
    ),
    'ni_W1': _create_lambdified_ff_pair(
        symbolic_formfactor['ni_W1']['AL'],
        symbolic_formfactor['ni_W1']['AR'],
        [QLai, QLbic, mW1] + _common_ff_args_sym + [k1, g],
        pv_functions  # Assuming pv_functions is suitable for all
    ),
    'W1_ni': _create_lambdified_ff_pair(
        symbolic_formfactor['W1_ni']['AL'],
        symbolic_formfactor['W1_ni']['AR'],
        [QLbi, QLaic, mW1] + _common_ff_args_sym + [k1, g],
        pv_functions  # Assuming pv_functions is suitable for all
    ),
    'ni_W2': _create_lambdified_ff_pair(
        symbolic_formfactor['ni_W2']['AL'],
        symbolic_formfactor['ni_W2']['AR'],
        [QRai, QRbic, mW2] + _common_ff_args_sym + [k1, g],
        pv_functions  # Assuming pv_functions is suitable for all
    ),
    'W2_ni': _create_lambdified_ff_pair(
        symbolic_formfactor['W2_ni']['AL'],
        symbolic_formfactor['W2_ni']['AR'],
        [QRbi, QRaic, mW2] + _common_ff_args_sym + [k1, g],
        pv_functions  # Assuming pv_functions is suitable for all
    ),
    'ni_GLp_GLm': _create_lambdified_ff_pair(
        symbolic_formfactor['ni_GLp_GLm']['AL'],
        symbolic_formfactor['ni_GLp_GLm']['AR'],
        [QLai, QLbic, TRLib, TRLiac, mW1, mH10] + _common_ff_args_sym + [k1, rho1, alpha13, lamb12],
        pv_functions  # Assuming pv_functions is suitable for all
    ),
    'ni_GRp_GRm': _create_lambdified_ff_pair(
        symbolic_formfactor['ni_GRp_GRm']['AL'],
        symbolic_formfactor['ni_GRp_GRm']['AR'],
        [QRai, QRbic, Jai, Jbic, mW2, mH10] + _common_ff_args_sym + [k1, vR, rho1, alpha13, lamb12],
        pv_functions  # Assuming pv_functions is suitable for all
    ),
    'ni_HRp_HRm': _create_lambdified_ff_pair(
        symbolic_formfactor['ni_HRp_HRm']['AL'],
        symbolic_formfactor['ni_HRp_HRm']['AR'],
        [QRai, QRbic, Kai, Kbic, mHR, mH10] + _common_ff_args_sym + [k1, vR, rho1, alpha13, alpha12, alpha23, lamb12],
        pv_functions  # Assuming pv_functions is suitable for all
    ),
    'ni_W1p_W1m': _create_lambdified_ff_pair(
        symbolic_formfactor['ni_W1p_W1m']['AL'],
        symbolic_formfactor['ni_W1p_W1m']['AR'],
        [QLai, QLbic, mW1, mH10] + _common_ff_args_sym + [k1, g],
        pv_functions  # Assuming pv_functions is suitable for all
    ),
}

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

# Configuration for _calculate_interaction_formfactors
_interaction_configs = {
    'ni_GL': {
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
        'couplings': [
            {'matrix_name': 'QL', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QL', 'idx_keys': ('b', 'i'), 'conj': True}
        ],
        'boson_mass_key': 'mW1_val',
        'extra_param_keys': ['k1_val', 'g_val']
    },
    'W1_ni': {
        'couplings': [
            {'matrix_name': 'QL', 'idx_keys': ('b', 'i'), 'conj': False},
            {'matrix_name': 'QL', 'idx_keys': ('a', 'i'), 'conj': True}
        ],
        'boson_mass_key': 'mW1_val',
        'extra_param_keys': ['k1_val', 'g_val']
    },
    'ni_W2': {
        'couplings': [
            {'matrix_name': 'QR', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QR', 'idx_keys': ('b', 'i'), 'conj': True}
        ],
        'boson_mass_key': 'mW2_val',
        'extra_param_keys': ['k1_val', 'g_val']
    },
    'W2_ni': {
        'couplings': [
            {'matrix_name': 'QR', 'idx_keys': ('b', 'i'), 'conj': False},
            {'matrix_name': 'QR', 'idx_keys': ('a', 'i'), 'conj': True}
        ],
        'boson_mass_key': 'mW2_val',
        'extra_param_keys': ['k1_val', 'g_val']
    },
    'ni_GLp_GLm': {
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
        'couplings': [
            {'matrix_name': 'QL', 'idx_keys': ('a', 'i'), 'conj': False},
            {'matrix_name': 'QL', 'idx_keys': ('b', 'i'), 'conj': True}
        ],
        'boson_mass_key': ['mW1_val', 'mH10_val'],
        'extra_param_keys': ['k1_val', 'g_val']
    },
}

def _calculate_interaction_formfactors(
    interaction_key, num_neutrinos,
    # Lambdified matrices
    QL_val, TRL_val, QR_val, J_val, K_val,
    # Masses Bosons
    mW1_val, mW2_val, mHR_val, mH10_val,
    # vev 
    k1_val, vR_val,
    # extra parameters
    g_val, rho1_val, alpha13_val, alpha12_val, alpha23_val, lamb12_val,
    # Masses fermions
    mni_masses, ml_a_val, ml_b_val,
    # Indices
    a_idx, b_idx,
    verbose=False
):
    """Helper function to sum form factor contributions for a given interaction type."""
    al_sum = mp.mpf(0)
    ar_sum = mp.mpf(0)

    config = _interaction_configs[interaction_key]
    ff_calculator_AL = function_formfactors[interaction_key]['AL']
    ff_calculator_AR = function_formfactors[interaction_key]['AR']

    # Map keys to actual matrix and parameter values
    matrix_values = {
        'QL': QL_val, 'TRL': TRL_val, 'QR': QR_val, 'J': J_val, 'K': K_val
    }
    parameter_values = {
        'mW1_val': mW1_val, 'mW2_val': mW2_val, 'mHR_val': mHR_val,
        'k1_val': k1_val, 'vR_val': vR_val, 'g_val': g_val, 'mH10_val': mH10_val,
        'rho1_val': rho1_val, 'alpha13_val': alpha13_val, 'alpha12_val': alpha12_val, 'alpha23_val': alpha23_val, 'lamb12_val': lamb12_val
    }

    for i in range(num_neutrinos):
        if verbose:
            print(f"  Calculating for {interaction_key}, neutrino index i = {i} (lepton_a index: {a_idx}, lepton_b index: {b_idx})")

        mni_val = mni_masses[i]

        current_ff_args = []
        
        # 1. Coupling matrix elements
        for c_desc in config['couplings']:
            matrix = matrix_values[c_desc['matrix_name']]
            
            # Resolve index keys ('a', 'b', 'i') to actual index values
            resolved_indices = []
            for idx_key in c_desc['idx_keys']:
                if idx_key == 'a': resolved_indices.append(a_idx)
                elif idx_key == 'b': resolved_indices.append(b_idx)
                elif idx_key == 'i': resolved_indices.append(i) # current neutrino loop index
                else: raise ValueError(f"Unknown index key {idx_key} in _interaction_configs for {interaction_key}")
            
            val = matrix[tuple(resolved_indices)]
            if c_desc['conj']:
                val = mp.conj(val)
            current_ff_args.append(val)

        # 2. Boson mass
        if isinstance(config['boson_mass_key'], list):
            for key in config['boson_mass_key']:
                current_ff_args.append(parameter_values[key])
        else:
            current_ff_args.append(parameter_values[config['boson_mass_key']])
        #current_ff_args.append(parameter_values[config['boson_mass_key']])
        
        # 3. Common particle masses (mni, mla, mlb)
        current_ff_args.extend([mni_val, ml_a_val, ml_b_val])
        
        # 4. Extra parameters (k1_val, vR_val if applicable)
        for param_key in config['extra_param_keys']:
            current_ff_args.append(parameter_values[param_key])
        
        if verbose:
            print('interaction_key: ',interaction_key)
            print('current_ff_args: ', current_ff_args)
            
        al_contrib = ff_calculator_AL(*current_ff_args)
        ar_contrib = ff_calculator_AR(*current_ff_args) # AR uses the same arguments

        al_sum += al_contrib
        ar_sum += ar_contrib
            
    return {'AL': al_sum, 'AR': ar_sum}

def formfactors_neutrino_sum(mns_vals, ml_vals_list, rho1_val, alpha13_val, alpha12_val, alpha23_val, lamb12_val, idx_a, idx_b, k1_val=mp.mpf('246'), vR_val=mp.mpf('5000'), mW1_val=mp.mpf('80.3692'), mH10_val=mp.mpf('125'), mHR_val=mp.mpf('1600'), verbose=False):
    """
    Calculates the sum of form factors for different interactions.
    """
    eps_val = k1_val / vR_val
    g_val = 2*mW1_val/k1_val
    mW2_squared_val = (mW1_val**2/k1_val**2)*(k1_val**2 + vR_val**2)
    mW2_val = mp.sqrt(mW2_squared_val)

    # The lambdified functions for mixing matrices expect 6 heavy neutrino mass arguments (mNi[3] to mNi[8])
    if len(mns_vals) < 9:
        raise ValueError(f"mns_vals must contain at least 9 neutrino masses in ISS (3 light, and 6 heavy for mNi[3]..mNi[8]). Received {len(mns_vals)}.")

    # Heavy neutrino mass components for lambdified functions (mNi[3] to mNi[8])
    # mns_vals[3] corresponds to mN_3, ..., mns_vals[8] corresponds to mN_8.
    mns_heavy_args = mns_vals[3:9]

    QL_val = QL_lamb(eps_val, *mns_heavy_args)
    TRL_val = TRL_lamb(eps_val, *mns_heavy_args)
    QR_val = QR_lamb(eps_val, *mns_heavy_args)
    J_val = J_lamb(eps_val, *mns_heavy_args)
    K_val = K_lamb(eps_val, *mns_heavy_args)
    
    num_total_neutrinos = len(mns_vals)
    all_form_factors = {}

    common_calc_args = {
        "num_neutrinos": num_total_neutrinos,
        "QL_val": QL_val, "TRL_val": TRL_val, "QR_val": QR_val,
        "J_val": J_val, "K_val": K_val,
        "mW1_val": mW1_val, "mW2_val": mW2_val, "mHR_val": mHR_val, 'mH10_val':mH10_val,
        "k1_val": k1_val, "vR_val": vR_val, "g_val": g_val, 
        'rho1_val':rho1_val, 'alpha13_val':alpha13_val, 'alpha12_val':alpha12_val, 'alpha23_val':alpha23_val, 'lamb12_val':lamb12_val,
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
        'ni_HRp_HRm', 'ni_W1p_W1m'
    ]
    for int_key in interaction_types:
        if verbose:
            print(f"Calculating form factors for interaction type: {int_key}")
        all_form_factors[int_key] = _calculate_interaction_formfactors(
            interaction_key=int_key,
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
    

    ff = formfactors_neutrino_sum(mni_vals, ml_vals, rho1_val, alpha13_val, alpha12_val, alpha23_val, lamb12_val, idx_a=1, idx_b=2, k1_val=k1_val, vR_val=vR_val, mHR_val=mHR_val, verbose=True)

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
    print('ALsum: ', ALsum)
    print('ARsum: ', ARsum)