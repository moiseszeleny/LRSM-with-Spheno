#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
vertexes.py

Defines symbolic representations of particle interaction vertices using SymPy
for use in Feynman diagram calculations, particularly for LFV Higgs decays.

Each class represents a type of vertex (e.g., Scalar-Scalar-Scalar,
Vector-Fermion-Fermion) and provides a `show()` method to return its
symbolic mathematical form.

@author: Moises Zeleny (moiseszeleny@gmail.com)
Original Date: Wed Jul  8 01:07:53 2020
Refactored: Moises Zeleny
"""

# --- Add parent directory to sys.path ---
import sys
import os

# Get the absolute path of the directory containing the current script (LFVXD)
current_dir = os.path.dirname(os.path.abspath(__file__))
# Get the absolute path of the parent directory (LFV decays DLRSM)
parent_dir = os.path.dirname(current_dir)

# Add the parent directory to the beginning of the Python path
# This allows imports relative to 'LFV decays DLRSM'
if parent_dir not in sys.path:
    sys.path.insert(0, parent_dir)
# --- End sys.path modification ---


from typing import Union
from sympy import symbols, Expr, Symbol

# --- Define Common Symbolic Constants ---
# Using descriptive names and type hints

# Chirality Projectors (non-commutative)
#P_R: Symbol = symbols('P_R', commutative=False)
#P_L: Symbol = symbols('P_L', commutative=False)
from DLRSM1.dirac import diracPL as  P_L
from DLRSM1.dirac import diracPR as P_R
from DLRSM1.dirac import DiracGamma, MetricTensor
#P_R: Symbol = diracPR
#P_L: Symbol = diracPL

# Gamma Matrix (non-commutative)
mu, nu, sig = symbols(r'\mu \nu \sigma', integer=True)
GAMMA_MU: DiracGamma = DiracGamma(mu)  # Gamma matrix in Dirac notation

# Metric Tensor (real, symmetric)
G_MU_NU = MetricTensor(mu, nu)  # Metric tensor in Dirac notation
G_NU_SIG = MetricTensor(nu, sig)  # Metric tensor in Dirac notation
G_MU_SIG = MetricTensor(mu, sig)  # Metric tensor in Dirac notation

# Generic Momenta Symbols (used in some vertex structures)
# Note: Specific momenta might be substituted later in calculations.
P_PLUS: Symbol = symbols(r'p^{+}') # Example momentum name
P_A: Symbol = symbols(r'p^{a}')   # Example momentum name
P1: Symbol = symbols(r'p_1')
P2: Symbol = symbols(r'p_2')
P3: Symbol = symbols(r'p_3')

# Type alias for SymPy expressions or symbols representing couplings
CouplingType = Union[Expr, Symbol]

# --- Base Vertex Classes (Implicit) ---
# While no explicit base class is strictly necessary here,
# VertexSSS and VertexSFF serve as conceptual bases for others.

# --- Vertex Definitions ---

class VertexSSS:
    """Represents a vertex coupling three scalar particles.

    Attributes:
        c (CouplingType): The coupling constant for the SSS interaction.
    """
    def __init__(self, c: CouplingType):
        """
        Args:
            c (CouplingType): Coupling constant for the SSS interaction.
        """
        if not isinstance(c, (Expr, Symbol)):
            raise TypeError(f"Coupling 'c' must be a SymPy expression or symbol, got {type(c)}")
        self.c: CouplingType = c

    def __str__(self) -> str:
        return f'{self.__class__.__name__}({self.c!r})'

    def __repr__(self) -> str:
        return self.__str__()

    def show(self) -> CouplingType:
        """Returns the symbolic representation of the SSS coupling."""
        return self.c

class VertexSFF:
    """Represents a vertex coupling one scalar and two fermion particles.

    Allows for different left-handed (cL) and right-handed (cR) couplings.

    Attributes:
        cR (CouplingType): The right-handed coupling coefficient (coefficient of P_R).
        cL (CouplingType): The left-handed coupling coefficient (coefficient of P_L).
        c (CouplingType | None): Set to cL if cL == cR, otherwise None.
                                    (Preserved for potential compatibility).
    """
    # Class attributes for shared symbolic constants
    PR: Symbol = P_R
    PL: Symbol = P_L

    def __init__(self, cR: CouplingType, cL: CouplingType):
        """
        Args:
            cR (CouplingType): Right-handed coupling coefficient.
            cL (CouplingType): Left-handed coupling coefficient.
        """
        if not isinstance(cR, (Expr, Symbol)):
            raise TypeError(f"Coupling 'cR' must be a SymPy expression or symbol, got {type(cR)}")
        if not isinstance(cL, (Expr, Symbol)):
            raise TypeError(f"Coupling 'cL' must be a SymPy expression or symbol, got {type(cL)}")

        self.cR: CouplingType = cR
        self.cL: CouplingType = cL
        self.c: Union[CouplingType, None] = None
        # Store 'c' if couplings are equal, maintaining original behavior
        if self.cL == self.cR:
            self.c = self.cL

    def __str__(self) -> str:
        return f'{self.__class__.__name__}(cR={self.cR!r}, cL={self.cL!r})'

    def __repr__(self) -> str:
        return self.__str__()

    def show(self) -> Expr:
        """Returns the symbolic SFF interaction term (cR*PR + cL*PL)."""
        return self.cR * self.PR + self.cL * self.PL

# --- Vertices Inheriting Structure from VertexSSS ---
# These vertices involve a single coupling constant 'c'.

class VertexVSS(VertexSSS):
    """Represents a vertex coupling one vector and two scalar particles.

    Inherits __init__ from VertexSSS (takes coupling 'c').
    The structure involves the difference of the scalar momenta.
    """
    # Class attributes for symbolic momenta difference structure
    p_plus: Symbol = P_PLUS
    p_a: Symbol = P_A

    # No __init__ needed, inherits from VertexSSS

    def show(self) -> Expr:
        """Returns the symbolic VSS interaction term c*(p_plus - p_a)."""
        # Uses p_plus and p_a defined at class level as placeholders
        return self.c * (self.p_plus - self.p_a)

class VertexSSpVm(VertexSSS):
    """Represents a vertex coupling two scalars (S, S+) and one vector (V-).

    Functionally similar to VertexVSS in this symbolic representation.
    Inherits __init__ from VertexSSS (takes coupling 'c').
    """
    # Class attributes for symbolic momenta difference structure
    p_plus: Symbol = P_PLUS
    p_a: Symbol = P_A

    # No __init__ needed, inherits from VertexSSS

    def show(self) -> Expr:
        """Returns the symbolic SSpVm interaction term c*(p_plus - p_a)."""
        return self.c * (self.p_plus - self.p_a)

class VertexSVpSm(VertexSSS):
    """Represents a vertex coupling one scalar (S), one vector (V+), one scalar (S-).

    Functionally similar to VertexVSS in this symbolic representation.
    Inherits __init__ from VertexSSS (takes coupling 'c').
    """
    # Class attributes for symbolic momenta difference structure
    p_plus: Symbol = P_PLUS
    p_a: Symbol = P_A

    # No __init__ needed, inherits from VertexSSS

    def show(self) -> Expr:
        """Returns the symbolic SVpSm interaction term c*(p_plus - p_a)."""
        return self.c * (self.p_plus - self.p_a)


class VertexSVV(VertexSSS):
    """Represents a vertex coupling one scalar and two vector particles.

    Inherits __init__ from VertexSSS (takes coupling 'c').
    The structure involves the metric tensor g_mu_nu.
    """
    # Class attribute for the metric tensor
    g_mu_nu: Symbol = G_MU_NU

    # No __init__ needed, inherits from VertexSSS

    def show(self) -> Expr:
        """Returns the symbolic SVV interaction term c*g_mu_nu."""
        return self.c * self.g_mu_nu

class VertexVVV(VertexSSS):
    """Represents a vertex coupling three vector bosons.

    Inherits __init__ from VertexSSS (takes coupling 'c').
    Structure involves metric tensors and momentum differences.
    """
    # Class attributes for metric tensors and momenta placeholders
    g_mu_nu: Symbol = G_MU_NU
    g_nu_sig: Symbol = G_NU_SIG
    g_mu_sig: Symbol = G_MU_SIG
    p1: Symbol = P1
    p2: Symbol = P2
    p3: Symbol = P3

    # No __init__ needed, inherits from VertexSSS

    def show(self) -> Expr:
        """Returns the symbolic VVV interaction term."""
        # Uses p1, p2, p3 defined at class level as placeholders
        term1 = self.g_mu_nu * (self.p2 - self.p1)
        term2 = self.g_nu_sig * (self.p3 - self.p2)
        term3 = self.g_mu_sig * (self.p1 - self.p3)
        return self.c * (term1 + term2 + term3)

# --- Vertices Inheriting Structure from VertexSFF ---
# These vertices involve distinct left (cL) and right (cR) couplings.

class VertexVFF(VertexSFF):
    """Represents a vertex coupling one vector and two fermion particles.

    Inherits __init__ from VertexSFF (takes cR, cL).
    Structure involves the gamma matrix gamma_mu.
    """
    # Class attribute for the gamma matrix
    gamma_mu: DiracGamma = GAMMA_MU

    # No __init__ needed, inherits from VertexSFF

    def show(self) -> Expr:
        """Returns the symbolic VFF interaction term gamma_mu*(cR*PR + cL*PL)."""
        # PR and PL are inherited from VertexSFF
        return self.gamma_mu * (self.cR * self.PR + self.cL * self.PL)


# --- Main Execution Block ---
if __name__ == '__main__':
    print("vertexes.py module loaded.")
    print("Defines symbolic vertex classes using SymPy.")

    # Example Instantiation (demonstration)
    try:
        c1, c2, c3 = symbols('c1 c2 c3', complex=True)
        cr_sym, cl_sym = symbols('cR cL', complex=True)

        v_sss = VertexSSS(c1)
        v_sff = VertexSFF(cr_sym, cl_sym)
        v_vff = VertexVFF(cr_sym, cl_sym * 2) # Example with different couplings
        v_vss = VertexVSS(c2)
        v_svv = VertexSVV(c3)

        print("\nExample instances:")
        print(v_sss)
        print(v_sff)
        print(v_vff)
        print(v_vss)
        print(v_svv)

        print("\nExample .show() output:")
        print(f"VertexSSS.show(): {v_sss.show()}")
        print(f"VertexSFF.show(): {v_sff.show()}")
        print(f"VertexVFF.show(): {v_vff.show()}")
        print(f"VertexVSS.show(): {v_vss.show()}")
        print(f"VertexSVV.show(): {v_svv.show()}")

    except Exception as e:
        print(f"\nError during example instantiation: {e}")

