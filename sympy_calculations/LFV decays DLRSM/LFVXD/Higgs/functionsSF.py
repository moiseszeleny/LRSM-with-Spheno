#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Monday Agost 06 2024

@author: Moises Zeleny (moiseszeleny@gmail.com)

Functions for the SF diagram for LFVHD
"""
from sympy import Function, S

from ..PaVe2 import B2_0, B2_1

# Funciones para las contribuciones del tipo SF
class GSF(Function):
    @classmethod
    def eval(cls, ma, mb, M0, M2, component):
        args = mb, M0, M2
        factor =  S(1)/(mb**2 - ma**2)
        if component == 1:
            out = - factor*ma*M0*B2_0(*args)
        elif component == 2:
            out = - factor*(-mb**2*B2_1(*args))
        elif component == 3:
            out = - factor*(-ma*mb*B2_1(*args))
        elif component == 4:
            out = - factor*mb*M0*B2_0(*args)
        else:
            out = None
        return out
    
    def _latex(self, printer):
        ma, mb, M0, M2, component = self.args #
        return rf'G^({component})_{{SF}}({printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M2)})'




