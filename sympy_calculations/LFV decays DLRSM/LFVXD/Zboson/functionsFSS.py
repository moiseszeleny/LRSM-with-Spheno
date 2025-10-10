#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Monday September 15 2025

@author: Moises Zeleny (moiseszeleny@gmail.com)

Functions for the scalar contribution for mu to e gamma
"""
from sympy import Function
from PaVe2 import C0, C1, C2, C00, C11, C12, C22
# ##########################################
# Functions H and I for the different diagrams with contributions to  Z->l1,l2
# ##########################################
# Funciones para las contribuciones del tipo FSS
class HFSS(Function):
    @classmethod
    def eval(cls, mX, ma, mb, M0, M1, M2, component):
        args = mX, ma, mb, M0, M1, M2
        if component == 1:
            out = M0*(
                C0(*args) + C1(*args) - C2(*args)
            )
        elif component == 2:
            out = ma*(
                C1(*args) + C11(*args) - C12(*args)
            ) 
        elif component == 3:
            out = - mb*(
                C12(*args) - C22(*args) + C2(*args)
            )
        elif component == 4:
            out = 0
        else:
            out = None
        return out
    
    def _latex(self, printer):
        mX, ma, mb, M0, M1, M2, componente = self.args #
        return rf'H^({componente})_{{FSS}}({printer.doprint(mX)}, {printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)}, {printer.doprint(M2)})'

class IFSS(Function):
    @classmethod
    def eval(cls, mX, ma, mb, M0, M1, M2, component):
        if component == 1:
            out = 0
        elif component == 2:
            out = C00(mX, ma, mb, M0, M1, M2)
        elif component == 3:
            out = 0
        elif component == 4:
            out = 0
        else:
            out = None
        return out
    
    def _latex(self, printer):
        mX, ma, mb, M0, M1, M2, componente = self.args #
        return rf'I^({componente})_{{FSS}}({printer.doprint(mX)}, {printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)}, {printer.doprint(M2)})'
