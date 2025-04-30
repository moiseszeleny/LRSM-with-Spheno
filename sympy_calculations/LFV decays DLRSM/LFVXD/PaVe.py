#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Monday Jul 30 2024

@author: Moises Zeleny (moiseszeleny@gmail.com)

The symbolic formalism of LFV Higgs decays is coded in this module
"""
from sympy import Function, symbols, solve, polylog, I
from sympy import Mul, Indexed
from sympy import Add, log, integrate
from sympy import lambdify, Symbol
from scipy.special import spence

# ###########################################
# Masas del higgs tipo SM, m1 y m2 masas de los leptones finales y
# delta parámetro infinitesimal para las integrales de Passarivo Veltman
# ###########################################
m0 = 'm_a'  # input('Initial particle mass ma: ')
m1 = 'm_i'  # input('Final particle mass mi: ')
m2 = 'm_j'  # input('Final particle mass mj: ')

ma = symbols(fr'{m0}', positive=True)
mi = symbols(fr'{m1}', positive=True)
mj = symbols(fr'{m2}', positive=True)

δ = 0  # Infinitesimal parameter for integrals

def sci_polylog(s: int, z: complex) -> float:
    '''
    Definition for the polilogarithm
    '''
    return spence(1-z)
#######################################
# Funciones de Passarino Veltman pertinentes para LFVHD
#######################################


# Funciones de PaVe escalares
A0 = Function('A_0')
B0 = Function('B_0')
B1_0 = Function('{{B^{(1)}_{0}}}')
B2_0 = Function('{{B^{(2)}_{0}}}')
B1_1 = Function('{{B^{(1)}_{1}}}')
B2_1 = Function('{{B^{(2)}_{1}}}')
B12_0 = Function('{{B^{(12)}_{0}}}')
B12_1 = Function('{{B^{(12)}_{1}}}')
B12_2 = Function('{{B^{(12)}_{2}}}')
C0 = Function('C_0')
C1 = Function('C_1')
C2 = Function('C_2')
C00 = Function('C_{00}')
C11 = Function('C_{11}')
C22 = Function('C_{22}')
C12 = Function('C_{12}')

# Adding factor from RD


# Partes finitas de las funciones de PaVe en la aproximación p_i^2 = 0
a0 = Function('a_0')
b1_0 = Function('{{b^{(1)}_0}}')
b2_0 = Function('{{b^{(2)}_0}}')
b1_1 = Function('{{b^{(1)}_1}}')
b2_1 = Function('{{b^{(2)}_1}}')
b12_0 = Function('{{b^{(12)}_0}}')
b12_1 = Function('{{b^{(12)}_1}}')
b12_2 = Function('{{b^{(12)}_2}}')

# Función simbolica para las divergencias
# Div=Function('Div')

# Definiendo divergencias
Δe = symbols(r'\Delta_\epsilon')


class Div(Function):
    '''Subclass of sympy Function which give the associated divergence of
    the PaVe functions predefined.

    Atributes
    ---------
    This has the same atributtes as Function
    of sympy

    Methods
    -------
    eval(F)
        F: PaVe function
        Return the divergence of the PaVe functions
        predefined

    Example
    -------
    >>> from sympy import symbols
    >>> m = symbols('m',rel=True)
    >>> Div(A0(m))
    m**2*Δe
    '''
    @classmethod
    def eval(cls, F):
        if F.func == A0:
            M = F.args[0]
            return M**2*Δe
        elif F.func == B1_0 or F.func == B2_0 or F.func == B12_0:
            return Δe
        elif F.func == B1_1 or F.func == B12_1:
            # M0, M1 = F.args
            return Δe/2
        elif F.func == B2_1 or F.func == B12_2:
            # M0, M2 = F.args
            return -(Δe/2)

# Cambios PaVe en términos de funciones divergentes y finitas


class PaVetoDivFin(Function):
    '''Subclass of sympy Function to rewrite PaVe functions in terms of
    the finite and divergent part of the corresponding PaVe

    Atributes
    ---------
    This has the same atributtes as Function of sympy

    Methods
    -------
    eval(F)
        F: PaVe Function
        Return the PaVe function in term of the finite and divergent parts

    Example
    -------
    >>> from sympy import symbols
    >>> m = symbols('m',rel=True)
    >>> PaVetoDivFin(A0(m))
    a0(m) + m**2*Δe
    '''
    @classmethod
    def eval(cls, F):
        if F.func == A0:
            args = F.args
            return Div(A0(*args)) + a0(*args)
        elif F.func == B1_0:
            args = F.args
            return Div(B1_0(*args)) + b1_0(*args)
        elif F.func == B2_0:
            args = F.args
            return Div(B2_0(*args)) + b2_0(*args)
        elif F.func == B12_0:
            args = F.args
            return Div(B12_0(*args)) + b12_0(*args)
        elif F.func == B1_1:
            args = F.args
            return Div(B1_1(*args)) + b1_1(*args)
        elif F.func == B2_1:
            args = F.args
            return Div(B2_1(*args)) + b2_1(*args)
        #elif F.func == C1:
            # args = F.args
        #    M0, M1, M2 = F.args
        #    return (1/ma**2)*(
        #        b1_0(M0, M1) - b12_0(M1, M2) + (M2**2-M0**2)*C0(M0, M1, M2)
        #        )
        elif F.func == C1:
            args = F.args
            mX, ma, mb, M0, M1, M2 = args
            mabq = ma**2 + mb**2 - mX**2
            f1 = M1**2 - M0**2 + ma**2
            f2 = M2**2 - M0**2 + mb**2
            return (
                2*mb**2*(-C0(*args)*f1 - b12_0(mX, M1, M2) + b2_0(mb, M0, M2)) + 
                mabq*(C0(*args)*f2 - b1_0(ma, M0, M1) + b12_0(mX, M1, M2))
            )/(4*ma**2*mb**2 - mabq**2)
        #elif F.func == C2:
            # args = F.args
        #    M0, M1, M2 = F.args
        #    return (-1/ma**2)*(
        #        b2_0(M0, M2) - b12_0(M1, M2) + (M1**2-M0**2)*C0(M0, M1, M2)
        #        )
        elif F.func == C2:
            args = F.args
            mX, ma, mb, M0, M1, M2 = args
            mabq = ma**2 + mb**2 - mX**2
            f1 = M1**2 - M0**2 + ma**2
            f2 = M2**2 - M0**2 + mb**2
            return (
                2*ma**2*(-C0(*args)*f2 + b1_0(ma, M0, M1) - b12_0(mX, M1, M2)) + 
                mabq*(C0(*args)*f1 + b12_0(mX, M1, M2) - b2_0(mb, M0, M2))
            )/(4*ma**2*mb**2 - mabq**2)
        else:
            raise ValueError(f'{F.func} is not defined.')
# definición de xk


_x, _m1, _m2 = symbols('x,m1,m2')
_funcion = _x**2 - ((ma**2 - _m1**2 + _m2**2)/ma**2)*_x + (_m2**2)/ma**2
_sols = solve(_funcion, _x)

# print(_sols[0].subs({_m1:1,_m2:2}))
# print(_sols[0].atoms(Symbol))


def xk(i, M1, M2, mh=ma):
    if i in [1, 2]:
        if (isinstance(M1, (Symbol, Mul, Indexed)) or
                isinstance(M2, (Symbol, Mul, Indexed)) or
                isinstance(mh, (Symbol, Mul, Indexed))):
            return _sols[i-1].subs({_m1: M1, _m2: M2, ma: mh})
        else:
            return _sols[i-1].evalf(30, subs={_m1: M1, _m2: M2, ma: mh})
    else:
        return 'i = a 1 o 2'


xkf = Function('x_k')


# C0 en terminos de R0
def Li2(x0):
    return polylog(2, x0)


def R0(x0, xi):
    return Li2(x0/(x0-xi)) - Li2((x0-1)/(x0-xi))

# R0_aprox = lambda x0,xi: Li2_aprox(x0/(x0-xi)) - Li2_aprox((x0-1)/(x0-xi))


def x0(M0, M2):
    return (M2**2-M0**2)/ma**2


def x3(M0, M1):
    return (-M0**2)/(M1**2-M0**2)

# Definiciones para las funciones b:
# https://www.sciencedirect.com/science/article/pii/S0550321317301785


y, t = symbols('y,t')
def f0(x):
    return integrate(log(1-(t/x)), (t, 0, 1))
def f1(x):
    return 2*integrate(t*log(1-(t/x)), (t, 0, 1))
# convirtiendo f0 y f1 en funciones simbolicas
f0sp = lambdify([y], f0(y), 'sympy')
f1sp = lambdify([y], f1(y), 'sympy')

# soluciones de la ecuación
M0, M1, M2 = symbols('M_0, M_1, M_2', real=True)
ec1 = y**2*mi**2 - y*(mi**2 + M0**2 - M1**2) + M0**2
ec2 = y**2*mj**2 - y*(mj**2 + M0**2 - M2**2) + M0**2
y11, y12 = solve(ec1, y)
y21, y22 = solve(ec2, y)

# Convirtiendo en funciones simbolicas las soluciones yij
y11sp = lambdify([mi, M0, M1], y11, 'sympy')
y12sp = lambdify([mi, M0, M1], y12, 'sympy')
y21sp = lambdify([mj, M0, M2], y21, 'sympy')
y22sp = lambdify([mj, M0, M2], y22, 'sympy')

def f01sum(mi, M0, M1):
    return Add(*[f0sp(y1j(mi, M0, M1)) for y1j in [y11sp, y12sp]])
# f01sum

def f02sum(mj, M0, M2):
    return Add(*[f0sp(y2j(mj, M0, M2)) for y2j in [y21sp, y22sp]])
# f02sum

def f11sum(mi, M0, M1):
    return Add(*[f1sp(y1j(mi, M0, M1)) for y1j in [y11sp, y12sp]])
# f11sum

def f12sum(mj, M0, M2):
    return Add(*[f1sp(y2j(mj, M0, M2)) for y2j in [y21sp, y22sp]])
# f12sum


b1_0sp = lambdify([mi, M0, M1], -log(M1**2)-f01sum(mi, M0, M1), 'sympy')
b2_0sp = lambdify([mj, M0, M2], -log(M2**2)-f02sum(mj, M0, M2), 'sympy')
b1_1sp = lambdify(
    [M0, M1], 
    -((1/2)*(-log(M1**2)) - f01sum(mi, M0, M1) + (1/2)*f11sum(mi, M0, M1)), 'sympy'
    )
b2_1sp = lambdify(
    [M0, M2], 
    (1/2)*(-log(M2**2)) - f02sum(mj, M0, M2) + (1/2)*f12sum(mj, M0, M2), 'sympy'
    )


# definiciones para las partes finitas de las PaVe
class PaVe_aprox(Function):
    '''Subclass of sympy Function to show explicitly the  definition of finite
    part of PaVe functions.
    Reference
    ---------
    This definition are given in the approximation given by
    https://arxiv.org/abs/1512.03266v2

    Atributes
    ---------
    This has the same atributtes as Function of sympy

    Methods
    -------
    eval(F)
        F: Finite part of PaVe Function
        Return explicitly definition of finite part of PaVe functions

    Example
    -------
    >>> from sympy import symbols
    >>> m = symbols('m',real=True)
    >>> PaVe_aprox(a0(m))
    m**2*(1+log((ma**2-I*δ)/(m**2-I*δ)))
    '''
    @classmethod
    def eval(cls, F):
        if F.func == a0:
            M = F.args[0]
            return M**2*(1+log((ma**2-I*δ)/(M**2-I*δ)))
        elif F.func == b1_0:
            mi, M0, M1 = F.args
            return b1_0sp(mi, M0, M1)
        elif F.func == b2_0:
            mj, M0, M2 = F.args
            return b2_0sp(mj, M0, M2)
        elif F.func == b1_1:
            mi, M0, M1 = F.args
            return b1_1sp(mi, M0, M1)
        elif F.func == b2_1:
            mj, M0, M2 = F.args
            return b2_1sp(mj, M0, M2)
        elif F.func == b12_0:
            mX, M1, M2 = F.args
            x1, x2 = xkf(1, M1, M2), xkf(2, M1, M2)
            # def log_rewrite(x):
            #     y = 1e30
            #     r = (y*x).expand()
            #     return log(r) - log(y)
            return log((mX**2 - I*δ)/(M1**2 - I*δ))/2 +\
                sum(x*(log(1 - 1/x)) for x in [x1, x2])
        elif F.func == b12_1:
            mX, M1, M2 = F.args
            return (1/(2*mX**2))*(
                M1**2*(1+log(mX**2/M1**2)) - M2**2*(1+log(mX**2/M2**2))
                ) + b12_0(M1, M2)/(2*mX**2)*(M2**2-M1**2 + mX**2)
        elif F.func == b12_2:
            mX, M1, M2 = F.args
            return (1/(2*mX**2))*(
                M1**2*(1+log(mX**2/M1**2)) - M2**2*(1+log(mX**2/M2**2))
                ) + b12_0(M1, M2)/(2*mX**2)*(M2**2-M1**2 - mX**2)
        elif F.func == C0:
            mX, mi, mj, M0, M1, M2 = F.args
            y0 = x0(M0, M2)
            y1 = xkf(1, M1, M2)
            y2 = xkf(2, M1, M2)
            y3 = x3(M0, M1)
            return (R0(y0, y1) + R0(y0, y2) - R0(y0, y3))/mX**2
        else:
            raise ValueError(f'{F.func} is not defined.')
##########################################
# ########################################


def cambiosx(M1, M2, mh):
    return {
        xkf(1, M1, M2): xk(1, M1, M2, mh),
        xkf(2, M1, M2): xk(2, M1, M2, mh)
        }


class PaVe_aprox_evalf(Function):
    '''Subclass of sympy Function to show explicitly the  definition of finite
    part of PaVe functions evaluated in a certain benchmark.
    Reference
    ---------
    This definition are given in the approximation given by
    https://arxiv.org/abs/1512.03266v2

    Atributes
    ---------
    This has the same atributtes as Function of sympy

    Methods
    -------
    eval(F)
        F: Finite part of PaVe Function evaluated
        Return numeric finite part of PaVe functions

    Example
    -------
    >>> from sympy import symbols
    >>> m = symbols('m',real=True)
    >>> PaVe_aprox(a0(1))
    m**2*(1+log((ma**2-I*δ)/(m**2-I*δ)))
    '''
    @classmethod
    def eval(cls, F, mX, mli=0, mlj=0):
        ####################################
        from sympy import And, Number
        are_true = And(*[isinstance(m, (Number)) for m in F.args])
        if are_true:
            pass
        else:
            print(
                'This function is used when the ' +
                'arguments of PaVe functions are numbers')
        #######################################
        m0, m1, m2 = symbols('m_0,m_1,m_2', posiive=True)
        # cambiosx = lambda M1,M2,mh: {xkf(1,M1,M2):xk(1,M1,M2,mh),
        #                     xkf(2,M1,M2):xk(2,M1,M2,mh)}
        if F.func == a0:
            M = F.args[0]
            return PaVe_aprox(a0(m0)).evalf(subs={ma: mX, m0: M})
        elif F.func == b1_0:
            M0, M1 = F.args
            return PaVe_aprox(b1_0(m0, m1)).evalf(subs={
                ma: mX, m0: M0, m1: M1, mi: mli
                })  # b1_0sp(M0,M1)
        elif F.func == b2_0:
            M0, M2 = F.args
            return PaVe_aprox(b2_0(m0, m2)).evalf(
                subs={ma: mX, m0: M0, m2: M2, mj: mlj})
        elif F.func == b1_1:
            M0, M1 = F.args
            return PaVe_aprox(b1_1(m0, m1)).evalf(
                subs={ma: mX, m0: M0, m1: M1, mi: mli})
        elif F.func == b2_1:
            M0, M2 = F.args
            return PaVe_aprox(b2_1(m0, m2)).evalf(
                subs={ma: mX, m0: M0, m2: M2, mi: mli})
        elif F.func == b12_0:
            M1, M2 = F.args
            return PaVe_aprox(b12_0(m1, m2)).subs(
                cambiosx(m1, m2, 125.18)).evalf(subs={ma: mX, m1: M1, m2: M2})
        elif F.func == b12_1:
            M1, M2 = F.args
            cambio = {b12_0(m1, m2): PaVe_aprox(b12_0(m1, m2))}
            return PaVe_aprox(b12_1(m1, m2)).subs(cambio).subs(
                cambiosx(m1, m2, 125.18)).evalf(subs={ma: mX, m1: M1, m2: M2})
        elif F.func == b12_2:
            M1, M2 = F.args
            cambio = {b12_0(m1, m2): PaVe_aprox(b12_0(m1, m2))}
            return PaVe_aprox(b12_2(m1, m2)).subs(cambio).subs(
                cambiosx(m1, m2, 125.18)).evalf(subs={ma: mX, m1: M1, m2: M2})
        # (1/(2*ma**2))*(M1**2*(1+log(ma**2/M1**2)) -
        # M2**2*(1+log(ma**2/M2**2))) +
        # b12_0(M1,M2)/(2*ma**2)*(M2**2-M1**2 - ma**2)
        elif F.func == C0:
            M0, M1, M2 = F.args
            # y0 = x0(M0,M2)
            # y1 = xkf(1,M1,M2)
            # y2 = xkf(2,M1,M2)
            # y3 = x3(M0,M1)
            return PaVe_aprox(C0(m0, m1, m2)).subs(
                cambiosx(m1, m2, 125.18)).evalf(
                    subs={ma: mX, m0: M0, m1: M1, m2: M2})
        # (R0(y0,y1) + R0(y0,y2) - R0(y0,y3))/ma**2
        else:
            raise ValueError(f'{F.func} is not defined.')

# #Funciones para sustituciones de las funciones de PaVe
# Para triangulos


def FuncPaVe(M0: symbols, M1:symbols, M2:symbols) -> list:
    """
    Returns a list of Passarino-Veltman functions for given masses.
    
    Parameters:
    M0, M1, M2 (symbols): Masses involved in the functions.
    
    Returns:
    List[Function]: List of Passarino-Veltman functions.
    """
    return [
        A0(M0), A0(M1), A0(M2), B1_0(M0, M1), B2_0(M0, M2),
        B1_1(M0, M1), B2_1(M0, M2), B12_0(M1, M2),
        C1(M0, M1, M2), C2(M0, M1, M2)
        ]


def funcPaVe(M0: symbols, M1:symbols, M2:symbols) -> list:
    """
    Returns a list of approximated finite parts of Passarino-Veltman functions.
    
    Parameters:
    M0, M1, M2 (symbols): Masses involved in the functions.
    
    Returns:
    List[Function]: List of approximated finite parts of Passarino-Veltman functions.
    """
    return [
        a0(M0), a0(M1), a0(M2), b1_0(M0, M1), b2_0(M0, M2),
        b1_1(M0, M1), b2_1(M0, M2), b12_0(M1, M2), C0(M0, M1, M2)
        ]


def cambiosDivFin(M0: symbols, M1:symbols, M2:symbols) -> dict:
    """
    Returns a dictionary of Passarino-Veltman functions to their finite parts.
    
    Parameters:
    M0, M1, M2 (symbols): Masses involved in the functions.
    
    Returns:
    Dict[Function, Function]: Dictionary mapping Passarino-Veltman functions to their finite parts.
    """
    return {
        PV: PaVetoDivFin(PV) for PV in FuncPaVe(M0, M1, M2)
        }


def cambios_aprox(M0: symbols, M1:symbols, M2:symbols) -> dict:
    """
    Returns a dictionary of approximated finite parts of Passarino-Veltman functions.
    
    Parameters:
    M0, M1, M2 (symbols): Masses involved in the functions.
    
    Returns:
    Dict[Function, Function]: Dictionary mapping Passarino-Veltman functions to their approximated finite parts.
    """
    return {PV: PaVe_aprox(PV) for PV in funcPaVe(M0, M1, M2)}


def cambios_aprox_evalf(M0: float, M1: float, M2: float, mh: float, mli: float, mlj: float) -> dict:
    """
    Returns a dictionary of evaluated approximated finite parts of Passarino-Veltman functions.
    
    Parameters:
    M0, M1, M2 (symbols): Masses involved in the functions.
    mh, mli, mlj (float): Numerical values of the masses.
    
    Returns:
    Dict[Function, float]: Dictionary mapping Passarino-Veltman functions to their evaluated approximated finite parts.
    """
    return {
        PV: PaVe_aprox_evalf(PV, mh, mli, mlj)
        for PV in funcPaVe(M0, M1, M2)
        }

if __name__ == '__main__':
    print('All right PaVe.py')
