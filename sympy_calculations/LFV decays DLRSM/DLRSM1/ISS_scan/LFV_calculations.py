"""
LFV Calculations Module for Inverse Seesaw Mechanism

This module provides functions to calculate lepton flavor violating
observables in the inverse seesaw framework, including:
- μ → eγ
- τ → μγ, τ → eγ
- h → μτ, h → eτ, h → eμ
- μ → 3e
- μ-e conversion in nuclei

Physical constants and experimental bounds are from PDG 2024.
"""

import numpy as np
from typing import Tuple, Union

# ============================================================================
# PHYSICAL CONSTANTS
# ============================================================================

# Electromagnetic and weak constants
ALPHA_EM = 1.0 / 137.036  # Fine structure constant
M_W = 80.379  # W boson mass [GeV]
M_Z = 91.1876  # Z boson mass [GeV]
M_H = 125.10  # Higgs mass [GeV]
V_EW = 174.0  # Electroweak VEV [GeV]
G_F = 1.1663787e-5  # Fermi constant [GeV^-2]

# Lepton masses [GeV]
M_ELECTRON = 0.5109989461e-3
M_MUON = 0.1056583745
M_TAU = 1.77686

# Neutrino mass-squared differences [eV^2]
DELTA_M21_SQ = 7.53e-5  # Solar
DELTA_M31_SQ_NO = 2.453e-3  # Atmospheric (Normal Ordering)
DELTA_M31_SQ_IO = -2.546e-3  # Atmospheric (Inverted Ordering)

# ============================================================================
# EXPERIMENTAL BOUNDS (90% or 95% CL)
# ============================================================================

# Radiative decays l_i -> l_j gamma
BR_MU_E_GAMMA_BOUND = 4.2e-13  # MEG II 2024
BR_TAU_MU_GAMMA_BOUND = 4.4e-8  # Belle II
BR_TAU_E_GAMMA_BOUND = 3.3e-8  # Belle II

# Three-body decays
BR_MU_3E_BOUND = 1.0e-12  # Mu3e expected sensitivity

# Higgs LFV decays
BR_H_MU_TAU_BOUND = 2.5e-3  # CMS + ATLAS combined
BR_H_E_TAU_BOUND = 4.7e-3  # CMS + ATLAS
BR_H_E_MU_BOUND = 6.1e-5  # CMS + ATLAS

# μ-e conversion in nuclei
CR_MU_E_AL_BOUND = 7.0e-13  # SINDRUM II (Aluminum)
CR_MU_E_TI_BOUND = 4.3e-12  # SINDRUM II (Titanium)

# ============================================================================
# LOOP FUNCTIONS
# ============================================================================

def loop_function_photonic(x: Union[float, np.ndarray]) -> Union[float, np.ndarray]:
    """
    Photonic penguin loop function F(x) for l_i -> l_j gamma
    
    F(x) appears in the dipole operator contribution.
    Valid for x = (M_heavy / m_W)^2
    
    Parameters:
    -----------
    x : float or array
        Ratio (M_heavy / m_W)^2
    
    Returns:
    --------
    F : Loop function value(s)
    
    Asymptotic behavior:
    - x << 1: F(x) ≈ 1/(12x) ∝ M^(-4)
    - x >> 1: F(x) ≈ -1/6 (constant)
    """
    # Handle scalar and array inputs
    scalar_input = np.isscalar(x)
    x = np.atleast_1d(x)
    
    result = np.zeros_like(x, dtype=float)
    
    # Low mass limit (x << 1)
    mask_low = x < 1e-4
    result[mask_low] = 1.0 / (12.0 * x[mask_low])
    
    # High mass limit (x >> 1)
    mask_high = x > 100
    result[mask_high] = -1.0 / 6.0
    
    # Intermediate region (exact formula)
    mask_mid = ~(mask_low | mask_high)
    x_mid = x[mask_mid]
    
    numerator = (10*x_mid**3 - 43*x_mid**2 + 78*x_mid - 49 + 
                 18*x_mid**2*np.log(x_mid) + 
                 4*(x_mid - 6)*np.log(x_mid))
    denominator = 6*(x_mid - 1)**4
    result[mask_mid] = numerator / denominator
    
    return result[0] if scalar_input else result


def loop_function_Z(x: Union[float, np.ndarray]) -> Union[float, np.ndarray]:
    """
    Z-penguin loop function G(x) for Z-mediated processes
    
    Parameters:
    -----------
    x : float or array
        Ratio (M_heavy / m_Z)^2
    
    Returns:
    --------
    G : Loop function value(s)
    """
    scalar_input = np.isscalar(x)
    x = np.atleast_1d(x)
    
    result = np.zeros_like(x, dtype=float)
    
    # Low mass limit
    mask_low = x < 1e-4
    result[mask_low] = 1.0 / (6.0 * x[mask_low])
    
    # High mass limit
    mask_high = x > 100
    result[mask_high] = -1.0 / 4.0
    
    # Intermediate region
    mask_mid = ~(mask_low | mask_high)
    x_mid = x[mask_mid]
    
    numerator = (6*x_mid**2 - 23*x_mid + 21 - 
                 6*x_mid*(2*x_mid - 3)*np.log(x_mid))
    denominator = 4*(x_mid - 1)**4
    result[mask_mid] = numerator / denominator
    
    return result[0] if scalar_input else result


def loop_function_box(x: Union[float, np.ndarray]) -> Union[float, np.ndarray]:
    """
    Box diagram loop function for processes like μ -> 3e
    
    Parameters:
    -----------
    x : float or array
        Ratio (M_heavy / m_W)^2
    
    Returns:
    --------
    B : Loop function value(s)
    """
    scalar_input = np.isscalar(x)
    x = np.atleast_1d(x)
    
    result = np.zeros_like(x, dtype=float)
    
    # Low mass limit
    mask_low = x < 1e-4
    result[mask_low] = 1.0 / x[mask_low]
    
    # High mass limit
    mask_high = x > 100
    result[mask_high] = np.log(x[mask_high]) / x[mask_high]
    
    # Intermediate region (approximate)
    mask_mid = ~(mask_low | mask_high)
    x_mid = x[mask_mid]
    result[mask_mid] = (x_mid + 1 - 2*x_mid*np.log(x_mid)) / ((x_mid - 1)**2)
    
    return result[0] if scalar_input else result


# ============================================================================
# MIXING ANGLE CALCULATIONS
# ============================================================================

def calculate_active_sterile_mixing(m_light: float, M: float, mu: float) -> float:
    """
    Calculate active-sterile mixing angle in inverse seesaw
    
    In the inverse seesaw mechanism:
    Θ² ≈ m_light / μ (in natural units with M factored out)
    
    More precisely: Θ ≈ m_D / M, where m_D = sqrt(m_light × M² / μ)
    Therefore: Θ² = m_light × M² / (μ × M²) = m_light / μ
    
    Parameters:
    -----------
    m_light : float
        Light neutrino mass [eV]
    M : float
        Heavy neutrino mass [GeV]
    mu : float
        Lepton number violation parameter [GeV]
    
    Returns:
    --------
    Theta_squared : float
        Mixing angle squared (dimensionless)
    """
    # Convert m_light from eV to GeV
    m_light_GeV = m_light * 1e-9
    
    # Calculate mixing: Θ² = m_light / μ
    Theta_squared = m_light_GeV / mu
    
    return Theta_squared


def calculate_effective_yukawa(m_light: float, M: float, mu: float) -> float:
    """
    Calculate effective Yukawa coupling in ISS
    
    Y_eff = m_D / v = sqrt(m_light × M² / μ) / v
    
    Parameters:
    -----------
    m_light : float
        Light neutrino mass [eV]
    M : float
        Heavy neutrino mass [GeV]
    mu : float
        LNV parameter [GeV]
    
    Returns:
    --------
    Y_eff : float
        Effective Yukawa coupling
    """
    m_light_GeV = m_light * 1e-9
    m_D = np.sqrt(m_light_GeV * M**2 / mu)
    Y_eff = m_D / V_EW
    return Y_eff


# ============================================================================
# LFV RADIATIVE DECAY: l_i -> l_j gamma
# ============================================================================

def calculate_BR_l_to_l_gamma(
    m_light: float,
    M: float,
    mu: float,
    m_initial: float = M_MUON,
    m_final: float = M_ELECTRON
) -> float:
    """
    Calculate BR(l_i -> l_j gamma) in inverse seesaw
    
    Formula:
    BR(l_i -> l_j gamma) = (3 α_em) / (32π) × |Θ_ij|² × F(M²/m_W²)²
    
    Parameters:
    -----------
    m_light : float
        Light neutrino mass [eV]
    M : float
        Heavy neutrino mass [GeV]
    mu : float
        LNV parameter [GeV]
    m_initial : float, optional
        Initial lepton mass [GeV] (default: muon)
    m_final : float, optional
        Final lepton mass [GeV] (default: electron)
    
    Returns:
    --------
    BR : float
        Branching ratio
    """
    # Calculate mixing angle
    Theta_sq = calculate_active_sterile_mixing(m_light, M, mu)
    
    # Calculate loop function
    x = (M / M_W)**2
    F = loop_function_photonic(x)
    
    # Branching ratio
    BR = (3 * ALPHA_EM / (32 * np.pi)) * Theta_sq**2 * F**2
    
    return BR


def calculate_BR_mu_to_e_gamma(m_light: float, M: float, mu: float) -> float:
    """
    Calculate BR(μ -> e γ)
    
    Convenience function for the most important LFV decay
    """
    return calculate_BR_l_to_l_gamma(m_light, M, mu, M_MUON, M_ELECTRON)


def calculate_BR_tau_to_mu_gamma(m_light: float, M: float, mu: float) -> float:
    """Calculate BR(τ -> μ γ)"""
    return calculate_BR_l_to_l_gamma(m_light, M, mu, M_TAU, M_MUON)


def calculate_BR_tau_to_e_gamma(m_light: float, M: float, mu: float) -> float:
    """Calculate BR(τ -> e γ)"""
    return calculate_BR_l_to_l_gamma(m_light, M, mu, M_TAU, M_ELECTRON)


# ============================================================================
# HIGGS LFV DECAYS: h -> l_i l_j
# ============================================================================

def calculate_BR_h_to_l_i_l_j(
    m_light: float,
    M: float,
    mu: float,
    m_lepton_i: float = M_MUON,
    m_lepton_j: float = M_TAU,
    N_generations: int = 3
) -> float:
    """
    Calculate BR(h -> l_i l_j) in inverse seesaw
    
    The rate depends on the effective Yukawa coupling:
    BR(h -> l_i l_j) ≈ (Γ_h / Γ_h^SM) × |Y_ij|² × (v²/M²) × kinematic_factor
    
    Approximation for tree-level contribution:
    BR(h -> l_i l_j) ≈ (m_h / (8π Γ_h^SM)) × |Θ_i Θ_j|² × (M/v)² × sqrt(1 - 4m²/m_h²)
    
    Parameters:
    -----------
    m_light : float
        Light neutrino mass [eV]
    M : float
        Heavy neutrino mass [GeV]
    mu : float
        LNV parameter [GeV]
    m_lepton_i, m_lepton_j : float
        Lepton masses [GeV]
    N_generations : int
        Number of heavy neutrino generations (typically 3)
    
    Returns:
    --------
    BR : float
        Branching ratio
    """
    # SM Higgs total width [GeV]
    Gamma_h_SM = 4.1e-3  # PDG 2024
    
    # Calculate mixing
    Theta_sq = calculate_active_sterile_mixing(m_light, M, mu)
    
    # Kinematic factor
    m_avg = (m_lepton_i + m_lepton_j) / 2
    if M_H < 2 * m_avg:
        return 0.0  # Kinematically forbidden
    
    kinematic = np.sqrt(1 - 4 * m_avg**2 / M_H**2)
    
    # Effective coupling: sum over N heavy neutrinos
    # |Y_eff|² ~ N × Θ² × (M/v)²
    Y_eff_sq = N_generations * Theta_sq * (M / V_EW)**2
    
    # Branching ratio
    BR = (M_H / (8 * np.pi * Gamma_h_SM)) * Y_eff_sq * kinematic
    
    # Suppression from loop vs tree (if loop-induced, add factor ~α²)
    # For ISS at one-loop: multiply by (α_em / (4π))²
    loop_suppression = (ALPHA_EM / (4 * np.pi))**2
    BR *= loop_suppression
    
    return BR


def calculate_BR_h_to_mu_tau(m_light: float, M: float, mu: float) -> float:
    """Calculate BR(h -> μ τ)"""
    return calculate_BR_h_to_l_i_l_j(m_light, M, mu, M_MUON, M_TAU)


def calculate_BR_h_to_e_tau(m_light: float, M: float, mu: float) -> float:
    """Calculate BR(h -> e τ)"""
    return calculate_BR_h_to_l_i_l_j(m_light, M, mu, M_ELECTRON, M_TAU)


def calculate_BR_h_to_e_mu(m_light: float, M: float, mu: float) -> float:
    """Calculate BR(h -> e μ)"""
    return calculate_BR_h_to_l_i_l_j(m_light, M, mu, M_ELECTRON, M_MUON)


# ============================================================================
# THREE-BODY DECAYS: μ -> 3e
# ============================================================================

def calculate_BR_mu_to_3e(m_light: float, M: float, mu: float) -> float:
    """
    Calculate BR(μ -> 3e)
    
    Approximate relation to radiative decay:
    BR(μ -> 3e) / BR(μ -> e γ) ≈ α_em / (3π) × [log(m_μ²/m_e²) - 3]
    
    Parameters:
    -----------
    m_light : float
        Light neutrino mass [eV]
    M : float
        Heavy neutrino mass [GeV]
    mu : float
        LNV parameter [GeV]
    
    Returns:
    --------
    BR : float
        Branching ratio
    """
    # Get radiative decay rate
    BR_mu_e_gamma = calculate_BR_mu_to_e_gamma(m_light, M, mu)
    
    # Approximate conversion factor
    log_factor = np.log(M_MUON**2 / M_ELECTRON**2) - 3
    conversion = (ALPHA_EM / (3 * np.pi)) * log_factor
    
    BR = BR_mu_e_gamma * conversion
    
    return BR


# ============================================================================
# μ-e CONVERSION IN NUCLEI
# ============================================================================

def calculate_CR_mu_e_conversion(
    m_light: float,
    M: float,
    mu: float,
    nucleus: str = 'Al'
) -> float:
    """
    Calculate coherent μ-e conversion rate in nuclei
    
    Approximate relation:
    CR(μ-e, N) / BR(μ -> e γ) ≈ α³ × Z_eff^4 × overlap_factor
    
    Parameters:
    -----------
    m_light : float
        Light neutrino mass [eV]
    M : float
        Heavy neutrino mass [GeV]
    mu : float
        LNV parameter [GeV]
    nucleus : str
        Target nucleus ('Al', 'Ti', 'Au', etc.)
    
    Returns:
    --------
    CR : float
        Conversion rate
    """
    # Get radiative decay rate
    BR_mu_e_gamma = calculate_BR_mu_to_e_gamma(m_light, M, mu)
    
    # Nuclear charge (effective)
    Z_eff_dict = {'Al': 13, 'Ti': 22, 'Au': 79}
    Z_eff = Z_eff_dict.get(nucleus, 13)
    
    # Conversion factor (approximate)
    conversion = ALPHA_EM**3 * Z_eff**4 * 1e-3
    
    CR = BR_mu_e_gamma * conversion
    
    return CR


# ============================================================================
# CONSTRAINT CHECKING
# ============================================================================

def check_LFV_constraints(
    m_light: float,
    M: float,
    mu: float,
    verbose: bool = False
) -> dict:
    """
    Check all LFV experimental constraints for given parameters
    
    Parameters:
    -----------
    m_light : float
        Light neutrino mass [eV]
    M : float
        Heavy neutrino mass [GeV]
    mu : float
        LNV parameter [GeV]
    verbose : bool
        Print results
    
    Returns:
    --------
    results : dict
        Dictionary with observable names, predicted values, bounds, and whether constrained
    """
    results = {}
    
    # Calculate observables
    BR_mu_e_g = calculate_BR_mu_to_e_gamma(m_light, M, mu)
    BR_tau_mu_g = calculate_BR_tau_to_mu_gamma(m_light, M, mu)
    BR_tau_e_g = calculate_BR_tau_to_e_gamma(m_light, M, mu)
    BR_h_mu_tau = calculate_BR_h_to_mu_tau(m_light, M, mu)
    BR_h_e_tau = calculate_BR_h_to_e_tau(m_light, M, mu)
    BR_h_e_mu = calculate_BR_h_to_e_mu(m_light, M, mu)
    BR_mu_3e = calculate_BR_mu_to_3e(m_light, M, mu)
    CR_mu_e_Al = calculate_CR_mu_e_conversion(m_light, M, mu, 'Al')
    
    # Store results
    results['mu_e_gamma'] = {
        'value': BR_mu_e_g,
        'bound': BR_MU_E_GAMMA_BOUND,
        'excluded': BR_mu_e_g > BR_MU_E_GAMMA_BOUND
    }
    results['tau_mu_gamma'] = {
        'value': BR_tau_mu_g,
        'bound': BR_TAU_MU_GAMMA_BOUND,
        'excluded': BR_tau_mu_g > BR_TAU_MU_GAMMA_BOUND
    }
    results['tau_e_gamma'] = {
        'value': BR_tau_e_g,
        'bound': BR_TAU_E_GAMMA_BOUND,
        'excluded': BR_tau_e_g > BR_TAU_E_GAMMA_BOUND
    }
    results['h_mu_tau'] = {
        'value': BR_h_mu_tau,
        'bound': BR_H_MU_TAU_BOUND,
        'excluded': BR_h_mu_tau > BR_H_MU_TAU_BOUND
    }
    results['h_e_tau'] = {
        'value': BR_h_e_tau,
        'bound': BR_H_E_TAU_BOUND,
        'excluded': BR_h_e_tau > BR_H_E_TAU_BOUND
    }
    results['h_e_mu'] = {
        'value': BR_h_e_mu,
        'bound': BR_H_E_MU_BOUND,
        'excluded': BR_h_e_mu > BR_H_E_MU_BOUND
    }
    results['mu_3e'] = {
        'value': BR_mu_3e,
        'bound': BR_MU_3E_BOUND,
        'excluded': BR_mu_3e > BR_MU_3E_BOUND
    }
    results['mu_e_conversion'] = {
        'value': CR_mu_e_Al,
        'bound': CR_MU_E_AL_BOUND,
        'excluded': CR_mu_e_Al > CR_MU_E_AL_BOUND
    }
    
    if verbose:
        print("\n" + "="*70)
        print(f"LFV CONSTRAINTS CHECK: m_light={m_light:.3e} eV, M={M:.1f} GeV, μ={mu:.3e} GeV")
        print("="*70)
        for obs_name, obs_data in results.items():
            status = "EXCLUDED" if obs_data['excluded'] else "ALLOWED"
            print(f"{obs_name:20s}: {obs_data['value']:.2e} (bound: {obs_data['bound']:.2e}) [{status}]")
        print("="*70)
    
    return results


# ============================================================================
# BATCH CALCULATION FOR PARAMETER SCANS
# ============================================================================

def calculate_LFV_grid(
    m_light: float,
    M_grid: np.ndarray,
    mu_grid: np.ndarray,
    observable: str = 'mu_e_gamma'
) -> np.ndarray:
    """
    Calculate LFV observable over a 2D parameter grid
    
    Parameters:
    -----------
    m_light : float
        Light neutrino mass [eV]
    M_grid : ndarray
        2D grid of heavy neutrino masses [GeV]
    mu_grid : ndarray
        2D grid of LNV parameters [GeV]
    observable : str
        Which observable to calculate:
        - 'mu_e_gamma': BR(μ -> eγ)
        - 'tau_mu_gamma': BR(τ -> μγ)
        - 'h_mu_tau': BR(h -> μτ)
        - 'mu_3e': BR(μ -> 3e)
        - 'mu_e_conversion': CR(μ-e, Al)
    
    Returns:
    --------
    result_grid : ndarray
        2D grid of observable values
    """
    calc_functions = {
        'mu_e_gamma': calculate_BR_mu_to_e_gamma,
        'tau_mu_gamma': calculate_BR_tau_to_mu_gamma,
        'tau_e_gamma': calculate_BR_tau_to_e_gamma,
        'h_mu_tau': calculate_BR_h_to_mu_tau,
        'h_e_tau': calculate_BR_h_to_e_tau,
        'h_e_mu': calculate_BR_h_to_e_mu,
        'mu_3e': calculate_BR_mu_to_3e,
        'mu_e_conversion': calculate_CR_mu_e_conversion,
    }
    
    if observable not in calc_functions:
        raise ValueError(f"Unknown observable: {observable}")
    
    calc_func = calc_functions[observable]
    
    # Vectorized calculation
    result_grid = np.zeros_like(M_grid)
    for i in range(M_grid.shape[0]):
        for j in range(M_grid.shape[1]):
            result_grid[i, j] = calc_func(m_light, M_grid[i, j], mu_grid[i, j])
    
    return result_grid


if __name__ == "__main__":
    # Test the module with benchmark points
    print("="*70)
    print("LFV CALCULATIONS MODULE - TEST")
    print("="*70)
    
    # Use atmospheric neutrino mass
    m_light_test = np.sqrt(DELTA_M31_SQ_NO)  # ~0.05 eV
    
    benchmarks = [
        ("TeV-scale, keV LNV", 1000, 0.001),
        ("100 GeV, 100 MeV LNV", 100, 0.1),
        ("10 TeV, 1 GeV LNV", 1e4, 1.0),
        ("EW-scale", 174, 0.174),
    ]
    
    for name, M_val, mu_val in benchmarks:
        print(f"\n{name}: M = {M_val} GeV, μ = {mu_val} GeV")
        print("-"*70)
        results = check_LFV_constraints(m_light_test, M_val, mu_val, verbose=False)
        
        # Print only most important observables
        print(f"  BR(μ→eγ)     = {results['mu_e_gamma']['value']:.2e}  (bound: {results['mu_e_gamma']['bound']:.2e})")
        print(f"  BR(h→μτ)     = {results['h_mu_tau']['value']:.2e}  (bound: {results['h_mu_tau']['bound']:.2e})")
        print(f"  BR(μ→3e)     = {results['mu_3e']['value']:.2e}  (bound: {results['mu_3e']['bound']:.2e})")
        
        # Overall status
        any_excluded = any(obs['excluded'] for obs in results.values())
        print(f"  Status: {'❌ EXCLUDED' if any_excluded else '✓ ALLOWED'}")
    
    print("\n" + "="*70)
