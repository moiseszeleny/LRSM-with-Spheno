#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Monday Agost 05 2024

@author: Moises Zeleny (moiseszeleny@gmail.com)

Functions for the SFF diagram for LFVHD
"""
from sympy import Function

from ..PaVe2 import C0, C1, C2, B12_0
# ##########################################
# Funciones H para las diferentes contribuciones al proceso h->l1,l2
# ##########################################
# Funciones para las contribuciones del tipo FSS
class GFSS(Function):
    @classmethod
    def eval(cls, mX, ma, mb, M0, M1, M2, component):
        if component == 1:
            out = -M0*C0(mX, ma, mb, M0, M1, M2)
        elif component == 2:
            out = -ma*C1(mX, ma, mb, M0, M1, M2)
        elif component == 3:
            out = mb*C2(mX, ma, mb, M0, M1, M2)
        elif component == 4:
            out = 0
        else:
            out = None
        return out

    def _latex(self, printer):
        mX, ma, mb, M0, M1, M2, component = self.args #
        return rf'G^({component})_{{FSS}}({printer.doprint(mX)}, {printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)}, {printer.doprint(M2)})'





