#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Monday Agust 05 2024

@author: Moises Zeleny (moiseszeleny@gmail.com)

Functions for the VF diagram for LFVZD
"""
from sympy import Function, S
from PaVe2 import B2_0, B2_1, D
# ##########################################
# Functions H and I for the different diagrams with contributions to  Z->l1,l2
# ##########################################
# Funciones para las contribuciones del tipo VF
class IVF(Function):
    @classmethod
    def eval(cls, ma, mb, M0, M2, component):
        args = mb, M0, M2
        factor = S(1)/(mb**2 - ma**2)
        if component == 1:
            out = factor*((D - 2)*mb**2*B2_1(*args))
        elif component == 2:
            out = factor*(D*ma*M0*B2_0(*args))
        elif component == 3:
            out = factor*(D*mb*M0*B2_0(*args))
        elif component == 4:
            out = factor*((D - 2)*ma*mb*B2_1(*args))
        else:
            out = None
        return out
    
    def _latex(self, printer):
        ma, mb, M0, M2, componente = self.args #
        return rf'I^({componente})_{{VF}}({printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M2)})'
    