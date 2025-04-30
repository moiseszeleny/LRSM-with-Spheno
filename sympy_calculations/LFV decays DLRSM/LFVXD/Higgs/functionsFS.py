#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Monday Agost 06 2024

@author: Moises Zeleny (moiseszeleny@gmail.com)

Functions for the FS diagram for LFVHD
"""
from sympy import Function, S

from ..PaVe2 import B1_0, B1_1

# Funciones para las contribuciones del tipo FS
class GFS(Function):
    @classmethod
    def eval(cls, ma, mb, M0, M1, component):
        args = ma, M0, M1
        factor =  S(1)/(ma**2 - mb**2)
        if component == 1:
            out = - factor*mb*M0*B1_0(*args)
        elif component == 2:
            out = - factor*ma*mb*B1_1(*args)
        elif component == 3:
            out = - factor*ma**2*B1_1(*args)
        elif component == 4:
            out = - factor*ma*M0*B1_0(*args)
        else:
            out = None
        return out
    
    def _latex(self, printer):
        ma, mb, M0, M1, component = self.args #
        return rf'G^({component})_{{FS}}({printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)})'




