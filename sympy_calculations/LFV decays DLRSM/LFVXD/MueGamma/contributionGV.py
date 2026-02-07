#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Monday September 15 2025

@author: Moises Zeleny (moiseszeleny@gmail.com)

Functions for the vector contribution for mu to e gamma
"""
from sympy import Function
from ..PaVe2 import C1
# ##########################################
# Functions for the one loop contribution of mu to e gamma from Charged scalars S
# ##########################################
# Funciones para las contribuciones del tipo FSS
class HGV(Function):
    @classmethod
    def eval(cls, ma, mb, M0, MV, component):
        args = 0, ma**2, mb**2, MV**2, MV**2, M0**2
        D = 4
        if component == 1:
            out = 0
        elif component == 2:
            out = 0
        elif component == 3:
            out = C1(*args)
        elif component == 4:
            out = 0
        else:
            out = None
        return out
    
    def _latex(self, printer):
        ma, mb, M0, MS, componente = self.args #
        return rf'H^({componente})_{{S}}({printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(MS)})'

#class IV(Function):
#    @classmethod
#    def eval(cls, ma, mb, M0, MS, component):
#        argsB0_1 = ma, M0, MS
#        argsB0_2 = mb, M0, MS
#        argsC = 0, ma, mb, MS, MS, M0
#        if component == 1:
#            out = (2*M0*(mb*B1_0(*argsB0_1) + ma*B2_0(*argsB0_2)))/((ma - mb)*(ma + mb))
#        elif component == 2:
#            out = ((-((ma + mb)*A0(M0)) + (ma + mb)*A0(MS)
#                + ma**2*mb*B1_0(argsB0_1) + mb*M0**2*B1_0(argsB0_1) 
#                - mb*MS**2*B1_0(argsB0_1) + ma*mb**2*B2_0(argsB0_2) 
#                + ma*M0**2*B2_0(argsB0_2) - ma*MS**2*B2_0(argsB0_2)))/((ma - mb)*mb*(ma + mb))
#        elif component == 3:
#            out = ((-((ma + mb)*A0(M0)) + (ma + mb)*A0(MS)
#                + ma**2*mb*B1_0(argsB0_1) + mb*M0**2*B1_0(argsB0_1)
#                - mb*MS**2*B1_0(argsB0_1) + ma*mb**2*B2_0(argsB0_2)
#                + ma*M0**2*B2_0(argsB0_2) - ma*MS**2*B2_0(argsB0_2)
#                + 4*ma**3*C00(argsC)
#                - 4*ma*mb**2*C00(argsC)))/(ma*(ma - mb)*(ma + mb))
#        elif component == 4:
#            out = (2*M0*(ma*B1_0(argsB0_1) + mb*B2_0(argsB0_2)))/((ma - mb)*(ma + mb))
#        else:
#            out = None
#        return out
#    
#    def _latex(self, printer):
#        ma, mb, M0, MS, componente = self.args #
#        return rf'I^({componente})_{{S}}({printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(MS)})'
