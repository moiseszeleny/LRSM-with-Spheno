# test_sw_comparison.py
import sys
import os
from sympy import simplify, Symbol, Expr, Basic
from typing import Dict, Any, Tuple

# Ensure the script can find the modules (adjust path if needed)
# Assuming this test script is in the same directory as the modules
module_path = os.path.dirname(__file__)
if module_path not in sys.path:
    sys.path.insert(0, module_path)

print(f"Attempting to import modules from: {module_path}")

# --- Import Modules ---
try:
    import FeynmanRules_senjanovic_SW as original
    print("Successfully imported original module (FeynmanRules_senjanovic_SW).")
except ImportError as e:
    print(f"Error importing original module: {e}")
    sys.exit(1)
except Exception as e:
    print(f"An unexpected error occurred during original module import: {e}")
    sys.exit(1)

try:
    import FeynmanRules_senjanovic_SW_GM_v2 as refactored
    print("Successfully imported refactored module (FeynmanRules_senjanovic_SW_GM).")
except ImportError as e:
    print(f"Error importing refactored module: {e}")
    sys.exit(1)
except Exception as e:
    print(f"An unexpected error occurred during refactored module import: {e}")
    sys.exit(1)

# --- Comparison Helper Function ---

def compare_interaction_dictionaries(
    dict1: Dict[int, Dict[Tuple[Symbol, ...], Expr]],
    dict2: Dict[int, Dict[Tuple[Symbol, ...], Expr]],
    name: str
) -> bool:
    """
    Compares two nested dictionaries of interaction coefficients.
    The outer key is the n-point value (e.g., 3 or 4).
    The inner dictionary maps interaction tuples to SymPy expressions.
    """
    print(f"\n--- Comparing Interaction Dictionary: {name} ---")
    overall_passed = True

    keys1 = set(dict1.keys())
    keys2 = set(dict2.keys())

    if keys1 != keys2:
        print(f" FAIL: Outer key sets (n-point values) do not match!")
        missing_in_1 = keys2 - keys1
        missing_in_2 = keys1 - keys2
        if missing_in_1:
            print(f"  Outer keys missing in original: {missing_in_1}")
        if missing_in_2:
            print(f"  Outer keys missing in refactored: {missing_in_2}")
        overall_passed = False
        # Continue comparison for common outer keys

    common_outer_keys = sorted(list(keys1.intersection(keys2)))

    for n_point in common_outer_keys:
        print(f" Comparing {n_point}-point interactions...")
        inner_dict1 = dict1.get(n_point, {})
        inner_dict2 = dict2.get(n_point, {})

        inner_keys1 = set(inner_dict1.keys())
        inner_keys2 = set(inner_dict2.keys())
        all_inner_keys = inner_keys1.union(inner_keys2)
        mismatches = []
        passed_inner = True

        if inner_keys1 != inner_keys2:
            print(f"  FAIL ({n_point}-point): Interaction key sets do not match!")
            missing_in_1 = inner_keys2 - inner_keys1
            missing_in_2 = inner_keys1 - inner_keys2
            if missing_in_1:
                print(f"    Interactions missing in original ({len(missing_in_1)}): {missing_in_1}")
            if missing_in_2:
                print(f"    Interactions missing in refactored ({len(missing_in_2)}): {missing_in_2}")
            passed_inner = False
            overall_passed = False
            # Continue comparison for common inner keys

        common_inner_keys = inner_keys1.intersection(inner_keys2)
        print(f"  Comparing {len(common_inner_keys)} common {n_point}-point interactions...")

        # Sort keys for consistent output order
        sorted_common_inner_keys = sorted(common_inner_keys, key=lambda k: tuple(map(str, k)))

        for key in sorted_common_inner_keys:
            val1 = inner_dict1[key]
            val2 = inner_dict2[key]

            # Ensure values are SymPy expressions before simplifying
            if not isinstance(val1, Basic) or not isinstance(val2, Basic):
                if val1 == val2:
                    continue # Allow comparison of non-sympy basic types if they are equal
                else:
                    mismatches.append(key)
                    passed_inner = False
                    overall_passed = False
                    print(f"  MISMATCH (non-sympy) for key: {key}")
                    print(f"    Original:   {val1} (Type: {type(val1)})")
                    print(f"    Refactored: {val2} (Type: {type(val2)})")
                    continue

            try:
                # Robust check for symbolic equality
                diff = simplify(val1 - val2)
                if diff != 0:
                    mismatches.append(key)
                    passed_inner = False
                    overall_passed = False
                    print(f"  MISMATCH for key: {key}")
                    print(f"    Original:   {val1}")
                    print(f"    Refactored: {val2}")
                    print(f"    Difference: {diff}")
            except Exception as e:
                mismatches.append(key)
                passed_inner = False
                overall_passed = False
                print(f"  ERROR comparing key: {key}")
                print(f"    Original:   {val1}")
                print(f"    Refactored: {val2}")
                print(f"    Error during simplification/comparison: {e}")

        if passed_inner:
            print(f"  PASS: {n_point}-point interactions are symbolically equivalent.")
        else:
            print(f"  FAIL: {n_point}-point interactions have differences.")
            if mismatches:
                print(f"    Keys with differing values ({len(mismatches)}): {mismatches}")

    if overall_passed:
        print(f"--- Result for '{name}': PASS ---")
    else:
        print(f"--- Result for '{name}': FAIL ---")

    return overall_passed

# --- Main Comparison Logic ---

if __name__ == "__main__":
    all_tests_passed = True
    results = {}

    # List of dictionary names to compare
    dict_names = [
        "interactions_gauge_scalars",
        "interactions_gauge_scalars_approx",
        "interactions_scalars",
        "interactions_scalars_approx",
    ]

    for name in dict_names:
        print(f"\nChecking existence of '{name}'...")
        try:
            dict_orig = getattr(original, name)
            dict_refact = getattr(refactored, name)
            print(f" Found '{name}' in both modules.")

            # Perform the comparison
            results[name] = compare_interaction_dictionaries(dict_orig, dict_refact, name)
            if not results[name]:
                all_tests_passed = False

        except AttributeError as e:
            print(f" SKIP: Attribute '{name}' not found in one or both modules: {e}")
            # Decide if this should be a failure
            all_tests_passed = False # Treat missing attribute as failure
            results[name] = False
        except Exception as e:
            print(f" ERROR accessing or comparing '{name}': {e}")
            all_tests_passed = False
            results[name] = False

    # --- Final Summary ---
    print("\n\n" + "="*30)
    print("      Comparison Summary")
    print("="*30)
    for name, result in results.items():
        status = "PASS" if result else "FAIL"
        print(f"{name:<35}: {status}")

    print("\n-------------------------------")
    if all_tests_passed:
        print("Overall Result: ALL TESTS PASSED!")
        print("The refactored script (FeynmanRules_senjanovic_SW_GM.py) matches the original.")
    else:
        print("Overall Result: SOME TESTS FAILED!")
        print("Differences found between original and refactored scripts.")
    print("-------------------------------")

    # Exit with status code 0 for success, 1 for failure
    sys.exit(0 if all_tests_passed else 1)

