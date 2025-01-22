#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Monday Agust 05 2024

@author: Moises Zeleny (moiseszeleny@gmail.com)

Functions for the FV diagram for LFVZD
"""
from sympy import Function, S
from PaVe2 import B1_0, B1_1, D
# ##########################################
# Functions H and I for the different diagrams with contributions to  Z->l1,l2
# ##########################################
# Funciones para las contribuciones del tipo FV
class IFV(Function):
    @classmethod
    def eval(cls, ma, mb, M0, M1, component):
        args = ma, M0, M1
        factor = S(1)/(ma**2 - mb**2)
        if component == 1:
            out = factor*((2 - D)*ma**2*B1_1(*args))
        elif component == 2:
            out = factor*D*ma*M0*B1_0(*args)
        elif component == 3:
            out = factor*D*mb*M0*B1_0(*args)
        elif component == 4:
            out = factor*((2 - D)*ma*mb*B1_1(*args))
        else:
            out = None
        return out
    
    def _latex(self, printer):
        ma, mb, M0, M1, componente = self.args #
        return rf'I^({componente})_{{FV}}({printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)})'
    