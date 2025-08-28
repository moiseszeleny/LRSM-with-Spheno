# ISS diagonalization tools

from sympy import fraction, sqrt

def sin_cos_from_catetos(tan_fraction):
    co, ca = fraction(tan_fraction)
    h = sqrt(co**2 + ca**2)
    sin_exp = co/h
    cos_exp = ca/h
    return sin_exp, cos_exp