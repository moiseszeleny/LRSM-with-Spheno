#!/usr/bin/env python
"""
Example Custom Analysis Script

Demonstrates how to use the modular LFV framework for custom studies.
This script shows various analysis patterns you can adapt for your needs.
"""

import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import LogNorm

# Import the modules
from LFV_calculations import (
    calculate_BR_mu_to_e_gamma,
    calculate_BR_h_to_mu_tau,
    calculate_LFV_grid,
    check_LFV_constraints,
    BR_MU_E_GAMMA_BOUND,
    BR_H_MU_TAU_BOUND,
    DELTA_M31_SQ_NO
)

from ISS_scan import (
    calculate_light_masses_NH,
    calculate_dirac_mass,
    calculate_yukawa
)


def example_1_single_point_analysis():
    """
    Example 1: Analyze a single point in parameter space
    """
    print("\n" + "="*70)
    print("EXAMPLE 1: Single Point Analysis")
    print("="*70)
    
    # Define parameter point
    m_light = np.sqrt(DELTA_M31_SQ_NO)  # atmospheric mass scale
    M = 1000  # GeV
    mu = 0.01  # GeV
    
    print(f"\nParameter point: M = {M} GeV, μ = {mu} GeV")
    print(f"Light neutrino mass: {m_light:.4e} eV")
    
    # Calculate derived quantities
    m_D = calculate_dirac_mass(m_light, M, mu)
    Y = calculate_yukawa(m_D)
    
    print(f"\nDerived quantities:")
    print(f"  Dirac mass m_D = {m_D:.3f} GeV")
    print(f"  Yukawa coupling Y = {Y:.3e}")
    print(f"  Effective scale Λ = M²/μ = {M**2/mu:.2e} GeV")
    
    # Check all LFV constraints
    print("\nLFV Observable Analysis:")
    results = check_LFV_constraints(m_light, M, mu, verbose=True)
    
    return results


def example_2_scan_one_variable():
    """
    Example 2: Scan one parameter while keeping others fixed
    """
    print("\n" + "="*70)
    print("EXAMPLE 2: 1D Parameter Scan")
    print("="*70)
    
    # Fixed parameters
    m_light = np.sqrt(DELTA_M31_SQ_NO)
    M = 500  # GeV (fixed)
    
    # Scan mu
    mu_values = np.logspace(-3, 0, 100)  # 1 MeV to 1 GeV
    
    BR_mu_e_gamma_array = np.zeros_like(mu_values)
    BR_h_mu_tau_array = np.zeros_like(mu_values)
    Y_array = np.zeros_like(mu_values)
    
    for i, mu in enumerate(mu_values):
        BR_mu_e_gamma_array[i] = calculate_BR_mu_to_e_gamma(m_light, M, mu)
        BR_h_mu_tau_array[i] = calculate_BR_h_to_mu_tau(m_light, M, mu)
        
        m_D = calculate_dirac_mass(m_light, M, mu)
        Y_array[i] = calculate_yukawa(m_D)
    
    # Plot results
    fig, axes = plt.subplots(1, 3, figsize=(15, 4))
    
    # Plot 1: BR(μ→eγ) vs μ
    ax1 = axes[0]
    ax1.loglog(mu_values, BR_mu_e_gamma_array, 'b-', linewidth=2)
    ax1.axhline(BR_MU_E_GAMMA_BOUND, color='r', linestyle='--', 
                linewidth=2, label='MEG II bound')
    ax1.set_xlabel('μ [GeV]', fontsize=12)
    ax1.set_ylabel('BR(μ → eγ)', fontsize=12)
    ax1.set_title(f'Fixed M = {M} GeV', fontsize=13, fontweight='bold')
    ax1.grid(True, alpha=0.3)
    ax1.legend()
    
    # Plot 2: BR(h→μτ) vs μ
    ax2 = axes[1]
    ax2.loglog(mu_values, BR_h_mu_tau_array, 'purple', linewidth=2)
    ax2.axhline(BR_H_MU_TAU_BOUND, color='r', linestyle='--',
                linewidth=2, label='LHC bound')
    ax2.set_xlabel('μ [GeV]', fontsize=12)
    ax2.set_ylabel('BR(h → μτ)', fontsize=12)
    ax2.set_title(f'Fixed M = {M} GeV', fontsize=13, fontweight='bold')
    ax2.grid(True, alpha=0.3)
    ax2.legend()
    
    # Plot 3: Yukawa vs μ
    ax3 = axes[2]
    ax3.loglog(mu_values, Y_array, 'g-', linewidth=2)
    ax3.axhline(4*np.pi, color='r', linestyle='--',
                linewidth=2, label='Perturbativity')
    ax3.set_xlabel('μ [GeV]', fontsize=12)
    ax3.set_ylabel('Yukawa Y', fontsize=12)
    ax3.set_title(f'Fixed M = {M} GeV', fontsize=13, fontweight='bold')
    ax3.grid(True, alpha=0.3)
    ax3.legend()
    
    plt.tight_layout()
    plt.savefig('example_1D_scan.png', dpi=150, bbox_inches='tight')
    print("\nPlot saved as 'example_1D_scan.png'")
    
    return fig


def example_3_custom_2D_scan():
    """
    Example 3: Custom 2D scan with specific region focus
    """
    print("\n" + "="*70)
    print("EXAMPLE 3: Custom 2D Scan (TeV Region)")
    print("="*70)
    
    # Focus on TeV-scale region
    M_range = np.logspace(2.5, 3.5, 100)  # ~300 GeV to ~3 TeV
    mu_range = np.logspace(-2.5, -0.5, 100)  # ~3 MeV to ~300 MeV
    
    M_grid, mu_grid = np.meshgrid(M_range, mu_range)
    
    m_light = np.sqrt(DELTA_M31_SQ_NO)
    
    print(f"\nCalculating BR(μ→eγ) over custom grid...")
    BR_mu_e_gamma_grid = calculate_LFV_grid(
        m_light, M_grid, mu_grid, 'mu_e_gamma'
    )
    
    print(f"Calculating BR(h→μτ) over custom grid...")
    BR_h_mu_tau_grid = calculate_LFV_grid(
        m_light, M_grid, mu_grid, 'h_mu_tau'
    )
    
    # Create figure
    fig, axes = plt.subplots(1, 2, figsize=(14, 6))
    
    # Plot 1: BR(μ→eγ)
    ax1 = axes[0]
    im1 = ax1.contourf(M_grid, mu_grid, BR_mu_e_gamma_grid, levels=50,
                       norm=LogNorm(vmin=1e-25, vmax=1e-15), cmap='YlOrRd')
    cs1 = ax1.contour(M_grid, mu_grid, BR_mu_e_gamma_grid,
                      levels=[BR_MU_E_GAMMA_BOUND],
                      colors='black', linewidths=3)
    ax1.clabel(cs1, inline=True, fontsize=10)
    ax1.set_xscale('log')
    ax1.set_yscale('log')
    ax1.set_xlabel('M [GeV]', fontsize=12)
    ax1.set_ylabel('μ [GeV]', fontsize=12)
    ax1.set_title('BR(μ → eγ) - TeV Region', fontsize=13, fontweight='bold')
    ax1.grid(True, alpha=0.3)
    plt.colorbar(im1, ax=ax1, label='BR(μ → eγ)')
    
    # Plot 2: BR(h→μτ)
    ax2 = axes[1]
    im2 = ax2.contourf(M_grid, mu_grid, BR_h_mu_tau_grid, levels=50,
                       norm=LogNorm(vmin=1e-20, vmax=1e-5), cmap='PuRd')
    cs2 = ax2.contour(M_grid, mu_grid, BR_h_mu_tau_grid,
                      levels=[BR_H_MU_TAU_BOUND],
                      colors='black', linewidths=3)
    ax2.clabel(cs2, inline=True, fontsize=10)
    ax2.set_xscale('log')
    ax2.set_yscale('log')
    ax2.set_xlabel('M [GeV]', fontsize=12)
    ax2.set_ylabel('μ [GeV]', fontsize=12)
    ax2.set_title('BR(h → μτ) - TeV Region', fontsize=13, fontweight='bold')
    ax2.grid(True, alpha=0.3)
    plt.colorbar(im2, ax=ax2, label='BR(h → μτ)')
    
    plt.tight_layout()
    plt.savefig('example_2D_TeV_region.png', dpi=150, bbox_inches='tight')
    print("\nPlot saved as 'example_2D_TeV_region.png'")
    
    return fig


def example_4_compare_hierarchies():
    """
    Example 4: Compare Normal vs Inverted Hierarchy
    """
    print("\n" + "="*70)
    print("EXAMPLE 4: Normal vs Inverted Hierarchy Comparison")
    print("="*70)
    
    from ISS_scan import calculate_light_masses_IH
    
    # Calculate masses for both hierarchies
    m1_NH, m2_NH, m3_NH = calculate_light_masses_NH(0.0)
    m1_IH, m2_IH, m3_IH = calculate_light_masses_IH(0.0)
    
    print(f"\nNormal Hierarchy:")
    print(f"  m1 = {m1_NH:.4e} eV, m2 = {m2_NH:.4e} eV, m3 = {m3_NH:.4e} eV")
    print(f"  Heaviest: m3 = {m3_NH:.4e} eV")
    
    print(f"\nInverted Hierarchy:")
    print(f"  m1 = {m1_IH:.4e} eV, m2 = {m2_IH:.4e} eV, m3 = {m3_IH:.4e} eV")
    print(f"  Heaviest: m2 = {m2_IH:.4e} eV")
    
    # Compare LFV predictions for same (M, μ)
    M = 1000  # GeV
    mu = 0.01  # GeV
    
    BR_NH = calculate_BR_mu_to_e_gamma(m3_NH, M, mu)
    BR_IH = calculate_BR_mu_to_e_gamma(m2_IH, M, mu)
    
    print(f"\nLFV Predictions at M={M} GeV, μ={mu} GeV:")
    print(f"  BR(μ→eγ) [NH] = {BR_NH:.3e}")
    print(f"  BR(μ→eγ) [IH] = {BR_IH:.3e}")
    print(f"  Ratio IH/NH = {BR_IH/BR_NH:.3f}")
    
    return BR_NH, BR_IH


def example_5_find_viable_points():
    """
    Example 5: Systematically find all viable parameter points
    """
    print("\n" + "="*70)
    print("EXAMPLE 5: Find Viable Parameter Points")
    print("="*70)
    
    # Coarse scan to find viable regions
    M_test = np.logspace(2, 4, 20)  # 100 GeV to 10 TeV
    mu_test = np.logspace(-2, 0, 20)  # 10 MeV to 1 GeV
    
    m_light = np.sqrt(DELTA_M31_SQ_NO)
    
    viable_points = []
    
    print("\nScanning for viable points...")
    for M in M_test:
        for mu in mu_test:
            # Check constraints
            results = check_LFV_constraints(m_light, M, mu, verbose=False)
            
            # Check if all constraints passed
            all_passed = all(not obs['excluded'] for obs in results.values())
            
            # Additional physics constraints
            m_D = calculate_dirac_mass(m_light, M, mu)
            Y = calculate_yukawa(m_D)
            perturbative = Y < 4*np.pi
            
            if all_passed and perturbative:
                viable_points.append({
                    'M': M,
                    'mu': mu,
                    'm_D': m_D,
                    'Y': Y,
                    'BR_mu_e_gamma': results['mu_e_gamma']['value'],
                    'BR_h_mu_tau': results['h_mu_tau']['value']
                })
    
    print(f"\nFound {len(viable_points)} viable points (out of {len(M_test)*len(mu_test)} tested)")
    
    if len(viable_points) > 0:
        print("\nFirst 5 viable points:")
        for i, point in enumerate(viable_points[:5]):
            print(f"\n  Point {i+1}:")
            print(f"    M = {point['M']:.1f} GeV, μ = {point['mu']:.3f} GeV")
            print(f"    Y = {point['Y']:.3e}, BR(μ→eγ) = {point['BR_mu_e_gamma']:.2e}")
    
    return viable_points


if __name__ == "__main__":
    print("="*70)
    print("CUSTOM ANALYSIS EXAMPLES")
    print("="*70)
    print("\nThis script demonstrates various analysis patterns using")
    print("the modular LFV framework. Run individual examples or all.")
    print("="*70)
    
    # Run all examples
    print("\n" + ">"*70)
    results_1 = example_1_single_point_analysis()
    
    print("\n" + ">"*70)
    fig_2 = example_2_scan_one_variable()
    
    print("\n" + ">"*70)
    fig_3 = example_3_custom_2D_scan()
    
    print("\n" + ">"*70)
    BR_NH, BR_IH = example_4_compare_hierarchies()
    
    print("\n" + ">"*70)
    viable = example_5_find_viable_points()
    
    print("\n" + "="*70)
    print("ALL EXAMPLES COMPLETED")
    print("="*70)
    print("\nGenerated files:")
    print("  - example_1D_scan.png")
    print("  - example_2D_TeV_region.png")
    print("\nYou can now adapt these patterns for your own analysis!")
    
    plt.show()
