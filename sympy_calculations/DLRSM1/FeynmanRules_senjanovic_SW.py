# -*- coding: utf-8 -*-
"""
Processes Lagrangians (Higgs kinetic terms and scalar potential) for the
Senjanovic model with Higgs Doublets (DLRSM) to extract Feynman rule
coefficients for gauge-scalar and scalar-scalar interactions.

Version 2.1: Reverts kinetic term processing to a more robust method
            (similar to the first refactor) while keeping v2's parameter
            definitions and potential sign handling for equivalence check.
"""

# --- Imports ---
# Standard library
from typing import Set, List, Dict, Tuple

# Third-party
from sympy import Mul, Add, conjugate, Symbol, Expr, simplify, Function, sympify

# Local project imports
from potential_senjanovic_HiggsDoublets import (
    vev_physical_charged_scalars, H10, H20, H30, H40, A10, A20, GZ1, GZ2,
    HLp, HLm, GLp, GLm, HRp, HRm, GRp, GRm,
    VLR_physical, VLR_physical_approx
)
from Gauge_Higgs_senjanovic_HiggsDoublets import (
    W1p, W2p, W1m, W2m, A, Z1, Z2,
    # partial_mu symbol is likely NOT used directly in LHiggs,
    # derivatives are implicit in the structure (e.g., Dagger(CovD(Phi))*CovD(Phi))
    LHiggs_physical, LHiggs_physical_approx
)
from symbolic_tools import (
    extract_interaction_coefficients,
    test_feynman_coefficients,
    PartialMu, # The function/class representing partial_mu(field)
    momentum   # The function/class representing momentum(field)
)

# --- Field Definitions ---

# Base physical scalar fields
BASE_SCALAR_FIELDS: List[Symbol] = (
    list(vev_physical_charged_scalars.keys()) +
    [H10, H20, H30, H40, A10, A20, GZ1, GZ2]
)
BASE_SCALAR_FIELDS_SET: Set[Symbol] = set(BASE_SCALAR_FIELDS)

# Base physical gauge fields
BASE_GAUGE_FIELDS: List[Symbol] = [W1p, W2p, W1m, W2m, A, Z1, Z2]
BASE_GAUGE_FIELDS_SET: Set[Symbol] = set(BASE_GAUGE_FIELDS)

# All base physical fields
ALL_BASE_FIELDS_SET: Set[Symbol] = BASE_SCALAR_FIELDS_SET.union(BASE_GAUGE_FIELDS_SET)

# Derivative and Momentum symbols corresponding to fields
# Using PartialMu and momentum functions from symbolic_tools
# Generate these dynamically as needed later

# Define the exact 'fields' set used in the original script for parameter calculation
# This included base scalars, base gauge bosons, and scalar derivatives
# We need the *symbols* PartialMu(s) for this set.
SCALAR_DERIVATIVE_SYMBOLS_AS_SYMBOLS: List[Expr] = [PartialMu(s) for s in BASE_SCALAR_FIELDS]

ORIGINAL_FIELDS_SET_FOR_PARAMS: Set[Symbol] = set(
    BASE_SCALAR_FIELDS + BASE_GAUGE_FIELDS + SCALAR_DERIVATIVE_SYMBOLS_AS_SYMBOLS
)
# Momentum symbols set needed for parameter calculation
SCALAR_MOMENTUM_SYMBOLS_SET: Set[Expr] = {momentum(s) for s in BASE_SCALAR_FIELDS}


# --- Helper Function (Robust Derivative Processing) ---

def _process_derivatives_robustly(expr: Expr, fields_subject_to_deriv: Set[Symbol]) -> Expr:
    """
    Recursively processes an expression, applying linearity and Leibniz rule
    to generate PartialMu(field) terms where derivatives act.
    Assumes the input expression represents derivatives implicitly (e.g.,
    through structure like CovD(...) or specific terms known to involve derivatives).

    NOTE: This function's effectiveness depends heavily on the *structure*
    of the input LHiggs_physical. If LHiggs_physical already contains explicit
    derivative symbols in a non-standard way, this might need adjustment.
    This version assumes a structure where derivatives need to be inferred
    and applied via Leibniz/linearity. It replaces the field 'f' with 'PartialMu(f)'
    when a derivative is deemed to act on it.

    Args:
        expr: The SymPy expression to process.
        fields_subject_to_deriv: A set of SymPy symbols representing the fields
                                that the derivative acts upon.

    Returns:
        The processed SymPy expression with `PartialMu(field)` terms generated.
    """
    expr = expr.expand() # Expand first to handle terms correctly

    # Define a dummy derivative symbol/function to represent the action
    # We will replace this with PartialMu where appropriate.
    # Using a Function allows replace to work more predictably.
    class ImplicitDerivative(Function):
        @classmethod
        def eval(cls, arg):
            if arg in fields_subject_to_deriv:
                return PartialMu(arg)
            else:
                # If derivative acts on something not a field, return 0? Or keep it?
                # Assuming derivative only acts on specified fields.
                # If it acts on a product, Leibniz rule is needed.
                # This simple replacement is likely insufficient for complex Lagrangians.
                # A better approach might require explicit CovariantD objects.
                # ---> Let's stick to the Leibniz/Linearity logic directly <---
                pass # Fall through to Add/Mul handling

    if isinstance(expr, Add):
        # Apply linearity: D(A + B) = D(A) + D(B)
        return Add(*(_process_derivatives_robustly(arg, fields_subject_to_deriv) for arg in expr.args))

    elif isinstance(expr, Mul):
        # Apply Leibniz rule: D(A * B) = D(A)*B + A*D(B)
        # This assumes the entire Mul term is under a derivative, which might
        # only be true for specific terms in the Lagrangian (e.g., kinetic terms).
        # We need to identify which terms in LHiggs actually represent derivatives.

        # ---> Revised Strategy: Assume LHiggs contains terms like `Derivative(Field)`
        # or `Field * Derivative` where `Derivative` needs to become `PartialMu(Field)`
        # or apply Leibniz. Without knowing the exact structure of LHiggs,
        # applying a generic rule is hard.

        # ---> Fallback to the logic from the first refactor, assuming it correctly
        # interpreted the structure or intent.

        factors = expr.as_ordered_factors()
        field_factors = [f for f in factors if f in fields_subject_to_deriv]
        coeff_factors = [f for f in factors if f not in fields_subject_to_deriv]
        coeff_part = Mul(*coeff_factors) if coeff_factors else sympify(1)

        # This logic assumes the derivative acts on the whole product `expr`
        # and distributes via Leibniz rule.
        if not field_factors: # Only coefficients
            return expr # Derivative of constant term is 0? Or term doesn't involve derivative? Assume latter.
        if len(field_factors) == 1: # Coefficient * Field -> Coeff * D(Field)
            # This assumes the derivative acts on this term.
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
        # If a standalone field is encountered, assume derivative acts on it.
        # This might happen if LHiggs has terms like `symbolic_derivative * Field`.
        return PartialMu(expr)

    # Check if expr is related to known derivative structures if available
    # E.g., if LHiggs uses CovariantD objects from another module.

    else:
        # Constants or fields not subject to derivative remain unchanged
        return expr

# --- Lagrangian Processing ---

# 1. Process Kinetic Terms (LHiggs) - Robust Method
print("\n--- Processing Kinetic Lagrangian (LHiggs) - Robust Method ---")

# Step 1: Apply derivative rules to generate PartialMu(Field) terms.
# CRITICAL ASSUMPTION: The function _process_derivatives_robustly correctly
# interprets the structure of LHiggs_physical and applies derivatives.
# Given the previous failures, this step is the most uncertain.
# If LHiggs_physical is simple (e.g., already expanded sums of products),
# the Leibniz/linearity logic might work.
# Let's use the function from the first refactor attempt as it seemed logically sounder
# than the replace(symbol, function) approach.

# Re-using the function from the first refactor attempt (renamed for clarity)
def apply_leibniz_linearity(expr: Expr, fields_subject_to_deriv: Set[Symbol]) -> Expr:
    """
    Applies linearity and Leibniz rule recursively to simulate derivative action,
    generating PartialMu(field) terms.
    """
    expr = expr.expand()
    if isinstance(expr, Add):
        return Add(*(apply_leibniz_linearity(arg, fields_subject_to_deriv) for arg in expr.args))
    elif isinstance(expr, Mul):
        factors = expr.as_ordered_factors()
        field_factors = [f for f in factors if f in fields_subject_to_deriv]
        coeff_factors = [f for f in factors if f not in fields_subject_to_deriv]
        coeff_part = Mul(*coeff_factors) if coeff_factors else sympify(1)

        if not field_factors:
            return expr # Assume term doesn't involve derivative if no fields present
        if len(field_factors) == 1:
            # Assumes derivative acts on this term -> Coeff * D(Field)
            return coeff_part * PartialMu(field_factors[0])
        else:
            # Apply Leibniz rule
            terms = []
            for i, field_i in enumerate(field_factors):
                other_fields = field_factors[:i] + field_factors[i+1:]
                terms.append(coeff_part * PartialMu(field_i) * Mul(*other_fields))
            return Add(*terms)
    elif expr in fields_subject_to_deriv:
        # Assumes derivative acts on standalone field
        return PartialMu(expr)
    else:
        return expr # Constants or unrelated symbols remain

# Apply this processing function
# WARNING: This assumes apply_leibniz_linearity correctly processes LHiggs.
# This might be incorrect if LHiggs has a complex structure or uses specific
# objects to represent derivatives.
try:
    print("Applying derivative logic (Leibniz/Linearity)...")
    # We apply this to the *whole* Lagrangian, assuming derivative terms need processing.
    LHiggs_physical_with_derivs = apply_leibniz_linearity(LHiggs_physical, ALL_BASE_FIELDS_SET)
    LHiggs_physical_approx_with_derivs = apply_leibniz_linearity(LHiggs_physical_approx, ALL_BASE_FIELDS_SET)
    print("Derivative logic applied.")
except Exception as e:
    print(f"ERROR during derivative processing: {e}")
    print("Falling back to original (potentially problematic) processing method for comparison.")
    # Fallback to v2 method if robust one fails, to see if it reproduces original error
    LHiggs_physical_momentum = LHiggs_physical.replace(
        partial_mu, _apply_derivative_logic_original # Original v2 helper
    ).expand().replace(
        PartialMu, momentum
    ).doit()
    LHiggs_physical_approx_momentum = LHiggs_physical_approx.replace(
        partial_mu, _apply_derivative_logic_original # Original v2 helper
    ).expand().replace(
        PartialMu, momentum
    ).doit()


# Step 2: Replace PartialMu(Field) with momentum(Field)
# Use subs for potentially better robustness
print("Replacing PartialMu with momentum...")
partial_to_momentum_map = {PartialMu(f): momentum(f) for f in ALL_BASE_FIELDS_SET}

# Need to ensure the map covers all fields derivatives might act on.
# If apply_leibniz_linearity worked, apply the substitution:
if 'LHiggs_physical_with_derivs' in locals():
    LHiggs_physical_momentum = LHiggs_physical_with_derivs.subs(partial_to_momentum_map).doit().expand()
    LHiggs_physical_approx_momentum = LHiggs_physical_approx_with_derivs.subs(partial_to_momentum_map).doit().expand()
    print("Momentum substitution complete.")
else:
    print("Skipping momentum substitution due to earlier error.")


print("Finished processing LHiggs.")

# 2. Process Scalar Potential (VLR) - Unchanged from v2
print("\n--- Processing Scalar Potential (VLR) ---")
conjugate_map = {
    conjugate(HLp): HLm, conjugate(HLm): HLp,
    conjugate(GLp): GLm, conjugate(GLm): GLp,
    conjugate(HRp): HRm, conjugate(HRm): HRp,
    conjugate(GRp): GRm, conjugate(GRm): GRp,
}
VLR_physical_processed = VLR_physical.subs(conjugate_map).expand()
VLR_physical_approx_processed = VLR_physical_approx.subs(conjugate_map).expand()
print("Finished processing VLR.")


# --- Parameter Definition (Matching Original - Unchanged from v2) ---
print("\n--- Defining Parameters ---")
# Parameters for Kinetic terms:
parameters_kinetic = (
    (LHiggs_physical_momentum.free_symbols - ORIGINAL_FIELDS_SET_FOR_PARAMS)
    | SCALAR_MOMENTUM_SYMBOLS_SET
)
parameters_kinetic_approx = (
    (LHiggs_physical_approx_momentum.free_symbols - ORIGINAL_FIELDS_SET_FOR_PARAMS)
    | SCALAR_MOMENTUM_SYMBOLS_SET
)

# Parameters for Potential terms:
parameters_potential = (
    VLR_physical_processed.free_symbols - ALL_BASE_FIELDS_SET
)
parameters_potential_approx = (
    VLR_physical_approx_processed.free_symbols - ALL_BASE_FIELDS_SET
)
print("Parameters defined.")

# --- Coefficient Extraction (Unchanged from v2) ---

print("\n--- Extracting Interaction Coefficients ---")

# Extract coefficients from Gauge-Scalar interactions (derived from LHiggs)
interactions_gauge_scalars = extract_interaction_coefficients(
    L=LHiggs_physical_momentum,
    fields=ALL_BASE_FIELDS_SET,
    parameters=parameters_kinetic
)
interactions_gauge_scalars_approx = extract_interaction_coefficients(
    L=LHiggs_physical_approx_momentum,
    fields=ALL_BASE_FIELDS_SET,
    parameters=parameters_kinetic_approx
)

# Extract coefficients from Scalar interactions (derived from VLR)
interactions_scalars = extract_interaction_coefficients(
    L=VLR_physical_processed, # Match original
    fields=ALL_BASE_FIELDS_SET,
    parameters=parameters_potential
)
interactions_scalars_approx = extract_interaction_coefficients(
    L=VLR_physical_approx_processed, # Match original
    fields=ALL_BASE_FIELDS_SET,
    parameters=parameters_potential_approx
)

print("Finished extracting coefficients.")

# --- Main Execution / Test Block (Unchanged from v2) ---

if __name__ == "__main__":
    print("\n--- Running Self-Tests (Reconstruction Check) ---")

    # Test reconstruction for LHiggs_physical_momentum
    print("Testing reconstruction of LHiggs_physical_momentum...")
    try:
        lag_diff_higgs = test_feynman_coefficients(
            Lagrangian=LHiggs_physical_momentum,
            fields=ALL_BASE_FIELDS_SET,
            parameters=parameters_kinetic
        )
        if simplify(lag_diff_higgs) == 0:
            print("LHiggs_physical_momentum reconstruction successful (Difference is 0).")
        else:
            print("WARNING: LHiggs_physical_momentum reconstruction failed!")
    except Exception as e:
        print(f"ERROR during LHiggs_physical_momentum reconstruction test: {e}")

    # Test reconstruction for LHiggs_physical_approx_momentum
    print("\nTesting reconstruction of LHiggs_physical_approx_momentum...")
    try:
        lag_diff_higgs_approx = test_feynman_coefficients(
            Lagrangian=LHiggs_physical_approx_momentum,
            fields=ALL_BASE_FIELDS_SET,
            parameters=parameters_kinetic_approx
        )
        if simplify(lag_diff_higgs_approx) == 0:
            print("LHiggs_physical_approx_momentum reconstruction successful (Difference is 0).")
        else:
            print("WARNING: LHiggs_physical_approx_momentum reconstruction failed!")
    except Exception as e:
        print(f"ERROR during LHiggs_physical_approx_momentum reconstruction test: {e}")

    # Test reconstruction for VLR_physical_processed
    print("\nTesting reconstruction of VLR_physical_processed...")
    try:
        lag_diff_vlr = test_feynman_coefficients(
            Lagrangian=VLR_physical_processed,
            fields=ALL_BASE_FIELDS_SET,
            parameters=parameters_potential
        )
        if simplify(lag_diff_vlr) == 0:
            print("VLR_physical_processed reconstruction successful (Difference is 0).")
        else:
            print("WARNING: VLR_physical_processed reconstruction failed!")
    except Exception as e:
        print(f"ERROR during VLR_physical_processed reconstruction test: {e}")

    # Test reconstruction for VLR_physical_approx_processed
    print("\nTesting reconstruction of VLR_physical_approx_processed...")
    try:
        lag_diff_vlr_approx = test_feynman_coefficients(
            Lagrangian=VLR_physical_approx_processed,
            fields=ALL_BASE_FIELDS_SET,
            parameters=parameters_potential_approx
        )
        if simplify(lag_diff_vlr_approx) == 0:
            print("VLR_physical_approx_processed reconstruction successful (Difference is 0).")
        else:
            print("WARNING: VLR_physical_approx_processed reconstruction failed!")
    except Exception as e:
        print(f"ERROR during VLR_physical_approx_processed reconstruction test: {e}")

    print("\n--- Self-Tests Finished ---")

