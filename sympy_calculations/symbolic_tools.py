from sympy import diff, S, factorial
from sympy.utilities.iterables import multiset_permutations

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

