#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Monday Agust 05 2024

@author: Moises Zeleny (moiseszeleny@gmail.com)

Functions for the FVS diagram for LFVZD
"""
from sympy import Function
from PaVe2 import C0, C1, C2
# ##########################################
# Functions H and I for the different diagrams with contributions to  Z->l1,l2
# ##########################################
# Funciones para las contribuciones del tipo FSV
class HFVS(Function):
    @classmethod
    def eval(cls, mX, ma, mb, M0, M1, M2, component):
        args = mX, ma, mb, M0, M1, M2
        if component == 1:
            out = 0
        elif component == 2:
            out = 2*C1(*args)
        elif component == 3:
            out = 0
        elif component == 4:
            out = 0
        else:
            out = None
        return out
    
    def _latex(self, printer):
        mX, ma, mb, M0, M1, M2, componente = self.args #
        return rf'H^({componente})_{{FVS}}({printer.doprint(mX)}, {printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)}, {printer.doprint(M2)})'
    

class IFVS(Function):
    @classmethod
    def eval(cls, mX, ma, mb, M0, M1, M2, component):
        args = mX, ma, mb, M0, M1, M2
        if component == 1:
            out = M0*C0(*args)
        elif component == 2:
            out = - ma*C1(*args)
        elif component == 3:
            out = - mb*C2(*args)
        elif component == 4:
            out = 0
        else:
            out = None
        return out
    
    def _latex(self, printer):
        mX, ma, mb, M0, M1, M2, componente = self.args #
        return rf'I^({componente})_{{FVS}}({printer.doprint(mX)}, {printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)}, {printer.doprint(M2)})'
