from sympy import MatrixSymbol, BlockMatrix, ZeroMatrix, Identity, block_collapse
from sympy import I, sqrt, DiagonalMatrix, symbols, Matrix
from sympy.physics.quantum import Dagger

n = 3
mD = MatrixSymbol('m_D', n,n)
M = MatrixSymbol('M', n,n)
#MD = DiagonalMatrix(MD)
mu = MatrixSymbol(r'mu', n,n)
#mu = DiagonalMatrix(mu)
Z3 = ZeroMatrix(n,n)
Z6 = ZeroMatrix(2*n,2*n)
I3 = Identity(n)
I6 = Identity(2*n)
Z36 = ZeroMatrix(3,6)
Z63 = ZeroMatrix(6,3)



Unu = MatrixSymbol('U_{\\nu}', 3,3)
V1 = MatrixSymbol('V_1', 3,3)
V2 = MatrixSymbol('V_2', 3,3)
WB = BlockMatrix(
    [
        [Unu, Z3, Z3],
        [Z3, V1, Z3],
        [Z3, Z3, V2]
    ]
)

V66 = MatrixSymbol('V', 6,6)
V66 = MatrixSymbol('V', 6,6)
WH = BlockMatrix(
    [
        [I3, Z36],
        [Z63, V66]
    ]
)

F = MatrixSymbol('F', 3,6)
WSS = BlockMatrix(
    [
        [I3, F],
        [-F.T, I6]
    ]
)

Mnu_explicit = BlockMatrix(
    [
        [mD],
        [Z3]
    ]
)
MN_explicit = BlockMatrix(
    [
        [Z3, M.T],
        [M, mu]
    ]
)
MN_inv_explicit = block_collapse(MN_explicit.inv())
MNT_inv_explicit = block_collapse(MN_explicit.T.inv())
F_explicit = block_collapse(Mnu_explicit.T*MNT_inv_explicit)


WSS_explicit = WSS.subs(F, F_explicit)

S = MatrixSymbol('S', 3,3)
S_explict = -M.inv()*mu
OnesM = BlockMatrix(
    [
        [I3, I3],
        [-I3, I3]
    ]
)/sqrt(2)
VS = OnesM*BlockMatrix(
    [
        [I3 - S*Dagger(S)/2, S],
        [-S, I3- Dagger(S)*S/2]
    ]
)
VS = block_collapse(VS)
VS = block_collapse(VS.subs(S*Dagger(S), Z3).subs(Dagger(S)*S, Z3))
VS_explicit = VS.subs(S, S_explict).expand().subs(M.T, M).expand()


WHWB = block_collapse(WH*WB).subs(V66, VS_explicit).subs(Z63, BlockMatrix([
    [Z3],
    [Z3]
])).subs(Z36, BlockMatrix([
    [Z3, Z3]
]))
WHWB = block_collapse(WHWB)
WSS_explicit2 = block_collapse(WSS_explicit).subs(I6, BlockMatrix(
    [
        [I3, Z3],
        [Z3, I3]
    ]
))
WSS_explicit2 = block_collapse(WSS_explicit2)
WSSWHWB = WSS_explicit2*WHWB
WSSWHWB = block_collapse(WSSWHWB).expand()

U = WSSWHWB.subs(M.T, M).expand().subs(mu.T, mu)


U01 = U.blocks[0,1].subs(M.T, M).expand().subs(mu.T, mu).expand().args[0]
U02 = U.blocks[0,2].subs(M.T, M).expand().subs(mu.T, mu).expand().args[0]
U11 = U.blocks[1,1].subs(M.T, M).expand().subs(mu.T, mu).expand().args[0]
U12 = U.blocks[1,2].subs(M.T, M).expand().subs(mu.T, mu).expand().args[0]
U21 = U.blocks[2,1].subs(M.T, M).expand().subs(mu.T, mu).expand().args[0]
U22 = U.blocks[2,2].subs(M.T, M).expand().subs(mu.T, mu).expand().args[0]

U_approx = BlockMatrix(
    [
        [Unu, U01, U02],
        [Z3, U11, U12], #U.blocks[1, 0]
        [U.blocks[2, 0], U21, U22]
    ]
)

U_approx2 = U_approx.subs(V1, I3).subs(V2, I3)

O = BlockMatrix([
    [I3, Z3, Z3],
    [Z3, I*I3, Z3],
    [Z3, Z3, I3]
])
U_approx3 = block_collapse(U_approx2*O)

U_approx4 = U_approx3.subs(M, DiagonalMatrix(M)).subs(mu,DiagonalMatrix(mu))