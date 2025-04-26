# -*- coding: utf-8 -*-
"""
Processes Lagrangians (Higgs kinetic terms and scalar potential) for the
Senjanovic model with Higgs Doublets (DLRSM) to extract Feynman rule
coefficients for gauge-scalar and scalar-scalar interactions.

This script:
1. Imports necessary fields, Lagrangians, and tools.
2. Defines the set of relevant physical fields (scalars and gauge bosons).
3. Implements a function `apply_covariant_derivative_rules` to handle the
    kinetic terms involving derivatives (simulating D_mu application).
4. Processes the kinetic Lagrangian (LHiggs) by applying derivative rules and
    replacing derivative symbols with momentum symbols.
5. Processes the scalar potential (VLR) by substituting conjugate fields.
6. Extracts 3- and 4-point interaction coefficients from both the exact and
    approximate versions of the processed Lagrangians using the
    `extract_interaction_coefficients` tool.
7. Provides results as dictionaries mapping interaction tuples to coefficients.
8. Includes a self-test block (`if __name__ == "__main__"`) to verify the
    reconstruction of the Lagrangians from the extracted coefficients.
"""

# --- Imports ---
# Standard library
from typing import Set, List, Dict, Any

# Third-party
from sympy import Mul, Add, conjugate, Symbol, Expr
from sympy.physics.quantum.dagger import Dagger # Use Dagger for conjugate representation if needed

# Local project imports
from potential_senjanovic_HiggsDoublets import (
    vev_physical_charged_scalars, H10, H20, H30, H40, A10, A20, GZ1, GZ2,
    HLp, HLm, GLp, GLm, HRp, HRm, GRp, GRm,
    VLR_physical, VLR_physical_approx
)
from Gauge_Higgs_senjanovic_HiggsDoublets import (
    W1p, W2p, W1m, W2m, A, Z1, Z2,
    partial_mu, # The symbolic representation of partial derivative
    LHiggs_physical, LHiggs_physical_approx
)
from symbolic_tools import (
    extract_interaction_coefficients,
    test_feynman_coefficients,
    PartialMu, # The function to create partial_mu(field)
    momentum   # The function to create momentum(field), e.g., p(H10)
)

# --- Field Definitions ---

# Base physical scalar fields
BASE_SCALAR_FIELDS: List[Symbol] = (
    list(vev_physical_charged_scalars.keys()) +
    [H10, H20, H30, H40, A10, A20, GZ1, GZ2]
)

# Base physical gauge fields
BASE_GAUGE_FIELDS: List[Symbol] = [W1p, W2p, W1m, W2m, A, Z1, Z2]

# All base fields relevant for interactions
ALL_BASE_FIELDS: List[Symbol] = BASE_SCALAR_FIELDS + BASE_GAUGE_FIELDS
ALL_BASE_FIELDS_SET: Set[Symbol] = set(ALL_BASE_FIELDS)

# Momentum symbols corresponding to scalar fields (used as parameters/external)
SCALAR_MOMENTUM_SYMBOLS: Set[Symbol] = {momentum(s) for s in BASE_SCALAR_FIELDS}

# --- Helper Functions ---

def apply_covariant_derivative_rules(expr: Expr, fields_subject_to_deriv: Set[Symbol]) -> Expr:
    """
    Applies linearity and Leibniz rule to simulate the action of a derivative
    (represented by `partial_mu`) on an expression containing specified fields.

    Args:
        expr: The SymPy expression to process.
        fields_subject_to_deriv: A set of SymPy symbols representing the fields
                                that the derivative acts upon.

    Returns:
        The processed SymPy expression with `partial_mu(field)` terms generated.
    """
    expr = expr.expand()
    if isinstance(expr, Add):
        # Apply linearity: D(A + B) = D(A) + D(B)
        return Add(*(apply_covariant_derivative_rules(arg, fields_subject_to_deriv) for arg in expr.args))

    elif isinstance(expr, Mul):
        # Apply Leibniz rule: D(A * B) = D(A)*B + A*D(B)
        factors = expr.as_ordered_factors()
        field_factors = [f for f in factors if f in fields_subject_to_deriv]
        coeff_factors = [f for f in factors if f not in fields_subject_to_deriv]
        coeff_part = Mul(*coeff_factors) if coeff_factors else 1

        if not field_factors: # Only coefficients
            return expr
        if len(field_factors) == 1: # Coefficient * Field
             # D(c * F) = c * D(F) (assuming derivative doesn't act on coeffs)
            return coeff_part * PartialMu(field_factors[0])
        else:
            # Apply Leibniz rule for multiple fields
            terms = []
            for i, field_i in enumerate(field_factors):
                other_fields = field_factors[:i] + field_factors[i+1:]
                # Term is coeff * D(field_i) * other_fields
                terms.append(coeff_part * PartialMu(field_i) * Mul(*other_fields))
            return Add(*terms)

    elif expr in fields_subject_to_deriv:
        # D(F) = partial_mu(F)
        return PartialMu(expr)

    else:
        # Constants or fields not subject to derivative remain unchanged
        return expr

def _extract_coefficients_from_lagrangian(
    lagrangian: Expr,
    base_fields: Set[Symbol],
    name: str,
    include_momenta_in_params: bool = False
) -> Dict[int, Dict[tuple, Expr]]:
    """
    Helper function to extract interaction coefficients from a given Lagrangian.

    Args:
        lagrangian: The SymPy expression for the Lagrangian.
        base_fields: Set of base field symbols (scalars + gauge).
        name: A descriptive name for the Lagrangian (e.g., "LHiggs_physical").
        include_momenta_in_params: If True, add scalar momentum symbols to the
                                   parameter set.

    Returns:
        A dictionary {n_point: {(field_tuple): coefficient}}.
    """
    print(f"\n--- Extracting coefficients for: {name} ---")
    all_symbols_in_lag = lagrangian.free_symbols
    parameters = all_symbols_in_lag - base_fields

    # Derivatives/Momenta are treated like parameters/external symbols in vertices
    if include_momenta_in_params:
        parameters |= SCALAR_MOMENTUM_SYMBOLS
        # Ensure momentum symbols that might not explicitly be in the simplified
        # Lagrangian (e.g., if a term vanished) are still considered parameters
        # if they *could* arise from the derivative terms.

    # We pass only the BASE fields to extract_interaction_coefficients.
    # The function identifies interactions based on combinations of these fields.
    # Derivatives/Momenta associated with fields in a vertex are implicitly
    # handled by the structure of the Lagrangian terms and included in the
    # coefficient expression along with other parameters.
    interactions = extract_interaction_coefficients(
        L=lagrangian,
        fields=base_fields,
        parameters=parameters
    )
    print(f"Finished extracting coefficients for: {name}")
    return interactions


# --- Lagrangian Processing ---

# 1. Process Kinetic Terms (LHiggs)
print("\n--- Processing Kinetic Lagrangian (LHiggs) ---")
# Apply the derivative rules (Leibniz, linearity) to simulate D_mu action
LHiggs_physical_with_derivs = apply_covariant_derivative_rules(LHiggs_physical, ALL_BASE_FIELDS_SET)
LHiggs_physical_approx_with_derivs = apply_covariant_derivative_rules(LHiggs_physical_approx, ALL_BASE_FIELDS_SET)

# Replace the symbolic derivative `partial_mu(Field)` with momentum `p(Field)`
# Use doit() to evaluate the replacement function.
partial_to_momentum_map = {PartialMu(f): momentum(f) for f in ALL_BASE_FIELDS}
LHiggs_physical_momentum = LHiggs_physical_with_derivs.subs(partial_to_momentum_map).doit().expand()
LHiggs_physical_approx_momentum = LHiggs_physical_approx_with_derivs.subs(partial_to_momentum_map).doit().expand()
print("Finished processing LHiggs.")

# 2. Process Scalar Potential (VLR)
print("\n--- Processing Scalar Potential (VLR) ---")
# Define substitutions for conjugate fields
# Using Dagger might be more explicit if complex conjugation is meant,
# but sticking to original `conjugate` for consistency unless specified otherwise.
conjugate_map = {
    conjugate(HLp): HLm, conjugate(HLm): HLp,
    conjugate(GLp): GLm, conjugate(GLm): GLp,
    conjugate(HRp): HRm, conjugate(HRm): HRp,
    conjugate(GRp): GRm, conjugate(GRm): GRp,
    # Add neutral fields if they can be complex and appear conjugated
    # conjugate(H10): H10, ... (if real)
}
# Substitute conjugates and expand
VLR_physical_processed = VLR_physical.subs(conjugate_map).expand()
VLR_physical_approx_processed = VLR_physical_approx.subs(conjugate_map).expand()
print("Finished processing VLR.")


# --- Coefficient Extraction ---

# Extract coefficients from Gauge-Scalar interactions (derived from LHiggs)
interactions_gauge_scalars = _extract_coefficients_from_lagrangian(
    lagrangian=LHiggs_physical_momentum,
    base_fields=ALL_BASE_FIELDS_SET,
    name="LHiggs_physical (Gauge-Scalar)",
    include_momenta_in_params=True # Momenta appear in kinetic terms
)
interactions_gauge_scalars_approx = _extract_coefficients_from_lagrangian(
    lagrangian=LHiggs_physical_approx_momentum,
    base_fields=ALL_BASE_FIELDS_SET,
    name="LHiggs_physical_approx (Gauge-Scalar)",
    include_momenta_in_params=True # Momenta appear in kinetic terms
)

# Extract coefficients from Scalar interactions (derived from -VLR)
# Note: Feynman rules usually come from -L. Potential V enters L as -V.
interactions_scalars = _extract_coefficients_from_lagrangian(
    lagrangian=-VLR_physical_processed, # Use -V for Lagrangian convention
    base_fields=ALL_BASE_FIELDS_SET,
    name="-VLR_physical (Scalar)",
    include_momenta_in_params=False # No momenta in potential terms
)
interactions_scalars_approx = _extract_coefficients_from_lagrangian(
    lagrangian=-VLR_physical_approx_processed, # Use -V for Lagrangian convention
    base_fields=ALL_BASE_FIELDS_SET,
    name="-VLR_physical_approx (Scalar)",
    include_momenta_in_params=False # No momenta in potential terms
)

# --- Main Execution / Test Block ---

if __name__ == "__main__":
    print("\n--- Running Self-Tests ---")

    # Test reconstruction for LHiggs_physical
    print("Testing reconstruction of LHiggs_physical...")
    lag_diff_higgs = test_feynman_coefficients(
        Lagrangian=LHiggs_physical_momentum,
        fields=ALL_BASE_FIELDS_SET,
        # Parameters should include momenta for kinetic terms
        parameters=(LHiggs_physical_momentum.free_symbols - ALL_BASE_FIELDS_SET) | SCALAR_MOMENTUM_SYMBOLS
    )
    if lag_diff_higgs == 0:
        print("LHiggs_physical reconstruction successful (Difference is 0).")
    else:
        print("WARNING: LHiggs_physical reconstruction failed!")
        # print("Difference:", lag_diff_higgs.simplify()) # Can be very large output

    # Test reconstruction for LHiggs_physical_approx
    print("\nTesting reconstruction of LHiggs_physical_approx...")
    lag_diff_higgs_approx = test_feynman_coefficients(
        Lagrangian=LHiggs_physical_approx_momentum,
        fields=ALL_BASE_FIELDS_SET,
        parameters=(LHiggs_physical_approx_momentum.free_symbols - ALL_BASE_FIELDS_SET) | SCALAR_MOMENTUM_SYMBOLS
    )
    if lag_diff_higgs_approx == 0:
        print("LHiggs_physical_approx reconstruction successful (Difference is 0).")
    else:
        print("WARNING: LHiggs_physical_approx reconstruction failed!")
        # print("Difference:", lag_diff_higgs_approx.simplify())

    # Test reconstruction for -VLR_physical
    print("\nTesting reconstruction of -VLR_physical...")
    lag_diff_vlr = test_feynman_coefficients(
        Lagrangian=-VLR_physical_processed, # Test with -V
        fields=ALL_BASE_FIELDS_SET,
        # Parameters do not include momenta for potential terms
        parameters=(-VLR_physical_processed).free_symbols - ALL_BASE_FIELDS_SET
    )
    if lag_diff_vlr == 0:
        print("-VLR_physical reconstruction successful (Difference is 0).")
    else:
        print("WARNING: -VLR_physical reconstruction failed!")
        # print("Difference:", lag_diff_vlr.simplify())

    # Test reconstruction for -VLR_physical_approx
    print("\nTesting reconstruction of -VLR_physical_approx...")
    lag_diff_vlr_approx = test_feynman_coefficients(
        Lagrangian=-VLR_physical_approx_processed, # Test with -V
        fields=ALL_BASE_FIELDS_SET,
        parameters=(-VLR_physical_approx_processed).free_symbols - ALL_BASE_FIELDS_SET
    )
    if lag_diff_vlr_approx == 0:
        print("-VLR_physical_approx reconstruction successful (Difference is 0).")
    else:
        print("WARNING: -VLR_physical_approx reconstruction failed!")
        # print("Difference:", lag_diff_vlr_approx.simplify())

    print("\n--- Self-Tests Finished ---")

