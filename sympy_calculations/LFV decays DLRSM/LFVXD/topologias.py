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
from .formfactors import (
    OneFermionLoopTriangle,
    OneFermionLoopBubbleFX,
    OneFermionLoopBubbleXF,
    TwoFermionLoop,
)
from .PaVe2 import C0, C1, C2

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
        return f'GenericOneLoopDiagramXDecayOneFermionTriangle(\n\t{self.v1!r},\n\t{self.v2!r},\n\t{self.v3!r},\n\t{self.masas!r})'

    def __repr__(self):
        return self.__str__()
    
    def formfactor(self):
        vertices = self.v1, self.v2, self.v3
        masas = self.masas
        return OneFermionLoopTriangle(*vertices, *masas)

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
        return f'TriangleOneFermion(\n\t{self.v1!r},\n\t{self.v2!r},\n\t{self.v3!r},\n\t{self.masas!r})'

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
        return f'GenericOneLoopDiagramXDecayOneFermionBubble(\n\t{self.v1!r},\n\t{self.v2!r},\n\t{self.v3!r},\n\t{self.masas!r})'

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
        return f'BubbleFXOneFermion(\n\t{self.v1!r},\n\t{self.v2!r},\n\t{self.v3!r},\n\t{self.masas!r})'
    
    def formfactor(self):
        vertices = self.v1, self.v2, self.v3
        masas = self.masas
        return OneFermionLoopBubbleFX(*vertices, *masas)

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
        return f'BubbleXFOneFermion(\n\t{self.v1!r},\n\t{self.v2!r},\n\t{self.v3!r},\n\t{self.masas!r})'
    
    def formfactor(self):
        vertices = self.v1, self.v2, self.v3
        masas = self.masas
        return OneFermionLoopBubbleXF(*vertices, *masas)

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
        return f'GenericOneLoopDiagramXDecayTwoFermion(\n\t{self.v1!r},\n\t{self.v2!r},\n\t{self.v3!r},\n\t{self.masas!r})'

    def __repr__(self):
        return self.__str__()
    
    def formfactor(self):
        vertices = self.v1, self.v2, self.v3
        masas = self.masas
        return TwoFermionLoop(*vertices, *masas)

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
        return f'TriangleTwoFermion(\n\t{self.v1!r},\n\t{self.v2!r},\n\t{self.v3!r},\n\t{self.masas!r})'

if __name__ == '__main__':
    print('All right topologias.py')
