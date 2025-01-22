#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Monday Jul 30 2024

@author: Moises Zeleny (moiseszeleny@gmail.com)

The symbolic formalism of LFV Higgs decays is coded in this module
"""
from sympy import symbols, Symbol, Mul, Indexed, solve, log
from sympy import Function, polylog, lambdify, integrate
from sympy import Add, S
from scipy.special import spence


m0 = 'm_a'  # input('Initial particle mass ma: ')
m1 = 'm_i'  # input('Final particle mass mi: ')
m2 = 'm_j'  # input('Final particle mass mj: ')

ma = symbols(fr'{m0}', positive=True)
mi = symbols(fr'{m1}', positive=True)
mj = symbols(fr'{m2}', positive=True)

_x, _m1, _m2 = symbols('x,m1,m2')
_funcion = _x**2 - ((ma**2 - _m1**2 + _m2**2)/ma**2)*_x + (_m2**2)/ma**2
_sols = solve(_funcion, _x)

# print(_sols[0].subs({_m1:1,_m2:2}))
# print(_sols[0].atoms(Symbol))


#def sci_polylog(s: int, z: complex) -> float:
#    '''
#    Definition for the polilogarithm
#    '''
#    return spence(1-z)

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


#b1_0sp = lambdify([mi, M0, M1], -log(M1**2)-f01sum(mi, M0, M1), 'sympy')
class b1_0sp(Function):
    @classmethod
    def eval(cls, mi, M0, M1):
        return -log(M1**2)-f01sum(mi, M0, M1)

    def _eval_evalf(self, prec):
        mi, M0, M1 = self.args
        return (-log(M1**2)-f01sum(mi, M0, M1))._eval_evalf(prec)

    def doit(self, deep=False, **hints):
        mi, M0, M1 = self.args
        return -log(M1**2)-f01sum(mi, M0, M1)

b2_0sp = lambdify([mj, M0, M2], -log(M2**2)-f02sum(mj, M0, M2), 'sympy')
b1_1sp = lambdify(
    [mi, M0, M1], 
    -((S(1)/2)*(-log(M1**2)) - f01sum(mi, M0, M1) + (S(1)/2)*f11sum(mi, M0, M1)), 'sympy'
    )
b2_1sp = lambdify(
    [mj, M0, M2], 
    (S(1)/2)*(-log(M2**2)) - f02sum(mj, M0, M2) + (S(1)/2)*f12sum(mj, M0, M2), 'sympy'
    )

# Definitions for C0

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


class x0(Function):
    @classmethod
    def eval(cls, mX, M0, M2):
        return (M2**2-M0**2)/mX**2

    def _eval_evalf(self, prec):
        mX, M0, M2 = self.args
        return ((M2**2-M0**2)/mX**2)._eval_evalf(prec)

    def doit(self, deep=False, **hints):
        mX, M0, M2 = self.args
        return (M2**2-M0**2)/mX**2

#def x0(M0, M2):
#    return (M2**2-M0**2)/ma**2


#def x3(M0, M1):
#    return (-M0**2)/(M1**2-M0**2)

class x3(Function):
    @classmethod
    def eval(cls, M0, M1):
        return (-M0**2)/(M1**2-M0**2)

    def _eval_evalf(self, prec):
        M0, M1 = self.args
        return ((-M0**2)/(M1**2-M0**2))._eval_evalf(prec)

    def doit(self, deep=False, **hints):
        M0, M1 = self.args
        return (-M0**2)/(M1**2-M0**2)

xkf = Function('x_k')

def cambiosx(M1, M2, mh):
    return {
        xkf(1, M1, M2): xk(1, M1, M2, mh),
        xkf(2, M1, M2): xk(2, M1, M2, mh)
        }

def Li2(x0):
    return polylog(2, x0)

# C0 en terminos de R0
def R0(x0, xi):
    return Li2(x0/(x0-xi)) - Li2((x0-1)/(x0-xi))