"""
This script computes the mixing matrices in the inverse seesaw (ISS) scenario of the DLRSM.
It uses the block diagonalization method to derive the mixing matrices for neutrinos and charged leptons.
The script also defines the mixing matrices lepton flavor violation (LFV) calculations.
We consider the Casas-Ibarra parameterization for the Dirac mass matrix mD.
The script relies on the symbolic computation capabilities of SymPy.
"""
from block_diagonalization_iss_new import U, Unu, M, mu, mD, V1, V2, Z3, I3
from potential_senjanovic_HiggsDoublets import vR, epsilon
from sympy import DiagonalMatrix, BlockMatrix, Matrix, eye, block_collapse, I, symbols, sqrt
from sympy import solve, conjugate
from sympy.physics.quantum import Dagger


# Define the matrix with I in the (2,2) block to guarantee positive eigenvalues
O = BlockMatrix(
    [
        [I3, Z3, Z3],
        [Z3, I*I3, Z3],
        [Z3, Z3, I3]
    ]
)
U_transformed = block_collapse(U*O)

U01 = U_transformed.blocks[0,1].subs(M.T, M).expand().subs(mu.T, mu).expand().args[0]
U02 = U_transformed.blocks[0,2].subs(M.T, M).expand().subs(mu.T, mu).expand().args[0]
U11 = U_transformed.blocks[1,1].subs(M.T, M).expand().subs(mu.T, mu).expand().args[0]
U12 = U_transformed.blocks[1,2].subs(M.T, M).expand().subs(mu.T, mu).expand().args[0]
U21 = U_transformed.blocks[2,1].subs(M.T, M).expand().subs(mu.T, mu).expand().args[0]
U22 = U_transformed.blocks[2,2].subs(M.T, M).expand().subs(mu.T, mu).expand().args[0]

U_approx2 = BlockMatrix(
    [
        [Unu, U01, U02],
        [Z3, U11, U12], #U.blocks[1, 0]
        [U.blocks[2, 0], U21, U22]
    ]
)
U_approx3 = U_approx2.subs(V1, I3).subs(V2, I3).subs(M, DiagonalMatrix(M)).subs(mu, DiagonalMatrix(mu))

# We consider the Casas-Ibarra parameterization for mD
YR1, YR2, YR3 = symbols('Y_{R1} Y_{R2} Y_{R3}', positive=True)
MR1 = YR1*vR/sqrt(2)
MR2 = YR2*vR/sqrt(2)
MR3 = YR3*vR/sqrt(2)
muX = symbols(r'\mu_X', positive=True)
eye3 = eye(3)
Mu = muX*eye3
MM = Matrix(
    [
        [MR1, 0, 0],
        [0, MR2, 0],
        [0, 0, MR3]
    ]
)

Mdiag = MM*Mu.inv()*MM.T

# Define light neutrino masses
m1, m2, m3 = symbols('m_{1} m_{2} m_{3}', positive=True)
mnu = Matrix(
    [
        [m1, 0, 0],
        [0, m2, 0],
        [0, 0, m3]
    ]
)
# Define the Casas-Ibarra parameterization for mD = sqrt(Mdiag)*R*sqrt(mnu)*Unu^dagger
R = eye(3)  # We consider R = I3 for simplicity
mD_CI = (Mdiag.applyfunc(sqrt)*R*mnu.applyfunc(sqrt)*Dagger(Unu.as_explicit()))

# Substitute mD in U_approx3 with explicit block matrices
U_approx4 = U_approx3.as_explicit().subs({
    **{mD[i,j]: mD_CI[i,j] for i in range(3) for j in range(3)},
    **{M[i,j]: MM[i,j] for i in range(3) for j in range(3)},
    **{mu[i,j]: Mu[i,j] for i in range(3) for j in range(3)}
}).applyfunc(lambda x: x.factor())

# For symbolic simplification we define the unitary condition of Unu
UnuDaggerUnu = block_collapse(Dagger(Unu)*Unu).as_explicit()
UnuUnuDagger = block_collapse(Unu*Dagger(Unu)).as_explicit()

unitarity_conditions_UnuDaggerUnu = {
    UnuDaggerUnu[0,0]: 1,
    UnuDaggerUnu[1,1]: 1,
    UnuDaggerUnu[2,2]: 1,
    UnuDaggerUnu[0,1]: 0,
    UnuDaggerUnu[0,2]: 0,
    UnuDaggerUnu[1,0]: 0,
    UnuDaggerUnu[1,2]: 0,
    UnuDaggerUnu[2,0]: 0,
    UnuDaggerUnu[2,1]: 0
}

unitarity_conditions_UnuUnuDagger = {
    UnuUnuDagger[0,0]: 1,
    UnuUnuDagger[1,1]: 1,
    UnuUnuDagger[2,2]: 1,
    UnuUnuDagger[0,1]: 0,
    UnuUnuDagger[0,2]: 0,
    UnuUnuDagger[1,0]: 0,
    UnuUnuDagger[1,2]: 0,
    UnuUnuDagger[2,0]: 0,
    UnuUnuDagger[2,1]: 0
}

# We apply the unitarity conditions to U_approx5
U_approx5 = U_approx4.subs(unitarity_conditions_UnuDaggerUnu).subs(unitarity_conditions_UnuUnuDagger)

# heavy neutrino masses
M1m, M2m, M3m = symbols('M_{1}^- M_{2}^- M_{3}^-', positive=True)
M1p, M2p, M3p = symbols('M_{1}^+ M_{2}^+ M_{3}^+', positive=True)

MMminus = MM - Mu/2
MMplus = MM + Mu/2
# YRi in terms of heavy neutrino masses
YR_sol = solve([MMminus[0, 0] - M1m, MMminus[1, 1] - M2m, MMminus[2, 2] - M3m], [YR1, YR2, YR3], dict=True)[0]

# Uncomment the following lines if you want to have the heavy neutrino masses in terms of YRi
# Substitute YRi into MMplus to get the heavy neutrino masses Mip
#MMplus1 = MMplus.subs(YR_sol).applyfunc(lambda x:x.factor())
#Mp = M1p, M2p, M3p
#Mp_changes = {
#   Mp[i]:MMplus1[i,i] for i in range(3)
#}

U_approx6 = U_approx5.subs(YR_sol).applyfunc(lambda x:x.factor())

# In the ISS we have in the weak basis nu_L, nu_R^c, S^c, and the mass eigenstates are nu, N_-, N_+
# We define the mixing matrices as
# (nu_L, nu_R^c, S^c)_L = (UL, UR, US) * (nu, N_-, N_+)_L
# Thus, the mixing matrices are
UL = U_approx6[:3, :]
UR = U_approx6[3:6, :]
US = U_approx6[6:9, :]

# Additional definitions
ULc = conjugate(UL)
ULDagger = Dagger(UL)

URT = UR.T
URc = conjugate(UR)
URDagger = Dagger(UR)

USc = conjugate(US)
USDagger = Dagger(US)

# Vl charge lepton mixing matrix equal to I3
Vl = I3

# The total diagonal mass matrix is
M_full_diag = Matrix(
    [
        [m1, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, m2, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, m3, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, M1m, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, M2m, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, M3m, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, M1p, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, M2p, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, M3p]
    ]
)

# We can now define the different couplings needed for the LFV calculations
# GRL = URT*URc*M_full_diag*ULDagger*UL
GRLmat = URT*URc*M_full_diag*ULDagger*UL
# GSR = USDagger*USc*M_full_diag*URDagger*URc
GSRmat = USDagger*USc*M_full_diag*URDagger*URc
# OmegaRL = GRL + GRL.T
OmegaRLmat = GRLmat + GRLmat.T
# OmegaSR = GSR + GSR.T
OmegaSRmat = GSRmat + GSRmat.T

# Mixing matrix for W1 and leptons
QLDagger = ULDagger*Vl
QLmat = Dagger(QLDagger)
# Mixing matrix for W2 and leptons
QRDagger = URT*Vl
QRmat = Dagger(QRDagger)

# SRL = QR*MFull_diag*ULDagger*UL
SRLmat = QRmat*M_full_diag*ULDagger*UL
# TRL = URT*URc*M_full_diag*QLDagger
TRLmat = URT*URc*M_full_diag*QLDagger
# TSR = USDagger*USc*M_full_diag*URDagger*Vl
TSRmat = USDagger*USc*M_full_diag*URDagger*Vl
TSRDagger = Dagger(TSRmat)

# K = (SRL - epsilons**2*TSRDagger)
Kmat = (SRLmat - epsilon**2*TSRDagger)
#J = (TSRDagger + SRL)
Jmat = (TSRDagger + SRLmat)
