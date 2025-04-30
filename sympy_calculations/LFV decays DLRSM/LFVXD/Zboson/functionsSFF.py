#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Monday Agust 05 2024

@author: Moises Zeleny (moiseszeleny@gmail.com)

Functions for the SFF diagram for LFVZD
"""
from sympy import Function
from PaVe2 import C0, C1, C2, C00, C11, C12, C22, B12_0
# ##########################################
# Functions H and I for the different diagrams with contributions to  Z->l1,l2
# ##########################################
# Funciones para las contribuciones del tipo FSS
class HSFF(Function):
    @classmethod
    def eval(cls, mX, ma, mb, M0, M1, M2, component):
        args = mX, ma, mb, M0, M1, M2
        if component == 1:
            out = 2*M2*C2(*args)
        elif component == 2:
            out = 0
        elif component == 3:
            out = 2*mb*(
                C12(*args) - C22(*args) + C2(*args)
            )
        elif component == 4:
            out = 0
        elif component == 5:
            out = -2*M1*C1(*args)
        elif component == 6:
            out = 2*ma*(
                C1(*args) + 2*C0(*args)- C11(*args) + C12(*args)
            )
        elif component == 7:
            out = 0
        elif component == 8:
            out = 0
        else:
            out = None
        return out
    
    def _latex(self, printer):
        mX, ma, mb, M0, M1, M2, componente = self.args #
        return rf'H^({componente})_{{SFF}}({printer.doprint(mX)}, {printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)}, {printer.doprint(M2)})'
    
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

class ISFF(Function):
    @classmethod
    def eval(cls, mX, ma, mb, M0, M1, M2, component):
        args = mX, ma, mb, M0, M1, M2
        if component == 1:
            out = -ma*M2*(C1(*args) - C0(*args))
        elif component == 2:
            out = -M1*M2*C0(*args)
        elif component == 3:
            out = ma*mb*(C1(*args) - C0(*args) - C2(*args))
        elif component == 4:
            out = mb*M1*(C2(*args) + C0(*args))
        elif component == 5:
            out = ma*M1*C1(*args)
        elif component == 6:
            out = -2*C00(*args) + (
                B12_0(mX, M1, M2) + M0**2*C0(*args) - ma**2*C1(*args) + mb**2*C2(*args)
            )
        elif component == 7:
            out = 0
        elif component == 8:
            out = -mb*M2*C2(*args)
        else:
            out = None
        return out
    
    def _latex(self, printer):
        mX, ma, mb, M0, M1, M2, componente = self.args #
        return rf'I^({componente})_{{SFF}}({printer.doprint(mX)}, {printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)}, {printer.doprint(M2)})'
