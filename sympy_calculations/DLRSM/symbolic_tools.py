from sympy import diff, S, factorial, Mul, Function, I
from sympy.utilities.iterables import multiset_permutations
from sympy import derive_by_array

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

def find_feynman_coefficients(Lag, fields, parameters):
    expanded_L = Lag.expand()
    terms = expanded_L.as_ordered_terms()

    # Store interactions uniquely in a dictionary { field_set : coefficient }
    interactions = {1: {}, 2: {}, 3: {}, 4: {}}  # Using dict to sum repeated interactions

    for t in terms:
        # Extract fields from the term
        term_fields = {s for s in t.free_symbols if s in fields}
        
        # Count the number of fields in the term
        num_fields = len(term_fields)
        
        # Extract coefficient (remove fields from the term)
        if num_fields > 0:
            coefficient = t / Mul(*term_fields)  # Factor out fields
            if coefficient.free_symbols.issubset(parameters):  # Ensure only parameters in coefficient
                # Store as a tuple (sorted fields, coefficient)
                sorted_fields = tuple(sorted(term_fields, key=lambda x: str(x)))  # Sorting ensures uniqueness
                
                # If interaction already exists, sum the coefficient
                if sorted_fields in interactions[num_fields]:
                    interactions[num_fields][sorted_fields] += coefficient
                else:
                    interactions[num_fields][sorted_fields] = coefficient
    return interactions

def find_feynman_coefficients2(Lag, fields, parameters, D):
    expanded_L = Lag.expand()
    terms = expanded_L.as_ordered_terms()

    # Store interactions uniquely in a dictionary { field_set : coefficient }
    interactions = {1: {}, 2: {}, 3: {}, 4: {}}  # Using dict to sum repeated interactions

    for t in terms:
        # Extract derivative fields first
        derivative_fields = {dterm for dterm in t.atoms(D) if dterm.args and dterm.args[0] in fields}
        
        # Extract non-derivative fields, excluding those inside D()
        normal_fields = {s for s in t.free_symbols if s in fields and all(s != df.args[0] for df in derivative_fields)}

        # Merge them together
        term_fields = derivative_fields.union(normal_fields)

        # Count the number of fields in the term
        num_fields = len(term_fields)
        
        # Extract coefficient (remove fields from the term)
        if num_fields > 0:
            coefficient = t / Mul(*term_fields)  # Factor out fields
            if coefficient.free_symbols.issubset(parameters):  # Ensure only parameters in coefficient
                # Store as a tuple (sorted fields, coefficient)
                sorted_fields = tuple(sorted(term_fields, key=lambda x: str(x)))  # Sorting ensures uniqueness
                
                # If interaction already exists, sum the coefficient
                if sorted_fields in interactions[num_fields]:
                    interactions[num_fields][sorted_fields] += coefficient
                else:
                    interactions[num_fields][sorted_fields] = coefficient
    return interactions



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