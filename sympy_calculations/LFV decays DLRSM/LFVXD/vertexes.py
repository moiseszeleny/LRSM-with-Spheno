#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jul  8 01:07:53 2020

@author: Moises Zeleny (moiseszeleny@gmail.com)

The symbolic formalism of LFV Higgs decays is coded in this module
"""
from sympy import symbols

###################################################
# Definiendo las clases de los vertices genericos para este tipo de procesos
###################################################


class VertexSSS():
    '''Class of vertex of three scalars

    Atributes
    ---------
        c:sympy symbols
            c represents the constant coupling among three scalars

    Methods
    -------
    show()
    returns three scalars coupling
    '''
    def __init__(self, c):
        '''
        Parameters
        ----------
            c:sympy symbols
                c represents the constant coupling among three scalars
        '''
        self.c = c

    def __str__(self):
        return f'VertexSSS({self.c!r})'

    def __repr__(self):
        return self.__str__()

    def show(self):
        '''Returns three scalars coupling'''
        return self.c


#class VertexSFF():
#    '''Class of vertex of neutral scalar and two fermions.#
#
#    Atributes
#    ---------
#        c:sympy symbols
#        c represents the constant coupling among a scalar
#        and two fermions
#
#    Methods
#    -------
#    show()
#        returns scalar and two fermions coupling
#    '''
#    PR, PL = symbols('P_R,P_L', commutative=False)
#    def __init__(self,cR, cL):
#        self.cR = cR
#        self.cL = cL #.conjugate()
#
#    def __str__(self):
#        return f'VertexSFF({self.cR!r},{self.cL!r})'
#
#    def show(self):
#        '''
#        Returns Higgs boson and two fermions coupling
#        '''
#        PR, PL = self.PR, self.PL
#        return self.cR*PR + self.cL*PL

class VertexSFF():
    '''Class vertex of one scalar and two fermions.

    Atributes
    ---------
        cR:sympy symbols
            cR is the coefficint of PR in the coupling of one
            scalar and two fermions
        cL:sympy symbols
            cL is the coefficint of PL in the coupling of one
            scalar and two fermions

    Methods
    -------
    show()
        returns one scalar and two fermions
    '''
    PR, PL = symbols('P_R,P_L', commutative=False)
    def __init__(self, cR, cL):
        '''
        Parameters
        ---------
        cR:sympy symbols
            cR is the coefficint of PR in the coupling of one
            scalar and two fermions
        cL:sympy symbols
            cL is the coefficint of PL in the coupling of one
            scalar and two fermions
        '''
        self.cR = cR
        self.cL = cL
        if self.cL == self.cR:
            self.c = self.cL

    def __str__(self):
        return f'VertexSFF({self.cR!r},{self.cL!r})'

    def __repr__(self):
        return self.__str__()

    def show(self):
        '''Returns one scalar and two fermions'''
        PR, PL = self.PR, self.PL
        cR = self.cR
        cL = self.cL
        return cR*PR + cL*PL

class VertexVSS(VertexSSS):
    '''Class of vertex of two scalars and one vector boson

    Atributes
    ---------
        c:sympy symbols
        c represents the constant coupling among two scalars
        and one vector boson

    Methods
    -------
    show()
        returns two scalars and one vector boson coupling
    '''
    pmu1, pmu2 = symbols(r'{{p^{+}}},{{p^{a}}}')
    # def __init__(self,c):
    #     self.c = c
    def __str__(self):
        return f'VertexVSS({self.c!r})'

    def show(self):
        '''Returns two scalars and one vector boson coupling'''
        pmu1, pmu2 = self.pmu1, self.pmu2
        return self.c*(pmu1 - pmu2)

class VertexSSpVm(VertexSSS):
    '''Class of vertex of two scalars and one vector boson

    Atributes
    ---------
        c:sympy symbols
        c represents the constant coupling among two scalars
        and one vector boson

    Methods
    -------
    show()
        returns two scalars and one vector boson coupling
    '''
    pmu1, pmu2 = symbols(r'{{p^{+}}},{{p^{a}}}')
    # def __init__(self,c):
    #     self.c = c
    def __str__(self):
        return f'VertexSSpVm({self.c!r})'

    def show(self):
        '''Returns two scalars and one vector boson coupling'''
        pmu1, pmu2 = self.pmu1, self.pmu2
        return self.c*(pmu1 - pmu2)


class VertexSVpSm(VertexSSpVm):
    '''Class of vertex of two scalars and one vector boson

    Atributes
    ---------
        c:sympy symbols
        c represents the constant coupling among two scalars
        and one vector boson

    Methods
    -------
    show()
        returns two scalars and one vector boson coupling
    '''
    # def __init__(self,c):
    #     self.c = c
    def __str__(self):
        return f'VertexHVpSm({self.c!r})'

    def show(self):
        '''Returns two scalars and one vector boson coupling'''
        pmu1, pmu2 = self.pmu1, self.pmu2
        return self.c*(pmu1 - pmu2)


class VertexSVV(VertexSSS):
    '''Class of vertex of one scalar and two vector bosons.

    Atributes
    ---------
        c:sympy symbols
        c represents the constant coupling among one scalar
        and two vector bosons

    Methods
    -------
    show()
        returns one scalar and two vector bosons coupling
    '''
    gmunu = symbols(r'{{g^{\mu \nu}}}', real=True)
    def __str__(self):
        return f'VertexSVV({self.c!r})'

    def show(self):
        '''Returns one scalar and two vector bosons coupling'''
        gmunu = self.gmunu
        return self.c*gmunu


#class VertexHF0F0(VertexSFF):
#    def __str__(self):
#        return f'VertexHF0F0({self.cR!r},{self.cL!r})'


class VertexVFF(VertexSFF):
    '''Class vertex of one vector boson and two fermions.

    Atributes
    ---------
        cR:sympy symbols
            cR is the coefficint of PR in the coupling of one vector boson
            and two fermions
        cL:sympy symbols
            cL is the coefficint of PL in the coupling of one vector boson
            and two fermions

    Methods
    -------
    show()
        returns one vector boson and two fermions
    '''
    gamma_mu = symbols(r'\gamma_\mu', commutative=False)
    # def __init__(self,cR,cL):
    #     self.cR = cR
    #     self.cL = cL

    def __str__(self):
        return f'VertexVFF({self.cR!r},{self.cL!r})'

    def show(self):
        '''Returns one vector boson and two fermions'''
        PR, PL, gamma_mu = self.PR, self.PL, self.gamma_mu
        cR = self.cR
        cL = self.cL
        return gamma_mu*(cR*PR + cL*PL)

class VertexVVV(VertexSSS):
    '''Class of vertex of three vector bosons

    Atributes
    ---------
        c:sympy symbols
        c represents the constant coupling among three vector bosons

    Methods
    -------
    show()
        returns three vector boson coupling
    '''
    gmunu = symbols(r'{{g^{\mu \nu}}}', real=True)
    gnusig = symbols(r'{{g^{\nu \sigma}}}', real=True)
    gmusig = symbols(r'{{g^{\mu \sigma}}}', real=True)
    pmu1, pmu2, pmu3 = symbols(r'p_1, p_2, p_3')
    # def __init__(self,c):
    #     self.c = c
    def __str__(self):
        return f'VertexVVV({self.c!r})'

    def show(self):
        '''Returns two scalars and one vector boson coupling'''
        gmunu, gmusig, gnusig = self.gmunu, self.gmusig, self.gnusig
        pmu1, pmu2, pmu3 = self.pmu1, self.pmu2, self.pmu3
        return self.c*(gmunu*(pmu2 - pmu1) + gnusig*(pmu3 - pmu2) + gmusig*(pmu1 - pmu3))


if __name__ == '__main__':
    print('All right vertexes.py')
