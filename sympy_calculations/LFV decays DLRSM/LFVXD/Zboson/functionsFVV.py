#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Monday Agust 05 2024

@author: Moises Zeleny (moiseszeleny@gmail.com)

Functions for the FVV diagram for LFVZD
"""
from sympy import Function
from PaVe2 import C0, C1, C2, C11, C22, C12, C00, B12_0, D
# ##########################################
# Functions H and I for the different diagrams with contributions to  Z->l1,l2
# ##########################################
# Funciones para las contribuciones del tipo FSV
class HFVV(Function):
    @classmethod
    def eval(cls, mX, ma, mb, M0, M1, M2, component):
        args = mX, ma, mb, M0, M1, M2
        if component == 1:
            out = -2*ma*(
                (2 - D)*(C11(*args) - C12(*args))
                + (C2(*args) - (4 - D)*C1(*args))
            )
        elif component == 2:
            out = 0
        elif component == 3:
            out = 2*M0*(
                (1 - D)*(C1(*args) - C2(*args)) - (4 - D)*C0(*args)
            )
        elif component == 4:
            out = 2*mb*(
                (2 - D)*(-C22(*args) + C12(*args))
                - ( (4 - D)*C2(*args) - C1(*args))
            )
        else:
            out = None
        return out
    
    def _latex(self, printer):
        mX, ma, mb, M0, M1, M2, componente = self.args #
        return rf'H^({componente})_{{FVV}}({printer.doprint(mX)}, {printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)}, {printer.doprint(M2)})'
    

class IFVV(Function):
    @classmethod
    def eval(cls, mX, ma, mb, M0, M1, M2, component):
        args = mX, ma, mb, M0, M1, M2
        if component == 1:
            out = (
                M0**2*C0(*args) + B12_0(mX, M1, M2) - (2 - D)*C00(*args)
                +(
                    (2*mX**2 - 2*mb**2 - 3*ma**2)*C1(*args)
                    - (2*mX**2 - 2*ma**2 - 3*mb**2)*C2(*args)
                )
            )
        elif component == 2:
            out = 3*mb*M0*C0(*args)
        elif component == 3:
            out = 3*ma*M0*C0(*args)
        elif component == 4:
            out = 3*ma*mb*(C2(*args) - C1(*args))
        else:
            out = None
        return out
    
    def _latex(self, printer):
        mX, ma, mb, M0, M1, M2, componente = self.args #
        return rf'I^({componente})_{{FVV}}({printer.doprint(mX)}, {printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)}, {printer.doprint(M2)})'
