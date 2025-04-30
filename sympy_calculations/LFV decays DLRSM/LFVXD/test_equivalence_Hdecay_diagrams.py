#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
test_equivalence.py

Tests the functional equivalence between Hdecay_diagrams.py (original)
and Hdecay_diagrams_v2.py (refactored).

Compares:
1. Symbolic output of AL() and AR() methods for each diagram class,
    using symbolic vertex instances from vertexes.py.
2. Numerical output of the decay width calculation function.

NOTE: For the Decay Width test to pass for strict equivalence,
        the `calculate_decay_width` function in Hdecay_diagrams_v2.py
        needs to be temporarily modified to use the *exact same* 'maij'
        phase space calculation as the original `Γhlilj` function.
"""

import sys
import os
import importlib
import math
import traceback

# --- Determine Module Directory ---
try:
    # Assumes script is in the same directory as the modules being tested
    module_dir = os.path.dirname(os.path.abspath(__file__))
except NameError:
    # Fallback for interactive environments
    module_dir = os.path.abspath('.')

# --- Add Necessary Directories to Path ---
# Add the directory containing the script (and potentially the modules)
if module_dir not in sys.path:
    sys.path.insert(0, module_dir)

# Add the parent directory (might contain topologias, Higgs)
parent_dir = os.path.dirname(module_dir)
if parent_dir not in sys.path:
    sys.path.insert(0, parent_dir)

# Add the grandparent directory if structure is LRSM-with-Spheno/LFVXD/...
# and topologias/Higgs are siblings of LFVXD
# grandparent_dir = os.path.dirname(parent_dir)
# if grandparent_dir not in sys.path:
#     sys.path.insert(0, grandparent_dir)

print(f"Using module directory: {module_dir}")
print(f"Using parent directory: {parent_dir}")
# print(f"Using grandparent directory: {grandparent_dir}") # Uncomment if used
print(f"Current sys.path: {sys.path}")


# --- Try importing the modules ---
try:
    # Ensure fresh imports if run multiple times
    if 'Hdecay_diagrams' in sys.modules:
        importlib.reload(sys.modules['Hdecay_diagrams'])
    if 'Hdecay_diagrams_v2' in sys.modules:
        importlib.reload(sys.modules['Hdecay_diagrams_v2'])
    if 'vertexes' in sys.modules:
        importlib.reload(sys.modules['vertexes'])

    import Hdecay_diagrams as original
    import Hdecay_diagrams_v2 as refactored
    import vertexes # Import the vertex definitions
    import sympy
    import numpy as np
    print("Successfully imported original, refactored, and vertexes modules.")
except ImportError as e:
    print(f"Error importing modules: {e}")
    print("Please ensure Hdecay_diagrams.py, Hdecay_diagrams_v2.py, vertexes.py")
    print("and their dependencies (topologias, Higgs.functions...) are accessible")
    print("and the necessary directories are in sys.path.")
    traceback.print_exc() # Print detailed traceback for import errors
    sys.exit(1)
except Exception as e:
    print(f"An unexpected error occurred during import: {e}")
    traceback.print_exc()
    sys.exit(1)

# --- Define Common Inputs ---

# Symbolic inputs for AL/AR comparison
# 1. Define symbolic *couplings* for the vertices
cR1, cL1, cR2, cL2, cR3, cL3 = sympy.symbols(
    'cR1 cL1 cR2 cL2 cR3 cL3', complex=True
)
# 2. Create vertex *instances* using these symbolic couplings
#    Using VertexSFF as a general case with cR and cL. Adjust if needed.
v1_vertex = vertexes.VertexSFF(cR1, cL1)
v2_vertex = vertexes.VertexSFF(cR2, cL2)
v3_vertex = vertexes.VertexSFF(cR3, cL3)
vertices_instances = (v1_vertex, v2_vertex, v3_vertex)

# 3. Define symbolic masses (6 needed for C0 function)
m1_sym, m2_sym, m3_sym, m4_sym, m5_sym, m6_sym = sympy.symbols(
    'm1 m2 m3 m4 m5 m6', real=True, positive=True
)
masas_sym = [m1_sym, m2_sym, m3_sym, m4_sym, m5_sym, m6_sym]


# Numerical inputs for Width comparison
ml_num = 1.5e-5 + 0.5e-5j
mr_num = 0.8e-5 - 1.2e-5j
higgs_mass_num = 125.18
tau_mass_num = 1.777
# IMPORTANT: Use the *same* mj mass for both function calls.
lepton_j_mass_num = 0.1507 # Use original default for comparison

# --- Mapping of Classes and Functions ---

diagram_classes_map = {
    # Class Name: (Original Class, Refactored Class, Needs Mass Unpacking?)
    'TriangleFSS': (original.TriangleFSS, refactored.TriangleFSS, False),
    'TriangleFSV': (original.TriangleFSV, refactored.TriangleFSV, False),
    'TriangleFVS': (original.TriangleFVS, refactored.TriangleFVS, False),
    'TriangleFVV': (original.TriangleFVV, refactored.TriangleFVV, False),
    'BubbleFV':    (original.BubbleFV, refactored.BubbleFV, True),
    'BubbleVF':    (original.BubbleVF, refactored.BubbleVF, True),
    'BubbleFS':    (original.BubbleFS, refactored.BubbleFS, True),
    'BubbleSF':    (original.BubbleSF, refactored.BubbleSF, True),
    'TriangleSFF': (original.TriangleSFF, refactored.TriangleSFF, False),
    'TriangleVFF': (original.TriangleVFF, refactored.TriangleVFF, False),
}

width_functions = {
    'DecayWidth': (original.Γhlilj, refactored.calculate_decay_width)
}

# --- Test Execution ---

results = {"passed": 0, "failed": 0, "errors": 0}
failed_tests = []

print("\n--- Testing AL/AR Symbolic Equivalence ---")

for name, (orig_cls, refac_cls, needs_unpacking) in diagram_classes_map.items():
    print(f"Testing {name}...")
    try:
        # Instantiate using the vertex *instances*
        if needs_unpacking:
            print(f"  Instantiating {name} with vertex instances and unpacked masses...")
            orig_instance = orig_cls(*vertices_instances, *masas_sym)
            refac_instance = refac_cls(*vertices_instances, *masas_sym)
        else:
            print(f"  Instantiating {name} with vertex instances and mass list...")
            orig_instance = orig_cls(*vertices_instances, masas_sym)
            refac_instance = refac_cls(*vertices_instances, masas_sym)

        # Test AL
        print(f"  Testing {name}.AL()...")
        al_orig = orig_instance.AL()
        al_refac = refac_instance.AL()
        diff_al = sympy.simplify(al_orig - al_refac)
        if diff_al == 0:
            print(f"  {name}.AL(): PASSED")
            results["passed"] += 1
        else:
            print(f"  {name}.AL(): FAILED")
            print(f"    Difference: {diff_al}") # Show simplified difference
            results["failed"] += 1
            failed_tests.append(f"{name}.AL()")

        # Test AR
        print(f"  Testing {name}.AR()...")
        ar_orig = orig_instance.AR()
        ar_refac = refac_instance.AR()
        diff_ar = sympy.simplify(ar_orig - ar_refac)
        if diff_ar == 0:
            print(f"  {name}.AR(): PASSED")
            results["passed"] += 1
        else:
            print(f"  {name}.AR(): FAILED")
            print(f"    Difference: {diff_ar}") # Show simplified difference
            results["failed"] += 1
            failed_tests.append(f"{name}.AR()")

    except Exception as e:
        print(f"  {name}: ERROR during testing - {e}")
        traceback.print_exc() # Print full traceback for errors
        results["errors"] += 1
        failed_tests.append(f"{name} (Error: {e})")

print("\n--- Testing Decay Width Numerical Equivalence ---")
print("NOTE: This test requires Hdecay_diagrams_v2.py to use the")
print("      *original* 'maij' phase space formula for strict equivalence.")

name = 'DecayWidth'
orig_func, refac_func = width_functions[name]

print(f"Testing {name} (Γhlilj vs calculate_decay_width)...")
try:
    width_orig = orig_func(ml_num, mr_num,
                           ma=higgs_mass_num,
                           mi=tau_mass_num,
                           mj=lepton_j_mass_num) # Use explicit mj

    # Ensure the refactored function uses the temporary 'maij' if modified
    width_refac = refac_func(ml_num, mr_num,
                             higgs_mass=higgs_mass_num,
                             lepton_i_mass=tau_mass_num,
                             lepton_j_mass=lepton_j_mass_num) # Use explicit mj

    # Compare numerically using math.isclose for floats
    if math.isclose(width_orig, width_refac, rel_tol=1e-12, abs_tol=1e-18):
        print(f"  {name}: PASSED")
        print(f"    Original Value:  {width_orig:.6e}")
        print(f"    Refactored Value:{width_refac:.6e}")
        results["passed"] += 1
    else:
        print(f"  {name}: FAILED")
        print(f"    Original Value:  {width_orig:.6e}")
        print(f"    Refactored Value:{width_refac:.6e}")
        print(f"    Difference:      {abs(width_orig - width_refac):.6e}")
        results["failed"] += 1
        failed_tests.append(name)

except Exception as e:
    print(f"  {name}: ERROR during testing - {e}")
    traceback.print_exc() # Print full traceback for errors
    results["errors"] += 1
    failed_tests.append(f"{name} (Error: {e})")


# --- Final Summary ---
print("\n--- Test Summary ---")
print(f"Passed: {results['passed']}")
print(f"Failed: {results['failed']}")
print(f"Errors: {results['errors']}")

if results["failed"] == 0 and results["errors"] == 0 :
    print("\nAll tests passed successfully! The refactored version appears equivalent.")
    print("(Assuming the 'maij' formula in Hdecay_diagrams_v2.py was temporarily matched to the original).")
else:
    print("\nSome tests failed or encountered errors:")
    for test_name in failed_tests:
        print(f"- {test_name}")
    print("\nPlease review the failed tests and errors.")
    if 'DecayWidth' in failed_tests:
        print("NOTE: DecayWidth failure might be due to the 'maij' phase space formula difference.")
        print("      Modify Hdecay_diagrams_v2.calculate_decay_width to use the original formula for strict equivalence testing, if not already done.")


# Exit with status code 0 if all passed, 1 otherwise
sys.exit(0 if results["failed"] == 0 and results["errors"] == 0 else 1)
