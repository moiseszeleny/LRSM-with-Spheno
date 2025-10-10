#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Monday September 15 2025

@author: Moises Zeleny (moiseszeleny@gmail.com)

Functions for the scalar contribution for mu to e gamma
"""
from sympy import Function
from ..PaVe2 import C0, C1, C2, C00, C11, C12, C22, B1_0, B2_0, A0
# ##########################################
# Functions for the one loop contribution of mu to e gamma from Charged scalars S
# ##########################################
# Funciones para las contribuciones del tipo FSS
class HS(Function):
    @classmethod
    def eval(cls, ma, mb, M0, MS, component):
        args1 = ma**2, mb**2, 0, MS**2, M0**2, MS**2
        args2 = 0, ma**2, mb**2, MS**2, MS**2, M0**2
        if component == 1:
            out = M0*C1(*args1)
        elif component == 2:
            out = mb*(
                C1(*args1) + C11(*args1) + C12(*args2)
            )
        elif component == 3:
            out = -ma*C12(*args2)
        elif component == 4:
            out = 0
        else:
            out = None
        return out
    
    def _latex(self, printer):
        ma, mb, M0, MS, componente = self.args #
        return rf'H^({componente})_{{S}}({printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(MS)})'

#class IS(Function):
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
