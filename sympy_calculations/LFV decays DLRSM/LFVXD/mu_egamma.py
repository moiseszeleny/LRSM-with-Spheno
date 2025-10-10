#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Monday September 15 2025

@author: Moises Zeleny (moiseszeleny@gmail.com)

Form factors sigmaL, sigmaR for the mu to e gamma decay
"""
from .MueGamma.contributionS import HS
from .MueGamma.contributionV import HV

class OneFermionSContribution():
    '''Class for the form factors for S contribution with one fermion in the loop for mu to e gamma decay
    '''
    def __init__(self, v1, v2, ma, mb, M0, MS):
        self.v1 = v1
        self.v2 = v2
        self.ma = ma
        self.mb = mb
        self.M0 = M0
        self.MS = MS
        self.masas = (ma, mb, M0, MS)
        self.vertices = [v1, v2]

    def __str__(self):
        return f'OneFermionSContribution(\n\t{self.v1!r},\n\t{self.v2!r},\n\t{self.masas!r})'

    def __repr__(self):
        return self.__str__()
    
    def sigmaR(self):
        v1 = self.v1
        v2 = self.v2
        ma, mb, M0, MS = self.masas
        return (v1.cR*v2.cR*HS(ma, mb, M0, MS, 1)
                + v1.cR*v2.cL*HS(ma, mb, M0, MS, 2)
                + v1.cL*v2.cR*HS(ma, mb, M0, MS, 3)
                + v1.cL*v2.cL*HS(ma, mb, M0, MS, 4)
               )
    
    def sigmaL(self):
        v1 = self.v1
        v2 = self.v2
        ma, mb, M0, MS = self.masas
        return (v1.cL*v2.cL*HS(ma, mb, M0, MS, 1)
                + v1.cL*v2.cR*HS(ma, mb, M0, MS, 2)
                + v1.cR*v2.cL*HS(ma, mb, M0, MS, 3)
                + v1.cR*v2.cR*HS(ma, mb, M0, MS, 4)
               )
    
class OneFermionVContribution():
    '''Class for the form factors for V contribution with one fermion in the loop for mu to e gamma decay
    '''
    def __init__(self, v1, v2, ma, mb, M0, MV):
        self.v1 = v1
        self.v2 = v2
        self.ma = ma
        self.mb = mb
        self.M0 = M0
        self.MV = MV
        self.masas = (ma, mb, M0, MV)
        self.vertices = [v1, v2]

    def __str__(self):
        return f'OneFermionVContribution(\n\t{self.v1!r},\n\t{self.v2!r},\n\t{self.masas!r})'

    def __repr__(self):
        return self.__str__()
    
    def sigmaR(self):
        v1 = self.v1
        v2 = self.v2
        ma, mb, M0, MV = self.masas
        return (v1.cR*v2.cR*HV(ma, mb, M0, MV, 1)
                + v1.cR*v2.cL*HV(ma, mb, M0, MV, 2)
                + v1.cL*v2.cR*HV(ma, mb, M0, MV, 3)
                + v1.cL*v2.cL*HV(ma, mb, M0, MV, 4)
               )
    
    def sigmaL(self):
        v1 = self.v1
        v2 = self.v2
        ma, mb, M0, MV = self.masas
        return (v1.cL*v2.cL*HV(ma, mb, M0, MV, 1)
                + v1.cL*v2.cR*HV(ma, mb, M0, MV, 2)
                + v1.cR*v2.cL*HV(ma, mb, M0, MV, 3)
                + v1.cR*v2.cR*HV(ma, mb, M0, MV, 4)
               )
    

def width_mu_to_e_gamma(mb, sigmaL, sigmaR):
    '''Width for the mu to e gamma decay
    '''
    from numpy import pi
    return (mb**3/(16*pi))*(abs(sigmaL)**2 + abs(sigmaR)**2)