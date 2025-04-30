from sympy import diff, S, factorial, Mul, Function, I, Symbol, expand, Pow, cancel
from sympy.utilities.iterables import multiset_permutations
from sympy import derive_by_array

from sympy import Basic, Add



momentum = Function('p')  # Function representing the momentum
class PartialMu(Function):
    """Custom function to emulate the differential operator ∂_μ."""
    
    @classmethod
    def eval(cls, arg):
        """Define any automatic simplifications (if needed)."""
        return None  # We let doit() handle the simplifications

    def doit(self, **hints):
        """Simplify the action of ∂_μ."""
        field = self.args[0]  # The field being differentiated
        
        # Apply the rule: ∂_μ(G^+) = i p(G^+) G^+
        return I * momentum(field) * field

def extract_interaction_coefficients(L, fields, parameters):
    """
    Extracts interaction coefficients from a Lagrangian.

    Args:
        L (sympy expression): The Lagrangian containing fields and parameters.
        fields (iterable): A list or set of sympy symbols representing the fields.
        parameters (set): A set of sympy symbols and functions representing parameters.

    Returns:
        dict: A nested dictionary with:
            - Outer key: Number of interacting fields.
            - Inner key: Tuple of interacting fields (sorted).
            - Value: Coefficient of the interaction term.
    """
    # Ensure fields is a set of valid SymPy objects
    fields = {f for f in fields if isinstance(f, Symbol)}
    
    # Expand the Lagrangian
    L_expanded = expand(L)

    # Initialize the classification dictionary
    interaction_dict = {}

    # Iterate over each term in the expanded Lagrangian
    for term in L_expanded.as_ordered_terms():
        detected_fields = []
        
        for f in fields:
            if f in term.free_symbols:
                exponent = 1
                for subterm in term.as_ordered_factors():
                    if isinstance(subterm, Pow) and subterm.base == f:
                        exponent = subterm.exp
                detected_fields.extend([f] * exponent)  # Count each appearance

        term_fields = tuple(sorted(detected_fields, key=lambda x: str(x)))
        num_fields = len(term_fields)

        # Extract the coefficient by dividing the term by the product of detected fields
        field_product = Mul(*term_fields) if term_fields else 1  # Avoid empty product
        coefficient = cancel(term / field_product)  # Ensure full cancellation

        # Ensure all fields are completely removed
        #coefficient = coefficient.subs({f: 1 for f in term_fields})

        # Store in dictionary
        if num_fields not in interaction_dict:
            interaction_dict[num_fields] = {}

        # Sum coefficients correctly for repeated field interactions
        if term_fields in interaction_dict[num_fields]:
            interaction_dict[num_fields][term_fields] += coefficient
        else:
            interaction_dict[num_fields][term_fields] = coefficient

    return interaction_dict

def test_feynman_coefficients(Lagrangian, fields, parameters):
    """ Test the Feynman coefficient extraction function by reconstructing the Lagrangian. """
    
    # Extract interactions
    interactions = extract_interaction_coefficients(Lagrangian, fields, parameters)
    
    # Reconstruct the Lagrangian from interactions
    reconstructed_Lagrangian = sum(
        coeff * Mul(*fields)
        for num_fields, terms in interactions.items()
        for fields, coeff in terms.items()
    )

    # Expand both the original and reconstructed Lagrangians
    expanded_original = Lagrangian.expand()
    expanded_reconstructed = reconstructed_Lagrangian

    print("\n--- Original Lagrangian ---")
    print(expanded_original)

    print("\n--- Reconstructed Lagrangian ---")
    print(expanded_reconstructed)

    # Check if they are equal
    diff = (expanded_original - expanded_reconstructed).expand().factor()
    if diff == 0 or diff.free_symbols.intersection(fields) == set():
        print("\n Test Passed: The reconstructed Lagrangian matches the original!")
    else:
        print("\n Test Failed: The reconstructed Lagrangian does NOT match the original.")

    return diff

def invert_dict(dictionary):
    """Invert a dictionary, swapping keys and values."""
    inverted_dict = {}
    for key, value in dictionary.items():
        inverted_dict[value] = key
    return inverted_dict

def build_mass_matrix(potential, fields1, fields2):
    """
    Build the mass matrix for a given potential and fields.
    """
    # Initialize the mass matrix
    Matrix_elements = derive_by_array(derive_by_array(potential, fields1), fields2)

    return Matrix_elements.tomatrix()

def multivariable_taylor(func, vars, point, order=2):
    """
    Compute the multivariable Taylor expansion of func at a given point.
    
    Parameters:
    - func: SymPy expression to expand
    - vars: List of variables (symbols) [x, y, ...]
    - point: List of expansion points [x0, y0, ...]
    - order: Order of expansion (default is 2)
    
    Returns:
    - Taylor expansion as a SymPy expression
    """
    if len(vars) != len(point):
        raise ValueError("The length of 'vars' must match the length of 'point'.")
    if not isinstance(order, int) or order <= 0:
        raise ValueError("'order' must be a positive integer.")
    
    expansion = func.subs(dict(zip(vars, point)))  # f(x0, y0, ...)
    
    # First-order terms
    for i, var in enumerate(vars):
        first_derivative = diff(func, var).subs(dict(zip(vars, point)))  # ∂f/∂x_i |_(x0, y0, ...)
        expansion += first_derivative * (var - point[i])

    # Higher-order terms
    for current_order in range(2, order + 1):
        # Iterate over all partial derivatives of the current order
        for derivative_vars in multiset_permutations(vars * current_order):
            partial_derivative = diff(func, *derivative_vars).subs(dict(zip(vars, point)))
            term = partial_derivative
            for var in derivative_vars:
                term *= (var - point[vars.index(var)])
            expansion += term / factorial(current_order)

    return expansion

from sympy.utilities.iterables import combinations_with_replacement

def multivariable_taylor_optimized(func, vars, point, order=2):
    """
    Compute the multivariable Taylor expansion of func at a given point.
    
    Parameters:
    - func: SymPy expression to expand
    - vars: List of variables (symbols) [x, y, ...]
    - point: List of expansion points [x0, y0, ...]
    - order: Order of expansion (default is 2)
    
    Returns:
    - Taylor expansion as a SymPy expression
    """
    if len(vars) != len(point):
        raise ValueError("The length of 'vars' must match the length of 'point'.")
    if not isinstance(order, int) or order <= 0:
        raise ValueError("'order' must be a positive integer.")
    
    # Precompute the substitution dictionary
    point_dict = dict(zip(vars, point))
    expansion = func.subs(point_dict)  # f(x0, y0, ...)

    # First-order terms
    for i, var in enumerate(vars):
        first_derivative = diff(func, var).subs(point_dict)  # ∂f/∂x_i |_(x0, y0, ...)
        expansion += first_derivative * (var - point[i])

    # Higher-order terms
    for current_order in range(2, order + 1):
        # Generate all combinations of variables for the current order
        for derivative_vars in combinations_with_replacement(vars, current_order):
            # Compute the partial derivative
            partial_derivative = diff(func, *derivative_vars).subs(point_dict)
            
            # Construct the term
            term = partial_derivative
            for var in derivative_vars:
                term *= (var - point[vars.index(var)])
            
            # Add the term divided by the factorial of the order
            expansion += term / factorial(current_order)

    return expansion

from sympy import simplify, latex

def generate_latex_table_feynman_rules(interactions):
    """
    Generates a LaTeX table for Feynman interaction terms and their coefficients.

    Parameters:
    interactions (dict): The dictionary output from find_feynman_coefficients.

    Returns:
    str: A LaTeX formatted table.
    """
    # LaTeX table header
    table = r"\begin{array}{|c|c|c|}" + "\n"
    table += r"\hline" + "\n"
    table += r"\textbf{Interaction} & \textbf{Coefficient} & \textbf{Simplified} \\" + "\n"
    table += r"\hline" + "\n"

    # Loop through interactions
    for num_fields in sorted(interactions.keys()):
        for fields, coefficient in interactions[num_fields].items():
            interaction_str = " ".join([latex(f) for f in fields])  # Convert fields to LaTeX
            coeff_str = latex(coefficient)  # Raw coefficient in LaTeX
            simplified_coeff_str = latex(simplify(coefficient))  # Simplified coefficient in LaTeX
            
            # Add row to the table
            table += f"${interaction_str}$ & ${coeff_str}$ & ${simplified_coeff_str}$ \\\\ \n"
            table += r"\hline" + "\n"

    # LaTeX table footer
    table += r"\end{array}"

    return table

def generate_latex_table_dict(interactions, simplification_coeff=None, simplification_approx=None):
    """
    Generates a LaTeX table for Feynman interaction terms and their coefficients.

    Parameters:
    interactions (dict): The dictionary output from find_feynman_coefficients.

    Returns:
    str: A LaTeX formatted table.
    """
    # LaTeX table header
    table = r"\begin{array}{|c|c|c|}" + "\n"
    table += r"\hline" + "\n"
    table += r"\textbf{Interaction} & \textbf{Coefficient} & \textbf{Simplified} \\" + "\n"
    table += r"\hline" + "\n"

    # Loop through interactions
    for fields, coefficient in interactions.items():
        interaction_str = " ".join([latex(f) for f in fields])  # Convert fields to LaTeX
        if simplification_coeff == None:
            coeff_str = latex(coefficient)  # Raw coefficient in LaTeX
        else:
            coeff_str = latex(simplification_coeff(coefficient))  # simplified coefficient in LaTeX
        if simplification_approx == None:
            simplified_coeff_str = latex(simplify(coefficient))  # Simplified coefficient in LaTeX
        else:
            simplified_coeff_str = latex(simplification_approx(coefficient))  # Simplified coefficient in LaTeX
        
        # Add row to the table
        table += f"${interaction_str}$ & ${coeff_str}$ & ${simplified_coeff_str}$ \\\\ \n"
        table += r"\hline" + "\n"

    # LaTeX table footer
    table += r"\end{array}"

    return table

def generate_latex_table_dict_2col(interactions, simplification_coeff=None):
    """
    Generates a LaTeX table for Feynman interaction terms and their coefficients.

    Parameters:
    interactions (dict): The dictionary output from find_feynman_coefficients.

    Returns:
    str: A LaTeX formatted table.
    """
    # LaTeX table header
    table = r"\begin{array}{|c|c|}" + "\n"
    table += r"\hline" + "\n"
    table += r"\textbf{Interaction} & \textbf{Coefficient} \\" + "\n"
    table += r"\hline" + "\n"

    # Loop through interactions
    for fields, coefficient in interactions.items():
        interaction_str = " ".join([latex(f) for f in fields])  # Convert fields to LaTeX
        if simplification_coeff == None:
            coeff_str = latex(coefficient)  # Raw coefficient in LaTeX
        else:
            coeff_str = latex(simplification_coeff(coefficient))  # simplified coefficient in LaTeX
        
        # Add row to the table
        table += f"${interaction_str}$ & ${coeff_str}$ \\\\ \n"
        table += r"\hline" + "\n"

    # LaTeX table footer
    table += r"\end{array}"

    return table

class ChiralProjector(Basic):
    """
    Custom SymPy object to represent chiral projectors P_L and P_R.
    Automatically enforces algebraic properties.
    """
    def __new__(cls, name):
        obj = super().__new__(cls, name)
        obj.name = name
        return obj

    def __mul__(self, other):
        # Idempotency: P_L * P_L = P_L, P_R * P_R = P_R
        if self == other:
            return self

        # Mutual exclusivity: P_L * P_R = P_R * P_L = 0
        if {self, other} == {PL, PR}:  # Ensures we check only P_L * P_R cases
            return S.Zero
        
        # Multiplication with other SymPy objects
        if not isinstance(other, ChiralProjector):
            return self*other

        # Default multiplication behavior (return product)
        return Mul(self, other)
    
    def __rmul__(self, other):
        # Handle right multiplication
        if not isinstance(other, ChiralProjector):
            return other*self  # Return as a symbolic Mul

        return Mul(other, self)  # Default case for ChiralProjector

    def __add__(self, other):
        # Completeness relation: P_L + P_R = 1
        if {self, other} == {PL, PR}:  # Ensures we check only P_L + P_R cases
            return S.One

        # Default addition behavior (return sum)
        return Add(self, other)

    #def __repr__(self):
    #    return self.name

    def _latex(self, printer=None):
        if self == PL:
            return r'P_L'
        elif self == PR:
            return r'P_R'
        else:
            return super()._latex()
    
# Create instances for P_L and P_R
PL = ChiralProjector("P_L")
PR = ChiralProjector("P_R")