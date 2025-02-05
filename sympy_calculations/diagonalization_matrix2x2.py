from sympy import Matrix, Abs, sqrt, exp, arg, I, Mul, sign 
# we follow the result of section 3 of "A tale of three diagonalizations"
# in the following link http://arxiv.org/abs/2009.03990v3

class HermitianMatrix2x2(Matrix):
    """A class for 2x2 Hermitian matrices."""
    
    def unitary_transformation(self):
        """Return the unitary matrix U that diagonalize H, then Dagge(U)*H*U = Hdiag,
        where H_diag is a diagonal matrix."""
        a = self[0,0]
        b = self[1, 1]
        c = self[0,1]
        if isinstance(c, Mul):
            args = c.args
            if args[0].func == exp:
                exp_fase = args[0]
            else:
                exp_fase = args[1]
        fase = exp_fase.args[0]*(-I)
        # tan2th = (2*Abs(c))/(b -a)
        co_2th = 2*Abs(c) 
        ca_2th = b - a
        h_2th = sqrt(co_2th**2 + ca_2th**2)
        sin_2th = (co_2th)/h_2th
        cos_2th = (ca_2th)/h_2th
        # tan_th = (1 - cos_2th)/sin_2th
        co_th = 1 - cos_2th
        ca_th = sin_2th
        h_th = sqrt(co_th**2 + ca_th**2)
        sin_th = co_th/h_th
        cos_th = ca_th/h_th
        # Constructing the unitary transformation matrix U
        U11 = cos_th
        U12 = sin_th*(exp(I*fase))
        U21 = sin_th*(-exp(-I*fase))
        U22 = cos_th
        U = Matrix([[U11, U12], [U21, U22]])
        DU12 = sin_th*(-exp(I*fase))
        DU21 = sin_th*(exp(-I*fase))
        Dagger_U = Matrix([[U11, DU12], [DU21, U22]])
        return U, Dagger_U
    

class RealSymmetricMatrix2x2(Matrix):
    """A class for 2x2 Hermitian matrices."""
    
    def orthogonal_transformation(self):
        """Return the unitary matrix U that diagonalize H, then Dagge(U)*H*U = Hdiag,
        where H_diag is a diagonal matrix."""
        a = self[0,0]
        b = self[1, 1]
        c = self[0,1]
        # tan2th = (2*c)/(b -a)
        co_2th = 2*c 
        ca_2th = b - a
        h_2th = sqrt(co_2th**2 + ca_2th**2)
        sin_2th = (co_2th)/h_2th
        cos_2th = (ca_2th)/h_2th
        # tan_th = (1 - cos_2th)/sin_2th
        co_th = 1 - cos_2th
        ca_th = sin_2th
        h_th = sqrt(co_th**2 + ca_th**2)
        sin_th = co_th/h_th
        cos_th = ca_th/h_th
        # Constructing the unitary transformation matrix U
        O11 = cos_th
        O12 = sin_th
        O21 = -sin_th
        O22 = cos_th
        O = Matrix([[O11, O12], [O21, O22]])
        return O