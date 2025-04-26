# dirac.py

# Import necessary SymPy components, including sympify (or S) and I for the example
from sympy import (
    Basic, Add, Mul, Symbol, latex, symbols, Function, 
    KroneckerDelta, S, Idx, sympify, I, Expr, Pow, preorder_traversal,
    Integer, expand
)
# from sympy.printing.precedence import precedence, PRECEDENCE
from sympy.printing.latex import LatexPrinter


# --- Import or define momentum for the example usage ---
# If symbolic_tools.py is in the same directory or accessible via PYTHONPATH:
try:
    from symbolic_tools import momentum
except ImportError:
    momentum = Function('p_placeholder') 
# --- End momentum import/definition ---

# It might be useful to have a representation for the Minkowski metric
# Using a Function for now, but a dedicated class could be better.
MetricTensor = Function('MetricTensor') 

# Define default Minkowski metric components (using +--- convention)
# This is primarily for potential future use in simplification rules, 
# not strictly necessary for the class definition itself.
#def minkowski_metric(idx1, idx2):
    # Ensure indices are SymPy Integers if they are numeric
#    idx1_s = sympify(idx1)
#    idx2_s = sympify(idx2)
    
#    if isinstance(idx1_s, Integer) and isinstance(idx2_s, Integer):
#        if idx1_s == idx2_s:
#            if idx1_s == 0: # Assuming 0 is the time index
#                return S.One
#            elif idx1_s in (1, 2, 3): # Assuming 1,2,3 are space indices
#                return -S.One
#            else: 
                # Undefined index, return symbolic? Or raise error?
                # Returning symbolic g(idx1, idx2) is safer
#                return MetricTensor(idx1, idx2) 
#        else:
#            return S.Zero
#    else:
        # If indices are symbolic, return the symbolic metric tensor
        # Implement KroneckerDelta for g(mu, mu) case? Maybe later.
#        if idx1 == idx2:
            # Represent g^{mu mu} (no sum) symbolically
            # This is tricky without knowing the dimension or specific index.
            # Let's return MetricTensor(idx1, idx1) for now.
            # A better approach might involve assuming 4D and using properties.
#            return MetricTensor(idx1, idx1) # Symbolic g^{mu mu}
#        return MetricTensor(idx1, idx2)

def minkowski_metric(idx1, idx2, convention='+---'):
    """
    Returns the Minkowski metric tensor component g^{idx1 idx2} or g_{idx1 idx2}.

    Handles both concrete integer indices (0, 1, 2, 3) and symbolic indices.
    For symbolic indices, it returns an expression involving KroneckerDelta,
    assuming a 4-dimensional spacetime where index 0 is time-like.

    Args:
        idx1: The first Lorentz index (Symbol, Integer, Idx, etc.).
        idx2: The second Lorentz index (Symbol, Integer, Idx, etc.).
        convention (str): The metric signature convention.
                            '+---' (default): diag(1, -1, -1, -1)
                            '-+++': diag(-1, 1, 1, 1)

    Returns:
        A SymPy expression representing the metric component (S.One, -S.One, S.Zero,
        or a KroneckerDelta expression).

    Examples:
        >>> mu, nu = symbols('mu nu')
        >>> minkowski_metric(0, 0)
        1
        >>> minkowski_metric(1, 1)
        -1
        >>> minkowski_metric(0, 1)
        0
        >>> minkowski_metric(mu, nu)
        KroneckerDelta(mu, nu)*(2*KroneckerDelta(mu, 0) - 1)
        >>> minkowski_metric(mu, mu) # Handles symbolic equality
        2*KroneckerDelta(mu, 0) - 1
        >>> minkowski_metric(mu, nu, convention='-+++')
        KroneckerDelta(mu, nu)*(1 - 2*KroneckerDelta(mu, 0))
        >>> minkowski_metric(mu, mu, convention='-+++')
        1 - 2*KroneckerDelta(mu, 0)
    """
    idx1_s = sympify(idx1)
    idx2_s = sympify(idx2)

    # Determine sign based on convention
    time_sign = S.One if convention == '+---' else -S.One
    space_sign = -S.One if convention == '+---' else S.One

    # --- Handle Concrete Integer Indices ---
    # Check if *both* indices are explicitly Integers
    if isinstance(idx1_s, Integer) and isinstance(idx2_s, Integer):
        if idx1_s == idx2_s:
            if idx1_s == 0:
                return time_sign
            elif idx1_s in (1, 2, 3):
                return space_sign
            else:
                # Index out of range (0,1,2,3) for standard Minkowski.
                # The symbolic formula below correctly yields 0 via KroneckerDelta
                # if the indices are different, or a symbolic term otherwise.
                # Let's fall through to the symbolic formula for consistency.
                pass # Fall through to symbolic case
        else:
            # Off-diagonal elements are always zero for integer indices
            return S.Zero

    # --- Handle Symbolic Indices (or mixed integer/symbolic, or out-of-range integers) ---
    # The general formula using KroneckerDelta is:
    # g^{mu nu} = delta(mu, nu) * diag_value(mu)
    # where diag_value(mu) is the value when mu == nu.
    # diag_value(mu) = time_sign if mu=0, space_sign otherwise (for mu=1,2,3).
    # We can express this using KroneckerDelta(mu, 0):
    # diag_value(mu) = time_sign * delta(mu, 0) + space_sign * (1 - delta(mu, 0))
    #
    # Let's simplify this based on the convention:
    if convention == '+---':
        # diag = 1 * delta(mu, 0) + (-1) * (1 - delta(mu, 0))
        #      = delta(mu, 0) - 1 + delta(mu, 0)
        #      = 2 * delta(mu, 0) - 1
        diag_symbolic = 2 * KroneckerDelta(idx1_s, 0) - 1
    elif convention == '-+++':
        # diag = (-1) * delta(mu, 0) + 1 * (1 - delta(mu, 0))
        #      = -delta(mu, 0) + 1 - delta(mu, 0)
        #      = 1 - 2 * delta(mu, 0)
        diag_symbolic = 1 - 2 * KroneckerDelta(idx1_s, 0)
    else:
        raise ValueError("Unsupported metric convention. Use '+---' or '-+++'.")

    # The full metric tensor component using KroneckerDelta
    # Note: We use idx1_s in the diagonal part as it only matters when idx1_s == idx2_s.
    # SymPy's KroneckerDelta(idx1, idx2) correctly handles cases where indices
    # might be symbols or integers.
    symbolic_metric = KroneckerDelta(idx1_s, idx2_s) * diag_symbolic

    # If the input indices were symbolically identical (e.g., minkowski_metric(mu, mu)),
    # SymPy might simplify KroneckerDelta(mu, mu) to 1 if assumptions allow,
    # but it's safer and clearer to return the diagonal part directly in this case.
    # The equality check `idx1_s == idx2_s` works for identical symbols.
    if idx1_s == idx2_s:
        return diag_symbolic
    else:
        # If idx1_s and idx2_s are different symbols or expressions,
        # KroneckerDelta(idx1_s, idx2_s) remains, correctly evaluating to 0
        # if they are substituted with different values later.
        return symbolic_metric

# --- Custom LaTeX Printer ---
class DiracLatexPrinter(LatexPrinter):
    def _print_Pow(self, expr, rational=False):
        """Custom Pow printer for DiracGamma objects."""
        base = expr.base
        exp = expr.exp

        # Check if the base is one of our custom Dirac classes
        if isinstance(base, (DiracGamma, DiracGammaLower)):
            # Manually add parentheses
            base_str = self.doprint(base)
            exp_str = self.doprint(exp)
            # Handle negative exponents for fractions if needed
            if exp.is_Rational and exp.p < 0:
                # Use default printing for the positive power in denominator
                return rf"\frac{{1}}{{{self._print_Pow(base**(-exp), rational)}}}"
            elif exp == -1:
                return rf"\frac{{1}}{{{base_str}}}"
            else:
                # Force parentheses for positive powers
                return rf"({base_str})^{{{exp_str}}}"
        else:
            # For all other bases, use the default printer logic
            return super()._print_Pow(expr, rational=rational)
        
dirac_printer = DiracLatexPrinter()

class DiracGamma(Expr):
    """
    Custom SymPy object representing a Dirac gamma matrix gamma^mu.

    Represents the symbolic object gamma^mu where mu is a Lorentz index.
    It does not automatically implement the full Clifford algebra 
    {gamma^mu, gamma^nu} = 2 * g^{mu nu} * I within the multiplication methods 
    by default, as this can be complex and context-dependent. 
    Such simplifications should typically be handled by dedicated functions.
    """
    # Use __slots__ for memory efficiency if many instances are created
    # __slots__ = ['index'] 

    is_commutative = False # Gamma matrices generally don't commute

    def __new__(cls, index):
        """
        Creates a new DiracGamma instance.

        Args:
            index: A SymPy Symbol, Idx, integer, or other object that can be
                sympified into a suitable index representation.
        """
        # Use sympy.sympify (or S) to convert the input to a SymPy object
        index = sympify(index) 
        # Optional: Add validation if needed, e.g., check if index is Symbol, Idx, Integer...
        # from sympy import Integer # If checking for Integer
        # if not isinstance(index, (Symbol, Idx, Integer)):
        #     raise TypeError(f"DiracGamma index must sympify to Symbol, Idx, or Integer, got {type(index)}")
            
        obj = super().__new__(cls, index)
        # The index is stored in obj.args[0] by Basic.__new__
        return obj

    @property
    def index(self):
        """Returns the Lorentz index of the gamma matrix."""
        return self.args[0]

    def __pow__(self, exponent):
        """Handles powers, e.g., (gamma^mu)^2."""
        # Basic implementation: return Pow(self, exponent)
        # More advanced: Could implement (gamma^mu)^2 = g^{mu mu} * I (no sum)
        # For now, keep it symbolic.
        exponent = sympify(exponent) # Ensure exponent is a SymPy object
        if exponent.is_Integer and exponent == 2:
            # Placeholder for g^{mu mu} * I. Requires metric and identity representation.
            # For simplicity, return symbolic Pow for now.
            # Or, if index is concrete (0, 1, 2, 3), return +1 or -1.
            pass # Fall through to default Pow behavior
        # Use Basic's __pow__ which correctly returns Pow(self, exponent)
        return super().__pow__(exponent)


    # --- Representation Methods ---

    def __repr__(self):
        """Machine-readable representation."""
        return f"DiracGamma({repr(self.index)})"

    def _sympystr(self, printer):
        """String representation for SymPy."""
        # Use printer.doprint to correctly handle nested printing
        return f"gamma({printer.doprint(self.index)})"
        
    def _latex(self, printer): # Note: removed printer=None default, it's always passed
        """LaTeX representation."""
        # Use the *provided* printer object to format the index
        index_latex = printer.doprint(self.index) 
        # Format as \gamma^{index}
        return rf"\gamma^{{{index_latex}}}"
    
        
# --- Dirac Gamma Lower Index Class ---
class DiracGammaLower(Expr):
    """Represents gamma_mu (gamma matrix with a lower index)."""
    is_commutative = False
    # __slots__ = ['index'] # Optional for memory

    def __new__(cls, index):
        index = sympify(index)
        # Could add validation: isinstance(index, (Symbol, Idx, Integer))
        return super().__new__(cls, index)

    @property
    def index(self):
        return self.args[0]
    
    # We might need a __pow__ method if we expect gamma_mu * gamma^mu etc.
    # For now, keep it simple.

    def __repr__(self):
        return f"DiracGammaLower({repr(self.index)})"

    def _sympystr(self, printer):
        # Using gamma_ for lower index representation
        return f"gamma_({printer.doprint(self.index)})" 
        
    def _latex(self, printer): 
        index_latex = printer.doprint(self.index) 
        # Format as \gamma_{index}
        return rf"\gamma_{{{index_latex}}}"
    

# --- Dirac Identity Matrix Class ---
class DiracIdentity(Expr):
    """Represents the 4x4 Identity matrix in Dirac space."""
    is_commutative = True # Identity commutes with everything
    is_Identity = True # Custom flag
    # __slots__ = [] # No arguments

    def __new__(cls):
        # Singleton pattern: Always return the same instance
        if not hasattr(cls, '_instance'):
            cls._instance = super().__new__(cls)
        return cls._instance

    # Define multiplication behavior
    def __mul__(self, other):
        if isinstance(other, (DiracGamma, DiracGammaLower)):
            return other # I * X = X
        else:
            return super().__mul__(other) # X * I 

    def __rmul__(self, other):
        if isinstance(other, (DiracGamma, DiracGammaLower)):
            return other # I * X = X
        else:
            return super().__mul__(other) # X * I
        
    # Define addition behavior (optional, Expr handles basics)
    def __add__(self, other):
        if other == DiracZero(): return self # I + 0 = I
        if other == self: return 2*self # I + I = 2*I
        return super().__add__(other) # Let Expr handle I + X

    def __repr__(self):
        return "DiracIdentity()"

    def _sympystr(self, printer):
        return "DiracI"
        
    def _latex(self, printer): 
        # return r"\mathbb{I}_4" # Requires amssymb package in LaTeX
        return r"I_{4}" # Simpler LaTeX
    


# --- Dirac Zero Matrix Class ---
class DiracZero(Expr):
    """Represents the 4x4 Zero matrix in Dirac space."""
    is_commutative = True
    is_Zero = True # Custom flag
    # __slots__ = []

    def __new__(cls):
        # Singleton pattern
        if not hasattr(cls, '_instance'):
            cls._instance = super().__new__(cls)
        return cls._instance

    # Define multiplication behavior
    def __mul__(self, other):
        return self # 0 * X = 0

    def __rmul__(self, other):
        return self # X * 0 = 0

    # Define addition behavior
    def __add__(self, other):
        if isinstance(other, (DiracGamma, DiracGammaLower)):
            return other # 0 + X = X
        else:
            raise NotImplementedError(
                f"Dirac0 lives in the Dirac space, the sum {self} + {other} is not defined"
            )
        
    def __radd__(self, other):
        return other # X + 0 = X

    def __repr__(self):
        return "DiracZero()"

    def _sympystr(self, printer):
        return "Dirac0"
        
    def _latex(self, printer): 
        # return r"\mathbf{0}_4" 
        return r"0_{4}"
    


# --- Create Singleton Instances ---
diracI = DiracIdentity()
dirac0 = DiracZero()

# Forward declare the instances, actual creation after class definitions
diracPR = None
diracPL = None

# --- Dirac Chiral Projector Classes ---

class PR(Expr):
    """
    Represents the Right-Handed Chiral Projector P_R = (1 + gamma^5) / 2.

    Implements basic algebraic properties directly via operator overloading:
    P_R^2 = P_R, P_R P_L = 0, P_R + P_L = I_4, I*P_R=P_R, 0*P_R=0.
    More complex rules involving gamma matrices (e.g., P_R gamma^mu)
    are NOT handled here and require external simplification functions.
    """
    is_commutative = False
    is_projector = True
    # __slots__ = []

    def __new__(cls):
        # Singleton pattern
        if not hasattr(cls, '_instance'):
            cls._instance = super().__new__(cls)
        return cls._instance

    # --- Multiplication ---
    def __mul__(self, other):
        other = sympify(other, strict=True) # Ensure other is a SymPy object
        if other == diracPR: return diracPR  # PR * PR = PR
        if other == diracPL: return dirac0   # PR * PL = 0
        if other == diracI: return diracPR   # PR * I = PR
        if other == dirac0: return dirac0   # PR * 0 = 0
        # Let SymPy handle scalar multiplication (e.g., 2 * PR)
        # and multiplication by other non-simplifying objects (e.g., PR * gamma_mu)
        return super().__mul__(other)

    def __rmul__(self, other):
        other = sympify(other, strict=True)
        # Note: PR * PR handled by __mul__
        if other == diracPL: return dirac0   # PL * PR = 0
        if other == diracI: return diracPR   # I * PR = PR
        if other == dirac0: return dirac0   # 0 * PR = 0
        # Let SymPy handle scalar multiplication (e.g., PR * 2)
        # and multiplication by other non-simplifying objects (e.g., gamma_mu * PR)
        return super().__rmul__(other)

    # --- Addition ---
    def __add__(self, other):
        other = sympify(other, strict=True)
        if other == diracPL: return diracI   # PR + PL = I
        if other == dirac0: return diracPR   # PR + 0 = PR
        if other == diracPR: return 2 * diracPR # PR + PR = 2*PR (standard Expr behavior)
        # Let SymPy handle other additions (e.g., PR + gamma_mu)
        return super().__add__(other)

    def __radd__(self, other):
        other = sympify(other, strict=True)
        if other == diracPL: return diracI   # PL + PR = I
        if other == dirac0: return diracPR   # 0 + PR = PR
        # Note: PR + PR handled by __add__
        # Let SymPy handle other additions (e.g., gamma_mu + PR)
        return super().__radd__(other)

    def __repr__(self):
        return "PR()"

    def _sympystr(self, printer):
        return "PR"

    def _latex(self, printer):
        return r"P_R"


class PL(Expr):
    """
    Represents the Left-Handed Chiral Projector P_L = (1 - gamma^5) / 2.

    Implements basic algebraic properties directly via operator overloading:
    P_L^2 = P_L, P_L P_R = 0, P_L + P_R = I_4, I*P_L=P_L, 0*P_L=0.
    More complex rules involving gamma matrices (e.g., P_L gamma^mu)
    are NOT handled here and require external simplification functions.
    """
    is_commutative = False
    is_projector = True
    # __slots__ = []

    def __new__(cls):
        # Singleton pattern
        if not hasattr(cls, '_instance'):
            cls._instance = super().__new__(cls)
        return cls._instance

    # --- Multiplication ---
    def __mul__(self, other):
        other = sympify(other, strict=True)
        if other == diracPL: return diracPL  # PL * PL = PL
        if other == diracPR: return dirac0   # PL * PR = 0
        if other == diracI: return diracPL   # PL * I = PL
        if other == dirac0: return dirac0   # PL * 0 = 0
        return super().__mul__(other)

    def __rmul__(self, other):
        other = sympify(other, strict=True)
        # Note: PL * PL handled by __mul__
        if other == diracPR: return dirac0   # PR * PL = 0
        if other == diracI: return diracPL   # I * PL = PL
        if other == dirac0: return dirac0   # 0 * PL = 0
        return super().__rmul__(other)

    # --- Addition ---
    def __add__(self, other):
        other = sympify(other, strict=True)
        if other == diracPR: return diracI   # PL + PR = I
        if other == dirac0: return diracPL   # PL + 0 = PL
        if other == diracPL: return 2 * diracPL # PL + PL = 2*PL
        return super().__add__(other)

    def __radd__(self, other):
        other = sympify(other, strict=True)
        if other == diracPR: return diracI   # PR + PL = I
        if other == dirac0: return diracPL   # 0 + PL = PL
        # Note: PL + PL handled by __add__
        return super().__radd__(other)

    def __repr__(self):
        return "PL()"

    def _sympystr(self, printer):
        return "PL"

    def _latex(self, printer):
        return r"P_L"

diracPR = PR() # Instantiate Right Projector
diracPL = PL() # Instantiate Left Projector

# --- Clifford Algebra Simplification Function ---

def gamma_simplify(expr, metric_func=minkowski_metric, identity=diracI, zero=dirac0):
    """
    Applies Clifford algebra rules {gamma^mu, gamma^nu} = 2*g^{mu nu}*I_4,
    metric contraction g_munu * gamma^nu = gamma_mu,
    and identity/zero matrix rules to a SymPy expression, enforcing
    canonical ordering to prevent infinite loops.

    Args:
        expr: The SymPy expression to simplify.
        metric_func: A function(idx1, idx2) returning the metric tensor g^{idx1 idx2}.
        identity: The identity matrix object.
        zero: The zero matrix object.

    Returns:
        Simplified SymPy expression.
    """
    
    # Expand initially
    current_expr = expand(expr)

    # Apply rules iteratively until no further changes occur in a full pass
    while True:
        simplified_expr_prev_iter = current_expr
        
        # --- Apply identity and zero rules first ---
        new_expr = current_expr
        # (Keep the existing identity/zero replacement logic here)
        new_expr = new_expr.replace(lambda x: isinstance(x, Mul) and identity in x.args, 
                                    lambda x: Mul(*[arg for arg in x.args if arg != identity]))
        new_expr = new_expr.replace(lambda x: isinstance(x, Mul) and zero in x.args, 
                                    lambda x: zero)
        new_expr = new_expr.replace(lambda x: isinstance(x, Add) and zero in x.args, 
                                    lambda x: Add(*[arg for arg in x.args if arg != zero]))
        new_expr = new_expr.replace(identity * identity, identity)
        new_expr = new_expr.replace(zero * zero, zero)
        new_expr = new_expr.replace(identity * zero, zero)
        new_expr = new_expr.replace(zero * identity, zero)
        
        current_expr = new_expr # Update after basic simplifications

        # --- Apply Metric Contraction g_munu * gamma^nu = gamma_mu ---
        # We'll do this by iterating through Mul terms and looking for the pattern
        contraction_replacements = {}
        for term in preorder_traversal(current_expr):
            if term in contraction_replacements: # Avoid re-processing
                continue
                
            if isinstance(term, Mul):
                args = list(term.args)
                metric_indices = [] # Store indices of MetricTensor args
                gamma_indices = []  # Store indices of DiracGamma args
                
                # Find all metric tensors and gamma matrices in the product
                for i, arg in enumerate(args):
                    if isinstance(arg, MetricTensor):
                        metric_indices.append(i)
                    elif isinstance(arg, DiracGamma):
                        gamma_indices.append(i)
                
                contracted_metric_idx = -1
                contracted_gamma_idx = -1
                new_gamma_lower = None
                
                # Try to find a pair to contract
                for m_idx_pos in metric_indices:
                    metric_arg = args[m_idx_pos]
                    # Ensure metric has 2 arguments (indices)
                    if len(metric_arg.args) != 2: continue 
                    metric_idx1, metric_idx2 = metric_arg.args
                    
                    for g_idx_pos in gamma_indices:
                        gamma_arg = args[g_idx_pos]
                        gamma_idx = gamma_arg.index
                        
                        # Check for contraction: g(mu, nu)*gamma(nu) -> gamma_lower(mu)
                        if gamma_idx == metric_idx2:
                            contracted_metric_idx = m_idx_pos
                            contracted_gamma_idx = g_idx_pos
                            new_gamma_lower = DiracGammaLower(metric_idx1)
                            break # Found one contraction
                        # Check for contraction: g(nu, mu)*gamma(nu) -> gamma_lower(mu)
                        elif gamma_idx == metric_idx1:
                            contracted_metric_idx = m_idx_pos
                            contracted_gamma_idx = g_idx_pos
                            new_gamma_lower = DiracGammaLower(metric_idx2)
                            break # Found one contraction
                            
                    if new_gamma_lower: # Exit outer loop if contraction found
                        break
                        
                # If a contraction was found, create the replacement term
                if new_gamma_lower:
                    new_args = []
                    for i, arg in enumerate(args):
                        if i == contracted_metric_idx or i == contracted_gamma_idx:
                            continue # Skip the contracted terms
                        new_args.append(arg)
                    new_args.append(new_gamma_lower) # Add the new lower-index gamma
                    
                    # Mark the original Mul term for replacement
                    contraction_replacements[term] = Mul(*new_args).expand()

        # Apply contraction replacements before Clifford algebra
        if contraction_replacements:
            current_expr = current_expr.xreplace(contraction_replacements)


        # --- Apply Clifford algebra with canonical ordering ---
        clifford_replacements = {}
        for term in preorder_traversal(current_expr):
            # (Keep the existing Clifford Algebra logic here)
            # ... (Pow handling) ...
            if isinstance(term, Pow) and isinstance(term.base, DiracGamma) and term.exp == 2:
                 # ... (replacement logic g_mu_mu * identity) ...
                mu = term.base.index
                g_mu_mu = metric_func(mu, mu)
                if term not in clifford_replacements:
                     clifford_replacements[term] = g_mu_mu * identity
                continue

            # ... (Mul handling for gamma*gamma) ...
            if isinstance(term, Mul):
                # ... (logic to find adjacent DiracGamma pairs) ...
                args = list(term.args)
                made_change_in_mul = False
                i = 0
                while i < len(args) - 1:
                    g1 = args[i]
                    g2 = args[i+1]
                    if isinstance(g1, DiracGamma) and isinstance(g2, DiracGamma):
                        mu = g1.index
                        nu = g2.index
                        if mu == nu:
                            # ... (replacement logic g_mu_mu * identity) ...
                            g_mu_mu = metric_func(mu, mu)
                            term_to_insert = g_mu_mu * identity
                            new_args = args[:i] + [term_to_insert] + args[i+2:]
                            if term not in clifford_replacements:
                                clifford_replacements[term] = Mul(*new_args).expand()
                            made_change_in_mul = True
                            break 
                        else:
                            # ... (canonical ordering check and replacement) ...
                            def index_is_greater(idx1, idx2):
                                s1 = str(idx1); s2 = str(idx2)
                                try: n1 = int(s1); n2 = int(s2); return n1 > n2
                                except ValueError: return s1 > s2
                            if index_is_greater(mu, nu): 
                                g_mu_nu = metric_func(mu, nu)
                                term_to_insert = 2 * g_mu_nu * identity - DiracGamma(nu) * DiracGamma(mu)
                                new_args = args[:i] + [term_to_insert] + args[i+2:]
                                if term not in clifford_replacements:
                                    clifford_replacements[term] = Mul(*new_args).expand()
                                made_change_in_mul = True
                                break
                    i += 1
                if made_change_in_mul:
                    continue 
            
        # --- Apply all collected Clifford replacements ---
        if clifford_replacements:
            current_expr = current_expr.xreplace(clifford_replacements)

        # --- Check if expression changed in this full iteration ---
        if current_expr == simplified_expr_prev_iter:
            break # Exit outer loop if no changes were made in the entire pass

    # Final cleanup (expand helps collect terms)
    return expand(current_expr)


# --- Example Usage ---
if __name__ == '__main__':
    print("\n--- Dirac Objects Examples ---")
    mu, nu, rho = symbols('mu nu rho', int=True) # Keep as generic symbols for now
    
    gamma_mu = DiracGamma(mu)
    gamma_nu = DiracGamma(nu)
    gamma_0 = DiracGamma(0) 
    gamma_1 = DiracGamma(1)

    print(f"gamma_mu: {gamma_mu}, LaTeX: {latex(gamma_mu)}")
    print(f"gamma_0: {gamma_0}, LaTeX: {latex(gamma_0)}")
    print(f"Identity: {diracI}, LaTeX: {latex(diracI)}")
    print(f"Zero: {dirac0}, LaTeX: {latex(dirac0)}")

    print("\n--- Basic Algebra ---")
    expr1 = gamma_mu * diracI
    print(f"gamma_mu * I = {expr1}")
    expr2 = dirac0 * gamma_mu
    print(f"0 * gamma_mu = {expr2}")
    expr3 = diracI * 5 * gamma_mu
    print(f"I * 5 * gamma_mu = {expr3}")
    expr4 = diracI + diracI
    print(f"I + I = {expr4}")
    expr5 = dirac0 + gamma_mu
    print(f"0 + gamma_mu = {expr5}")

    print("\n--- Clifford Algebra Simplification ---")
    
    # Case 1: mu == nu (symbolic)
    prod_mu_mu = gamma_mu * gamma_mu
    print(f"Product gamma(mu)*gamma(mu): {prod_mu_mu}")
    simp_mu_mu = gamma_simplify(prod_mu_mu)
    print(f"Simplified: {simp_mu_mu}")
    print(f"LaTeX: {latex(simp_mu_mu)}")

    # Case 2: mu == nu (concrete)
    prod_0_0 = gamma_0 * gamma_0
    print(f"Product gamma(0)*gamma(0): {prod_0_0}")
    simp_0_0 = gamma_simplify(prod_0_0)
    print(f"Simplified: {simp_0_0}") # Should be 1 * I_4
    print(f"LaTeX: {latex(simp_0_0)}")

    prod_1_1 = gamma_1 * gamma_1
    print(f"Product gamma(1)*gamma(1): {prod_1_1}")
    simp_1_1 = gamma_simplify(prod_1_1)
    print(f"Simplified: {simp_1_1}") # Should be -1 * I_4
    print(f"LaTeX: {latex(simp_1_1)}")

    # Case 3: mu != nu (symbolic)
    prod_mu_nu = gamma_mu * gamma_nu
    print(f"Product gamma(mu)*gamma(nu): {prod_mu_nu}")
    # Simplification only swaps or introduces metric if indices known
    simp_mu_nu = gamma_simplify(prod_mu_nu) 
    print(f"Simplified (no change expected): {simp_mu_nu}") 

    # Case 4: Anticommutator (symbolic)
    anticomm_sym = gamma_mu * gamma_nu + gamma_nu * gamma_mu
    print(f"Anticommutator {{gamma_mu, gamma_nu}}: {anticomm_sym}")
    simp_anticomm_sym = gamma_simplify(anticomm_sym)
    print(f"Simplified: {simp_anticomm_sym}") # Should be 2*g(mu, nu)*I_4
    print(f"LaTeX: {latex(simp_anticomm_sym)}")

    # Case 5: Anticommutator (concrete, mu != nu)
    anticomm_01 = gamma_0 * gamma_1 + gamma_1 * gamma_0
    print(f"Anticommutator {{gamma_0, gamma_1}}: {anticomm_01}")
    simp_anticomm_01 = gamma_simplify(anticomm_01)
    print(f"Simplified: {simp_anticomm_01}") # Should be 2*g(0, 1)*I_4 = 0
    print(f"LaTeX: {latex(simp_anticomm_01)}") # Should be 0_4

    # Case 6: Longer product
    prod_long = gamma_mu * gamma_nu * gamma_mu
    print(f"Product gamma_mu * gamma_nu * gamma_mu: {prod_long}")
    simp_long = gamma_simplify(prod_long)
    # Expect: gamma_mu * (2*g_nu_mu*I - gamma_mu*gamma_nu) = 2*g_nu_mu*gamma_mu - gamma_mu*gamma_mu*gamma_nu = 2*g_nu_mu*gamma_mu - g_mu_mu*I*gamma_nu
    print(f"Simplified: {simp_long}") 
    print(f"LaTeX: {latex(simp_long)}")

    # Case 7: Product involving identity
    prod_with_I = gamma_mu * diracI * gamma_nu
    print(f"Product g_mu * I * g_nu: {prod_with_I}")
    simp_with_I = gamma_simplify(prod_with_I)
    print(f"Simplified: {simp_with_I}")
