#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on friday Aug  10 15:30:00 2024

@author: Moises Zeleny (moiseszeleny@gmail.com)

The symbolic formalism for the form factors of LFV X decays is coded in this module, X = Z,H.
"""
from sympy import Mul
class OneFermionLoopTriangle():
    '''
    Class for form factors with one fermion in the loop in the LFV X decays.
    '''
    def __init__(self, v1, v2, v3, mX, ma, mb, M0, M1, M2):
        self.v1 = v1
        self.v2 = v2
        self.v3 = v3
        self.mX = mX
        self.ma = ma
        self.mb = mb
        self.M0 = M0
        self.M1 = M1
        self.M2 = M2
    
    def Fcomponents(self, func):
        args = [self.mX, self.ma, self.mb, self.M0, self.M1, self.M2]
        G1 = func(*[*args, 1])
        G2 = func(*[*args, 2])
        G3 = func(*[*args, 3])
        G4 = func(*[*args, 4])
        return G1, G2, G3, G4
    
    def R(self, func):
        v1 = self.v1
        v2 = self.v2
        v3 = self.v3
        F1, F2, F3, F4 = self.Fcomponents(func)
        eval = True
        return v1.c*(
            Mul(F1,v2.cR*v3.cR, evaluate=eval) 
            + Mul(F2,v2.cR*v3.cL, evaluate=eval) 
            + Mul(F3, v2.cL*v3.cR, evaluate=eval)
            + Mul(F4, v2.cL*v3.cL, evaluate=eval)
        )
    
    def L(self, func):
        v1 = self.v1
        v2 = self.v2
        v3 = self.v3
        F1, F2, F3, F4 = self.Fcomponents(func)
        eval = True
        return v1.c*(
            Mul(F1,v2.cL*v3.cL, evaluate=eval) 
            + Mul(F2,v2.cL*v3.cR, evaluate=eval) 
            + Mul(F3, v2.cR*v3.cL, evaluate=eval)
            + Mul(F4, v2.cR*v3.cR, evaluate=eval)
        )

class OneFermionLoopBubbleFX():
    '''
    Class for form factors of Bubble FX with one fermion in the loop in the LFV X decays.
    '''
    def __init__(self, v1, v2, v3, ma, mb, M0, M1):
        self.v1 = v1
        self.v2 = v2
        self.v3 = v3
        self.ma = ma
        self.mb = mb
        self.M0 = M0
        self.M1 = M1
    
    def Fcomponents(self, func):
        args = [self.ma, self.mb, self.M0, self.M1]
        G1 = func(*[*args, 1])
        G2 = func(*[*args, 2])
        G3 = func(*[*args, 3])
        G4 = func(*[*args, 4])
        return G1, G2, G3, G4
    
    def R(self, func):
        v1 = self.v1
        v2 = self.v2
        v3 = self.v3
        F1, F2, F3, F4 = self.Fcomponents(func)
        eval = True
        return v1.cR*(
            Mul(F1,v2.cR*v3.cR, evaluate=eval) 
            + Mul(F2,v2.cR*v3.cL, evaluate=eval) 
            + Mul(F3, v2.cL*v3.cR, evaluate=eval)
            + Mul(F4, v2.cL*v3.cL, evaluate=eval)
        )
    
    def L(self, func):
        v1 = self.v1
        v2 = self.v2
        v3 = self.v3
        F1, F2, F3, F4 = self.Fcomponents(func)
        eval = True
        return v1.cL*(
            Mul(F1,v2.cL*v3.cL, evaluate=eval) 
            + Mul(F2,v2.cL*v3.cR, evaluate=eval) 
            + Mul(F3, v2.cR*v3.cL, evaluate=eval)
            + Mul(F4, v2.cR*v3.cR, evaluate=eval)
        )

class OneFermionLoopBubbleXF():
    '''
    Class for form factors of Bubble XF with one fermion in the loop in the LFV X decays.
    '''
    def __init__(self, v1, v2, v3, ma, mb, M0, M2):
        self.v1 = v1
        self.v2 = v2
        self.v3 = v3
        self.ma = ma
        self.mb = mb
        self.M0 = M0
        self.M2 = M2
    
    def Fcomponents(self, func):
        args = [self.ma, self.mb, self.M0, self.M2]
        G1 = func(*[*args, 1])
        G2 = func(*[*args, 2])
        G3 = func(*[*args, 3])
        G4 = func(*[*args, 4])
        return G1, G2, G3, G4
    
    def R(self, func):
        v1 = self.v1
        v2 = self.v2
        v3 = self.v3
        F1, F2, F3, F4 = self.Fcomponents(func)
        eval = True
        return v1.cR*(
            Mul(F1,v2.cR*v3.cR, evaluate=eval) 
            + Mul(F2,v2.cR*v3.cL, evaluate=eval) 
            + Mul(F3, v2.cL*v3.cR, evaluate=eval)
            + Mul(F4, v2.cL*v3.cL, evaluate=eval)
        )
    
    def L(self, func):
        v1 = self.v1
        v2 = self.v2
        v3 = self.v3
        F1, F2, F3, F4 = self.Fcomponents(func)
        eval = True
        return v1.cL*(
            Mul(F1,v2.cL*v3.cL, evaluate=eval) 
            + Mul(F2,v2.cL*v3.cR, evaluate=eval) 
            + Mul(F3, v2.cR*v3.cL, evaluate=eval)
            + Mul(F4, v2.cR*v3.cR, evaluate=eval)
        )

class TwoFermionLoop():
    '''
    Class for form factors with two fermions in the loop in the LFV X decays.
    '''
    def __init__(self, v1, v2, v3, mX, ma, mb, M0, M1, M2):
        self.v1 = v1
        self.v2 = v2
        self.v3 = v3
        self.mX = mX
        self.ma = ma
        self.mb = mb
        self.M0 = M0
        self.M1 = M1
        self.M2 = M2
    
    def Fcomponents(self, func):
        args = [self.mX, self.ma, self.mb, self.M0, self.M1, self.M2]
        F1 = func(*[*args, 1])
        F2 = func(*[*args, 2])
        F3 = func(*[*args, 3])
        F4 = func(*[*args, 4])
        F5 = func(*[*args, 5])
        F6 = func(*[*args, 6])
        F7 = func(*[*args, 7])
        F8 = func(*[*args, 8])
        return F1, F2, F3, F4, F5, F6, F7, F8
    
    def R(self, func):
        v1 = self.v1
        v2 = self.v2
        v3 = self.v3
        F1, F2, F3, F4, F5, F6, F7, F8 = self.Fcomponents(func)
        return (
            v1.cR*(F1*v2.cR*v3.cR + F2*v2.cR*v3.cL + F3*v2.cL*v3.cR + F4*v2.cL*v3.cL)
            + v1.cL*(F5*v2.cR*v3.cR + F6*v2.cR*v3.cL + F7*v2.cL*v3.cR + F8*v2.cL*v3.cL)
        )
    
    def L(self, func):
        v1 = self.v1
        v2 = self.v2
        v3 = self.v3
        F1, F2, F3, F4, F5, F6, F7, F8 = self.Fcomponents(func)
        return (
            v1.cL*(F1*v2.cL*v3.cL + F2*v2.cL*v3.cR + F3*v2.cR*v3.cL + F4*v2.cR*v3.cR)
            + v1.cR*(F5*v2.cL*v3.cL + F6*v2.cL*v3.cR + F7*v2.cR*v3.cL + F8*v2.cR*v3.cR)
        )

