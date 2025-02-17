#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on friday Aug  10 15:30:00 2024

@author: Moises Zeleny (moiseszeleny@gmail.com)

The symbolic formalism of LFV Higgs decays is coded in this module
"""
from sympy import symbols, I, pi
import numpy as np

from topologias import TriangleOneFermion
from Higgs.functionsFSS import GFSS
from Higgs.functionsFSV import GFSV
from Higgs.functionsFVS import GFVS
from Higgs.functionsFVV import GFVV
from topologias import BubbleFXOneFermion
from Higgs.functionsFS import GFS
from Higgs.functionsFV import GFV
from topologias import BubbleXFOneFermion
from Higgs.functionsSF import GSF
from Higgs.functionsVF import GVF
from topologias import TriangleTwoFermion
from Higgs.functionsSFF import GSFF
from Higgs.functionsVFF import GVFF

#####################################
# One fermions in the loop
#####################################

# #####
# Tipo triangulo
# #####

FactorRD = I/(16*pi**2)

class TriangleFSS(TriangleOneFermion):
    def __str__(self):
        return f'TriangleFSS({self.v1!r}, {self.v2!r}, {self.v3!r}, {self.masas!r})'
    
    def AR(self):
        return FactorRD*self.formfactor().R(GFSS)

    def AL(self):
        return FactorRD*self.formfactor().L(GFSS)



class TriangleFSV(TriangleOneFermion):
    def __str__(self):
        return f'TriangleFSV({self.v1!r}, {self.v2!r}, {self.v3!r},{self.masas!r})'

    def AR(self):
        return FactorRD*self.formfactor().R(GFSV)

    def AL(self):
        return FactorRD*self.formfactor().L(GFSV)


class TriangleFVS(TriangleOneFermion):
    def __str__(self):
        return f'TriangleFVS({self.v1!r}, {self.v2!r}, {self.v3!r},{self.masas!r})'

    def AR(self):
        return FactorRD*self.formfactor().R(GFVS)

    def AL(self):
        return FactorRD*self.formfactor().L(GFVS)


class TriangleFVV(TriangleOneFermion):
    def __str__(self):
        return f'TriangleFVV({self.v1!r}, {self.v2!r}, {self.v3!r},{self.masas!r})'

    def AR(self):
        return FactorRD*self.formfactor().R(GFVV)

    def AL(self):
        return FactorRD*self.formfactor().L(GFVV)

# #####
# Tipo Burbuja
# #####

class BubbleFV(BubbleFXOneFermion):
    def __str__(self):
        return f'BubbleFV({self.v1!r}, {self.v2!r}, {self.v3!r},{self.masas!r})'

    def AR(self):
        return FactorRD*self.formfactor().R(GFV)

    def AL(self):
        return FactorRD*self.formfactor().L(GFV)


class BubbleVF(BubbleXFOneFermion):
    def __str__(self):
        return f'BubbleVF({self.v1!r}, {self.v2!r}, {self.v3!r},{self.masas!r})'

    def AR(self):
        return FactorRD*self.formfactor().R(GVF)

    def AL(self):
        return FactorRD*self.formfactor().L(GVF)


class BubbleFS(BubbleFXOneFermion):
    def __str__(self):
        return f'BubbleFS({self.v1!r}, {self.v2!r},  {self.v3!r},{self.masas!r})'

    def AR(self):
        return FactorRD*self.formfactor().R(GFS)

    def AL(self):
        return FactorRD*self.formfactor().L(GFS)


class BubbleSF(BubbleXFOneFermion):
    def __str__(self):
        return f'BubbleSF({self.v1!r}, {self.v2!r}, {self.v3!r},{self.masas!r})'

    def AR(self):
        return FactorRD*self.formfactor().R(GSF)

    def AL(self):
        return FactorRD*self.formfactor().L(GSF)

#####################################
# Two fermions in the loop
#####################################

class TriangleSFF(TriangleTwoFermion):
    def __str__(self):
        return f'TriangleSFF({self.v1!r}, {self.v2!r}, {self.v3!r},{self.masas!r})'

    def AR(self):
        return FactorRD*self.formfactor().R(GSFF)

    def AL(self):
        return FactorRD*self.formfactor().L(GSFF)


class TriangleVFF(TriangleTwoFermion):
    def __str__(self):
        return f'TriangleVFF({self.v1!r}, {self.v2!r}, {self.v3!r},{self.masas!r})'

    def AR(self):
        return FactorRD*self.formfactor().R(GVFF)

    def AL(self):
        return FactorRD*self.formfactor().L(GVFF)

# #########################################
# Width and BR h -> li lj
# ########################################


def Γhlilj(ML, MR, ma=125.18, mi=1.777, mj=0.1507):
    '''
    Width decay to H_r -> l_a l_b
    '''
    maij = (1 - ((mi**2 + mj**2)/ma)**2)*(1 - ((mi**2 - mj**2)/ma)**2)
    widthij = 1/(8*np.pi*ma)*np.sqrt(maij)*(
        (ma**2 - mi**2 - mj**2)*(np.abs(ML)**2 + np.abs(MR)**2) -
        4*mi*mj*np.real(ML*np.conj(MR)))
    return np.nan_to_num(widthij)


# def BRhlilj(ML,MR,ma=125.18,mi=1.777,mj=0.1507):
#    return np.nan_to_num(Γhlilj(ML ,MR,ma,mi,mj)/
#     (Γhlilj(ML ,MR,ma,mi,mj)+ 4.07e-3))

if __name__ == '__main__':
    print('All right LFVHDFeynGv3')
