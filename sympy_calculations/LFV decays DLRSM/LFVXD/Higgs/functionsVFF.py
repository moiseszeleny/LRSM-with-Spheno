#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Monday Agost 05 2024

@author: Moises Zeleny (moiseszeleny@gmail.com)

Functions for the SFF diagram for LFVHD
"""
from sympy import Function
from ..PaVe2 import C0, C1, C2, B12_0, D
# ##########################################
# Funciones H para las diferentes contribuciones al proceso h->l1,l2
# ##########################################
# Funciones para las contribuciones del tipo VFF
class GVFF(Function):
    @classmethod
    def eval(cls, mX, ma, mb, M0, M1, M2, component):
        args = mX, ma, mb, M0, M1, M2
        if component == 1:
            out = (2 - D)*ma*M1*C1(*args)
        elif component == 2:
            out = (
                D*(B12_0(mX, M1, M2) + M0**2*C0(*args) - ma**2*C1(*args) + mb**2*C2(*args)) 
                + 2*(mX**2 - ma**2 - mb**2)*(C1(*args) - C2(*args) - C0(*args))
            )
        elif component == 3:
            out = 0
        elif component == 4:
            out = -(2 - D)*mb*M2*C2(*args)
        elif component == 5:
            out = (2 - D)*ma*M2*(C1(*args) - C0(*args))
        elif component == 6:
            out = D*M1*M2*C0(*args)
        elif component == 7:
            out = -(D - 4)*ma*mb*(C1(*args) - C2(*args) - C0(*args))
        elif component == 8:
            out = -(2 - D)*mb*M1*(C2(*args) + C0(*args))
        else:
            out = None
        return out
    
    def _latex(self, printer):
        mX, ma, mb, M0, M1, M2, component = self.args #
        return rf'G^({component})_{{VFF}}({printer.doprint(mX)}, {printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)}, {printer.doprint(M2)})'





