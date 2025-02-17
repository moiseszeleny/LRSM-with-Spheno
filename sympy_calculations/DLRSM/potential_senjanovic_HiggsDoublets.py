from sympy import symbols, I, sqrt
from sympy import trace, factor, conjugate, Matrix
from sympy.physics import msigma 
from sympy.physics.quantum import Dagger
from sympy import solve
from symbolic_tools import build_mass_matrix
from sympy import Dummy
from sympy import eye
from sympy import Eq
from sympy import sin, cos, tan
from sympy import series


##  Bidoublet definition
phi1p = symbols(r'{{\phi_1^+}}')
phi2p = symbols(r'{{\phi_2^+}}')

phi10, phi20 = symbols(r'\phi_1^0, \phi_2^0')

Phi = Matrix(
    [
        [phi10, phi1p],
        [conjugate(phi2p), phi20]
    ]
)
### Vevs k1, k2
k1, k2 = symbols(r"k_1, k_2", positive=True)
sqrt2 = sqrt(2)
vevPhi = {phi10:k1, phi20:k2, phi1p:0, phi2p:0}

## Doublets definition

chiL0 = symbols(r'\chi_L^0')
chiR0 = symbols(r'\chi_R^0')

chiLp = symbols(r'{{\chi_L^+}}')
chiRp = symbols(r'{{\chi_R^+}}')

ChiL = Matrix(
    [
        [chiLp],
        [chiL0]
    ]
)

ChiR = Matrix(
    [
        [chiRp],
        [chiR0]
    ]
)

### vevs definition
vL, vR = symbols(r'v_L, v_R', positive=True)
vevL = {chiL0:vL, chiLp:0}
vevR = {chiR0:vR, chiRp:0}

## Bidoublet products

PhiDagger = Dagger(Phi)
#PhiDagger
PhiDaggerPhi = PhiDagger*Phi
Phitilde = (msigma(2)*conjugate(Phi)*msigma(2))
#Phitilde
PhitildeDagger = Dagger(Phitilde)
PhiDaggerPhitilde = PhiDagger*Phitilde
#PhitildeDagger
PhitildeDaggerPhi = PhitildeDagger*Phi
PhitildeDaggerPhitilde = PhitildeDagger*Phitilde
PhiPhiDagger = Phi*PhiDagger
PhiPhitildeDagger = Phi*PhitildeDagger

## Doublets products

ChiLDagger = Dagger(ChiL)
ChiRDagger = Dagger(ChiR)

ChiLDaggerChiL = (ChiLDagger*ChiL)[0]
ChiRDaggerChiR = (ChiRDagger*ChiR)[0]

## Potential parameters
mu12, mu22 = symbols(r'\mu_1^2, \mu_2^2', real=True)
lamb1, lamb2, lamb3, lamb4, lamb5, lamb6 = symbols(r'\lambda_1, \lambda_2, \lambda_3, \lambda_4, \lambda_5, \lambda_6', real=True)
alpha1, alpha2, alpha3 = symbols(r'\alpha_1, \alpha_2, \alpha_3', real=True)
rho1, rho2,= symbols(r'\rho_1, \rho_2', real=True)

## Potential
V = (
    - mu12*trace(PhiDaggerPhi)
    + lamb1*trace(PhiDaggerPhi)**2
    + lamb2*trace(PhiDaggerPhi*PhiDaggerPhi)
    + lamb3/2*(trace(PhiDaggerPhitilde) + trace(PhitildeDaggerPhi))**2
    + lamb4/2*(trace(PhiDaggerPhitilde) - trace(PhitildeDaggerPhi))**2
    + lamb5*trace(PhiDaggerPhi*PhitildeDaggerPhitilde)
    + lamb6/2*(trace(PhiDaggerPhitilde*PhiDaggerPhitilde) + conjugate(trace(PhiDaggerPhitilde*PhiDaggerPhitilde)))
    - mu22*(ChiLDaggerChiL + ChiRDaggerChiR)
    + rho1*(ChiLDaggerChiL**2 + ChiRDaggerChiR**2)
    + rho2*(ChiLDaggerChiL*ChiRDaggerChiR)
    + alpha1*trace(PhiDaggerPhi)*(ChiLDaggerChiL + ChiRDaggerChiR)
    + alpha2*(
        ChiLDagger*Phi*PhiDagger*ChiL
        + ChiRDagger*PhiDagger*Phi*ChiR
    )[0]
    + alpha3*(
        ChiLDagger*Phitilde*PhitildeDagger*ChiL
        + ChiRDagger*PhitildeDagger*Phitilde*ChiR
    )[0]
)

### Potential evaluated in the vev
VLRPhi_vev = V.subs(vevL).subs(vevR).subs(vevPhi).simplify()

## Tadpole conditions
scalar_vevs = [k1, k2, vL, vR]
tadpoles_relations = {}
for vev in scalar_vevs:
    tadpoles_relations[vev] = VLRPhi_vev.diff(vev).factor()

### tadpole solutions mu12 mu22
tadpole12_sol = solve(
    [tadpoles_relations[k1], 
    tadpoles_relations[vR]], [mu12, mu22], dict=True
)[0]

tadpoles_relations_simplified = {}
for muij, tadpole in tadpole12_sol.items():
    tadpole_simplified = tadpole.collect(
        [k1, k2, vL, vR], factor
    ).subs(k2,0).subs(vL, 0) # remove vL and vR
    tadpoles_relations_simplified[muij] = tadpole_simplified

## Mass matrices

### Rewrite fields in terms of real and imaginary parts
phi10r, phi10i = symbols(r'\phi_1^{0r}, \phi_1^{0i}', real=True)
phi20r, phi20i = symbols(r'\phi_2^{0r}, \phi_2^{0i}', real=True)
chiR0r, chiR0i = symbols(r'\chi_R^{0r}, \chi_R^{0i}', real=True)
chiL0r, chiL0i = symbols(r'\chi_L^{0r}, \chi_L^{0i}', real=True)
complex_scalar_fields = {
    phi10: (k1 + phi10r + I*phi10i),
    phi20: (k2 + phi20r + I*phi20i),
    chiR0: (vR + chiR0r + I*chiR0i),
    chiL0: (vL + chiL0r + I*chiL0i)
}

### Substitution of real and imaginary fields
VLRPhi_ri = V.subs(complex_scalar_fields)
VLRPhi_ri_tadpole_caso1 = VLRPhi_ri.subs(tadpoles_relations_simplified)

### Add zero vev for new fields
vevPhi[phi10r] = 0#vevPhi[phi10]
vevPhi[phi10i] = 0
vevPhi[phi20r] = 0#vevPhi[phi20]
vevPhi[phi20i] = 0
vevL[chiL0r] = 0#vevL[deltaL0]
vevL[chiL0i] = 0
vevR[chiR0r] = 0#vevR[deltaR0]
vevR[chiR0i] = 0

## Mass matrix for charged scalars
phip_fields = [phi2p, chiLp, phi1p, chiRp]

dummyconjugate1p = Dummy(r'\phi_1^{+,d}')
dummyconjugate2p = Dummy(r'\phi_2^{+,d}')
dummyconjugateRp = Dummy(r'\chi_R^{+,d}')
dummyconjugateLp = Dummy(r'\chi_L^{+,d}')

dummychangep = {
    conjugate(phi1p):dummyconjugate1p,
    conjugate(phi2p):dummyconjugate2p,
    conjugate(chiRp):dummyconjugateRp,
    conjugate(chiLp):dummyconjugateLp
}
phim_fields = [dummyconjugate2p, dummyconjugateLp, dummyconjugate1p, dummyconjugateRp] 

Mp_square = build_mass_matrix(
    VLRPhi_ri_tadpole_caso1.subs(dummychangep), phim_fields, phip_fields
).subs(
    {value:key for key, value in dummychangep.items()}
).subs(
    vevPhi
).subs(vevL).subs(vevR).subs(k2,0).subs(vL, 0)

Mp_square = Mp_square.applyfunc(
    lambda x:x.collect([k1, vR], factor)
    )

### Eigenvalues problem for charged scalars
z = symbols('z')
poly_p = (Mp_square - z*eye(4)).det()
eigenvals_p = solve(poly_p.expand().factor(), z, dict=True)

#### dummy vector to calculate the eigenvectors of Mp_square
x1, x2, x3, x4 = symbols('x_1, x_2, x_3, x_4')
x = Matrix(
    [
        [x1],
        [x2],
        [x3],
        [x4]
    ]
)

#### sol3
eigevector_sol3 = solve(
    (Mp_square - eigenvals_p[1][z]*eye(4)).applyfunc(factor)*x, 
    [x1, x2, x3, x4], dict=True
)[0]
eigevector3 = x.subs(eigevector_sol3).subs(x4,1)
eigevector3 = (eigevector3/eigevector3.norm()).applyfunc(factor)
eigevector3

### sol2
eigevector_sol2 = solve(
    (Mp_square - eigenvals_p[2][z]*eye(4)).applyfunc(factor)*x, 
    [x1, x2, x3, x4], dict=True
)[0]
eigevector2 = x.subs(eigevector_sol2).subs(x2,1)
eigevector2 = (eigevector2/eigevector2.norm()).applyfunc(factor)

#sol4
eigevector_sol4 = solve(
    (Mp_square - eigenvals_p[0][z]*eye(4)).applyfunc(factor)*x, 
    [x1, x2, x3, x4], dict=True
)[0]
eigevector4 = x.subs(eigevector_sol4).subs(x4,1).subs(x1,0)
eigevector4 = (eigevector4/eigevector4.norm()).applyfunc(factor)

# sol1
eigevector_sol1 = solve(
    [x.dot(eigevector2), x.dot(eigevector3), x.dot(eigevector4)], 
    [x1, x2, x3, x4] , dict=True
)[0]
eigevector1 = x.subs(eigevector_sol1).subs(x1,1)
eigevector1 = (eigevector1/eigevector1.norm()).applyfunc(factor)

#### Rotation from eigenvects
Pp = Matrix.hstack(
    eigevector1, eigevector2, eigevector3, eigevector4
)
#### Diagonal matrix with square masses to charged scalars
Dp = (Pp.T*Mp_square*Pp).applyfunc(factor)
Ppinv = Pp.T

#### Physical charged scalars mixing of weak eigenstates
physical_charged_scalars_plus = (Ppinv*Matrix(phip_fields)).applyfunc(factor)

##### High energy approximation
epsilon = symbols('epsilon')
physical_charged_scalars_plus_approx = physical_charged_scalars_plus.applyfunc(
    lambda x:x.subs(k1, epsilon*vR).series(x=epsilon, x0=0, n=2).removeO().subs(epsilon, k1/vR)
)

phi1m, phi2m, chiLm, chiRm = symbols(r'\phi_1^-, \phi_2^-, \chi_L^-, \chi_R^-')
physical_charged_scalars_minus = (Ppinv*Matrix(phip_fields).subs(
    {
        phi1p: phi1m,
        phi2p: phi2m,
        chiLp: chiLm,
        chiRp: chiRm,
    }
)).applyfunc(factor)

physical_charged_scalars_minus_approx = physical_charged_scalars_minus.applyfunc(
    lambda x:x.subs(k1, epsilon*vR).series(x=epsilon, x0=0, n=2).removeO().subs(epsilon, k1/vR)
)
#### Weak eigenstates solutions in terms of new physical charged scalars

GRp = symbols(r'{{G_R^+}}')
HRp = symbols(r'{{H_R^+}}')
eqHRp = Eq(HRp, physical_charged_scalars_plus_approx[2])
eqGRp = Eq(GRp, physical_charged_scalars_plus_approx[3])

GRm = symbols(r'{{G_R^-}}')
HRm = symbols(r'{{H_R^-}}')
eqHRm = Eq(HRm, physical_charged_scalars_minus_approx[2])
eqGRm = Eq(GRm, physical_charged_scalars_minus_approx[3])

change_charged_higgs_plus = solve([eqGRp, eqHRp], [phi1p, chiRp])
change_charged_higgs_minus = solve([eqGRm, eqHRm], [phi1m, chiRm])

GLp = symbols(r'{{G_L^+}}')
HLp = symbols(r'{{H_L^+}}')
change_charged_higgs_plus[phi2p] = GLp
change_charged_higgs_plus[chiLp] = HLp

GLm = symbols(r'{{G_L^-}}')
HLm = symbols(r'{{H_L^-}}')
change_charged_higgs_minus[phi2m] = GLm
change_charged_higgs_minus[chiLm] = HLm

HLm = symbols('{{H_L^-}}')
HRm = symbols('{{H_R^-}}')
GLm = symbols('{{G_L^-}}')
GRm = symbols('{{G_R^-}}')

change_charged_higgs = {
    **change_charged_higgs_plus,
    **change_charged_higgs_minus
}

VLRPhi_ri_tadpole_caso1_physical = VLRPhi_ri_tadpole_caso1.subs(change_charged_higgs)
vev_physical_charged_scalars = {
    GLp:0, GRp:0, HLp:0, HRp:0,
    GLm:0, GRm:0, HLm:0, HRm:0
}
phip_fields = [GLp, GRp, HLp, HRp]

dummyconjugateGLp = Dummy(r'G_L^{+,d}')
dummyconjugateGRp = Dummy(r'G_R^{+,d}')
dummyconjugateHRp = Dummy(r'H_R^{+,d}')
dummyconjugateHLp = Dummy(r'H_L^{+,d}')

dummychangep = {
    conjugate(GLp):dummyconjugateGLp,
    conjugate(GRp):dummyconjugateGRp,
    conjugate(HRp):dummyconjugateHRp,
    conjugate(HLp):dummyconjugateHLp
}
phim_fields = [dummyconjugateGLp, dummyconjugateGRp, dummyconjugateHLp, dummyconjugateHRp] 
Mp_square_physical = build_mass_matrix(
    (VLRPhi_ri_tadpole_caso1_physical.subs(dummychangep)),phim_fields, phip_fields
).subs(
    {value:key for key, value in dummychangep.items()}
).subs(
    vevPhi
).subs(vevL).subs(vevR).subs(k2,0).subs(vL, 0).subs(vev_physical_charged_scalars)

Mp_square_physical = Mp_square_physical.applyfunc(factor).applyfunc(
    lambda x:x.collect([k1, vR], factor)
)


mHL, mHR = symbols('m_{H_L^+}, m_{H_R^+}', positive=True)
alpha12_rho12_masses_relations = solve(
    [
        mHL**2 - Mp_square_physical[2,2],
        mHR**2 - Mp_square_physical[3,3]
    ],
    [alpha2-alpha3, rho2-2*rho1], dict=True
)[0]

for param, exp in alpha12_rho12_masses_relations.items():
    exp_factor = exp.factor()
    alpha12_rho12_masses_relations[param] = exp_factor

## Mass matrix for neutral fields

phir_fields = [phi10r, phi20r, chiL0r, chiR0r]
phii_fields = [phi10i, phi20i, chiL0i, chiR0i]
phiri_fields = phir_fields + phii_fields

MRI_square = (build_mass_matrix(VLRPhi_ri_tadpole_caso1, phiri_fields, phiri_fields)).subs(
    vevPhi
).subs(vevL).subs(vevR).subs(k2,0).subs(vL, 0)

### Pseudo scalars
Mii = MRI_square[4:, 4:].applyfunc(
    lambda x:x.collect([k1, vR], factor)
)

Pii = Matrix(
    [
        [1, 0, 0, 0],
        [0, 1, 0, 0],
        [0, 0, 1, 0],
        [0, 0, 0, 1]
    ]
)

Dii = (Pii.T*Mii*Pii)

physical_pseudo_scalars = (Pii.T*Matrix(phii_fields)).applyfunc(factor)

A10 = symbols(r'{{A_1^0}}')
A20 = symbols(r'{{A_2^0}}')
GZ1 = symbols(r'{{G_{Z_1}}}')
GZ2 = symbols(r'{{G_{Z_2}}}')
eqA10 = Eq(A10, physical_pseudo_scalars[1])
eqA20 = Eq(A20, physical_pseudo_scalars[2])
eqGZ1 = Eq(GZ1, physical_pseudo_scalars[0])
eqGZ2 = Eq(GZ2, physical_pseudo_scalars[3])

change_pseudo_scalars = solve(
    [eqA10, eqA20, eqGZ1, eqGZ2], 
    [chiL0i, chiR0i, phi10i, phi20i]
)

mA10, mA20 = symbols('m_{A_1^0}, m_{A_2^0}', positive=True)
lamb2456 = lamb2 + 4*lamb4 - lamb5 + lamb6
lambdas2456_masses_relations = solve(
    [
        mA10**2 - Dii[1,1]
    ],
    [lamb2456], dict=True
)[0]

lambdas2456_masses_relations[lamb2456] = lambdas2456_masses_relations[lamb2456].factor()

rho12_relations = solve(
    [
        mA20**2 - Dii[2,2]
    ],
    [-2*rho1 + rho2], dict=True
)[0]

### Scalars
phir_fields = [phi20r, chiL0r, phi10r, chiR0r]

Mrr = (build_mass_matrix(VLRPhi_ri_tadpole_caso1, phir_fields, phir_fields)).subs(
    vevPhi
).subs(vevL).subs(vevR).subs(k2,0).subs(vL, 0)

Mrr = Mrr.applyfunc(lambda x:x.collect([k1, vR], factor))

mrr_mix = Matrix(
    [
        [Mrr[2,2], Mrr[2,3]],
        [Mrr[3,2], Mrr[3,3]]
    ]
)

th = symbols(r'\theta')
Oth = Matrix(
    [
        [cos(th), sin(th)],
        [-sin(th), cos(th)]
    ]
)

mrr_mix_rotate = (Oth.T*mrr_mix*Oth).applyfunc(factor)
sin2th_sol = solve(
    mrr_mix_rotate[0,1].trigsimp(), sin(2*th), dict=True
)[0]
tan2th_sol = {
    tan(2*th): (sin(2*th)/cos(2*th)).subs(sin2th_sol)
}

tan2th_approx = series(
    tan2th_sol[tan(2*th)].subs(k1, epsilon*vR),
    x=epsilon, x0=0, n=2
).removeO().factor().subs(epsilon, k1/vR)

Oth_approx = Oth.subs(sin(th), tan2th_approx/2).subs(cos(th), 1)
Oth_approx_inv = (Oth.T).subs(sin(th), tan2th_approx/2).subs(cos(th), 1)

mH10_square = mrr_mix_rotate[0,0].subs(
    sin(th), tan2th_approx/2
).subs(cos(th), 1).expand().collect(rho1, factor)

mH20_square = mrr_mix_rotate[1,1].subs(
    sin(th), tan2th_approx/2
).subs(cos(th), 1).expand().collect(rho1, factor)

mH10, mH20, mH30, mH40 = symbols('m_{H_1^0}, m_{H_2^0}, m_{H_3^0}, m_{H_4^0}', positive=True)

alpha13_lamb12_sol = solve(
    [
        Eq(mH10_square, mH10**2),
        Eq(mH20_square, mH20**2)
    ], 
    [(alpha1 + alpha3)**2, lamb1 + lamb2], dict=True
)[0]

mH30_square = Mrr[0,0]
mH30_square, mH30_square.subs(alpha12_rho12_masses_relations)

lamb2356_sol = solve(Eq(mH30_square, mH30**2), - lamb2 + 4*lamb3 + lamb5 + lamb6, dict=True)[0]

mH40_square = Mrr[1,1]
mH40_square, mH40_square.subs(alpha12_rho12_masses_relations)

rho21_neutral_sol = solve(Eq(mH40_square, mH40**2), rho2 - 2*rho1, dict=True)[0]

#### Physical scalars in term of weak eigenstates
physical_scalars = Oth_approx_inv*Matrix(
    [
        [phi10r],
        [chiR0r]
    ]
)

H10 = symbols(r'{{H_1^0}}')
H20 = symbols(r'{{H_2^0}}')
H30 = symbols(r'{{H_3^0}}')
H40 = symbols(r'{{H_4^0}}')
eqH10 = Eq(H10, physical_scalars[0])
eqH20 = Eq(H20, physical_scalars[1])
eqH30 = Eq(H30, phi20r)
eqH40 = Eq(H40, chiL0r)

change_scalars = solve(
    [eqH10, eqH20, eqH30, eqH40], 
    [chiL0r, chiR0r, phi10r, phi20r], dict=True
)[0]

for key, value in change_scalars.items():
    change_scalars[key] = value.factor(deep=True)

change_scalar_fields = {
    **change_scalars,
    **change_pseudo_scalars,
    **change_charged_higgs
}

# Final Higgs potential with scalar field in the mass basis
VLR_physical = VLRPhi_ri_tadpole_caso1.subs(
    complex_scalar_fields
).subs(
    change_scalar_fields
)

if __name__ == '__main__':
    from sympy import pprint

    pprint(change_scalar_fields)

    pprint(VLR_physical.free_symbols)