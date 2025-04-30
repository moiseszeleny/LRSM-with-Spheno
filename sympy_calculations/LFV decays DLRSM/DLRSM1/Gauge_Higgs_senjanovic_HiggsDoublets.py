from sympy import symbols, init_printing, I, Add, eye, conjugate, Eq
from sympy import sqrt, sin, cos, tan, trace, solve, Matrix, Function, factor
from sympy.physics import msigma 
from sympy.physics.quantum import Dagger

from .symbolic_tools import build_mass_matrix, invert_dict

from .potential_senjanovic_HiggsDoublets import ChiL, ChiR, Phi
from .potential_senjanovic_HiggsDoublets import change_scalar_fields, complex_scalar_fields, change_scalar_fields_approx
from .potential_senjanovic_HiggsDoublets import chiL0, chiR0, chiLp, chiLm, chiRp, chiRm
from .potential_senjanovic_HiggsDoublets import phi10, phi20, phi1p, phi1m, phi2p, phi2m
from .potential_senjanovic_HiggsDoublets import vevL, vevR, vevPhi, k1, k2, vL, vR
from .potential_senjanovic_HiggsDoublets import epsilon

# Guage Higgs Lagrangian DLRSM

## Covariant derivatives
### Doublets

g, gBL = symbols('g, g_{B-L}', positive=True)
W1L, W2L, W3L = symbols('W^1_L, W^2_L, W^3_L', real=True)
WL = [W1L, W2L, W3L]
W1R, W2R, W3R = symbols('W^1_R, W^2_R, W^3_R', real=True)
WR = [W1R, W2R, W3R]
Bmu = symbols(r'B_\mu', real=True)
B, L = symbols(r'B, L', real=True)

WsigmaL = Add(*[WL[i]*msigma(i+1) for i in range(3)])
WsigmaR = Add(*[WR[i]*msigma(i+1) for i in range(3)])

WLp, WLm, WRp, WRm = symbols('W_L^+, W_L^-, W_R^+, W_R^-')
Wcharge_subs = {
    W1L - I*W2L:WLp,
    W1L + I*W2L:WLm,
    W1R - I*W2R:WRp,
    W1R + I*W2R:WRm
}

WsigmaL, WsigmaR = WsigmaL.subs(Wcharge_subs), WsigmaR.subs(Wcharge_subs)

partial_mu = Function(r'\partial_\mu') # Partial mu as a function

#### partial_mu of doublets
partial_mu_L = Matrix(
    [
        [partial_mu(chiLp)],
        [partial_mu(chiL0)],

    ]
)
partial_mu_R = Matrix(
    [
        [partial_mu(chiRp)],
        [partial_mu(chiR0)]
    ]
)

#### deivate convariant independent of partial mu
DmuL = - I*g/2*WsigmaL - I*gBL/2*Bmu*eye(2)
DmuR = - I*g/2*WsigmaR - I*gBL/2*Bmu*eye(2)

#### Derivate covariant applied to Doublets
Dmu_ChiL = partial_mu_L +  DmuL*ChiL 
Dmu_ChiR = partial_mu_R + DmuR*ChiR

#### Complex conjugate identities
conjugate_fields = {
    conjugate(WLp):WLm,
    conjugate(WLm):WLp,
    conjugate(WRm):WRp,
    conjugate(WRp):WRm,
    conjugate(chiL0): chiL0,
    conjugate(chiR0): chiR0,
    conjugate(chiLp): chiLm,
    conjugate(chiLm): chiLp,
    conjugate(chiRm): chiRp,
    conjugate(chiRp): chiRm,
    conjugate(partial_mu(chiL0)): partial_mu(chiL0),
    conjugate(partial_mu(chiR0)): partial_mu(chiR0),
    conjugate(partial_mu(chiLp)): partial_mu(chiLm),
    conjugate(partial_mu(chiLm)): partial_mu(chiLp),
    conjugate(partial_mu(chiRm)): partial_mu(chiRp),
    conjugate(partial_mu(chiRp)): partial_mu(chiRm)
}

#### Dagger(Dmu_ChiL), Dagger(Dmu_ChiR)
Dmu_ChiL_dagger = Dagger(Dmu_ChiL).subs(conjugate_fields)
Dmu_ChiR_dagger = Dagger(Dmu_ChiR).subs(conjugate_fields)

#### Dagger(Dmu_ChiL)*Dmu_ChiL
Dmu_ChiL_square = (Dmu_ChiL_dagger*Dmu_ChiL)[0]

#### Dagger(Dmu_ChiR)*Dmu_ChiR
Dmu_ChiR_square = (Dmu_ChiR_dagger*Dmu_ChiR)[0]

### Bidoublets

#### partial_mu Phi
partial_mu_Phi = Matrix(
    [
        [partial_mu(phi10), partial_mu(phi1p)],
        [conjugate(partial_mu(phi2p)), partial_mu(phi20)],

    ]
)

#### Dmu Phi
Dmu_Phi = partial_mu_Phi -I*g/2*(WsigmaL*Phi - Phi*WsigmaR).subs(conjugate_fields)

#### complex conjugate identities
conjugate_scalarsPhi = {
    conjugate(phi10):phi10,
    conjugate(phi20):phi20,
    conjugate(phi1p):phi1m,
    conjugate(phi2p):phi2m,
    conjugate(phi1m):phi1p,
    conjugate(phi2m):phi2p,
    conjugate(partial_mu(phi10)):partial_mu(phi10),
    conjugate(partial_mu(phi20)):partial_mu(phi20),
    conjugate(partial_mu(phi1p)):partial_mu(phi1m),
    conjugate(partial_mu(phi2p)):partial_mu(phi2m),
    conjugate(partial_mu(phi1m)):partial_mu(phi1p),
    conjugate(partial_mu(phi2m)):partial_mu(phi2p)
}

#### Dagger(Dmu Phi)
Dmu_Phi_dagger = Dagger(Dmu_Phi).subs(conjugate_scalarsPhi).subs(conjugate_fields)

#### Dagger(Dmu Phi)Dmu Phi
Dmu_Phi_Dmu = (Dmu_Phi_dagger*Dmu_Phi).subs(conjugate_scalarsPhi)

#### trace(Dagger(Dmu Phi)Dmu Phi)
Tr_DmuPhi = trace(Dmu_Phi_Dmu)

## Kinetic Lagrangian of scalars
LHiggs = Dmu_ChiL_square + Dmu_ChiR_square + Tr_DmuPhi 

### Charged gauge bosons mass matrix

MW11 = LHiggs.diff(WLm, WLp)
MW12 = LHiggs.diff(WLm, WRp)
MW21 = LHiggs.diff(WRm, WLp)
MW22 = LHiggs.diff(WRm, WRp)

MW = Matrix(
    [
        [MW11, MW12],
        [MW21, MW22]
    ]
).subs(vevPhi).subs(vevL).subs(vevR)

#### Approximate case for k2 = 0
MW_k2_0 = MW.subs(k2, 0).subs(vL,0)

mW1, mW2 = symbols('m_{W_1}, m_{W_2}', positive=True)
mW_sol_k2vL_0 = solve(
    [Eq(mW1**2, MW_k2_0[0,0]), Eq(mW2**2, MW_k2_0[1,1])],
    [mW1**2, mW2**2], dict=True
)[0]

gvR_sol = solve(Eq(mW2**2, mW_sol_k2vL_0[mW2**2].subs((g**2*k1**2)/4, mW1**2)), (g**2*vR**2)/4, dict=True)[0]

#### Rotation over angle xi
xi = symbols(r'\xi')
Oxi = Matrix(
    [
        [cos(xi), -sin(xi)],
        [sin(xi), cos(xi)]
    ]
)

MW_rotate = (Oxi.T*MW.subs(vL,0)*Oxi).applyfunc(factor)

sin2xi_sol = solve(MW_rotate[0,1].trigsimp(), sin(2*xi), dict=True)[0]
tan2xi_sol = {tan(2*xi): (sin(2*xi)/cos(2*xi)).subs(sin2xi_sol)}

Oxi_approx = Oxi.subs(sin(xi), tan2xi_sol[tan(2*xi)]/2).subs(cos(xi), 1)

#### Mixing among mass eigenstates and weak eigenstates
W1p, W2p = symbols('W_1^+, W_2^+')
W1m, W2m = symbols('W_1^-, W_2^-')

W12p_doublet = Matrix(
    [
        [W1p],
        [W2p]
    ]
)
mixingW12 = Oxi*W12p_doublet
WLp_mix = mixingW12[0]
WRp_mix = mixingW12[1]

change_charged_bosons = {
    WLp:WLp_mix, WRp:WRp_mix,
    WLm:WLp_mix.subs(W1p, W1m).subs(W2p, W2m), WRm:WRp_mix.subs(W1p, W1m).subs(W2p, W2m)
}
#### in the case of k_2 = 0, we have the following expressions for the masses of the charged gauge bosons
change_charged_bosons_approx = {
    key: value.subs(cos(xi), 1).subs(sin(xi), 0) for key, value in change_charged_bosons.items() 
}

### Neutral gauge boson mass
WLWRB = [W3L, W3R, Bmu]
M0_square = build_mass_matrix(LHiggs, WLWRB, WLWRB).applyfunc(lambda x:x.simplify())/2
M0_square = M0_square.subs(vevPhi).subs(vevL).subs(vevR)

M0_square_vL0 = M0_square.applyfunc(factor).subs(vL,0)


M0_eigenvals = M0_square_vL0.eigenvals()

M0_eigenvects = M0_square_vL0.eigenvects()

#### Rotation matrix
P0 = Matrix.hstack(
    *[eigeninfo[2][0]/(eigeninfo[2][0]).norm()
    for eigeninfo in M0_eigenvects]
)

#### Rotation matrix high energy approximation
P0_approx = P0.applyfunc(
    lambda x: x.subs(k1, epsilon*vR).series(x=epsilon, x0=0, n=2).removeO().subs(epsilon, k1/vR)
).applyfunc(
    lambda x: x.subs(k2, epsilon*vR).series(x=epsilon, x0=0, n=2).removeO().subs(epsilon, k2/vR)
)

##### simplifying rotation matrix

sqrt_P0 = P0_approx[0,1].args[0].args[3].args[0].args[3].args[-1].args[0].args[0].args[0].args[0]
sqrt_P0_factor = sqrt_P0.factor()

P0_approx = P0_approx.subs(sqrt_P0, sqrt_P0_factor).applyfunc(factor)

P0_approx_inv = P0_approx.inv()

####Rotation approximation k2 = 0
M0_square_vL0_rotationg = (P0_approx_inv*M0_square_vL0*P0_approx).applyfunc(
    lambda x:x.factor().expand().collect(vR, factor)
)

M0_square_vL0_rotationg_k2_0 = M0_square_vL0_rotationg.subs(k2,0)


##### Rewriting the approximate rotation matrix
e = symbols('e', positive=True)
thw = symbols(r'\theta_W')

e_square_inv = (2/g**2+ 1/gBL**2).factor()
g_changes = {
    g:e/sin(thw),
    gBL:e/sqrt(cos(2*thw))
}

e_sol = solve(Eq(1/e**2, e_square_inv), e, dict=True)[0]
sinthw_sol_ggBL =  solve((1/e).subs(e_sol) - 1/(g*sin(thw)), sin(thw), dict=True)[0]
costhw_sol_ggBL = solve(Eq(cos(thw)**2, (1-sin(thw)**2).subs(sinthw_sol_ggBL)), cos(thw), dict=True)[1]
tanthw_sol_ggBL = {tan(thw): (sin(thw)/cos(thw)).subs(sinthw_sol_ggBL).subs(costhw_sol_ggBL)}
cos2thw_sol_ggBL = solve(
    Eq(cos(2*thw), (cos(thw)**2 - sin(thw)**2).subs(sinthw_sol_ggBL).subs(costhw_sol_ggBL)), 
    cos(2*thw), dict=True
)[0]
cos2thw_sol_ggBL[sqrt(cos(2*thw))] = sqrt(cos2thw_sol_ggBL[cos(2*thw)])
cos2thw_cosW_square_sol_ggBL = {
    cos(2*thw)/cos(thw)**2: (cos(2*thw)/cos(thw)**2).subs(cos2thw_sol_ggBL).subs(costhw_sol_ggBL)
}
cos2thw_cosW_square_sol_ggBL[sqrt(cos(2*thw))/cos(thw)] = sqrt(cos2thw_cosW_square_sol_ggBL[cos(2*thw)/cos(thw)**2]).expand()


P0_approx2_angles = P0_approx.subs(
    invert_dict(costhw_sol_ggBL)
).subs(
    invert_dict(sinthw_sol_ggBL)
).subs(
    invert_dict(tanthw_sol_ggBL)
).subs(
    invert_dict(cos2thw_cosW_square_sol_ggBL)
).applyfunc(lambda x:x.trigsimp()).subs(
    invert_dict(cos2thw_sol_ggBL)
)

P0_approx2_angles_inv = P0_approx2_angles.inv().applyfunc(lambda x:x.trigsimp())

M0_square_vL0_rotation1 = (P0_approx2_angles_inv*M0_square_vL0*P0_approx2_angles).applyfunc(factor)

M0_square_vL0_rotation1[0,0] = M0_square_vL0_rotation1[0,0].subs(sinthw_sol_ggBL).subs(cos2thw_sol_ggBL)

M0_square_vL0_rotation1[0,1] = M0_square_vL0_rotation1[0,1].subs(sinthw_sol_ggBL).subs(cos2thw_sol_ggBL)

M0_square_vL0_rotation1[0,2] = M0_square_vL0_rotation1[0,2].subs(sinthw_sol_ggBL).subs(cos2thw_sol_ggBL)

M0_square_vL0_rotation1[1,0] = M0_square_vL0_rotation1[1,0].subs(sinthw_sol_ggBL).subs(cos2thw_sol_ggBL)

M0_square_vL0_rotation1[2,0] = M0_square_vL0_rotation1[2,0].subs(sinthw_sol_ggBL).subs(cos2thw_sol_ggBL)

M0_square_vL0_rotation1[1,1] = (M0_square_vL0_rotation1[1,1].subs(
    sinthw_sol_ggBL
).subs(
    costhw_sol_ggBL
).subs(
    tanthw_sol_ggBL
).subs(
    cos2thw_sol_ggBL
).factor(deep=True)*4/(g**2*(k1**2 + k2**2))).subs(
    1/costhw_sol_ggBL[cos(thw)]**2, 1/cos(thw)**2
)*((g**2*(k1**2 + k2**2))/4)

M0_square_vL0_rotation1[1,2] = M0_square_vL0_rotation1[1,2].subs(
    sinthw_sol_ggBL
).subs(
    costhw_sol_ggBL
).subs(
    tanthw_sol_ggBL
).subs(
    cos2thw_sol_ggBL
).factor(deep=True).subs(
    sqrt(g**2 + 2*gBL**2), gBL/sin(thw)
).subs(
    g**2 + gBL**2, g**2*cos(thw)**2/cos(2*thw) 
).subs(
    4*sin(thw)*cos(thw)**2, 2*(sin(2*thw))*cos(thw)
).trigsimp()

M0_square_vL0_rotation1[2,1] = M0_square_vL0_rotation1[2,1].subs(
    sinthw_sol_ggBL
).subs(
    costhw_sol_ggBL
).subs(
    tanthw_sol_ggBL
).subs(
    cos2thw_sol_ggBL
).factor(deep=True).subs(
    sqrt(g**2 + 2*gBL**2), gBL/sin(thw)
).subs(
    g**2 + gBL**2, g**2*cos(thw)**2/cos(2*thw) 
).subs(
    4*sin(thw)*cos(thw)**2, 2*(sin(2*thw))*cos(thw)
).trigsimp()

M0_square_vL0_rotation1[2,2] = M0_square_vL0_rotation1[2,2].subs(
    sinthw_sol_ggBL
).subs(
    costhw_sol_ggBL
).subs(
    tanthw_sol_ggBL
).subs(
    cos2thw_sol_ggBL
).factor(deep=True).collect(vR, factor).subs(
    g**2 + gBL**2, g**2*cos(thw)**2/cos(2*thw) 
).expand().collect(vR, factor)

# sub matrix non_diagonal
m0_square_vL0_rotation1 = M0_square_vL0_rotation1[1:, 1:]

##### Extract the submatrix non_diagonal
x = symbols('x')

###### substituting k1^2 and vR^2 in terms of mW1, mW2 
M0_square_vL0_rotationg_k2_0_mWs = M0_square_vL0_rotationg_k2_0.applyfunc(
    lambda x:x.expand().collect([(g**2*k1**2)/4, (g**2*vR**2)/4])
).subs(gvR_sol).subs(k1**2, (4*mW1**2)/g**2).subs(vR**2, (4*(mW2**2 - mW1**2))/g**2)

###### Charpoly of submatrix nondiagonal
M0_square_vL0_rotationg_k2_0_mWs_det = (M0_square_vL0_rotationg_k2_0_mWs[1:,1:] - eye(2)*x).det().expand().collect(
    x, lambda x:x.collect([g,gBL], factor)
)
###### Solve the charpoly
MZs_mws_sol = solve(M0_square_vL0_rotationg_k2_0_mWs_det, x, dict=True)
mZ1, mZ2 = MZs_mws_sol[0][x], MZs_mws_sol[1][x]

###### Approximate expressions for masses of Z1 and Z2
mZ1_approx = mZ1.subs(mW1**2, epsilon*mW2**2).series(epsilon, 0, 2).removeO().subs(epsilon, mW1**2/mW2**2)
mZ2_approx = mZ2.subs(mW1**2, epsilon*mW2**2).series(epsilon, 0, 2).removeO().subs(epsilon, mW1**2/mW2**2)

sqrt_mz12 = (mZ2_approx - mZ1_approx).expand().args[0].args[1].args[0]
sqrt_mz12_factor = sqrt_mz12.collect([mW1, mW2], lambda x:x.factor())

mZ1_approx2 = mZ1_approx.subs(sqrt_mz12, sqrt_mz12_factor).factor()
mZ2_approx2 = mZ2_approx.subs(sqrt_mz12, sqrt_mz12_factor).expand().collect([mW1, mW2], factor)


ggbL_tanthw = {(2*g**2 + gBL**2)/g**2: tan(2*thw)/2 + 2}

mZ1_mW1 = mZ1_approx2.subs(1/costhw_sol_ggBL[cos(thw)]**2, 1/cos(thw)**2)

mZ2_mW12 = mZ2_approx2.subs(tanthw_sol_ggBL[tan(thw)]**2, tan(thw)**2).subs(
    1/cos2thw_cosW_square_sol_ggBL[cos(2*thw)/cos(thw)**2], 1/(cos(2*thw)/cos(thw)**2)
).subs(ggbL_tanthw).expand().collect([mW1, mW2], lambda x:x.factor())

mZ1_sym, mZ2_sym = symbols('m_{Z_1}, m_{Z_2}', positive=True)

####### Masses Z1, Z2 solution approximation 
mZ12_sol = solve(
    [
        Eq(mZ1_sym**2, mZ1_mW1),
        Eq(mZ2_sym**2, mZ2_mW12)
    ],
    [mZ1_sym**2, mZ2_sym**2], dict=True
)[0]

###### Rotation over angle zeta
zeta = symbols(r'\zeta')
Ozeta = Matrix(
    [
        [cos(zeta), -sin(zeta)],
        [sin(zeta), cos(zeta)]
    ]
)

m0_rotate = (Ozeta.T*m0_square_vL0_rotation1*Ozeta).applyfunc(factor)

m0_rotate[0,1].collect([sin(zeta), cos(zeta)], factor).subs(
    {
        sin(zeta)*cos(zeta):sin(2*zeta)/2,
        cos(zeta)**2:(1 + cos(2*zeta))/2,
        sin(zeta)**2:(1 - cos(2*zeta))/2
    }
).expand().collect([sin(2*zeta), cos(2*zeta)], lambda x:x.factor())

sin2zeta_sol = solve(m0_rotate[0,1].collect([sin(zeta), cos(zeta)], factor).subs(
    {
        sin(zeta)*cos(zeta):sin(2*zeta)/2,
        cos(zeta)**2:(1 + cos(2*zeta))/2,
        sin(zeta)**2:(1 - cos(2*zeta))/2
    }
).expand().collect([sin(2*zeta), cos(2*zeta)], lambda x:x.factor()), 
sin(2*zeta), dict=True)[0]

# tan(2 zeta)
tan2zeta_sol = {tan(2*zeta): (sin(2*zeta)/cos(2*zeta)).subs(sin2zeta_sol).factor()}

# tan(2 zeta) approximation
tan2zeta_sol_approx = {tan(2*zeta):tan2zeta_sol[tan(2*zeta)].collect(vR,factor).subs((k1**2 + k2**2), epsilon*vR).series(
    x=epsilon, x0=0, n=2
).removeO().subs(epsilon, (k1**2 + k2**2)/vR)}

#### mixing among weak and mass eigenstates neutral gauge bosons
Ozeta3d = Matrix(
    [
        [1, 0, 0],
        [0, Ozeta[0,0], Ozeta[0,1]],
        [0, Ozeta[1,0], Ozeta[1,1]]
    ]
)

P0 = Ozeta3d*P0_approx2_angles

P0_inv = P0_approx2_angles_inv*Ozeta3d.inv()
P0_inv = P0_inv.applyfunc(lambda x:x.trigsimp())

##### symbolic expresion for the rotation for neutral gauge bosons
R11, R12, R13 = symbols('R_{11}, R_{12}, R_{13}', real=True)
R21, R22, R23 = symbols('R_{21}, R_{22}, R_{23}', real=True)
R31, R32, R33 = symbols('R_{31}, R_{32}, R_{33}', real=True)

R = Matrix(
    [
        [R11, R12, R13],
        [R21, R22, R23],
        [R31, R32, R33]
    ]
)

changes_R_neutral_bosons = {r:o for r, o in zip(list(R), list(P0))}

P0R = R

Z1, Z2, A = symbols('Z1, Z2, A', real=True)

mixingZ12A = P0*Matrix([ # explicit mixing
    [A],
    [Z1],
    [Z2]
])
mixingZ12A_R = P0R*Matrix([ # symbolic mixing
    [A],
    [Z1],
    [Z2]
])

W3L_mix = mixingZ12A[0]
W3R_mix = mixingZ12A[1]
B_mix = mixingZ12A[2]

W3L_mix_R = mixingZ12A_R[0]
W3R_mix_R = mixingZ12A_R[1]
B_mix_R = mixingZ12A_R[2]

# neutral guage bosons complete mixing
change_neutral_bosons = {W3L:W3L_mix, W3R:W3R_mix, Bmu:B_mix}
# neutral guage bosons mixing approximation zeta = 0
change_neutral_bosons_approx = {}
for field, mixing in change_neutral_bosons.items():
    change_neutral_bosons_approx[field] = mixing.subs(sin(zeta),0).subs(cos(zeta),1)
# neutral guage bosons complete mixing with elements of the rotation matrix R
change_neutral_bosons_R = {W3L:W3L_mix_R, W3R:W3R_mix_R, Bmu:B_mix_R}

# LHiggs in the physical basis
LHiggs_physical = LHiggs.subs(
    change_charged_bosons
).subs(
    change_neutral_bosons_R
).subs(
    complex_scalar_fields
).subs(
    change_scalar_fields
)

# LHiggs in the physical basis approximation, v_L =  k_2 = 0, xi, zeta = 0
# and k1 << vR
LHiggs_physical_approx = LHiggs.subs(
    change_charged_bosons_approx
).subs(
    change_neutral_bosons_approx
).subs(
    complex_scalar_fields
).subs(
    change_scalar_fields_approx
).subs(k2,0).subs(vL,0)


if __name__ == '__main__':
    from sympy import pprint
    for field, mixing in change_neutral_bosons.items():
        pprint(Eq(field, mixing))

    for field, mixing in change_neutral_bosons_R.items():
        pprint(Eq(field, mixing.subs(R13, 0)))
