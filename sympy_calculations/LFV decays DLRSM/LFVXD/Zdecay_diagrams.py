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
from Zboson.functionsFSS import HFSS, IFSS
from Zboson.functionsFSV import HFSV, IFSV
from Zboson.functionsFVS import HFVS, IFVS
from Zboson.functionsFVV import HFVV, IFVV
from topologias import BubbleFXOneFermion
from Zboson.functionsFS import IFS
from Zboson.functionsFV import IFV
from topologias import BubbleXFOneFermion
from Zboson.functionsSF import ISF
from Zboson.functionsVF import IVF
from topologias import TriangleTwoFermion
from Zboson.functionsSFF import HSFF, ISFF
from Zboson.functionsVFF import HVFF, IVFF

#####################################
# One fermions in the loop
#####################################

# #####
# Tipo triangulo
# #####

FactorRD = I/(16*pi**2)

class TriangleFSS(TriangleOneFermion):
    def __str__(self):
        return f'TriangleFSS({self.v1!r}, {self.v2!r},' +\
            ' {self.v3!r}, {self.masas!r})'
    
    def OmegaR(self):
        return FactorRD*self.formfactor().R(HFSS)

    def OmegaL(self):
        return FactorRD*self.formfactor().L(HFSS)
    
    def LambdaR(self):
        return FactorRD*self.formfactor().R(IFSS)
    
    def LambdaL(self):
        return FactorRD*self.formfactor().L(IFSS)



class TriangleFSV(TriangleOneFermion):
    def __str__(self):
        return f'TriangleFSV({self.v1!r}, {self.v2!r},' +\
            ' {self.v3!r},{self.masas!r})'

    def OmegaR(self):
        return FactorRD*self.formfactor().R(HFSV)

    def OmegaL(self):
        return FactorRD*self.formfactor().L(HFSV)
    
    def LambdaR(self):
        return FactorRD*self.formfactor().R(IFSV)
    
    def LambdaL(self):
        return FactorRD*self.formfactor().L(IFSV)


class TriangleFVS(TriangleOneFermion):
    def __str__(self):
        return f'TriangleFVS({self.v1!r}, {self.v2!r},' +\
            ' {self.v3!r},{self.masas!r})'

    def OmegaR(self):
        return FactorRD*self.formfactor().R(HFVS)

    def OmegaL(self):
        return FactorRD*self.formfactor().L(HFVS)
    
    def LambdaR(self):
        return FactorRD*self.formfactor().R(IFVS)
    
    def LambdaL(self):
        return FactorRD*self.formfactor().L(IFVS)


class TriangleFVV(TriangleOneFermion):
    def __str__(self):
        return f'TriangleFVV({self.v1!r}, {self.v2!r},' +\
            ' {self.v3!r},{self.masas!r})'

    def OmegaR(self):
        return FactorRD*self.formfactor().R(HFVV)

    def OmegaL(self):
        return FactorRD*self.formfactor().L(HFVV)
    
    def LambdaR(self):
        return FactorRD*self.formfactor().R(IFVV)
    
    def LambdaL(self):
        return FactorRD*self.formfactor().L(IFVV)

# #####
# Tipo Burbuja
# #####

class BubbleFV(BubbleFXOneFermion):
    def __str__(self):
        return f'BubbleFV({self.v1!r}, {self.v2!r},' +\
            ' {self.v3!r},{self.masas!r})'

    def LambdaR(self):
        return FactorRD*self.formfactor().R(IFV)
    
    def LambdaL(self):
        return FactorRD*self.formfactor().L(IFV)


class BubbleVF(BubbleXFOneFermion):
    def __str__(self):
        return f'BubbleVF({self.v1!r}, {self.v2!r},' +\
            ' {self.v3!r},{self.masas!r})'

    def LambdaR(self):
        return FactorRD*self.formfactor().R(IVF)
    
    def LambdaL(self):
        return FactorRD*self.formfactor().L(IVF)


class BubbleFS(BubbleFXOneFermion):
    def __str__(self):
        return f'BubbleFS({self.v1!r}, {self.v2!r},' +\
            ' {self.v3!r},{self.masas!r})'

    def LambdaR(self):
        return FactorRD*self.formfactor().R(IFS)
    
    def LambdaL(self):
        return FactorRD*self.formfactor().L(IFS)


class BubbleSF(BubbleXFOneFermion):
    def __str__(self):
        return f'BubbleSF({self.v1!r}, {self.v2!r},' +\
            ' {self.v3!r},{self.masas!r})'

    def LambdaR(self):
        return FactorRD*self.formfactor().R(ISF)
    
    def LambdaL(self):
        return FactorRD*self.formfactor().L(ISF)

#####################################
# Two fermions in the loop
#####################################

class TriangleSFF(TriangleTwoFermion):
    def __str__(self):
        return f'TriangleSFF({self.v1!r}, {self.v2!r},' +\
            ' {self.v3!r},{self.masas!r})'

    def OmegaR(self):
        return FactorRD*self.formfactor().R(HSFF)

    def OmegaL(self):
        return FactorRD*self.formfactor().L(HSFF)
    
    def LambdaR(self):
        return FactorRD*self.formfactor().R(ISFF)
    
    def LambdaL(self):
        return FactorRD*self.formfactor().L(ISFF)


class TriangleVFF(TriangleTwoFermion):
    def __str__(self):
        return f'TriangleVFF({self.v1!r}, {self.v2!r},' +\
            ' {self.v3!r},{self.masas!r})'

    def OmegaR(self):
        return FactorRD*self.formfactor().R(HVFF)

    def OmegaL(self):
        return FactorRD*self.formfactor().L(HVFF)
    
    def LambdaR(self):
        return FactorRD*self.formfactor().R(IVFF)
    
    def LambdaL(self):
        return FactorRD*self.formfactor().L(IVFF)

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
