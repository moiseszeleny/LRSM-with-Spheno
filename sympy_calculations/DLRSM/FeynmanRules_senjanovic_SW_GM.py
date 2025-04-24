# standard library imports (if any, keep here)
# e.g., import os

# third-party imports
from sympy import conjugate, Function, Symbol, Add, Mul # Assuming partial_mu/momentum might be Functions/Symbols
# Add other necessary sympy imports if needed, e.g. Add, Mul are usually implicit

# local application/library specific imports
print("Importing libraries of Lagrangian LHiggs and potential...")
from potential_senjanovic_HiggsDoublets import (
    vev_physical_charged_scalars,
    H10, H20, H30, H40, A10, A20, GZ1, GZ2,
    HLp, HLm, GLp, GLm, HRp, HRm, GRp, GRm,
    VLR_physical, VLR_physical_approx
)
# It's generally better to import the specific functions/classes needed
# from Gauge_Higgs_senjanovic_HiggsDoublets import change_neutral_bosons_R, change_charged_bosons # Assuming these are not used here
from Gauge_Higgs_senjanovic_HiggsDoublets import (
    W1p, W2p, W1m, W2m, A, Z1, Z2,
    partial_mu, # Assuming this is the derivative operator function/class
    LHiggs_physical, LHiggs_physical_approx
)
from symbolic_tools import (
    extract_interaction_coefficients,
    PartialMu, # Assuming this is an alias or definition used for partial_mu
    momentum, # Assuming this is the momentum function/class
    test_feynman_coefficients
)
print("Libraries imported.")

# --- Configuration & Field Definitions ---

# Define scalar fields based on imports
charged_scalar_fields = list(vev_physical_charged_scalars.keys())
neutral_scalar_fields = [H10, H20, H30, H40, A10, A20, GZ1, GZ2]
scalar_fields = charged_scalar_fields + neutral_scalar_fields

# Define gauge fields
gauge_fields = [W1p, W2p, W1m, W2m, A, Z1, Z2]

# Combine all physical fields relevant for interactions
physical_fields = set(scalar_fields + gauge_fields)

charge_physical_field = {
    field:0 for field in neutral_scalar_fields + [A, Z1, Z2]
}
charge_physical_field[W1m] = -1
charge_physical_field[W2m] = -1
charge_physical_field[W1p] = 1
charge_physical_field[W2p] = 1
charge_physical_field[HLm] = -1
charge_physical_field[HLp] = 1
charge_physical_field[GLm] = -1
charge_physical_field[GLp] = 1
charge_physical_field[HRm] = -1
charge_physical_field[HRp] = 1
charge_physical_field[GRm] = -1
charge_physical_field[GRp] = 1

# Define momentum symbols corresponding to scalar fields
# These will be treated as parameters in the interaction vertices
scalar_fields_momentum = [momentum(scalar) for scalar in scalar_fields]

# Alias for momentum function/class if needed (as in original code)
# If momentum is already the correct function/class, this alias might be redundant
partial_mu_momentum = momentum

# --- Helper Function for Derivative Application ---

def _apply_partial_mu_rules(expr):
    """
    Applies linearity and Leibniz rule to instances of partial_mu within an expression.

    This function expands the expression and then processes Add and Mul terms
    to ensure partial_mu is only applied directly to individual fields before
    it's replaced by momentum.

    Example:
        partial_mu(H1 + H2) -> partial_mu(H1) + partial_mu(H2)
        partial_mu(c * H1) -> c * partial_mu(H1) (where c is not a field)
        partial_mu(H1 * H2) -> partial_mu(H1)*H2 + H1*partial_mu(H2)

    Args:
        expr (sympy.Expr): The expression containing partial_mu terms.

    Returns:
        sympy.Expr: The expression with derivative rules applied.
    """
    # Define the fields that the derivative acts upon within this context
    # Note: Relying on global scope here. Passing fields as an argument would be cleaner.
    _fields_for_derivative = set(scalar_fields + gauge_fields)

    expr = expr.expand()
    if expr.is_Add:
        # Apply recursively to arguments of Add
        return expr.func(*(_apply_partial_mu_rules(arg) for arg in expr.args))

    elif expr.is_Mul:
        # Apply Leibniz rule
        factors = expr.as_ordered_factors()
        field_factors = [f for f in factors if f in _fields_for_derivative]
        coeff_factors = [f for f in factors if f not in _fields_for_derivative]

        if not field_factors: # No fields, derivative is zero (or handled by caller)
            # This case might need refinement depending on how partial_mu(constant) is defined.
            # Assuming partial_mu only appears applied to fields based on Lagrangian structure.
            # If partial_mu(non_field) can occur, handle it here (e.g., return 0).
            # For now, assume it only acts on fields listed in _fields_for_derivative.
            return expr # Return the constant product

        # Apply Leibniz rule: d(uvw) = (du)vw + u(dv)w + uv(dw)
        terms = []
        for i in range(len(field_factors)):
            # Create a copy of field factors for modification
            current_field_factors = list(field_factors)
            # Apply partial_mu to the i-th field factor
            current_field_factors[i] = partial_mu(current_field_factors[i])

            # Combine coefficient factors and the modified field factors
            # Use sympy.Mul to handle the multiplication
            term_factors = coeff_factors + current_field_factors
            terms.append(Mul(*term_factors))

        # Return the sum of terms from the Leibniz rule
        return Add(*terms)

    elif expr in _fields_for_derivative:
        # If the expression is a single field, apply partial_mu
        return partial_mu(expr)

    elif isinstance(expr, partial_mu):
        # If it's already a partial_mu(field) term, leave it as is for the next replacement step
        # This assumes partial_mu is applied correctly in the input Lagrangian
        # or generated by the Leibniz rule application above.
        return expr

    else:
        # If it's a constant or parameter, the derivative doesn't apply directly here
        # (assuming partial_mu acts like a functional derivative on fields)
        return expr


# --- Process Kinetic Lagrangian (LHiggs) ---

print("Processing Kinetic Lagrangian (LHiggs)...")
# Step 1: Apply linearity and Leibniz rules to partial_mu terms.
# This ensures partial_mu(field1 + field2) -> partial_mu(field1) + partial_mu(field2), etc.
# The .expand() helps ensure the rules are applied correctly to the structure.
LHiggs_physical_processed = LHiggs_physical.replace(
    lambda expr: isinstance(expr, partial_mu), # Target applications of partial_mu
    lambda expr: _apply_partial_mu_rules(expr.args[0]) # Apply rules to the argument
).expand()
# LHiggs_physical_processed = LHiggs_physical.expand() # Alternative: if LHiggs_physical is already expanded with partial_mu(field) terms only

# Step 2: Replace occurrences of partial_mu(field) with momentum(field).
# Assumes partial_mu and partial_mu_momentum (momentum) are sympy Function classes.
# The replace method can substitute Function applications.
LHiggs_physical_mom = LHiggs_physical_processed.replace(
    partial_mu, partial_mu_momentum
)
# LHiggs_physical_mom = LHiggs_physical_mom.doit() # Add .doit() if needed for specific evaluations

# Repeat for the approximate Lagrangian
LHiggs_physical_approx_processed = LHiggs_physical_approx.replace(
    lambda expr: isinstance(expr, partial_mu),
    lambda expr: _apply_partial_mu_rules(expr.args[0])
).expand()
# LHiggs_physical_approx_processed = LHiggs_physical_approx.expand() # Alternative

LHiggs_physical_approx_mom = LHiggs_physical_approx_processed.replace(
    partial_mu, partial_mu_momentum
)
# LHiggs_physical_approx_mom = LHiggs_physical_approx_mom.doit() # Add .doit() if needed

print("Kinetic Lagrangian processing complete.")

# --- Define Parameters for Interaction Extraction ---

# Parameters include model parameters (couplings, masses, VEVs) AND momentum symbols
# They are symbols in the Lagrangian that are NOT the physical fields themselves.
kinetic_symbols = LHiggs_physical_mom.free_symbols
parameters_kinetic = (kinetic_symbols - physical_fields) | set(scalar_fields_momentum)

# --- Extract Gauge-Scalar Interactions ---

print("Extracting Gauge-Scalar interactions...")
interactions_gauge_scalars = extract_interaction_coefficients(
    L=LHiggs_physical_mom,
    fields=physical_fields, # Use the set of physical fields
    parameters=parameters_kinetic
)
print(f"Found {len(interactions_gauge_scalars)} interaction terms in full LHiggs.")
for num_fields, terms in interactions_gauge_scalars.items():
    print(f"The number of interactions of {num_fields} fields is {len(terms)}")

interactions_gauge_scalars_approx = extract_interaction_coefficients(
    L=LHiggs_physical_approx_mom,
    fields=physical_fields, # Use the set of physical fields
    # Re-calculate parameters for the approximate Lagrangian if symbols differ significantly
    parameters=(LHiggs_physical_approx_mom.free_symbols - physical_fields) | set(scalar_fields_momentum)
)
print(f"Found {len(interactions_gauge_scalars_approx)} interaction terms in approximate LHiggs.")
for num_fields, terms in interactions_gauge_scalars_approx.items():
    print(f"The number of interactions of {num_fields} fields is {len(terms)}")



# --- Process Scalar Potential (VLR) ---

print("Processing Scalar Potential (VLR)...")
# Define mapping for complex conjugate fields
conjugate_scalar_map = {
    conjugate(HLp): HLm, conjugate(HLm): HLp,
    conjugate(GLp): GLm, conjugate(GLm): GLp,
    conjugate(HRp): HRm, conjugate(HRm): HRp,
    conjugate(GRp): GRm, conjugate(GRm): GRp,
    # Add conjugates for neutral fields if they are complex and conjugation matters
    # e.g., conjugate(H10): H10 if real
}
# Add identity mappings for fields that are their own conjugates (real fields)
for field in neutral_scalar_fields:
    if conjugate(field) not in conjugate_scalar_map:
        conjugate_scalar_map[conjugate(field)] = field


# Substitute conjugates and expand the potential
VLR_physical_processed = VLR_physical.subs(conjugate_scalar_map).expand()
VLR_physical_approx_processed = VLR_physical_approx.subs(conjugate_scalar_map).expand()

print("Scalar Potential processing complete.")

# --- Define Parameters for Potential ---
# Parameters are symbols in the potential that are not physical fields
# Momentum symbols are not typically relevant for the potential term itself.
parameters_potential = VLR_physical_processed.free_symbols - physical_fields
parameters_potential_approx = VLR_physical_approx_processed.free_symbols - physical_fields

# --- Extract Scalar Self-Interactions ---

print("Extracting Scalar self-interactions...")
interactions_scalars = extract_interaction_coefficients(
    L=-VLR_physical_processed, # Feynman rules come from -V
    fields=physical_fields,
    parameters=parameters_potential
)
print(f"Found {len(interactions_scalars)} interaction terms in full VLR.")
for num_fields, terms in interactions_scalars.items():
    print(f"The number of interactions of {num_fields} fields is {len(terms)}")

interactions_scalars_approx = extract_interaction_coefficients(
    L=-VLR_physical_approx_processed, # Feynman rules come from -V
    fields=physical_fields,
    parameters=parameters_potential_approx
)
print(f"Found {len(interactions_scalars_approx)} interaction terms in approximate VLR.")
for num_fields, terms in interactions_scalars_approx.items():
    print(f"The number of interactions of {num_fields} fields is {len(terms)}")



# --- Main Execution / Testing Block ---

if __name__ == "__main__":
    print("\n--- Running Tests ---")

    # Combine all parameters for the test
    # Note: test_feynman_coefficients might need specific parameter sets depending on its implementation
    all_parameters = parameters_kinetic | parameters_potential

    # Test reconstruction of the kinetic Lagrangian
    print("Testing Feynman coefficients for full LHiggs...")
    lag_diff = test_feynman_coefficients(
        Lagrangian=LHiggs_physical_mom,
        fields=physical_fields, # Pass the set of physical fields
        parameters=all_parameters # Pass combined parameters relevant to LHiggs
                                    # Or just parameters_kinetic if test function handles it
    )
    # Add check for lag_diff, e.g., assert lag_diff.simplify() == 0
    print(f"Difference for full LHiggs: {lag_diff.simplify()}")

    print("Testing Feynman coefficients for approximate LHiggs...")
    lag_diff_approx = test_feynman_coefficients(
        Lagrangian=LHiggs_physical_approx_mom,
        fields=physical_fields, # Pass the set of physical fields
        parameters=all_parameters # Or specific parameters for approx LHiggs
    )
    # Add check for lag_diff_approx
    print(f"Difference for approximate LHiggs: {lag_diff_approx.simplify()}")

    # Test reconstruction of the scalar potential
    # The test function needs to handle the minus sign convention for potential
    print("Testing Feynman coefficients for full VLR...")
    pot_diff = test_feynman_coefficients(
        Lagrangian=-VLR_physical_processed, # Test against -V
        fields=physical_fields,
        parameters=all_parameters # Or just parameters_potential
    )
    print(f"Difference for full VLR: {pot_diff.simplify()}")

    print("Testing Feynman coefficients for approximate VLR...")
    pot_diff_approx = test_feynman_coefficients(
        Lagrangian=-VLR_physical_approx_processed, # Test against -V
        fields=physical_fields,
        parameters=all_parameters # Or just parameters_potential_approx
    )
    print(f"Difference for approximate VLR: {pot_diff_approx.simplify()}")

    print("--- Tests Complete ---")

    # Optional: Save the extracted interactions to a file (e.g., JSON, Python dict)
    # import json
    # def sympy_to_str(obj):
    #     if isinstance(obj, (set, tuple)):
    #         return [str(item) for item in obj]
    #     return str(obj) # Basic string conversion for other sympy objects

    # with open("interactions_gauge_scalars.json", "w") as f:
    #     json.dump(interactions_gauge_scalars, f, default=sympy_to_str, indent=2)
    # print("Saved gauge-scalar interactions to interactions_gauge_scalars.json")
    # # Repeat for other interaction dictionaries...

