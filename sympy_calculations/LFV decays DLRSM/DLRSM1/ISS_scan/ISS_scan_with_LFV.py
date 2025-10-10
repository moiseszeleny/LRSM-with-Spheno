"""
Integrated Parameter Space Scanner for Inverse Seesaw with LFV Constraints

This module combines the parameter space analysis from ISS_scan.py
with LFV observable calculations from LFV_calculations.py to show
which regions of parameter space are phenomenologically viable.
"""

import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import LogNorm
import matplotlib.patches as mpatches

# Import base ISS functions
from ISS_scan import (
    calculate_light_masses_NH,
    calculate_light_masses_IH,
    calculate_dirac_mass,
    calculate_yukawa,
    v_ew,
    delta_m21_sq,
    delta_m31_sq_NO,
    delta_m31_sq_IO
)

# Import LFV calculation functions
from LFV_calculations import (
    calculate_LFV_grid,
    BR_MU_E_GAMMA_BOUND,
    BR_H_MU_TAU_BOUND,
    BR_H_E_TAU_BOUND,
    BR_MU_3E_BOUND,
    check_LFV_constraints
)


def scan_parameter_space_with_LFV(hierarchy='NH', m_lightest=0.0, 
                                   save_prefix='ISS_LFV_scan'):
    """
    Scan (mu, M) parameter space with LFV constraints overlaid
    
    Parameters:
    -----------
    hierarchy : str
        'NH' for normal hierarchy, 'IH' for inverted hierarchy
    m_lightest : float
        Lightest neutrino mass in eV (default: 0 for minimal mass)
    save_prefix : str
        Prefix for saved figure files
    
    Returns:
    --------
    fig : matplotlib figure
    masses : tuple
        (m1, m2, m3) neutrino masses
    LFV_grids : dict
        Dictionary of calculated LFV observable grids
    """
    
    # Calculate light neutrino masses
    if hierarchy == 'NH':
        m1, m2, m3 = calculate_light_masses_NH(m_lightest)
        m_heavy = m3
        print(f"Normal Hierarchy: m1={m1:.4e} eV, m2={m2:.4e} eV, m3={m3:.4e} eV")
    else:
        m1, m2, m3 = calculate_light_masses_IH(m_lightest)
        m_heavy = m2
        print(f"Inverted Hierarchy: m1={m1:.4e} eV, m2={m2:.4e} eV, m3={m3:.4e} eV")
    
    print(f"Sum of masses: {m1+m2+m3:.4e} eV")
    print(f"Heaviest mass used for LFV: {m_heavy:.4e} eV")
    
    # Create parameter grid
    M_range = np.logspace(0, 6, 200)  # 1 GeV to 10^6 GeV
    mu_range = np.logspace(-6, 3, 200)  # 10^-6 GeV to 10^3 GeV
    M_grid, mu_grid = np.meshgrid(M_range, mu_range)
    
    # Calculate basic ISS quantities
    m_D_grid = calculate_dirac_mass(m_heavy, M_grid, mu_grid)
    Y_grid = calculate_yukawa(m_D_grid)
    Lambda_grid = M_grid**2 / mu_grid
    
    # Calculate LFV observables
    print("\nCalculating LFV observables over parameter grid...")
    print("  - BR(μ → eγ)...")
    BR_mu_e_gamma_grid = calculate_LFV_grid(m_heavy, M_grid, mu_grid, 'mu_e_gamma')
    
    print("  - BR(h → μτ)...")
    BR_h_mu_tau_grid = calculate_LFV_grid(m_heavy, M_grid, mu_grid, 'h_mu_tau')
    
    print("  - BR(τ → μγ)...")
    BR_tau_mu_gamma_grid = calculate_LFV_grid(m_heavy, M_grid, mu_grid, 'tau_mu_gamma')
    
    print("  - BR(μ → 3e)...")
    BR_mu_3e_grid = calculate_LFV_grid(m_heavy, M_grid, mu_grid, 'mu_3e')
    
    print("Done!\n")
    
    # Store grids for return
    LFV_grids = {
        'BR_mu_e_gamma': BR_mu_e_gamma_grid,
        'BR_h_mu_tau': BR_h_mu_tau_grid,
        'BR_tau_mu_gamma': BR_tau_mu_gamma_grid,
        'BR_mu_3e': BR_mu_3e_grid
    }
    
    # Create comprehensive figure
    fig = plt.figure(figsize=(20, 16))
    
    # ========================================================================
    # Plot 1: BR(μ → eγ) with MEG bound
    # ========================================================================
    ax1 = plt.subplot(3, 3, 1)
    
    # Avoid log of zero
    BR_plot = np.maximum(BR_mu_e_gamma_grid, 1e-30)
    
    im1 = ax1.contourf(M_grid, mu_grid, BR_plot, levels=50,
                       norm=LogNorm(vmin=1e-25, vmax=1e-8), cmap='YlOrRd')
    
    # Add experimental bound contour
    cs1 = ax1.contour(M_grid, mu_grid, BR_mu_e_gamma_grid, 
                      levels=[BR_MU_E_GAMMA_BOUND],
                      colors='black', linewidths=3, linestyles='-')
    ax1.clabel(cs1, inline=True, fontsize=8, fmt='MEG bound')
    
    # Shade excluded region
    excluded_mu_e = BR_mu_e_gamma_grid > BR_MU_E_GAMMA_BOUND
    ax1.contourf(M_grid, mu_grid, excluded_mu_e.astype(float), 
                 levels=[0.5, 1.5], colors='gray', alpha=0.4, hatches=['///'])
    
    ax1.set_xscale('log')
    ax1.set_yscale('log')
    ax1.set_xlabel('M [GeV]', fontsize=11)
    ax1.set_ylabel('μ [GeV]', fontsize=11)
    ax1.set_title(r'BR($\mu \to e\gamma$) - MEG II Bound', fontsize=12, fontweight='bold')
    ax1.grid(True, alpha=0.3)
    cbar1 = plt.colorbar(im1, ax=ax1)
    cbar1.set_label(r'BR($\mu \to e\gamma$)', fontsize=10)
    
    # ========================================================================
    # Plot 2: BR(h → μτ) with collider bounds
    # ========================================================================
    ax2 = plt.subplot(3, 3, 2)
    
    BR_h_plot = np.maximum(BR_h_mu_tau_grid, 1e-30)
    
    im2 = ax2.contourf(M_grid, mu_grid, BR_h_plot, levels=50,
                       norm=LogNorm(vmin=1e-20, vmax=1e-2), cmap='PuRd')
    
    # Add experimental bound
    cs2 = ax2.contour(M_grid, mu_grid, BR_h_mu_tau_grid,
                      levels=[BR_H_MU_TAU_BOUND],
                      colors='black', linewidths=3, linestyles='-')
    ax2.clabel(cs2, inline=True, fontsize=8, fmt='CMS/ATLAS')
    
    # Shade excluded region
    excluded_h_mu_tau = BR_h_mu_tau_grid > BR_H_MU_TAU_BOUND
    ax2.contourf(M_grid, mu_grid, excluded_h_mu_tau.astype(float),
                 levels=[0.5, 1.5], colors='gray', alpha=0.4, hatches=['///'])
    
    ax2.set_xscale('log')
    ax2.set_yscale('log')
    ax2.set_xlabel('M [GeV]', fontsize=11)
    ax2.set_ylabel('μ [GeV]', fontsize=11)
    ax2.set_title(r'BR($h \to \mu\tau$) - LHC Bound', fontsize=12, fontweight='bold')
    ax2.grid(True, alpha=0.3)
    cbar2 = plt.colorbar(im2, ax=ax2)
    cbar2.set_label(r'BR($h \to \mu\tau$)', fontsize=10)
    
    # ========================================================================
    # Plot 3: BR(τ → μγ)
    # ========================================================================
    ax3 = plt.subplot(3, 3, 3)
    
    BR_tau_plot = np.maximum(BR_tau_mu_gamma_grid, 1e-30)
    
    im3 = ax3.contourf(M_grid, mu_grid, BR_tau_plot, levels=50,
                       norm=LogNorm(vmin=1e-20, vmax=1e-5), cmap='Purples')
    
    ax3.set_xscale('log')
    ax3.set_yscale('log')
    ax3.set_xlabel('M [GeV]', fontsize=11)
    ax3.set_ylabel('μ [GeV]', fontsize=11)
    ax3.set_title(r'BR($\tau \to \mu\gamma$) - Belle II', fontsize=12, fontweight='bold')
    ax3.grid(True, alpha=0.3)
    cbar3 = plt.colorbar(im3, ax=ax3)
    cbar3.set_label(r'BR($\tau \to \mu\gamma$)', fontsize=10)
    
    # ========================================================================
    # Plot 4: Yukawa coupling (from base scan)
    # ========================================================================
    ax4 = plt.subplot(3, 3, 4)
    
    im4 = ax4.contourf(M_grid, mu_grid, Y_grid, levels=50,
                       norm=LogNorm(vmin=1e-8, vmax=10), cmap='plasma')
    
    # Perturbativity bound
    ax4.contour(M_grid, mu_grid, Y_grid, levels=[4*np.pi],
                colors='red', linewidths=3, linestyles='-')
    
    ax4.set_xscale('log')
    ax4.set_yscale('log')
    ax4.set_xlabel('M [GeV]', fontsize=11)
    ax4.set_ylabel('μ [GeV]', fontsize=11)
    ax4.set_title('Yukawa Coupling (Perturbativity)', fontsize=12, fontweight='bold')
    ax4.grid(True, alpha=0.3)
    cbar4 = plt.colorbar(im4, ax=ax4)
    cbar4.set_label('Yukawa Y', fontsize=10)
    
    # ========================================================================
    # Plot 5: Dirac mass
    # ========================================================================
    ax5 = plt.subplot(3, 3, 5)
    
    im5 = ax5.contourf(M_grid, mu_grid, m_D_grid, levels=50,
                       norm=LogNorm(vmin=1e-3, vmax=1e4), cmap='viridis')
    
    ax5.set_xscale('log')
    ax5.set_yscale('log')
    ax5.set_xlabel('M [GeV]', fontsize=11)
    ax5.set_ylabel('μ [GeV]', fontsize=11)
    ax5.set_title(r'Dirac Mass $m_D$ [GeV]', fontsize=12, fontweight='bold')
    ax5.grid(True, alpha=0.3)
    cbar5 = plt.colorbar(im5, ax=ax5)
    cbar5.set_label('$m_D$ [GeV]', fontsize=10)
    
    # ========================================================================
    # Plot 6: BR(μ → 3e)
    # ========================================================================
    ax6 = plt.subplot(3, 3, 6)
    
    BR_mu_3e_plot = np.maximum(BR_mu_3e_grid, 1e-30)
    
    im6 = ax6.contourf(M_grid, mu_grid, BR_mu_3e_plot, levels=50,
                       norm=LogNorm(vmin=1e-25, vmax=1e-10), cmap='Oranges')
    
    # Add Mu3e sensitivity
    cs6 = ax6.contour(M_grid, mu_grid, BR_mu_3e_grid,
                      levels=[BR_MU_3E_BOUND],
                      colors='black', linewidths=2, linestyles='--')
    ax6.clabel(cs6, inline=True, fontsize=8, fmt='Mu3e')
    
    ax6.set_xscale('log')
    ax6.set_yscale('log')
    ax6.set_xlabel('M [GeV]', fontsize=11)
    ax6.set_ylabel('μ [GeV]', fontsize=11)
    ax6.set_title(r'BR($\mu \to 3e$) - Mu3e Prospect', fontsize=12, fontweight='bold')
    ax6.grid(True, alpha=0.3)
    cbar6 = plt.colorbar(im6, ax=ax6)
    cbar6.set_label(r'BR($\mu \to 3e$)', fontsize=10)
    
    # ========================================================================
    # Plot 7: COMBINED LFV CONSTRAINTS
    # ========================================================================
    ax7 = plt.subplot(3, 3, 7)
    
    # Define constraint satisfaction
    allowed_mu_e = ~excluded_mu_e
    allowed_h_mu_tau = ~excluded_h_mu_tau
    perturbative = Y_grid < 4*np.pi
    tev_scale = (M_grid > 100) & (M_grid < 1e4)
    small_LNV = mu_grid < 1.0
    
    # Count satisfied constraints
    n_constraints = (allowed_mu_e.astype(int) + 
                     allowed_h_mu_tau.astype(int) +
                     perturbative.astype(int) +
                     tev_scale.astype(int) +
                     small_LNV.astype(int))
    
    im7 = ax7.contourf(M_grid, mu_grid, n_constraints, 
                       levels=[0, 1, 2, 3, 4, 5],
                       colors=['darkred', 'red', 'orange', 'yellow', 'lightgreen', 'darkgreen'],
                       alpha=0.7)
    
    ax7.set_xscale('log')
    ax7.set_yscale('log')
    ax7.set_xlabel('M [GeV]', fontsize=11)
    ax7.set_ylabel('μ [GeV]', fontsize=11)
    ax7.set_title('Combined Constraints Satisfied', fontsize=12, fontweight='bold')
    ax7.grid(True, alpha=0.3)
    
    cbar7 = plt.colorbar(im7, ax=ax7, ticks=[0, 1, 2, 3, 4, 5])
    cbar7.set_label('N constraints', fontsize=10)
    cbar7.ax.set_yticklabels(['0', '1', '2', '3', '4', '5 (all)'])
    
    # Add annotation
    ax7.text(500, 0.01, 'Viable\nRegion', fontsize=11,
             bbox=dict(boxstyle='round', facecolor='green', alpha=0.6),
             ha='center', fontweight='bold')
    
    # ========================================================================
    # Plot 8: ALLOWED REGIONS (Binary: pass all or not)
    # ========================================================================
    ax8 = plt.subplot(3, 3, 8)
    
    # All constraints must be satisfied
    fully_allowed = (allowed_mu_e & allowed_h_mu_tau & perturbative & 
                     tev_scale & small_LNV)
    
    # Create colored regions
    ax8.contourf(M_grid, mu_grid, fully_allowed.astype(float),
                 levels=[0, 0.5, 1.5],
                 colors=['lightcoral', 'lightgreen'],
                 alpha=0.6)
    
    # Add constraint boundaries
    ax8.contour(M_grid, mu_grid, BR_mu_e_gamma_grid,
                levels=[BR_MU_E_GAMMA_BOUND],
                colors='blue', linewidths=2, linestyles='-', label='μ→eγ')
    ax8.contour(M_grid, mu_grid, BR_h_mu_tau_grid,
                levels=[BR_H_MU_TAU_BOUND],
                colors='purple', linewidths=2, linestyles='-', label='h→μτ')
    ax8.contour(M_grid, mu_grid, Y_grid,
                levels=[4*np.pi],
                colors='red', linewidths=2, linestyles='--', label='Y=4π')
    
    ax8.set_xscale('log')
    ax8.set_yscale('log')
    ax8.set_xlabel('M [GeV]', fontsize=11)
    ax8.set_ylabel('μ [GeV]', fontsize=11)
    ax8.set_title('Phenomenologically Viable Region', fontsize=12, fontweight='bold')
    ax8.grid(True, alpha=0.3)
    ax8.legend(fontsize=9, loc='upper right')
    
    # ========================================================================
    # Plot 9: Effective Scale Lambda
    # ========================================================================
    ax9 = plt.subplot(3, 3, 9)
    
    im9 = ax9.contourf(M_grid, mu_grid, Lambda_grid, levels=50,
                       norm=LogNorm(vmin=1e3, vmax=1e15), cmap='coolwarm')
    
    # Overlay allowed region
    ax9.contour(M_grid, mu_grid, fully_allowed.astype(float),
                levels=[0.5], colors='black', linewidths=3, linestyles='-')
    
    ax9.set_xscale('log')
    ax9.set_yscale('log')
    ax9.set_xlabel('M [GeV]', fontsize=11)
    ax9.set_ylabel('μ [GeV]', fontsize=11)
    ax9.set_title(r'Effective Scale $\Lambda = M^2/\mu$ [GeV]', fontsize=12, fontweight='bold')
    ax9.grid(True, alpha=0.3)
    cbar9 = plt.colorbar(im9, ax=ax9)
    cbar9.set_label(r'$\Lambda$ [GeV]', fontsize=10)
    
    plt.tight_layout()
    
    # ========================================================================
    # Print benchmark point analysis
    # ========================================================================
    print("\n" + "="*80)
    print("BENCHMARK POINTS WITH LFV CONSTRAINTS")
    print("="*80)
    
    benchmarks = [
        ("TeV-scale, keV LNV", 1000, 0.001),
        ("100 GeV, 100 MeV LNV", 100, 0.1),
        ("10 TeV, 1 GeV LNV", 1e4, 1.0),
        ("EW-scale", 174, 0.174),
        ("Sweet spot", 500, 0.05),
    ]
    
    for name, M_val, mu_val in benchmarks:
        m_D_val = calculate_dirac_mass(m_heavy, M_val, mu_val)
        Y_val = calculate_yukawa(m_D_val)
        
        print(f"\n{name}:")
        print(f"  M = {M_val:.2e} GeV,  μ = {mu_val:.2e} GeV")
        print(f"  m_D = {m_D_val:.3f} GeV,  Yukawa Y = {Y_val:.3e}")
        
        # Check LFV constraints
        lfv_results = check_LFV_constraints(m_heavy, M_val, mu_val, verbose=False)
        
        print(f"  BR(μ→eγ) = {lfv_results['mu_e_gamma']['value']:.2e}  " +
              f"{'❌' if lfv_results['mu_e_gamma']['excluded'] else '✓'}")
        print(f"  BR(h→μτ) = {lfv_results['h_mu_tau']['value']:.2e}  " +
              f"{'❌' if lfv_results['h_mu_tau']['excluded'] else '✓'}")
        print(f"  BR(μ→3e) = {lfv_results['mu_3e']['value']:.2e}  " +
              f"{'❌' if lfv_results['mu_3e']['excluded'] else '✓'}")
        
        any_excluded = any(obs['excluded'] for obs in lfv_results.values())
        print(f"  Overall: {'❌ EXCLUDED' if any_excluded else '✓ PHENOMENOLOGICALLY VIABLE'}")
    
    print("\n" + "="*80)
    
    return fig, (m1, m2, m3), LFV_grids


if __name__ == "__main__":
    print("="*80)
    print("INVERSE SEESAW PARAMETER SPACE WITH LFV CONSTRAINTS")
    print("="*80)
    print("\nExperimental inputs:")
    print(f"Δm²_21 = {delta_m21_sq:.3e} eV²")
    print(f"Δm²_31 (NO) = {delta_m31_sq_NO:.3e} eV²")
    print(f"Electroweak scale v = {v_ew} GeV")
    print("\nLFV bounds:")
    print(f"BR(μ→eγ) < {BR_MU_E_GAMMA_BOUND:.2e} (MEG II)")
    print(f"BR(h→μτ) < {BR_H_MU_TAU_BOUND:.2e} (CMS/ATLAS)")
    print("\n")
    
    # Run the integrated scan
    fig, masses, LFV_grids = scan_parameter_space_with_LFV(
        hierarchy='NH', 
        m_lightest=0.0,
        save_prefix='ISS_LFV_scan_NH'
    )
    
    # Save figure
    filename = 'ISS_with_LFV_constraints_NH.png'
    plt.savefig(filename, dpi=150, bbox_inches='tight')
    print(f"\nPlot saved as '{filename}'")
    
    print("\nTo scan inverted hierarchy, use:")
    print("fig, masses, LFV_grids = scan_parameter_space_with_LFV(hierarchy='IH', m_lightest=0.0)")
    
    plt.show()
