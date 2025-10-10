import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import LogNorm
import matplotlib.patches as mpatches

# Physical constants and experimental data
# Neutrino mass-squared differences (PDG 2024)
delta_m21_sq = 7.53e-5  # eV^2 (solar)
delta_m31_sq_NO = 2.453e-3  # eV^2 (atmospheric, normal ordering)
delta_m31_sq_IO = -2.546e-3  # eV^2 (inverted ordering)

# Cosmological bound on sum of masses
sum_mass_upper = 0.12  # eV (Planck 2018)

# Electroweak scale
v_ew = 174.0  # GeV (Higgs VEV)

def calculate_light_masses_NH(m_lightest):
    """
    Calculate light neutrino masses for Normal Hierarchy
    m1 < m2 < m3
    """
    m1 = m_lightest
    m2 = np.sqrt(m1**2 + delta_m21_sq)
    m3 = np.sqrt(m1**2 + delta_m31_sq_NO)
    return m1, m2, m3

def calculate_light_masses_IH(m_lightest):
    """
    Calculate light neutrino masses for Inverted Hierarchy
    m3 < m1 < m2
    """
    m3 = m_lightest
    m1 = np.sqrt(m3**2 - delta_m31_sq_IO)
    m2 = np.sqrt(m1**2 + delta_m21_sq)
    return m1, m2, m3

def calculate_dirac_mass(m_light, M, mu):
    """
    Calculate required Dirac mass from inverse seesaw formula:
    m_light = m_D^2 * mu / M^2
    
    Therefore: m_D = sqrt(m_light * M^2 / mu)
    
    Parameters:
    -----------
    m_light : float or array
        Light neutrino mass in eV
    M : float or array
        Heavy Majorana mass in GeV
    mu : float or array
        LNV parameter in GeV
    
    Returns:
    --------
    m_D : Dirac mass in GeV
    """
    # Convert m_light from eV to GeV
    m_light_GeV = m_light * 1e-9
    
    # m_D = sqrt(m_light * M^2 / mu)
    m_D = np.sqrt(m_light_GeV * M**2 / mu)
    
    return m_D

def calculate_yukawa(m_D):
    """
    Calculate Yukawa coupling: Y = m_D / v
    """
    return m_D / v_ew

def scan_parameter_space(hierarchy='NH', m_lightest=0.0):
    """
    Scan (mu, M) parameter space for inverse seesaw
    
    Parameters:
    -----------
    hierarchy : str
        'NH' for normal hierarchy, 'IH' for inverted hierarchy
    m_lightest : float
        Lightest neutrino mass in eV (default: 0 for minimal mass)
    """
    
    # Calculate light neutrino masses
    if hierarchy == 'NH':
        m1, m2, m3 = calculate_light_masses_NH(m_lightest)
        print(f"Normal Hierarchy: m1={m1:.4e} eV, m2={m2:.4e} eV, m3={m3:.4e} eV")
    else:
        m1, m2, m3 = calculate_light_masses_IH(m_lightest)
        print(f"Inverted Hierarchy: m1={m1:.4e} eV, m2={m2:.4e} eV, m3={m3:.4e} eV")
    
    print(f"Sum of masses: {m1+m2+m3:.4e} eV")
    
    # Create parameter grid
    # M range: 1 GeV to 10^6 GeV (TeV to GUT scale)
    M_range = np.logspace(0, 6, 200)  # GeV
    
    # mu range: 10^-6 GeV (keV) to 10^3 GeV (TeV)
    mu_range = np.logspace(-6, 3, 200)  # GeV
    
    M_grid, mu_grid = np.meshgrid(M_range, mu_range)
    
    # Calculate Dirac masses for each generation
    # We'll focus on the heaviest neutrino (m3 for NH, m2 for IH)
    m_heavy = m3 if hierarchy == 'NH' else m2
    m_D_grid = calculate_dirac_mass(m_heavy, M_grid, mu_grid)
    
    # Calculate Yukawa couplings
    Y_grid = calculate_yukawa(m_D_grid)
    
    # Create figure with subplots
    fig, axes = plt.subplots(2, 2, figsize=(14, 12))
    
    # Plot 1: Dirac mass m_D
    ax1 = axes[0, 0]
    im1 = ax1.contourf(M_grid, mu_grid, m_D_grid, levels=50, 
                       norm=LogNorm(vmin=1e-3, vmax=1e4), cmap='viridis')
    ax1.contour(M_grid, mu_grid, m_D_grid, levels=[0.1, 1, 10, 100, 1000], 
                colors='white', linewidths=0.5, alpha=0.5)
    ax1.set_xscale('log')
    ax1.set_yscale('log')
    ax1.set_xlabel('M [GeV]', fontsize=12)
    ax1.set_ylabel('μ [GeV]', fontsize=12)
    ax1.set_title(f'Dirac Mass $m_D$ [GeV] ({hierarchy})', fontsize=13)
    ax1.grid(True, alpha=0.3)
    cbar1 = plt.colorbar(im1, ax=ax1)
    cbar1.set_label('$m_D$ [GeV]', fontsize=11)
    
    # Add reference lines
    ax1.axhline(y=v_ew, color='red', linestyle='--', linewidth=1.5, 
                label='μ = v_EW', alpha=0.7)
    ax1.axvline(x=v_ew, color='orange', linestyle='--', linewidth=1.5, 
                label='M = v_EW', alpha=0.7)
    ax1.legend(fontsize=9)
    
    # Plot 2: Yukawa coupling
    ax2 = axes[0, 1]
    im2 = ax2.contourf(M_grid, mu_grid, Y_grid, levels=50,
                       norm=LogNorm(vmin=1e-8, vmax=10), cmap='plasma')
    
    # Add perturbativity bound Y < 4π ≈ 12.6
    ax2.contour(M_grid, mu_grid, Y_grid, levels=[1.0], 
                colors='white', linewidths=2, linestyles='--')
    ax2.contour(M_grid, mu_grid, Y_grid, levels=[4*np.pi], 
                colors='red', linewidths=2, linestyles='-')
    
    ax2.set_xscale('log')
    ax2.set_yscale('log')
    ax2.set_xlabel('M [GeV]', fontsize=12)
    ax2.set_ylabel('μ [GeV]', fontsize=12)
    ax2.set_title(f'Yukawa Coupling Y = $m_D$/v ({hierarchy})', fontsize=13)
    ax2.grid(True, alpha=0.3)
    cbar2 = plt.colorbar(im2, ax=ax2)
    cbar2.set_label('Yukawa Y', fontsize=11)
    
    # Add legend for contours
    white_patch = mpatches.Patch(color='white', label='Y = 1')
    red_line = mpatches.Patch(color='red', label='Y = 4π (perturbativity)')
    ax2.legend(handles=[white_patch, red_line], fontsize=9, loc='upper right')
    
    # Plot 3: Effective scale Lambda = M^2/mu
    Lambda_grid = M_grid**2 / mu_grid
    ax3 = axes[1, 0]
    im3 = ax3.contourf(M_grid, mu_grid, Lambda_grid, levels=50,
                       norm=LogNorm(vmin=1e3, vmax=1e15), cmap='coolwarm')
    ax3.contour(M_grid, mu_grid, Lambda_grid, 
                levels=[1e6, 1e9, 1e12, 1e15], 
                colors='black', linewidths=0.5, alpha=0.5)
    ax3.set_xscale('log')
    ax3.set_yscale('log')
    ax3.set_xlabel('M [GeV]', fontsize=12)
    ax3.set_ylabel('μ [GeV]', fontsize=12)
    ax3.set_title(r'Effective Scale $\Lambda = M^2/\mu$ [GeV]', fontsize=13)
    ax3.grid(True, alpha=0.3)
    cbar3 = plt.colorbar(im3, ax=ax3)
    cbar3.set_label(r'$\Lambda$ [GeV]', fontsize=11)
    
    # Plot 4: Allowed regions based on different constraints
    ax4 = axes[1, 1]
    
    # Define regions
    # Region 1: Perturbative Yukawa (Y < 4π)
    perturbative = Y_grid < 4*np.pi
    
    # Region 2: Natural m_D (0.1 GeV < m_D < 10 TeV)
    natural_mD = (m_D_grid > 0.1) & (m_D_grid < 1e4)
    
    # Region 3: TeV-scale physics (100 GeV < M < 10 TeV)
    tev_scale = (M_grid > 100) & (M_grid < 1e4)
    
    # Region 4: Small LNV (mu < 1 GeV)
    small_LNV = mu_grid < 1.0
    
    # Combine constraints
    allowed = perturbative.astype(int)
    allowed += natural_mD.astype(int)
    allowed += tev_scale.astype(int)
    allowed += small_LNV.astype(int)
    
    im4 = ax4.contourf(M_grid, mu_grid, allowed, levels=[0, 1, 2, 3, 4],
                       colors=['darkred', 'red', 'yellow', 'lightgreen', 'darkgreen'],
                       alpha=0.6)
    ax4.set_xscale('log')
    ax4.set_yscale('log')
    ax4.set_xlabel('M [GeV]', fontsize=12)
    ax4.set_ylabel('μ [GeV]', fontsize=12)
    ax4.set_title('Number of Constraints Satisfied', fontsize=13)
    ax4.grid(True, alpha=0.3)
    
    # Add colorbar with labels
    cbar4 = plt.colorbar(im4, ax=ax4, ticks=[0, 1, 2, 3, 4])
    cbar4.set_label('Constraints satisfied', fontsize=11)
    
    # Add text annotations for interesting regions
    ax4.text(500, 0.01, 'TeV Seesaw\nRegion', fontsize=10, 
             bbox=dict(boxstyle='round', facecolor='white', alpha=0.8),
             ha='center')
    
    plt.tight_layout()
    
    # Print some benchmark points
    print("\n" + "="*60)
    print("BENCHMARK POINTS")
    print("="*60)
    
    benchmarks = [
        ("TeV-scale, keV LNV", 1000, 0.001),
        ("100 GeV, MeV LNV", 100, 0.1),
        ("10 TeV, GeV LNV", 1e4, 1.0),
        ("EW-scale", 174, 0.174),
    ]
    
    for name, M_val, mu_val in benchmarks:
        m_D_val = calculate_dirac_mass(m_heavy, M_val, mu_val)
        Y_val = calculate_yukawa(m_D_val)
        Lambda_val = M_val**2 / mu_val
        
        print(f"\n{name}:")
        print(f"  M = {M_val:.2e} GeV,  μ = {mu_val:.2e} GeV")
        print(f"  m_D = {m_D_val:.3f} GeV")
        print(f"  Yukawa Y = {Y_val:.3e}")
        print(f"  Λ = M²/μ = {Lambda_val:.2e} GeV")
        print(f"  Perturbative: {Y_val < 4*np.pi}")
    
    return fig, (m1, m2, m3)

# Run the scan
print("="*60)
print("INVERSE SEESAW PARAMETER SPACE SCANNER")
print("="*60)
print("\nExperimental inputs:")
print(f"Δm²_21 = {delta_m21_sq:.3e} eV²")
print(f"Δm²_31 (NO) = {delta_m31_sq_NO:.3e} eV²")
print(f"Electroweak scale v = {v_ew} GeV")
print("\n")

# Scan for normal hierarchy with minimal mass (m1 ≈ 0)
fig_NH, masses_NH = scan_parameter_space(hierarchy='NH', m_lightest=0.0)
plt.savefig('inverse_seesaw_scan_NH.png', dpi=150, bbox_inches='tight')

print("\n" + "="*60)
print("\nPlot saved as 'inverse_seesaw_scan_NH.png'")
print("\nTo scan inverted hierarchy, use:")
print("fig_IH, masses_IH = scan_parameter_space(hierarchy='IH', m_lightest=0.0)")

plt.show()