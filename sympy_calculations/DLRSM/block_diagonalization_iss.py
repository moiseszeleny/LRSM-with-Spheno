from sympy import MatrixSymbol, BlockMatrix, ZeroMatrix, symbols, Identity, block_collapse
from sympy import DiagonalMatrix
from sympy import cos, sin, tan, Dummy, I
from sympy import solve, sqrt, conjugate, fraction
from sympy.physics.quantum import Dagger
from iss_tools import sin_cos_from_catetos
from potential_senjanovic_HiggsDoublets import epsilon

n = 3
MD = MatrixSymbol('M', n,n)
#MD = DiagonalMatrix(MD)
mu = MatrixSymbol(r'mu', n,n)
#mu = DiagonalMatrix(mu)
Z3 = ZeroMatrix(n,n)
I3 = Identity(n)
#epsilon = symbols(r'\epsilon', positive=True)


MLRiss_mDp0 = BlockMatrix(
    [
        [Z3, epsilon*MD*I3, Z3],
        [epsilon*MD*I3, Z3, MD*I3],
        [Z3, MD*I3, mu*I3]
    ]
)
#Rotation Us
Us = BlockMatrix(
    [
        [cos(epsilon)*I3, Z3, sin(epsilon)*I3],
        [Z3, I3, Z3],
        [-sin(epsilon)*I3, Z3, cos(epsilon)*I3]
    ]
)

UsT = Us.T

UsTMLRissUs = block_collapse(UsT*MLRiss_mDp0*Us)
#
#sinxi_sol = solve(epsilon*cos(epsilon) - sin(epsilon), sin(epsilon), dict=True)[0]
#tanxi_sol = {tan(epsilon):(sin(epsilon)/cos(epsilon)).subs(sinxi_sol)}

sinxi_approx = epsilon/sqrt(1 + epsilon**2)
cosxi_approx = 1/sqrt(1 + epsilon**2)

UsTMLRissUs_sym = block_collapse(UsTMLRissUs.subs(sin(epsilon), sinxi_approx).subs(cos(epsilon), cosxi_approx)).simplify()
#UsTMLRissUs_sym_sinxi = block_collapse(block_collapse(UsTMLRissUs.subs(cos(epsilon), 1)).simplify().subs(epsilon - sin(epsilon), 0))

# Rotation UN
CN = MatrixSymbol('C_N', 3,3)
CNdiag = DiagonalMatrix(CN)
SN = MatrixSymbol('S_N', 3,3)
SNdiag = DiagonalMatrix(SN)
UN = BlockMatrix(
    [
        [I3, Z3, Z3],
        [Z3, CN*I3, SN*I3],
        [Z3, -SN*I3, CN*I3]
    ]
)
UNT = BlockMatrix(
    [
        [I3, Z3, Z3],
        [Z3, CN*I3, -SN*I3],
        [Z3, SN*I3, CN*I3]
    ]
)

UNTUsTMLRissUsUN = block_collapse(UNT*UsTMLRissUs_sym*UN)
#UNTUsTMLRissUsUN_sinxi = block_collapse(UNT*UsTMLRissUs_sym_sinxi*UN)

# Rotation Unu and Ul
Unu = MatrixSymbol(r'U_{\nu}', 3,3)
Unu_matrix = BlockMatrix(
    [
        [Unu, Z3, Z3],
        [Z3, I3, Z3],
        [Z3, Z3, I3]
    ]
)
Unu_matrixT = BlockMatrix(
    [
        [Unu.T, Z3, Z3],
        [Z3, I3, Z3],
        [Z3, Z3, I3]
    ]
)

Ul = MatrixSymbol(r'U_{\ell}', 3,3)
Ul_matrix = BlockMatrix(
    [
        [Ul, Z3, Z3],
        [Z3, I3, Z3],
        [Z3, Z3, I3]
    ]
)
Ul_matrixDagger = BlockMatrix(
    [
        [Dagger(Ul), Z3, Z3],
        [Z3, I3, Z3],
        [Z3, Z3, I3]
    ]
)

mnu = DiagonalMatrix(MatrixSymbol(r'm_\nu',3,3))

UnuTUNTUsTMLRissUsUNUnu2 = block_collapse(
    block_collapse(Unu_matrixT*UNTUsTMLRissUsUN*Unu_matrix).expand().subs(
        ((epsilon**2)/(1 + epsilon**2))*Unu.T*mu*Unu, mnu
    )#.subs(xi_approximations)
)

Oi = BlockMatrix(
    [
        [I3, Z3, Z3],
        [Z3, I*I3, Z3],
        [Z3, Z3, I3]
    ]
)
UnuTUNTUsTMLRissUsUNUnu2 = block_collapse(
    Oi*UnuTUNTUsTMLRissUsUNUnu2*Oi.T
)

th1 = symbols(r'\theta_1', real=True)
th2 = symbols(r'\theta_2', real=True)
th3 = symbols(r'\theta_3', real=True)

UnuTUNTUsTMLRissUsUNUnu2_12 = block_collapse(
    UnuTUNTUsTMLRissUsUNUnu2.blocks[2,1].subs(
        mu, DiagonalMatrix(mu),
    ).subs(
        MD, DiagonalMatrix(MD)
    ).subs(CN, DiagonalMatrix(CN)).subs(SN, DiagonalMatrix(SN)).expand()
).as_explicit().applyfunc(lambda x:x.factor().subs(
    {
        SN[0,0]:sin(th1),
        CN[0,0]:cos(th1),
        SN[1,1]:sin(th2),
        CN[1,1]:cos(th2),
        SN[2,2]:sin(th3),
        CN[2,2]:cos(th3) 
    }
).expand().collect([sin(th1), cos(th1), sin(th2), cos(th2), sin(th3), cos(th3)], lambda x:x.factor())
)

UnuTUNTUsTMLRissUsUNUnu2_12_trigsimp = UnuTUNTUsTMLRissUsUNUnu2_12.applyfunc(lambda x:x.trigsimp())

UnuTUNTUsTMLRissUsUNUnu2_12_trigsimp_th1 = UnuTUNTUsTMLRissUsUNUnu2_12_trigsimp[0,0]
UnuTUNTUsTMLRissUsUNUnu2_12_trigsimp_th2 = UnuTUNTUsTMLRissUsUNUnu2_12_trigsimp[1,1]
UnuTUNTUsTMLRissUsUNUnu2_12_trigsimp_th3 = UnuTUNTUsTMLRissUsUNUnu2_12_trigsimp[2,2]

sin2th1_sol = solve(UnuTUNTUsTMLRissUsUNUnu2_12_trigsimp_th1, sin(2*th1), dict=True)[0]
sin2th2_sol = solve(UnuTUNTUsTMLRissUsUNUnu2_12_trigsimp_th2, sin(2*th2), dict=True)[0]
sin2th3_sol = solve(UnuTUNTUsTMLRissUsUNUnu2_12_trigsimp_th3, sin(2*th3), dict=True)[0]

tan2th1_sol = {tan(2*th1):(sin2th1_sol[sin(2*th1)]/cos(2*th1)).subs(epsilon, 0)}
tan2th2_sol = {tan(2*th2):(sin2th2_sol[sin(2*th2)]/cos(2*th2)).subs(epsilon, 0)}
tan2th3_sol = {tan(2*th3):(sin2th3_sol[sin(2*th3)]/cos(2*th3)).subs(epsilon, 0)}

#tan2th1_sol[tan(2*th1)] = tan2th1_sol[tan(2*th1)].series(epsilon, 0, 3).removeO().factor()
#tan2th2_sol[tan(2*th2)] = tan2th2_sol[tan(2*th2)].series(epsilon, 0, 3).removeO().factor()
#tan2th3_sol[tan(2*th3)] = tan2th3_sol[tan(2*th3)].series(epsilon, 0, 3).removeO().factor()

sin2th1, cos2th1 = sin_cos_from_catetos(tan2th1_sol[tan(2*th1)])
sin2th2, cos2th2 = sin_cos_from_catetos(tan2th2_sol[tan(2*th2)])
sin2th3, cos2th3 = sin_cos_from_catetos(tan2th3_sol[tan(2*th3)])

tanth1 = ((1 - cos2th1)/sin2th1).factor()
tanth2 = ((1 - cos2th2)/sin2th2).factor()
tanth3 = ((1 - cos2th3)/sin2th3).factor()

sinth1, costh1 = sin_cos_from_catetos(tanth1)
sinth2, costh2 = sin_cos_from_catetos(tanth2)
sinth3, costh3 = sin_cos_from_catetos(tanth3)

sinth1 = (sinth1).factor()
costh1 = (costh1).factor()
sinth2 = (sinth2).factor()
costh2 = (costh2).factor()
sinth3 = (sinth3).factor()
costh3 = (costh3).factor()

UnuTUNTUsTMLRissUsUNUnu2_explicit = block_collapse(
    UnuTUNTUsTMLRissUsUNUnu2.subs(
        mu, DiagonalMatrix(mu),
    ).subs(
        MD, DiagonalMatrix(MD)
    ).subs(CN, DiagonalMatrix(CN)).subs(SN, DiagonalMatrix(SN)).expand()
).as_explicit().applyfunc(lambda x:x.factor().subs(
    {
        SN[0,0]:sin(th1),
        CN[0,0]:cos(th1),
        SN[1,1]:sin(th2),
        CN[1,1]:cos(th2),
        SN[2,2]:sin(th3),
        CN[2,2]:cos(th3) 
    }
).expand().collect([sin(th1), cos(th1), sin(th2), cos(th2), sin(th3), cos(th3)], lambda x:x.factor())
)

eigenvalsMnu = UnuTUNTUsTMLRissUsUNUnu2_explicit.subs(
    {
        sin(th1): sinth1,
        cos(th1): costh1,
        sin(th2): sinth2,
        cos(th2): costh2,
        sin(th3): sinth3,
        cos(th3): costh3,
    }
).applyfunc(lambda x:x.subs(epsilon,0).factor())

Upmns = MatrixSymbol(r'U_{\text{PMNS}}', 3,3)
U = block_collapse(Us*UN*conjugate(Unu_matrix)*Oi)#.subs(cos(epsilon), 1)

Uf = block_collapse((Dagger(Ul_matrix)*Us*UN*conjugate(Unu_matrix)*Oi))#.subs(cos(epsilon), 1))

U_exp = U.subs(CN, DiagonalMatrix(CN)).subs(SN, DiagonalMatrix(SN)).expand().as_explicit()
Uf_exp = Uf.subs(Dagger(Ul)*conjugate(Unu), Upmns).subs(CN, DiagonalMatrix(CN)).subs(SN, DiagonalMatrix(SN)).expand().as_explicit()

nu = MatrixSymbol(r'\nu', 3,1)
Nm = MatrixSymbol('N^-', 3,1)
Np = MatrixSymbol('N^+', 3,1)
Nu = BlockMatrix(
    [
        [nu],
        [Nm],
        [Np]
    ]
)


U_exp2 = U_exp.applyfunc(lambda x:x.factor().subs(
    {
        SN[0,0]:sin(th1),
        CN[0,0]:cos(th1),
        SN[1,1]:sin(th2),
        CN[1,1]:cos(th2),
        SN[2,2]:sin(th3),
        CN[2,2]:cos(th3) 
    }
).expand().collect([sin(th1), cos(th1), sin(th2), cos(th2), sin(th3), cos(th3)], lambda x:x.factor())).subs(
    {
        sin(th1): sinth1,
        cos(th1): costh1,
        sin(th2): sinth2,
        cos(th2): costh2,
        sin(th3): sinth3,
        cos(th3): costh3,
    }
).applyfunc(lambda x:x.expand().collect([Nm[0,0], Nm[1,0], Nm[2,0]], lambda x:x.factor()))

Uf_exp2 = Uf_exp.applyfunc(lambda x:x.factor().subs(
    {
        SN[0,0]:sin(th1),
        CN[0,0]:cos(th1),
        SN[1,1]:sin(th2),
        CN[1,1]:cos(th2),
        SN[2,2]:sin(th3),
        CN[2,2]:cos(th3) 
    }
).expand().collect([sin(th1), cos(th1), sin(th2), cos(th2), sin(th3), cos(th3)], lambda x:x.factor())).subs(
    {
        sin(th1): sinth1,
        cos(th1): costh1,
        sin(th2): sinth2,
        cos(th2): costh2,
        sin(th3): sinth3,
        cos(th3): costh3,
    }
).applyfunc(lambda x:x.expand().collect([Nm[0,0], Nm[1,0], Nm[2,0]], lambda x:x.factor()))

mNi = symbols('m_{n_1}, m_{n_2}, m_{n_3}, m_{n_4}, m_{n_5}, m_{n_6}, m_{n_7}, m_{n_8}, m_{n_9}', positive=True)
mNi_changes = {eigenvalsMnu[i,i]:mNi[i] for i in range(9)}

list0 = [solve(eigenvalsMnu[3+i,3+i]-mNi[3+i], sqrt(mu[i,i]**2 + 4*MD[i,i]**2), dict=True)[0] for i in range(3)]

dict_sqrt_muii_MDi = {
    **list0[0],
    **list0[1],
    **list0[2]
}

list1 = [solve(eigenvalsMnu[3+i,3+i]-mNi[3+i], MD[i,i]**2, dict=True)[0] for i in range(3)]
dict_Mii = {
    **list1[0],
    **list1[1],
    **list1[2]
}

list2 = []
for i in range(3):
    eq = eigenvalsMnu[6+i,6+i].subs(dict_Mii)-mNi[6+i] 
    sol = solve(eq, mu[i,i], dict=True)[0]
    #print(sol)
    list2.append(sol)

dict_muii = {
    **list2[0],
    **list2[1],
    **list2[2]
}

dict_Mii2 = {}
for key, value in dict_Mii.items():
    #print(f"Key: {key}, Value: {value}")
    #print("\n")
    dict_Mii2[key] = value.subs(dict_muii)

dict_Mii2_sqrt = {
    MD[i,i]:sqrt(dict_Mii2[MD[i,i]**2]) for i in range(3)
}

UL = U_exp2[:3,:]
UR = U_exp2[3:6,:]
US = U_exp2[6:,:]

mn58 = Dummy('m_{n_{58}}', negative=True)
mn47 = Dummy('m_{n_{47}}', negative=True)
mn69 = Dummy('m_{n_{69}}', negative=True)

mns_dummys = {
    mNi[3] - mNi[6]:mn47,
    mNi[4] - mNi[7]:mn58,
    mNi[5] - mNi[8]:mn69
}
dummys_mns = {
    mn47:mNi[3] - mNi[6],
    mn58:mNi[4] - mNi[7],
    mn69:mNi[5] - mNi[8]
}

ULmni = UL.subs(dict_sqrt_muii_MDi).subs(dict_Mii2).subs(dict_muii).subs(dict_Mii2_sqrt).applyfunc(
    lambda x:x.factor(deep=True)
)

URmni = UR.subs(dict_sqrt_muii_MDi).subs(dict_Mii2).subs(dict_muii).subs(dict_Mii2_sqrt).applyfunc(
    lambda x:x.factor(deep=True)
)

USmni = US.subs(dict_sqrt_muii_MDi).subs(dict_Mii2).subs(dict_muii).subs(dict_Mii2_sqrt).applyfunc(
    lambda x:x.factor(deep=True)
)

GRL = (URmni.T*conjugate(URmni)*(eigenvalsMnu.subs(mNi_changes))*Dagger(ULmni)*conjugate(ULmni)).applyfunc(
    lambda x:x.factor()
).replace(
    sin(epsilon), sin(epsilon)
).subs(dict_Mii2).subs(dict_muii).subs(dict_Mii2_sqrt).applyfunc(
    lambda x:x.factor(deep=True)
).subs(mns_dummys).simplify().subs(dummys_mns)

GSR = (Dagger(USmni)*conjugate(USmni)*(eigenvalsMnu.subs(mNi_changes))*Dagger(URmni)*conjugate(URmni)).applyfunc(
    lambda x:x.factor()
).replace(
    sin(epsilon), sin(epsilon)
).subs(dict_Mii2).subs(dict_muii).subs(dict_Mii2_sqrt).applyfunc(
    lambda x:x.factor(deep=True)
).subs(mns_dummys).simplify().subs(dummys_mns)

a13, rho1 = symbols(r'\alpha_{13}, \rho_1', positive=True)

Gamma = (GRL - ((a13)/(2*rho1))*epsilon**2*Dagger(GSR)).subs(mns_dummys).simplify().subs(dummys_mns).applyfunc(
    lambda x:x.subs(sin(epsilon)**2, epsilon**2).factor(deep=True)
)

Omega = (Gamma + Gamma.T).applyfunc(lambda x:x.factor())#.replace(epsilon**2,0)