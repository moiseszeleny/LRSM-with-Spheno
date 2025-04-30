#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Monday Agost 05 2024

@author: Moises Zeleny (moiseszeleny@gmail.com)

Functions for the FSV diagram for LFVHD
"""
from sympy import Function

from ..PaVe2 import C0, C1, C2, B12_0

# Funciones para las contribuciones del tipo FSV
class GFSV(Function):
    @classmethod
    def eval(cls, mX, ma, mb, M0, M1, M2, component):
        args = mX, ma, mb, M0, M1, M2
        if component == 1:
            out = (
                - M0**2*C0(*args) - B12_0(mX, M1, M2) 
                + (2*mX**2 - 2*ma**2 - mb**2)*C2(*args) + 2*ma**2*C1(*args)
            )
        elif component == 2:
            out = ma*M0*(2*C0(*args) - C1(*args))
        elif component == 3:
            out = -mb*M0*(C0(*args) - C2(*args))
        elif component == 4:
            out = ma*mb*(2*C2(*args) - C1(*args))
        else:
            out = None
        return out
    
    def _latex(self, printer):
        mX, ma, mb, M0, M1, M2, component = self.args #
        return rf'G^({component})_{{FSV}}({printer.doprint(mX)}, {printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)}, {printer.doprint(M2)})'




