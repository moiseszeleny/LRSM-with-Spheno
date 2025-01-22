#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on friday Aug  10 15:30:00 2024

@author: Moises Zeleny (moiseszeleny@gmail.com)

The topologies involved in LFV X decays at one loop is coded in this module.
"""

# ###################################################
# Definiendo las clases para los diferentes diagramas con un fermion en el loop
# ###################################################
import formfactors
from PaVe2 import C0, C1, C2

class GenericOneLoopDiagramXDecayOneFermionTriangle():
    '''Rrpresenta a generic on loop diagram for decays of X -> la lb 
    with one fermion in the loop

    Atributes
    ---------
        v1,v2,v3: some of the classes VertexSSS,VertexVSS,VertexSVV,
        VertexSFF, or VertexSFF.
        masas: mass of the particles mX, ma, mb, M0, M1, M2, where 
        M0, M1, M2 are the masses of the particles in the loop.
    Methods
    -------
    show()
        returns
    '''
    def __init__(self, v1, v2, v3, masas):
        self.v1 = v1
        self.v2 = v2
        self.v3 = v3
        self.masas = masas
        self.vertices = [v1, v2, v3]
        self.Cs = [C0(*masas), C1(*masas), C2(*masas)]

    def __str__(self):
        return f'GenericOneLoopDiagramXDecayOneFermionTriangle({self.v1!r}, {self.v2!r},' +\
            ' {self.v3!r}, {self.masas!r})'

    def __repr__(self):
        return self.__str__()
    
    def formfactor(self):
        vertices = self.v1, self.v2, self.v3
        masas = self.masas
        return formfactors.OneFermionLoopTriangle(*vertices, *masas)

class TriangleOneFermion(GenericOneLoopDiagramXDecayOneFermionTriangle):
    '''Represents a Triangle Feynman diagram with one fermions in the loop

    Atributes
    ---------
        v1,v2,v3:some of the classes VertexSSS,VertexVSS,VertexSVV,
        VertexSFF, or VertexSFF.
        masas: mass of the particles mX, ma, mb, where 
        M0, M1, M2 are the masses of the particles in the loop.

    Methods
    -------
    show()
        returns
    '''
    def __str__(self):
        return f'TriangleOneFermion({self.v1!r}, {self.v2!r}, {self.v3!r}, {self.masas!r})'

class GenericOneLoopDiagramXDecayOneFermionBubble():
    '''Representa a generic on loop diagram for decays of X -> la lb 
    with one fermion in the loop

    Atributes
    ---------
        v1,v2,v3: some of the classes VertexSSS,VertexVSS,VertexSVV,
        VertexSFF, or VertexSFF.
        masas: mass of the particles mX, ma, mb, M0, M1, M2, where 
        M0, M1, M2 are the masses of the particles in the loop.
    Methods
    -------
    show()
        returns
    '''
    def __init__(self, v1, v2, v3, masas):
        self.v1 = v1
        self.v2 = v2
        self.v3 = v3
        self.masas = masas
        self.vertices = [v1, v2, v3]

    def __str__(self):
        return f'GenericOneLoopDiagramXDecayOneFermionBubble({self.v1!r}, {self.v2!r}, {self.v3!r}, {self.masas!r})'

    def __repr__(self):
        return self.__str__()
    
    def formfactor(self, ff):
        vertices = self.v1, self.v2, self.v3
        masas = self.masas
        return ff(*vertices, *masas)

class BubbleFXOneFermion(GenericOneLoopDiagramXDecayOneFermionBubble):
    '''Represents a Bubble Feynman diagram with one fermions in the loop

    Atributes
    ---------
        v1,v2,v3:some of the classes VertexSSS,VertexVSS,VertexSVV.
        masas: mass of the particles mX, ma, mb, where 
        M0, M1, M2 are the masses of the particles in the loop.

    Methods
    -------
    show()
        returns
    '''
    def __str__(self):
        return f'BubbleFXOneFermion({self.v1!r}, {self.v2!r}, {self.v3!r},{self.masas!r})'
    
    def formfactor(self):
        vertices = self.v1, self.v2, self.v3
        masas = self.masas
        return formfactors.OneFermionLoopBubbleFX(*vertices, *masas)

class BubbleXFOneFermion(GenericOneLoopDiagramXDecayOneFermionBubble):
    '''Represents a Bubble Feynman diagram with one fermions in the loop

    Atributes
    ---------
        v1,v2,v3:some of the classes VertexSSS,VertexVSS,VertexSVV.
        masas: mass of the particles mX, ma, mb, where 
        M0, M1, M2 are the masses of the particles in the loop.

    Methods
    -------
    show()
        returns
    '''
    def __str__(self):
        return f'BubbleXFOneFermion({self.v1!r}, {self.v2!r}, {self.v3!r},{self.masas!r})'
    
    def formfactor(self):
        vertices = self.v1, self.v2, self.v3
        masas = self.masas
        return formfactors.OneFermionLoopBubbleXF(*vertices, *masas)

# ###################################################
# Definiendo las clases para los diferentes diagramas con dos fermion en el loop
# ###################################################
class GenericOneLoopDiagramXDecayTwoFermion():
    '''Representa a one loop generic diagram for decays of X -> la lb 
    with one fermion in the loop

    Atributes
    ---------
        v1,v2,v3: some of the classes VertexSSS,VertexVSS,VertexSVV,
        VertexSFF, or VertexSFF.
        masas: mass of the particles mX, ma, mb, M0, M1, M2, where 
        M0, M1, M2 are the masses of the particles in the loop.
    Methods
    -------
    show()
        returns
    '''
    def __init__(self, v1, v2, v3, masas):
        self.v1 = v1
        self.v2 = v2
        self.v3 = v3
        self.masas = masas
        self.vertices = [v1, v2, v3]
        self.Cs = [C0(*masas), C1(*masas), C2(*masas)]

    def __str__(self):
        return f'GenericOneLoopDiagramXDecayTwoFermion({self.v1!r}, {self.v2!r}, {self.v3!r}, {self.masas!r})'

    def __repr__(self):
        return self.__str__()
    
    def formfactor(self):
        vertices = self.v1, self.v2, self.v3
        masas = self.masas
        return formfactors.TwoFermionLoop(*vertices, *masas)

class TriangleTwoFermion(GenericOneLoopDiagramXDecayTwoFermion):
    '''Represents a Triangle Feynman diagram with two fermions in the loop

    Atributes
    ---------
        v1,v2,v3:some of the classes VertexSSS,VertexVSS,VertexSVV,
        VertexSFF, or VertexSFF.
        masas: mass of the particles mX, ma, mb, where 
        M0, M1, M2 are the masses of the particles in the loop.

    Methods
    -------
    show()
        returns
    '''
    def __str__(self):
        return f'TriangleTwoFermion({self.v1!r}, {self.v2!r}, {self.v3!r}, {self.masas!r})'

if __name__ == '__main__':
    print('All right topologias.py')
