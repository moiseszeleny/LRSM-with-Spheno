# c:\Users\moise\OneDrive\Escritorio\LRSM-with-Spheno\sympy_calculations\LFV decays DLRSM\LFVXD\test_vertexes.py

import unittest
import sys
import os
from sympy import symbols, Expr, Symbol, Add, Mul

# --- Test Setup ---
# Ensure the parent directory (LFV decays DLRSM) is in sys.path
# This is needed for vertexes_v2 to find DLRSM1, and potentially
# for the test runner to find both vertexes modules if not run from LFVXD.
current_dir = os.path.dirname(os.path.abspath(__file__))
parent_dir = os.path.dirname(current_dir)
if parent_dir not in sys.path:
    sys.path.insert(0, parent_dir)

# --- Import Modules to Test ---
# Import with aliases to avoid name collisions
try:
    # Assuming vertexes.py is accessible (e.g., copied to LFVXD or in PYTHONPATH)
    # If vertexes.py is in the parent dir: from .. import vertexes as v_orig
    import vertexes as v_orig
except ImportError:
    print("Warning: Could not import original 'vertexes.py'. Ensure it's accessible.")
    v_orig = None # Set to None to skip tests if not found

try:
    # vertexes_v2.py should be in the same directory as this test file
    import vertexes_v2 as v_refactored
except ImportError as e:
    print(f"Error importing refactored 'vertexes_v2.py': {e}")
    print("Ensure DLRSM1/dirac.py and its dependencies are accessible.")
    v_refactored = None # Set to None to skip tests if import fails

# --- Define Symbolic Inputs for Tests ---
# Use the same symbols for instantiating both versions
c_sym, c1_sym, c2_sym, c3_sym = symbols('c c1 c2 c3', complex=True)
cr_sym, cl_sym = symbols('cR cL', complex=True)

# --- Test Class ---

# Decorator to skip tests if modules aren't loaded
skip_if_modules_missing = unittest.skipIf(
    v_orig is None or v_refactored is None,
    "Skipping test because original or refactored vertex module failed to import."
)

@skip_if_modules_missing
class TestVertexEquivalence(unittest.TestCase):
    """
    Tests if the symbolic output of vertex classes in vertexes_v2.py
    matches the output of the corresponding classes in the original vertexes.py.
    """

    def assertSymPyEqual(self, expr1, expr2, msg=None):
        """Asserts that two SymPy expressions are structurally equal."""
        # SymPy's == operator checks for structural equality
        self.assertEqual(expr1, expr2, msg=msg)
        # Optional: Check LaTeX representation for visual confirmation (can be stricter)
        # from sympy import latex
        # self.assertEqual(latex(expr1), latex(expr2), msg=f"LaTeX mismatch: {msg}")

    def test_vertex_sss(self):
        """Test VertexSSS equivalence."""
        orig = v_orig.VertexSSS(c1_sym)
        refactored = v_refactored.VertexSSS(c1_sym)
        self.assertSymPyEqual(orig.show(), refactored.show(), "VertexSSS mismatch")

    def test_vertex_sff(self):
        """Test VertexSFF equivalence."""
        orig = v_orig.VertexSFF(cr_sym, cl_sym)
        refactored = v_refactored.VertexSFF(cr_sym, cl_sym)
        self.assertSymPyEqual(orig.show(), refactored.show(), "VertexSFF mismatch")

        # Test case where cR == cL
        orig_eq = v_orig.VertexSFF(c1_sym, c1_sym)
        refactored_eq = v_refactored.VertexSFF(c1_sym, c1_sym)
        self.assertSymPyEqual(orig_eq.show(), refactored_eq.show(), "VertexSFF mismatch (cR=cL)")


    def test_vertex_vss(self):
        """Test VertexVSS equivalence."""
        orig = v_orig.VertexVSS(c2_sym)
        refactored = v_refactored.VertexVSS(c2_sym)
        # Note: Original uses pmu1, pmu2; Refactored uses P_PLUS, P_A
        # SymPy equality should handle this if the structure c*(p1-p2) is the same.
        self.assertSymPyEqual(orig.show(), refactored.show(), "VertexVSS mismatch")

    def test_vertex_sspvm(self):
        """Test VertexSSpVm equivalence."""
        orig = v_orig.VertexSSpVm(c_sym)
        refactored = v_refactored.VertexSSpVm(c_sym)
        self.assertSymPyEqual(orig.show(), refactored.show(), "VertexSSpVm mismatch")

    def test_vertex_svpsm(self):
        """Test VertexSVpSm equivalence."""
        orig = v_orig.VertexSVpSm(c_sym)
        refactored = v_refactored.VertexSVpSm(c_sym)
        self.assertSymPyEqual(orig.show(), refactored.show(), "VertexSVpSm mismatch")

    def test_vertex_svv(self):
        """Test VertexSVV equivalence."""
        orig = v_orig.VertexSVV(c3_sym)
        refactored = v_refactored.VertexSVV(c3_sym)
        # Note: Original uses gmunu=symbols(...); Refactored uses G_MU_NU=MetricTensor(...)
        # SymPy equality should handle this if the structure c*g_mu_nu is the same.
        self.assertSymPyEqual(orig.show(), refactored.show(), "VertexSVV mismatch")

    def test_vertex_vvv(self):
        """Test VertexVVV equivalence."""
        orig = v_orig.VertexVVV(c_sym)
        refactored = v_refactored.VertexVVV(c_sym)
        # Note: Differences in how metric tensors and momenta symbols are defined.
        # Relying on SymPy's structural equality for the overall expression.
        self.assertSymPyEqual(orig.show(), refactored.show(), "VertexVVV mismatch")

    def test_vertex_vff(self):
        """Test VertexVFF equivalence."""
        orig = v_orig.VertexVFF(cr_sym, cl_sym)
        refactored = v_refactored.VertexVFF(cr_sym, cl_sym)
        # Note: Original uses gamma_mu=symbols(...), P_R/L=symbols(...)
        # Refactored uses GAMMA_MU=DiracGamma(...), P_R/L=diracPR/L instances
        # Relying on SymPy's structural equality for gamma*(cR*PR + cL*PL).
        self.assertSymPyEqual(orig.show(), refactored.show(), "VertexVFF mismatch")

        # Test case where cR == cL
        orig_eq = v_orig.VertexVFF(c1_sym, c1_sym)
        refactored_eq = v_refactored.VertexVFF(c1_sym, c1_sym)
        self.assertSymPyEqual(orig_eq.show(), refactored_eq.show(), "VertexVFF mismatch (cR=cL)")


# --- Run Tests ---
if __name__ == '__main__':
    print("Running vertex equivalence tests...")
    print(f"Original module loaded: {'Yes' if v_orig else 'No'}")
    print(f"Refactored module loaded: {'Yes' if v_refactored else 'No'}")
    print("-" * 30)
    unittest.main(verbosity=2) # Increase verbosity for more details
