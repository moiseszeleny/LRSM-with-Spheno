# In this file we construct the scalar and vectorial contributions to mu to e gamma in the DLRSM
# We use the Feynman rules from the DLRSM1 package

from sympy import pi, sqrt, symbols

from DLRSM1.FeynmanRules_senjanovic_H10_Z1_GM import interactionsSp_n_l, interactionsSm_n_l
from DLRSM1.FeynmanRules_senjanovic_H10_Z1_GM import interactionsWp_n_l, interactionsWm_n_l, g
from DLRSM1.FeynmanRules_senjanovic_H10_Z1_GM import ml, i, a, b, nadj, n, l, ladj, gamma_mu
from DLRSM1.FeynmanRules_senjanovic_H10_Z1_GM import mn as MN
from DLRSM1.dirac import diracPL, diracPR
from DLRSM1.Gauge_Higgs_senjanovic_HiggsDoublets import W1p, W1m, W2p, W2m, mW1, mW2, k1, mZ1_sym
from DLRSM1.potential_senjanovic_HiggsDoublets import (
    GLp,
    GLm,
    GRp,
    GRm,
    HRp,
    HRm,
    mHR,
    mHR
)

# Import necessary functions and classes from LFVXD
from LFVXD import mu_egamma as meg
from LFVXD.vertexes_v2 import VertexSFF, VertexVFF, VertexSVV

# F one loop factor
F = 1/(16*pi**2)

# electric charge in terms of  mW1, mZ1 and  k1
#e = symbols('e')# for symbolic compact form
e = (2*mW1/k1)*sqrt(1 - mW1**2/mZ1_sym**2) # for numerical evaluations

# Define Vertexes for contribution of W1
cR_Wp_nadji_lb = interactionsWp_n_l(i, b)[(W1p, nadj[i], l[b])].expand().coeff(gamma_mu*diracPR).subs(g,2*mW1/k1)
cL_Wp_nadji_lb = interactionsWp_n_l(i, b)[(W1p, nadj[i], l[b])].expand().coeff(gamma_mu*diracPL).subs(g,2*mW1/k1)
v_Wp_nadji_lb = VertexVFF(cR_Wp_nadji_lb, cL_Wp_nadji_lb)

cR_Wm_nadji_la = interactionsWm_n_l(i, a)[(W1m, ladj[a], n[i])].expand().coeff(gamma_mu*diracPR).subs(g,2*mW1/k1)
cL_Wm_nadji_la = interactionsWm_n_l(i, a)[(W1m, ladj[a], n[i])].expand().coeff(gamma_mu*diracPL).subs(g,2*mW1/k1)
v_Wm_nadji_la = VertexVFF(cR_Wm_nadji_la, cL_Wm_nadji_la)

W_contribution = meg.OneFermionVContribution(
    v_Wm_nadji_la,
    v_Wp_nadji_lb,
    ml[a], ml[b],
    MN[i], mW1)

# Define Vertexes for contribution of W2
cR_W2p_nadji_lb = interactionsWp_n_l(i, b)[(W2p, nadj[i], l[b])].expand().coeff(gamma_mu*diracPR).subs(g,2*mW1/k1)
cL_W2p_nadji_lb = interactionsWp_n_l(i, b)[(W2p, nadj[i], l[b])].expand().coeff(gamma_mu*diracPL).subs(g,2*mW1/k1)
v_W2p_nadji_lb = VertexVFF(cR_W2p_nadji_lb, cL_W2p_nadji_lb)

cR_W2m_nadji_la = interactionsWm_n_l(i, a)[(W2m, ladj[a], n[i])].expand().coeff(gamma_mu*diracPR).subs(g,2*mW1/k1)
cL_W2m_nadji_la = interactionsWm_n_l(i, a)[(W2m, ladj[a], n[i])].expand().coeff(gamma_mu*diracPL).subs(g,2*mW1/k1)
v_W2m_nadji_la = VertexVFF(cR_W2m_nadji_la, cL_W2m_nadji_la)

W2_contribution = meg.OneFermionVContribution(
    v_W2m_nadji_la,
    v_W2p_nadji_lb,
    ml[a], ml[b],
    MN[i], mW2)

# Define Vertexes for contribution of GLpm
cR_GLp_nadji_lb = interactionsSp_n_l(i, b)[(GLp, nadj[i], l[b])].expand().coeff(diracPR)
cL_GLp_nadji_lb = interactionsSp_n_l(i, b)[(GLp, nadj[i], l[b])].expand().coeff(diracPL)
v_GLp_nadji_lb = VertexSFF(cR_GLp_nadji_lb, cL_GLp_nadji_lb)

cR_GLm_nadji_la = interactionsSm_n_l(i, a)[(GLm, ladj[a], n[i])].expand().coeff(diracPR)
cL_GLm_nadji_la = interactionsSm_n_l(i, a)[(GLm, ladj[a], n[i])].expand().coeff(diracPL)
v_GLm_nadji_la = VertexSFF(cR_GLm_nadji_la, cL_GLm_nadji_la)

GL_contribution = meg.OneFermionSContribution(
    v_GLm_nadji_la,
    v_GLp_nadji_lb, # cambio de orden
    ml[a], ml[b],
    MN[i], mW1)

v_gamma_GLp_W1m = VertexSVV(e*mW1)
GLW1_contribution = meg.OneFermionGVContribution(
    v_Wm_nadji_la,
    v_GLp_nadji_lb,
    v_gamma_GLp_W1m,
    ml[a], ml[b],
    MN[i], mW1)

W1GL_contribution = meg.OneFermionVGContribution(
    v_GLm_nadji_la,
    v_Wp_nadji_lb,
    v_gamma_GLp_W1m,
    ml[a], ml[b],
    MN[i], mW1)

# Define Vertexes for contribution of GRpm
cR_GRp_nadji_lb = interactionsSp_n_l(i, b)[(GRp, nadj[i], l[b])].expand().coeff(diracPR)
cL_GRp_nadji_lb = interactionsSp_n_l(i, b)[(GRp, nadj[i], l[b])].expand().coeff(diracPL)
v_GRp_nadji_lb = VertexSFF(cR_GRp_nadji_lb, cL_GRp_nadji_lb)

cR_GRm_nadji_la = interactionsSm_n_l(i, a)[(GRm, ladj[a], n[i])].expand().coeff(diracPR)
cL_GRm_nadji_la = interactionsSm_n_l(i, a)[(GRm, ladj[a], n[i])].expand().coeff(diracPL)
v_GRm_nadji_la = VertexSFF(cR_GRm_nadji_la, cL_GRm_nadji_la)

GR_contribution = meg.OneFermionSContribution(
    v_GRm_nadji_la,
    v_GRp_nadji_lb, # cambio de orden
    ml[a], ml[b],
    MN[i], mW2)

v_gamma_GLp_W2m = VertexSVV(-e*mW2)
GRW2_contribution = meg.OneFermionGVContribution(
    v_W2m_nadji_la,
    v_GRp_nadji_lb,
    v_gamma_GLp_W2m,
    ml[a], ml[b],
    MN[i], mW2)
W2GR_contribution = meg.OneFermionVGContribution(
    v_GRm_nadji_la,
    v_W2p_nadji_lb,
    v_gamma_GLp_W2m,
    ml[a], ml[b],
    MN[i], mW2)

# Define Vertexes for contribution of HRpm
cR_HRp_nadji_lb = interactionsSp_n_l(i, b)[(HRp, nadj[i], l[b])].expand().coeff(diracPR)
cL_HRp_nadji_lb = interactionsSp_n_l(i, b)[(HRp, nadj[i], l[b])].expand().coeff(diracPL)
v_HRp_nadji_lb = VertexSFF(cR_HRp_nadji_lb, cL_HRp_nadji_lb)

cR_HRm_nadji_la = interactionsSm_n_l(i, a)[(HRm, ladj[a], n[i])].expand().coeff(diracPR)
cL_HRm_nadji_la = interactionsSm_n_l(i, a)[(HRm, ladj[a], n[i])].expand().coeff(diracPL)
v_HRm_nadji_la = VertexSFF(cR_HRm_nadji_la, cL_HRm_nadji_la)

HR_contribution = meg.OneFermionSContribution(
    v_HRm_nadji_la,
    v_HRp_nadji_lb, # cambio de orden
    ml[a], ml[b],
    MN[i], mHR)

# Define symbolic contributions dictionary
symbolic_contribution_meg = {
    'Wpm': W_contribution,
    'W2pm': W2_contribution,
    'GLpm': GL_contribution,
    'GRpm': GR_contribution,
    'HRpm': HR_contribution,
    'GLW1': GLW1_contribution,
    'W1GL': W1GL_contribution,
    'GRW2': GRW2_contribution,
    'W2GR': W2GR_contribution
}

# Extract symbolic form factors from contributions
symbolic_formfactor_meg = {}
for contribution in symbolic_contribution_meg:
    if contribution in ['GLW1', 'W1GL', 'GRW2', 'W2GR']:
        e = 1  # The electric charge is already included in the vertex
    else:
        #e = symbols('e') 
        e = (2*mW1/k1)*sqrt(1 - mW1**2/mZ1_sym**2)
    symbolic_formfactor_meg[contribution] = {
        'sigmaL': e*F*symbolic_contribution_meg[contribution].sigmaL(),
        'sigmaR': e*F*symbolic_contribution_meg[contribution].sigmaR()
    }
