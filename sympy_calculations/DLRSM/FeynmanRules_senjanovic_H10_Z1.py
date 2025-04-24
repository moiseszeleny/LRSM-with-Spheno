# -*- coding: utf-8 -*-
"""
Calculates specific Feynman rules involving H10, Z1, W bosons, and leptons
in the context of the Senjanovic model with Higgs Doublets (DLRSM).

This script focuses on:
- H10 interactions with W1/W2 bosons.
- H10 interactions with charged scalars and W bosons.
- H10 interactions with pairs of charged scalars.
- Z1 interactions with pairs of charged gauge bosons or scalars.
- W boson interactions with leptons.
- Charged scalars interactions with leptons.

It utilizes pre-calculated interaction terms from other modules and provides
both exact and approximate (where available) results.
"""

from sympy import sqrt

from FeynmanRules_senjanovic_SW import interactions_gauge_scalars
from FeynmanRules_senjanovic_SW import interactions_gauge_scalars_approx
from FeynmanRules_senjanovic_SW import interactions_scalars, interactions_scalars_approx

from potential_senjanovic_HiggsDoublets import H10, vR, k1
from potential_senjanovic_HiggsDoublets import GRp, GLp, HLp, HRp, HRm, GRm, GLm, HLm
from Gauge_Higgs_senjanovic_HiggsDoublets import W1p, W1m, W2p, Z1, W2m

###########
# Interactions of H10
###########
# Interaction of H10 and W1 W2  for Lagrangian and approximate Lagrangian
interactionsH10_WW = [(W1p, W1m, H10), (W1p, W2m, H10), (W1m, W2p, H10), (W2p, W2m, H10)]

interactionsH10_WW_dict = {
    interaction:interactions_gauge_scalars[3][interaction]
    for interaction in interactionsH10_WW
}
interactionsH10_WW_dict_approx = {}
for interaction in interactionsH10_WW:
    try:
        interactionsH10_WW_dict_approx[interaction] = interactions_gauge_scalars_approx[3][interaction]
    except:
        pass

# Interaction of H10 and Vp Sm

interactionsH10_W1pSm = []
for S in [GLm, GRm, HLm, HRm, H10]:
    for S1 in [GLm, GRm, HLm, HRm, H10]:
        if (S1 == H10 or S == H10):
            interaction_tuple = (W1p, S, S1)
            if interaction_tuple not in interactionsH10_W1pSm:
                interactionsH10_W1pSm.append(interaction_tuple)

interactionsH10_W2pSm = []
for S in [GLm, GRm, HLm, HRm, H10]:
    for S1 in [GLm, GRm, HLm, HRm, H10]:
        if (S1 == H10 or S == H10):
            interaction_tuple = (W2p, S, S1)
            if interaction_tuple not in interactionsH10_W2pSm:
                interactionsH10_W2pSm.append(interaction_tuple)
################################################################3
# Interaction of H10 and Vm Sp
interactionsH10_W1mSp = []
for S in [GLp, GRp, HLp, HRp, H10]:
    for S1 in [GLp, GRp, HLp, HRp, H10]:
        if (S1 == H10 or S == H10):
            interaction_tuple = (W1m, S, S1)
            if interaction_tuple not in interactionsH10_W1mSp:
                interactionsH10_W1mSp.append(interaction_tuple)

interactionsH10_W2mSp = []
for S in [GLp, GRp, HLp, HRp, H10]:
    for S1 in [GLp, GRp, HLp, HRp, H10]:
        if (S1 == H10 or S == H10):
            interaction_tuple = (W2m, S, S1)
            if interaction_tuple not in interactionsH10_W2mSp:
                interactionsH10_W2mSp.append(interaction_tuple)

interactionsH10_W1pSm_dict = {}
for interaction in interactionsH10_W1pSm:
    try:
        interactionsH10_W1pSm_dict[interaction] = interactions_gauge_scalars[3][interaction]
        print(f'interaction: {interaction}')
    except:
        print(f'This interaction is not present in this model: {interaction}')

interactionsH10_W2pSm_dict = {}
for interaction in interactionsH10_W2pSm:
    try:
        interactionsH10_W2pSm_dict[interaction] = interactions_gauge_scalars[3][interaction]
        print(f'interaction: {interaction}')
    except:
        print(f'This interaction is not present in this model: {interaction}')
##############################################################################33
interactionsH10_W1mSp_dict = {}
for interaction in interactionsH10_W1mSp:
    try:
        interactionsH10_W1mSp_dict[interaction] = interactions_gauge_scalars[3][interaction]
        print(f'interaction: {interaction}')
    except:
        print(f'This interaction is not present in this model: {interaction}')

interactionsH10_W2mSp_dict = {}
for interaction in interactionsH10_W2mSp:
    try:
        interactionsH10_W2mSp_dict[interaction] = interactions_gauge_scalars[3][interaction]
        print(f'interaction: {interaction}')
    except:
        print(f'This interaction is not present in this model: {interaction}')

interactionsH10_W1pSm_dict_approx = {}
for interaction, coeff in interactionsH10_W1pSm_dict.items():
    print('Interaction: ')
    print(interaction)
    print('Coefficient: ')
    coeff_factor = coeff.factor()
    print(coeff_factor)
    interactionsH10_W1pSm_dict[interaction] = coeff_factor
    try:
        print('Approximation: ')
        interactionsH10_W1pSm_dict_approx[interaction] = interactions_gauge_scalars_approx[3][interaction].factor()
        print(interactionsH10_W1pSm_dict_approx[interaction])
    except:
        print('No approximation available')

interactionsH10_W2pSm_dict_approx = {}
for interaction, coeff in interactionsH10_W2pSm_dict.items():
    print('Interaction: ')
    print(interaction)
    print('Coefficient: ')
    coeff_factor = coeff.factor()
    print(coeff_factor)
    interactionsH10_W2pSm_dict[interaction] = coeff_factor
    try:
        print('Approximation: ')
        interactionsH10_W2pSm_dict_approx[interaction] = interactions_gauge_scalars_approx[3][interaction].factor()
        print(interactionsH10_W2pSm_dict_approx[interaction])
    except:
        print('No approximation available')
############################################################
interactionsH10_W1mSp_dict_approx = {}
for interaction, coeff in interactionsH10_W1mSp_dict.items():
    print('Interaction: ')
    print(interaction)
    print('Coefficient: ')
    coeff_factor = coeff.factor()
    print(coeff_factor)
    interactionsH10_W1mSp_dict[interaction] = coeff_factor
    try:
        print('Approximation: ')
        interactionsH10_W1mSp_dict_approx[interaction] = interactions_gauge_scalars_approx[3][interaction].factor()
        print(interactionsH10_W1mSp_dict_approx[interaction])
    except:
        print('No approximation available')

interactionsH10_W2mSp_dict_approx = {}
for interaction, coeff in interactionsH10_W2mSp_dict.items():
    print('Interaction: ')
    print(interaction)
    print('Coefficient: ')
    coeff_factor = coeff.factor()
    print(coeff_factor)
    interactionsH10_W2mSp_dict[interaction] = coeff_factor
    try:
        print('Approximation: ')
        interactionsH10_W2mSp_dict_approx[interaction] = interactions_gauge_scalars_approx[3][interaction].factor()
        print(interactionsH10_W2mSp_dict_approx[interaction])
    except:
        print('No approximation available')

# Interaction of H10 with charged scalars
interactionsH10_SS = []
for Xp in [GRp, GLp, HLp, HRp]:
    for Xm in [GRm, GLm, HLm, HRm]:
        fields = tuple(sorted({H10, Xp, Xm}, key=lambda x: str(x)))
        if fields not in interactionsH10_SS:
            print(fields)
            interactionsH10_SS.append(fields)

interactionsH10_SS_dict = {}
for interaction in interactionsH10_SS:
    try:
        interactionsH10_SS_dict[interaction] = interactions_scalars[3][interaction]
    except:
        print(f'Interaction {interaction} does not appear in this lagrangian')

interactionsH10_SS_dict_approx = {}
for interaction_tuple, coeff in interactionsH10_SS_dict.items():
    try:
        interactionsH10_SS_dict_approx[interaction_tuple] = interactions_scalars_approx[3][interaction_tuple]
    except:
        print('This interaction is not present in the approximation')

###########
# Interactions of Z1
###########

interactionsZ1_VS = []
for Xp in [GRp, GLp, HLp, HRp, W1p, W2p]:
    for Xm in [GRm, GLm, HLm, HRm, W1m, W2m]:
        fields_tuple = tuple(sorted({Z1, Xp, Xm}, key=lambda x: str(x)))
        if fields_tuple not in interactionsZ1_VS:
            print(fields_tuple)
            interactionsZ1_VS.append(fields_tuple)

interactionsZ1_VS_dict = {}
interactionsZ1_VS_dict_approx = {}
for interaction in interactionsZ1_VS:
    try:
        print(interaction)
        interactionsZ1_VS_dict[interaction] = interactions_gauge_scalars[3][interaction]
    except:
        print(f'Interaction {interaction} does not appear in this lagrangian')
    try:
        interactionsZ1_VS_dict_approx[interaction] = interactions_gauge_scalars_approx[3][interaction]
    except:
        print(f'Approximation not available for interaction {interaction}')

###########
# Interactions of W1, W2 with leptons
###########

from sympy import IndexedBase, symbols, conjugate
from Gauge_Higgs_senjanovic_HiggsDoublets import g
from dirac import diracPL, diracPR, DiracGamma

# Definitions
i, j, a, b = symbols('i, j, a, b', integer=True)
mu, nu = symbols('\mu, \nu', integer=True)
gamma_mu = DiracGamma(mu)
gamma_nu = DiracGamma(nu)
QL = IndexedBase('Q_L')
QR = IndexedBase('Q_R')
n = IndexedBase('n')
nadj = IndexedBase(r'\overline{n}')
l = IndexedBase(r'\ell')
ladj = IndexedBase(r'\overline{\ell}')

interactionsW1p_n_l = lambda i,a: {
    (W1p, nadj[i], l[a]): (g/2)*conjugate(QL[i,a])*gamma_mu*diracPL
}

interactionsW1m_n_l = lambda i,a: {
    (W1m, ladj[a], n[i]): (g/2)*QL[a,i]*gamma_mu*diracPL
}

interactionsW2p_n_l = lambda i,a: {
    (W2p, nadj[i], l[a]): (g/2)*conjugate(QR[i,a])*gamma_mu*diracPR
}

interactionsW2m_n_l = lambda i,a: {
    (W2m, ladj[a], n[i]): (g/2)*QR[a,i]*gamma_mu*diracPR
}

interactionsWp_n_l = lambda i,a: {###########
    list(dict_interaction.keys())[0]:list(dict_interaction.values())[0]
    for dict_interaction in [interactionsW1p_n_l(i,a), interactionsW2p_n_l(i,a)]
}

interactionsWm_n_l = lambda i,a: {###########
    list(dict_interaction.keys())[0]:list(dict_interaction.values())[0]
    for dict_interaction in [interactionsW1m_n_l(i,a), interactionsW2m_n_l(i,a)]
}

###########
# Interactions of charged scalars with leptons
###########

# Definitions
TRL = IndexedBase('T_{RL}')
K = IndexedBase('K')
J = IndexedBase('J')
ml = IndexedBase('m_\ell')
mn = IndexedBase('m_n')
sqrt2 = sqrt(2)

interactionsGLm_n_l = lambda i,a: {
    (GLm, ladj[a], n[i]): (sqrt2/k1)*(
        - conjugate(TRL[i,a])*diracPR
        + ml[a]*QL[a,i]*diracPL
    )
}
interactionsGLp_n_l = lambda i,a: {
    (GLp, nadj[i], l[a]): (sqrt2/k1)*(
        - TRL[a,i]*diracPL
        + ml[a]*conjugate(QL[i,a])*diracPR
    )
}

interactionsGRm_n_l = lambda i,a: {
    (GRm, ladj[a], n[i]): (sqrt2/vR)*(
        - ml[a]*QR[a,i]*diracPR
        + J[a,i]*diracPL
    )
}
interactionsGRp_n_l = lambda i,a: {
    (GRp, nadj[i], l[a]): (sqrt2/vR)*(
        - ml[a]*conjugate(QR[i,a])*diracPL
        + conjugate(J[i,a])*diracPR
    )
}

interactionsHRm_n_l = lambda i,a: {
    (HRm, ladj[a], n[i]): (sqrt2/k1)*(
        - K[a,i]*diracPL
        + ml[a]*QR[a,i]*diracPR
    )
}
interactionsHRp_n_l = lambda i,a: {
    (HRp, nadj[i], l[a]): (sqrt2/k1)*(
        - conjugate(K[i,a])*diracPR
        + ml[a]*conjugate(QR[i,a])*diracPL
    )
}

interactionsSp_n_l = lambda i,a: {
    list(dict_interaction.keys())[0]:list(dict_interaction.values())[0]
    for dict_interaction in [interactionsGLp_n_l(i,a), interactionsGRp_n_l(i,a), interactionsHRp_n_l(i,a)]
}

interactionsSm_n_l = lambda i,a: {
    list(dict_interaction.keys())[0]:list(dict_interaction.values())[0]
    for dict_interaction in [interactionsGLm_n_l(i,a), interactionsGRm_n_l(i,a), interactionsHRm_n_l(i,a)]
}