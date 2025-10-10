#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Hdecay_diagrams.py

Calculates amplitudes and decay widths for Lepton Flavor Violating (LFV)
Higgs decays (h -> li lj) at one-loop.

This module defines classes representing different Feynman diagram topologies
and interaction types, using a symbolic approach initially and numerical
evaluation for the final width.

@author: Moises Zeleny (moiseszeleny@gmail.com)
Original Date: friday Aug 10 15:30:00 2024
Refactored: [Your Name/Date]
"""

# --- Add parent directory to sys.path ---
#import sys
#import os
#current_dir = os.path.dirname(os.path.abspath(__file__))
#parent_dir = os.path.dirname(current_dir) # This is 'LFV decays DLRSM'
#if parent_dir not in sys.path:
#    sys.path.insert(0, parent_dir)
# --- End sys.path modification ---


from typing import Type, Callable, Any, Union
from sympy import symbols, I, pi, Expr
import numpy as np

# --- External Dependencies (Assumed Structure) ---
# These modules need to exist and provide the specified classes/functions.

# Base topology classes defining structure and self.formfactor() method
from .topologias import (
    TriangleOneFermion,
    BubbleFXOneFermion,
    BubbleXFOneFermion,
    TriangleTwoFermion
)

# Loop integral / form factor functions (G-functions)
from .Higgs.functionsFSS import GFSS
from .Higgs.functionsFSV import GFSV
from .Higgs.functionsFVS import GFVS
from .Higgs.functionsFVV import GFVV
from .Higgs.functionsFS import GFS
from .Higgs.functionsFV import GFV
from .Higgs.functionsSF import GSF
from .Higgs.functionsVF import GVF
from .Higgs.functionsSFF import GSFF
from .Higgs.functionsVFF import GVFF

# --- Constants ---
FACTOR_RD: Expr = I / (16 * pi**2)  # Standard 1-loop factor

# Default masses (in GeV) for width calculation
DEFAULT_HIGGS_MASS: float = 125.20
DEFAULT_TAU_MASS: float = 1.777
DEFAULT_MUON_MASS: float = 0.1057 # GeV

# Standard Model Higgs Width (GeV) - for Branching Ratio calculation
SM_HIGGS_WIDTH: float = 4.07e-3

# --- Type Aliases ---
# Represents the type of the G-functions (assumed signature)
LoopFunctionType = Callable[..., Any] # Adjust ... based on actual G-func signature
# Represents the base topology classes
BaseTopologyType = Union[
    Type[TriangleOneFermion],
    Type[BubbleFXOneFermion],
    Type[BubbleXFOneFermion],
    Type[TriangleTwoFermion]
]
# Represents numeric types used in calculations
Numeric = Union[float, np.float64, complex, np.complex128]


# --- Factory Function for Diagram Classes ---

def create_diagram_calculator(
    class_name: str,
    base_class: BaseTopologyType,
    loop_function: LoopFunctionType
) -> Type:
    """
    Factory function to dynamically create diagram calculator classes.

    This avoids repetitive class definitions for each diagram type.

    Args:
        class_name: The desired name for the generated class (e.g., "TriangleFSS").
        base_class: The base topology class to inherit from (e.g., TriangleOneFermion).
        loop_function: The specific G-function (e.g., GFSS) used for form factor calculation.

    Returns:
        A new class inheriting from base_class and implementing AR/AL methods.
    """

    def __str__(self) -> str:
        # Assumes base class __init__ stores v1, v2, v3, masas
        # Uses !r for repr() representation, as in the original code
        try:
            return f'{class_name}({self.v1!r}, {self.v2!r}, {self.v3!r}, {self.masas!r})'
        except AttributeError:
            # Fallback if attributes aren't named exactly v1, v2, v3, masas
            return f'{class_name}(...)'

    def AR(self) -> Expr:
        """Calculates the Right-handed form factor contribution."""
        # Assumes self.formfactor() exists from base_class and returns
        # an object with an R method that accepts the loop_function.
        return FACTOR_RD * self.formfactor().R(loop_function)

    def AL(self) -> Expr:
        """Calculates the Left-handed form factor contribution."""
        # Assumes self.formfactor() exists from base_class and returns
        # an object with an L method that accepts the loop_function.
        return FACTOR_RD * self.formfactor().L(loop_function)

    # Dynamically create the class using type()
    new_class = type(
        class_name,
        (base_class,),
        {
            "__str__": __str__,
            "AR": AR,
            "AL": AL,
            "_loop_function": loop_function, # Store for potential introspection
            "__doc__": f"""Calculator for {class_name} diagram topology.
                        Inherits from {base_class.__name__}.
                        Uses {loop_function.__name__} for form factor calculation."""
        }
    )
    return new_class

# --- Diagram Class Definitions using the Factory ---

# One fermion in the loop - Triangles
TriangleFSS = create_diagram_calculator('TriangleFSS', TriangleOneFermion, GFSS)
TriangleFSV = create_diagram_calculator('TriangleFSV', TriangleOneFermion, GFSV)
TriangleFVS = create_diagram_calculator('TriangleFVS', TriangleOneFermion, GFVS)
TriangleFVV = create_diagram_calculator('TriangleFVV', TriangleOneFermion, GFVV)

# One fermion in the loop - Bubbles
# Note: Using BubbleFXOneFermion and BubbleXFOneFermion as per original code
BubbleFV = create_diagram_calculator('BubbleFV', BubbleFXOneFermion, GFV)
BubbleVF = create_diagram_calculator('BubbleVF', BubbleXFOneFermion, GVF)
BubbleFS = create_diagram_calculator('BubbleFS', BubbleFXOneFermion, GFS)
BubbleSF = create_diagram_calculator('BubbleSF', BubbleXFOneFermion, GSF)

# Two fermions in the loop - Triangles
TriangleSFF = create_diagram_calculator('TriangleSFF', TriangleTwoFermion, GSFF)
TriangleVFF = create_diagram_calculator('TriangleVFF', TriangleTwoFermion, GVFF)


# --- Decay Width and Branching Ratio Calculation ---

def calculate_decay_width(
    ML: Numeric,
    MR: Numeric,
    higgs_mass: float = DEFAULT_HIGGS_MASS,
    lepton_i_mass: float = DEFAULT_TAU_MASS,      # e.g., tau
    lepton_j_mass: float = DEFAULT_MUON_MASS     # e.g., muon
) -> float:
    """
    Calculates the partial decay width for H -> l_i l_j.

    Args:
        ML: Total Left-handed amplitude contribution (sum from all diagrams).
            Can be complex.
        MR: Total Right-handed amplitude contribution (sum from all diagrams).
            Can be complex.
        higgs_mass: Mass of the decaying Higgs boson (GeV).
        lepton_i_mass: Mass of the final state lepton i (GeV).
        lepton_j_mass: Mass of the final state lepton j (GeV).

    Returns:
        The partial decay width in GeV, or 0.0 if kinematically forbidden
        or results in NaN.

    Formula:
        Γ = (1 / (8 * π * m_H)) * sqrt(λ(m_H^2, m_i^2, m_j^2) / m_H^4) *
            [ (m_H^2 - m_i^2 - m_j^2) * (|ML|^2 + |MR|^2) -
              4 * m_i * m_j * Re(ML * MR†) ]
        where λ(a,b,c) = (a - b - c)^2 - 4bc is the Källén function.
        The sqrt(maij) term in the original code corresponds to sqrt(λ)/ma^2.
    """
        # ... inside calculate_decay_width ...

    # Ensure masses are non-negative
    mh, mi, mj = abs(higgs_mass), abs(lepton_i_mass), abs(lepton_j_mass)

    if mh <= mi + mj:
        # Kinematically forbidden
        return 0.0

    # --- TEMPORARY MODIFICATION FOR EQUIVALENCE TEST ---
    # Use the exact same 'maij' calculation as the original Hdecay_diagrams.py
    if mh == 0: return 0.0 # Prevent division by zero
    maij = (1 - ((mi**2 + mj**2)/mh)**2)*(1 - ((mi**2 - mj**2)/mh)**2)
    if maij < 0:
        # This can happen if mh is very close to mi+mj due to precision
        # Or if the formula itself allows negative values in some regimes
        # Original code used nan_to_num later, returning 0.0 here is safer
        return 0.0
    phase_space_sqrt = np.sqrt(maij)
    # --- END TEMPORARY MODIFICATION ---


    # # --- Original Refactored Calculation (Källén function based) ---
    # # Ensure denominator isn't zero
    # if mh == 0: return 0.0
    # # Using the corrected Kallen function approach: lambda / mh^4
    # maij_factor_corrected = (1 - (mi+mj)**2/mh**2) * (1 - (mi-mj)**2/mh**2)
    # if maij_factor_corrected < 0:
    #      return 0.0 # Should be protected by mh > mi + mj check
    # phase_space_sqrt = np.sqrt(maij_factor_corrected)
    # # --- End Original Refactored Calculation ---


    # Amplitude squared part
    amp_sq_term = (
        (mh**2 - mi**2 - mj**2) * (np.abs(ML)**2 + np.abs(MR)**2) -
        4 * mi * mj * np.real(ML * np.conj(MR))
    )

    # Combine factors
    width = (1 / (8 * np.pi * mh)) * phase_space_sqrt * amp_sq_term

    # Handle potential NaNs from edge cases in numerical evaluation
    # The original code did this, so keep it for equivalence.
    return float(np.nan_to_num(width))


# Alias for backward compatibility if needed, but prefer the new name
Γhlilj = calculate_decay_width

def calculate_branching_ratio(
    ML: Numeric,
    MR: Numeric,
    higgs_mass: float = DEFAULT_HIGGS_MASS,
    lepton_i_mass: float = DEFAULT_TAU_MASS,
    lepton_j_mass: float = DEFAULT_MUON_MASS,
    total_higgs_width: float = -1.0 # Default to calculating total width
) -> float:
    """
    Calculates the branching ratio for H -> l_i l_j.

    Args:
        ML: Total Left-handed amplitude contribution.
        MR: Total Right-handed amplitude contribution.
        higgs_mass: Mass of the decaying Higgs boson (GeV).
        lepton_i_mass: Mass of the final state lepton i (GeV).
        lepton_j_mass: Mass of the final state lepton j (GeV).
        total_higgs_width: The total width of the Higgs boson (GeV).
                            If negative (default), uses Γ_partial + Γ_SM.
                            Provide the model's total Higgs width if available
                            and different from Γ_partial + Γ_SM.

    Returns:
        The branching ratio (dimensionless), or 0.0 if width is zero.
    """
    partial_width = calculate_decay_width(
        ML, MR, higgs_mass, lepton_i_mass, lepton_j_mass
    )

    if partial_width == 0.0:
        return 0.0

    if total_higgs_width < 0:
        # Use the approximation: Total Width = Partial LFV Width + SM Width
        effective_total_width = partial_width + SM_HIGGS_WIDTH
    else:
        effective_total_width = total_higgs_width

    if effective_total_width <= 0:
        # Avoid division by zero or negative width
        return 0.0

    branching_ratio = partial_width / effective_total_width
    return float(np.nan_to_num(branching_ratio))

# Alias for backward compatibility if needed
# BRhlilj = calculate_branching_ratio


# --- Main Execution Block ---
if __name__ == '__main__':
    print("Hdecay_diagrams.py module loaded successfully.")
    print(f"Defined loop factor: FACTOR_RD = {FACTOR_RD}")
    print("\nAvailable diagram calculators:")
    calculators = [
        TriangleFSS, TriangleFSV, TriangleFVS, TriangleFVV,
        BubbleFV, BubbleVF, BubbleFS, BubbleSF,
        TriangleSFF, TriangleVFF
    ]
    for calc in calculators:
        print(f"- {calc.__name__}") # Access the class name

    # Example usage (requires dummy inputs or actual model parameters)
    print("\nExample Width Calculation (using dummy amplitudes):")
    # Note: Amplitudes ML, MR would typically be sums of AL, AR from
    # instantiated calculator objects, evaluated numerically.
    # Example: ML = TriangleFSS(...).AL() + BubbleFS(...).AL() + ... (evaluated)
    dummy_ML = 1e-5 + 2e-6j
    dummy_MR = 3e-6 - 1e-5j

    width = calculate_decay_width(dummy_ML, dummy_MR,
                                lepton_i_mass=DEFAULT_TAU_MASS,
                                lepton_j_mass=DEFAULT_MUON_MASS) # h -> tau mu
    print(f"Γ(h -> tau mu) ≈ {width:.4e} GeV (with dummy amplitudes)")

    br = calculate_branching_ratio(dummy_ML, dummy_MR,
                                lepton_i_mass=DEFAULT_TAU_MASS,
                                lepton_j_mass=DEFAULT_MUON_MASS)
    print(f"BR(h -> tau mu) ≈ {br:.4e} (using Γ_partial + Γ_SM, dummy amplitudes)")

    # Example showing how a calculator class looks
    # print(f"\nDocstring for TriangleFSS:\n{TriangleFSS.__doc__}")
    # print(f"Base class for TriangleFSS: {TriangleFSS.__bases__[0].__name__}")
    # print(f"Loop function for TriangleFSS: {TriangleFSS._loop_function.__name__}")

