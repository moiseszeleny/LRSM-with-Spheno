#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Monday Agost 05 2024

@author: Moises Zeleny (moiseszeleny@gmail.com)

Functions for the FVV diagram for LFVHD
"""
from sympy import Function

from PaVe2 import C0, C1, C2, D

# Funciones para las contribuciones del tipo FVV
class GFVV(Function):
    @classmethod
    def eval(cls, mX, ma, mb, M0, M1, M2, component):
        args = mX, ma, mb, M0, M1, M2
        if component == 1:
            out = (
                (D - 2)*ma*C1(*args)
            )
        elif component == 2:
            out = 0
        elif component == 3:
            out = (
                -D*M0*C0(*args)
            )
        elif component == 4:
            out = (2 - D)*mb*C2(*args)
        else:
            out = None
        return out
    
    def _latex(self, printer):
        mX, ma, mb, M0, M1, M2, component = self.args #
        return rf'G^({component})_{{FVV}}({printer.doprint(mX)}, {printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)}, {printer.doprint(M2)})'




