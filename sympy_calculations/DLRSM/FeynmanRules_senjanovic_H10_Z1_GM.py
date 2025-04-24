# -*- coding: utf-8 -*-
"""
Calculates specific Feynman rules involving H10, Z1, W bosons, and leptons
in the context of the Senjanovic model with Higgs Doublets (DLRSM).

This script focuses on:
- H10 interactions with W1/W2 bosons.
- H10 interactions with charged scalars and W bosons.
- H10 interactions with pairs of charged scalars.
- Z1 interactions with pairs of charged gauge bosons or scalars.
- W boson interactions with leptons.
- Charged scalar interactions with leptons.

It utilizes pre-calculated interaction terms from other modules and provides
both exact and approximate (where available) results.
"""

from sympy import factor, sqrt, conjugate
from sympy import IndexedBase, symbols 

# Local imports from the project structure
from FeynmanRules_senjanovic_SW import (
    interactions_gauge_scalars, interactions_gauge_scalars_approx,
    interactions_scalars, interactions_scalars_approx
)
from potential_senjanovic_HiggsDoublets import H10, vR, k1
from potential_senjanovic_HiggsDoublets import (
    GRp, GLp, HLp, HRp, HRm, GRm, GLm, HLm
)
from Gauge_Higgs_senjanovic_HiggsDoublets import (
    W1p, W1m, W2p, Z1, W2m, g # Added g
)
from dirac import diracPL, diracPR, DiracGamma

# --- Constants & Type Definitions ---

# Assuming interaction dictionaries use key 3 for 3-point vertices
SOURCE_DICT_KEY = 3
VERBOSE_FETCHING = False # Set to True to print details during dictionary population

# Define lists of scalar fields for convenience
SCALARS_NEG = [GLm, GRm, HLm, HRm]
SCALARS_POS = [GLp, GRp, HLp, HRp]
# Lists including the neutral H10 for VSS interactions as in original code
SCALARS_M_WITH_H10 = SCALARS_NEG + [H10]
SCALARS_P_WITH_H10 = SCALARS_POS + [H10]

# --- Helper Functions ---

def _sort_interaction_tuple(interaction_tuple):
    """Sorts particles in an interaction tuple alphabetically by string representation."""
    return tuple(sorted(interaction_tuple, key=str))

def populate_interaction_dict(
    target_dict,
    interaction_list,
    source_dict,
    source_key=SOURCE_DICT_KEY,
    factor_coeffs=True,
    verbose=VERBOSE_FETCHING
):
    """
    Populates target_dict with coefficients from source_dict.

    Args:
        target_dict (dict): The dictionary to populate.
        interaction_list (list): List of interaction tuples (particle symbols).
        source_dict (dict): The source dictionary containing coefficients.
        source_key: The key in source_dict holding the interaction coefficients.
        factor_coeffs (bool): Whether to factor the coefficients.
        verbose (bool): Print details if an interaction is not found.
    """
    count = 0
    for interaction in interaction_list:
        try:
            coeff = source_dict[source_key][interaction]
            if factor_coeffs:
                # Ensure factoring doesn't fail on simple numbers/symbols
                try:
                    coeff = factor(coeff)
                except Exception:
                    pass # Keep original coeff if factoring fails
            target_dict[interaction] = coeff
            count += 1
        except KeyError:
            if verbose:
                print(f"Info: Interaction {interaction} not found in source.")
        except Exception as e:
            if verbose:
                print(f"Warning: Error processing interaction {interaction}: {e}")
    if verbose:
        print(f"Successfully populated {count} interactions into target dictionary.")


def populate_approximation_dict(
    target_approx_dict,
    source_exact_dict, # Use the already populated exact dict as reference
    source_approx_dict,
    source_key=SOURCE_DICT_KEY,
    factor_coeffs=True,
    verbose=VERBOSE_FETCHING
):
    """
    Populates target_approx_dict with approximate coefficients from source_approx_dict,
    corresponding to interactions present in source_exact_dict.

    Args:
        target_approx_dict (dict): The dictionary to populate with approximations.
        source_exact_dict (dict): The dictionary of exact interactions (used for keys).
        source_approx_dict (dict): The source dictionary containing approximate coefficients.
        source_key: The key in source_approx_dict holding the interaction coefficients.
        factor_coeffs (bool): Whether to factor the approximate coefficients.
        verbose (bool): Print details if an approximation is not found or fails.
    """
    count = 0
    for interaction in source_exact_dict.keys():
        try:
            approx_coeff = source_approx_dict[source_key][interaction]
            if factor_coeffs:
                # Ensure factoring doesn't fail on simple numbers/symbols
                try:
                    approx_coeff = factor(approx_coeff)
                except Exception:
                    pass # Keep original approx coeff if factoring fails
            target_approx_dict[interaction] = approx_coeff
            count += 1
        except KeyError:
            if verbose:
                print(f"Info: Approximation for {interaction} not found.")
        except Exception as e:
            if verbose:
                print(f"Warning: Error processing approximation for {interaction}: {e}")
    if verbose:
        print(f"Successfully populated {count} approximations into target dictionary.")


def generate_VSS_interactions(vector_boson, scalar_list1, scalar_list2, required_scalar=None):
    """
    Generates unique V S S interaction tuples (Vector, Scalar1, Scalar2).
    Optionally ensures one of the scalars is the required_scalar.
    """
    interactions = set()
    for S1 in scalar_list1:
        for S2 in scalar_list2:
            include = True
            if required_scalar:
                include = (S1 == required_scalar or S2 == required_scalar)

            if include:
                # Keep the V S S order, sorting not needed here as order matters (V S S' vs V S' S)
                # If order doesn't matter use _sort_interaction_tuple
                interaction_tuple = (vector_boson, S1, S2)
                interactions.add(interaction_tuple)

    # Sort the final list for consistency
    return sorted(list(interactions), key=lambda t: tuple(map(str, t)))

def generate_SSS_interactions(scalar1, scalar_list_p, scalar_list_m):
    """Generates unique S S+ S- interaction tuples, sorted alphabetically."""
    interactions = set()
    for Sp in scalar_list_p:
        for Sm in scalar_list_m:
            # Sort tuple alphabetically for canonical representation
            interaction_tuple = _sort_interaction_tuple((scalar1, Sp, Sm))
            interactions.add(interaction_tuple)
    # Sort the final list for consistency
    return sorted(list(interactions), key=lambda t: tuple(map(str, t)))

def generate_ZVS_interactions(Z_boson, charged_list_p, charged_list_m):
    """Generates unique Z V/S+ V/S- interaction tuples, sorted alphabetically."""
    interactions = set()
    for Xp in charged_list_p:
        for Xm in charged_list_m:
            # Sort tuple alphabetically for canonical representation
            interaction_tuple = _sort_interaction_tuple((Z_boson, Xp, Xm))
            interactions.add(interaction_tuple)
    # Sort the final list for consistency
    return sorted(list(interactions), key=lambda t: tuple(map(str, t)))


# --- H10 Interactions ---

print("\n--- Calculating H10 Interactions ---")

# 1. H10 - W - W Interactions
interactionsH10_WW = [
    _sort_interaction_tuple((W1p, W1m, H10)),
    _sort_interaction_tuple((W1p, W2m, H10)),
    _sort_interaction_tuple((W1m, W2p, H10)),
    _sort_interaction_tuple((W2p, W2m, H10))
]
interactionsH10_WW_dict = {}
populate_interaction_dict(interactionsH10_WW_dict, interactionsH10_WW, interactions_gauge_scalars)

interactionsH10_WW_dict_approx = {}
populate_approximation_dict(interactionsH10_WW_dict_approx, interactionsH10_WW_dict, interactions_gauge_scalars_approx)

# 2. H10 - W+/- - S-/+ Interactions (V S S' where one S/S' is H10)
interactionsH10_W1pSm = generate_VSS_interactions(W1p, SCALARS_M_WITH_H10, SCALARS_M_WITH_H10, required_scalar=H10)
interactionsH10_W2pSm = generate_VSS_interactions(W2p, SCALARS_M_WITH_H10, SCALARS_M_WITH_H10, required_scalar=H10)
interactionsH10_W1mSp = generate_VSS_interactions(W1m, SCALARS_P_WITH_H10, SCALARS_P_WITH_H10, required_scalar=H10)
interactionsH10_W2mSp = generate_VSS_interactions(W2m, SCALARS_P_WITH_H10, SCALARS_P_WITH_H10, required_scalar=H10)

# Populate dictionaries for H10-W-S interactions
interactionsH10_W1pSm_dict = {}
populate_interaction_dict(interactionsH10_W1pSm_dict, interactionsH10_W1pSm, interactions_gauge_scalars)
interactionsH10_W1pSm_dict_approx = {}
populate_approximation_dict(interactionsH10_W1pSm_dict_approx, interactionsH10_W1pSm_dict, interactions_gauge_scalars_approx)

interactionsH10_W2pSm_dict = {}
populate_interaction_dict(interactionsH10_W2pSm_dict, interactionsH10_W2pSm, interactions_gauge_scalars)
interactionsH10_W2pSm_dict_approx = {}
populate_approximation_dict(interactionsH10_W2pSm_dict_approx, interactionsH10_W2pSm_dict, interactions_gauge_scalars_approx)

interactionsH10_W1mSp_dict = {}
populate_interaction_dict(interactionsH10_W1mSp_dict, interactionsH10_W1mSp, interactions_gauge_scalars)
interactionsH10_W1mSp_dict_approx = {}
populate_approximation_dict(interactionsH10_W1mSp_dict_approx, interactionsH10_W1mSp_dict, interactions_gauge_scalars_approx)

interactionsH10_W2mSp_dict = {}
populate_interaction_dict(interactionsH10_W2mSp_dict, interactionsH10_W2mSp, interactions_gauge_scalars)
interactionsH10_W2mSp_dict_approx = {}
populate_approximation_dict(interactionsH10_W2mSp_dict_approx, interactionsH10_W2mSp_dict, interactions_gauge_scalars_approx)

# 3. H10 - S+ - S- Interactions
interactionsH10_SS = generate_SSS_interactions(H10, SCALARS_POS, SCALARS_NEG)

interactionsH10_SS_dict = {}
populate_interaction_dict(interactionsH10_SS_dict, interactionsH10_SS, interactions_scalars)

interactionsH10_SS_dict_approx = {}
populate_approximation_dict(interactionsH10_SS_dict_approx, interactionsH10_SS_dict, interactions_scalars_approx)


# --- Z1 Interactions ---

print("\n--- Calculating Z1 Interactions ---")

# Z1 - V+/S+ - V-/S- Interactions
CHARGED_PARTICLES_P = SCALARS_POS + [W1p, W2p]
CHARGED_PARTICLES_M = SCALARS_NEG + [W1m, W2m]

interactionsZ1_VS = generate_ZVS_interactions(Z1, CHARGED_PARTICLES_P, CHARGED_PARTICLES_M)

interactionsZ1_VS_dict = {}
populate_interaction_dict(interactionsZ1_VS_dict, interactionsZ1_VS, interactions_gauge_scalars)

interactionsZ1_VS_dict_approx = {}
populate_approximation_dict(interactionsZ1_VS_dict_approx, interactionsZ1_VS_dict, interactions_gauge_scalars_approx)


# --- Lepton Interactions ---

print("\n--- Defining Lepton Interactions ---")

# Definitions for Leptons
i, j, a, b = symbols('i, j, a, b', integer=True) # Generation indices
mu, nu = symbols('mu, nu', integer=True) # Lorentz indices
gamma_mu = DiracGamma(mu)
# gamma_nu = DiracGamma(nu) # Not used in 3-point vertices here

# Lepton fields and parameters
QL = IndexedBase('Q_L') # Left-handed mixing matrix (leptons)
QR = IndexedBase('Q_R') # Right-handed mixing matrix (leptons)
n = IndexedBase('n')    # Neutrino field (mass eigenstate)
nadj = IndexedBase(r'\overline{n}') # Adjoint neutrino field
l = IndexedBase(r'\ell') # Charged lepton field (mass eigenstate)
ladj = IndexedBase(r'\overline{\ell}') # Adjoint charged lepton field
TRL = IndexedBase('T_{RL}') # Yukawa-related matrix
K = IndexedBase('K')        # Yukawa-related matrix
J = IndexedBase('J')        # Yukawa-related matrix
ml = IndexedBase('m_ell') # Charged lepton mass (diagonal matrix m_l[a,a] or just m_l[a])
# mn = IndexedBase('m_n') # Neutrino mass (not directly used in these vertices)
sqrt2 = sqrt(2)

# 1. W Boson - Lepton Interactions
# Note: Assuming QL[a,i] means row a, column i (lepton a, neutrino i)
#       and conjugate(QL[i,a]) means row i, column a (neutrino i, lepton a)
#       Adjust indices if convention is different.

interactionsW1p_n_l = lambda i, a: {
    (W1p, nadj[i], l[a]): (g / 2) * conjugate(QL[i, a]) * gamma_mu * diracPL
}
interactionsW1m_n_l = lambda i, a: {
    (W1m, ladj[a], n[i]): (g / 2) * QL[a, i] * gamma_mu * diracPL
}
interactionsW2p_n_l = lambda i, a: {
    (W2p, nadj[i], l[a]): (g / 2) * conjugate(QR[i, a]) * gamma_mu * diracPR
}
interactionsW2m_n_l = lambda i, a: {
    (W2m, ladj[a], n[i]): (g / 2) * QR[a, i] * gamma_mu * diracPR
}

# Combined interactions (using dictionary unpacking)
interactionsWp_n_l = lambda i, a: {
    **interactionsW1p_n_l(i, a),
    **interactionsW2p_n_l(i, a)
}
interactionsWm_n_l = lambda i, a: {
    **interactionsW1m_n_l(i, a),
    **interactionsW2m_n_l(i, a)
}

# 2. Charged Scalar - Lepton Interactions
# Assuming ml[a] refers to the mass of lepton 'a'. If ml is a matrix, use ml[a,a].

interactionsGLm_n_l = lambda i, a: {
    (GLm, ladj[a], n[i]): (sqrt2 / k1) * (
        - conjugate(TRL[i, a]) * diracPR
        + ml[a] * QL[a, i] * diracPL  # Check if ml[a] or ml[a,a]
    )
}
interactionsGLp_n_l = lambda i, a: {
    (GLp, nadj[i], l[a]): (sqrt2 / k1) * (
        - TRL[a, i] * diracPL
        + ml[a] * conjugate(QL[i, a]) * diracPR # Check if ml[a] or ml[a,a]
    )
}

interactionsGRm_n_l = lambda i, a: {
    (GRm, ladj[a], n[i]): (sqrt2 / vR) * (
        - ml[a] * QR[a, i] * diracPR # Check if ml[a] or ml[a,a]
        + J[a, i] * diracPL
    )
}
interactionsGRp_n_l = lambda i, a: {
    (GRp, nadj[i], l[a]): (sqrt2 / vR) * (
        - ml[a] * conjugate(QR[i, a]) * diracPL # Check if ml[a] or ml[a,a]
        + conjugate(J[i, a]) * diracPR
    )
}

# Assuming HR interactions involve k1 (like GL) based on doublet structure? Verify this.
interactionsHRm_n_l = lambda i, a: {
    (HRm, ladj[a], n[i]): (sqrt2 / k1) * ( # Verify VEV: k1 or vR? Assumed k1 like GLm
        - K[a, i] * diracPL
        + ml[a] * QR[a, i] * diracPR # Check if ml[a] or ml[a,a]
    )
}
interactionsHRp_n_l = lambda i, a: {
    (HRp, nadj[i], l[a]): (sqrt2 / k1) * ( # Verify VEV: k1 or vR? Assumed k1 like GLp
        - conjugate(K[i, a]) * diracPR
        + ml[a] * conjugate(QR[i, a]) * diracPL # Check if ml[a] or ml[a,a]
    )
}

# Combined scalar interactions
interactionsSp_n_l = lambda i, a: {
    **interactionsGLp_n_l(i, a),
    **interactionsGRp_n_l(i, a),
    **interactionsHRp_n_l(i, a)
}
interactionsSm_n_l = lambda i, a: {
    **interactionsGLm_n_l(i, a),
    **interactionsGRm_n_l(i, a),
    **interactionsHRm_n_l(i, a)
}

# --- Optional: Print results for verification ---
# You can uncomment sections below to print the calculated dictionaries

# print("\n--- H10 WW Interactions (Exact) ---")
# for k, v in interactionsH10_WW_dict.items(): print(f"{k}: {v}")
# print("\n--- H10 WW Interactions (Approx) ---")
# for k, v in interactionsH10_WW_dict_approx.items(): print(f"{k}: {v}")

# print("\n--- H10 W1p Sm Interactions (Exact) ---")
# for k, v in interactionsH10_W1pSm_dict.items(): print(f"{k}: {v}")
# print("\n--- H10 W1p Sm Interactions (Approx) ---")
# for k, v in interactionsH10_W1pSm_dict_approx.items(): print(f"{k}: {v}")
# ... (similarly for other H10-W-S interactions) ...

# print("\n--- H10 SS Interactions (Exact) ---")
# for k, v in interactionsH10_SS_dict.items(): print(f"{k}: {v}")
# print("\n--- H10 SS Interactions (Approx) ---")
# for k, v in interactionsH10_SS_dict_approx.items(): print(f"{k}: {v}")

# print("\n--- Z1 VS Interactions (Exact) ---")
# for k, v in interactionsZ1_VS_dict.items(): print(f"{k}: {v}")
# print("\n--- Z1 VS Interactions (Approx) ---")
# for k, v in interactionsZ1_VS_dict_approx.items(): print(f"{k}: {v}")

# Example Lepton interaction print (for specific indices, e.g., i=1, a=1)
# print("\n--- Example Lepton Interactions (i=1, a=1) ---")
# print("W+ nbar l:", interactionsWp_n_l(1, 1))
# print("W- lbar n:", interactionsWm_n_l(1, 1))
# print("S+ nbar l:", interactionsSp_n_l(1, 1))
# print("S- lbar n:", interactionsSm_n_l(1, 1))

print("\nRefactored script execution finished.")

