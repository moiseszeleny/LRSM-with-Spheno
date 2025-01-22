#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Monday Jul 30 2024

@author: Moises Zeleny (moiseszeleny@gmail.com)

The general structure of H functions in the form factors
from H and Z LFV decays.
"""

# Generic class for functions coefficients of  
# cR cR, cR cL, cL cR, cL cL.
class DoubleQuiral():
    def __init__(self,  mX, ma, mb, M0, M1, M2):
        self.M0 = M0
        self.M1 = M1
        self.M2 = M2
        self.mX = mX
        self.ma = ma
        self.mb = mb
    
    def F1(self):
        pass

    def F2(self):
        pass

    def F3(self):
        pass

    def F4(self):
        pass