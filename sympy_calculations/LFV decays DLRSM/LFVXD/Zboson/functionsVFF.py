#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Monday Agust 05 2024

@author: Moises Zeleny (moiseszeleny@gmail.com)

Functions for the SFF diagram for LFVZD
"""
from sympy import Function
from PaVe2 import C0, C1, C2, C00, C11, C12, C22, B12_0, D
# ##########################################
# Functions H and I for the different diagrams with contributions to  Z->l1,l2
# ##########################################
# Funciones para las contribuciones del tipo VFF
class HVFF(Function):
    @classmethod
    def eval(cls, mX, ma, mb, M0, M1, M2, component):
        args = mX, ma, mb, M0, M1, M2
        p1p2 = mX**2 - ma**2 - mb**2
        if component == 1:
            y3 = 2*(2 - D)*ma*(C11(*args) - C12(*args))
            z3 = 4*ma*(C1(*args) - C2(*args)) + 2*(4 - D)*mb*C2(*args)
            u3 = 2*(2 - D)*ma*C1(*args)
            v3 = -4*ma*C0(*args)
            a3 = y3 + z3 + u3 + v3
            out = a3
        elif component == 2:
            out = M1*(2*(D - 2)*C1(*args) - 4*(C2(*args) - C0(*args)))
        elif component == 3:
            out = 0
        elif component == 4:
            out = 0
        elif component == 5:
            out = 0
        elif component == 6:
            out = M1*(4*(C1(*args) - C0(*args)) + 2*(2 - D)*C2(*args))
        elif component == 7:
            out = 0
        elif component == 8:
            y4 = -2*(2 - D)*mb*(C12(*args) - C22(*args))
            u4 = 4*mb*(C2(*args) - C1(*args))
            a4 = y4 + u4
            out = a4
        else:
            out = None
        return out
    
    def _latex(self, printer):
        mX, ma, mb, M0, M1, M2, componente = self.args #
        return rf'H^({componente})_{{VFF}}({printer.doprint(mX)}, {printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)}, {printer.doprint(M2)})'
    
    #def doit(self, deep=False, **hints):
    #    mX, ma, mb, M0, M1, M2, component = self.args
    #    if deep:
    #        mX = mX.doit()
    #        ma = ma.doit()
    #        mb = mb.doit()
    #        M0 = M0.doit()
    #        M1 = M1.doit()
    #        M2 = M2.doit()
    #    return self.replace(lambda F: isinstance(F, C0), lambda e: e.doit(deep=False))

class IVFF(Function):
    @classmethod
    def eval(cls, mX, ma, mb, M0, M1, M2, component):
        args = mX, ma, mb, M0, M1, M2
        p1p2 = mX**2 - ma**2 - mb**2
        if component == 1:
            y1 = (2 - D)*(2*C00(*args) - B12_0(mX, M1, M2) - M0**2*C0(*args))
            z1 = -(4 - D)*ma*mb*C1(*args) -2*ma**2*C1(*args) - 2*p1p2*C2(*args)
            u1 = -(
                ((2 - D)*ma**2 + 2*(mX**2))*C1(*args) + 2*mb**2*C2(*args)
            )
            v1 = -2*p1p2*C0(*args)
            a1 = y1 + z1 + u1 + v1
            out = a1
        elif component == 2:
            out = -(D - 4)*M1*(ma*C1(*args) + mb*(C2(*args) + C0(*args)))
        elif component == 3:
            out = (D - 4)*mb*M2*C2(*args)
        elif component == 4:
            out = 0
        elif component == 5:
            out = (2 - D)*M1*M2*C0(*args)
        elif component == 6:
            out = (D - 4)*ma*M2*(C1(*args) - C0(*args))
        elif component == 7:
            out = 0
        elif component == 8:
            z2 = -((4 - D)*mb + 2*ma)*mb*C2(*args)
            u2 = ma*mb*(2*C1(*args) - (4 - D)*C2(*args))
            v2 = (2 - D)*ma*mb*C0(*args)
            a2 = z2 + u2 + v2
            out = a2
        else:
            out = None
        return out
    
    def _latex(self, printer):
        mX, ma, mb, M0, M1, M2, componente = self.args #
        return rf'I^({componente})_{{VFF}}({printer.doprint(mX)}, {printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)}, {printer.doprint(M2)})'
