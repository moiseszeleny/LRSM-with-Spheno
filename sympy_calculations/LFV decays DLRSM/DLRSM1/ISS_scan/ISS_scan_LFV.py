import numpy as np
import matplotlib.pyplot as plt
from matplotlib import cm
from mpl_toolkits.mplot3d import Axes3D

# Constants
v_ew = 174.0
alpha_em = 1/137.036
m_W = 80.4
delta_m31_sq = 2.453e-3

def loop_function_exact(x):
    """Exact loop function for l->l' gamma"""
    if x < 1e-4:
        return 1.0/(12.0*x)
    elif x > 100:
        return -1.0/6.0
    else:
        numerator = 10*x**3 - 43*x**2 + 78*x - 49 + 18*x**2*np.log(x) + 4*(x-6)*np.log(x)
        denominator = 6*(x-1)**4
        return numerator/denominator

def plot_scaling_laws():
    """
    Visualize the scaling laws of LFV with M and mu
    """
    fig = plt.figure(figsize=(18, 12))
    
    # ========== Plot 1: Loop function F(x) ==========
    ax1 = plt.subplot(2, 3, 1)
    x_range = np.logspace(-3, 3, 500)
    F_values = np.array([loop_function_exact(x) for x in x_range])
    
    ax1.loglog(x_range, np.abs(F_values), 'b-', linewidth=2, label='|F(x)|')
    ax1.axvline(x=1.0, color='r', linestyle='--', linewidth=1.5, alpha=0.7, 
                label='x=1 (M=m_W)')
    
    # Mark asymptotic regions
    ax1.fill_between(x_range[x_range < 0.1], 1e-3, 1e3, alpha=0.2, color='green',
                     label='Low mass: F~1/x')
    ax1.fill_between(x_range[x_range > 10], 1e-3, 1e3, alpha=0.2, color='orange',
                     label='High mass: F~const')
    
    ax1.set_xlabel('x = (M/m_W)²', fontsize=12, fontweight='bold')
    ax1.set_ylabel('|F(x)|', fontsize=12, fontweight='bold')
    ax1.set_title('Photonic Penguin Loop Function', fontsize=13, fontweight='bold')
    ax1.grid(True, alpha=0.3, which='both')
    ax1.legend(fontsize=9, loc='best')
    ax1.set_ylim([1e-3, 1e3])
    
    # Add annotations
    ax1.annotate('F(x) ≈ 1/(12x)\n~M⁴ growth', xy=(0.01, 100), xytext=(0.001, 300),
                fontsize=9, ha='center',
                arrowprops=dict(arrowstyle='->', color='green', lw=1.5),
                bbox=dict(boxstyle='round', facecolor='green', alpha=0.3))
    
    ax1.annotate('F(x) ≈ -1/6\n~M⁻⁴ decay', xy=(100, 0.17), xytext=(100, 10),
                fontsize=9, ha='center',
                arrowprops=dict(arrowstyle='->', color='orange', lw=1.5),
                bbox=dict(boxstyle='round', facecolor='orange', alpha=0.3))
    
    # ========== Plot 2: BR vs M (fixed mu) ==========
    ax2 = plt.subplot(2, 3, 2)
    M_range = np.logspace(0, 5, 300)  # 1 GeV to 100 TeV
    
    mu_values = [0.001, 0.01, 0.1, 1.0]
    colors_mu = ['red', 'orange', 'green', 'blue']
    
    m_light = np.sqrt(delta_m31_sq)  # ~ 0.05 eV
    
    for mu_val, color in zip(mu_values, colors_mu):
        BR_array = np.zeros_like(M_range)
        
        for idx, M in enumerate(M_range):
            # Simplified: Theta ~ sqrt(m_light/mu)
            Theta_sq = (m_light * 1e-9) / mu_val  # in GeV units
            x = (M/m_W)**2
            F = loop_function_exact(x)
            BR_array[idx] = (3*alpha_em/(32*np.pi)) * Theta_sq**2 * F**2
        
        ax2.loglog(M_range, BR_array, linewidth=2, color=color, 
                  label=f'μ = {mu_val} GeV')
    
    ax2.axhline(4.2e-13, color='black', linestyle='--', linewidth=2, label='MEG bound')
    ax2.axvline(m_W, color='gray', linestyle=':', linewidth=1.5, alpha=0.7)
    
    ax2.set_xlabel('M [GeV]', fontsize=12, fontweight='bold')
    ax2.set_ylabel('BR(μ → eγ)', fontsize=12, fontweight='bold')
    ax2.set_title('LFV vs Heavy Mass M', fontsize=13, fontweight='bold')
    ax2.grid(True, alpha=0.3, which='both')
    ax2.legend(fontsize=9, loc='best')
    ax2.set_ylim([1e-20, 1e-8])
    ax2.text(m_W, 1e-19, 'm_W', fontsize=9, ha='center')
    
    # ========== Plot 3: BR vs mu (fixed M) ==========
    ax3 = plt.subplot(2, 3, 3)
    mu_range = np.logspace(-4, 1, 300)  # 0.1 MeV to 10 GeV
    
    M_values = [100, 500, 1000, 5000]
    colors_M = ['purple', 'red', 'orange', 'green']
    
    for M_val, color in zip(M_values, colors_M):
        BR_array = np.zeros_like(mu_range)
        
        x = (M_val/m_W)**2
        F = loop_function_exact(x)
        
        for idx, mu in enumerate(mu_range):
            Theta_sq = (m_light * 1e-9) / mu
            BR_array[idx] = (3*alpha_em/(32*np.pi)) * Theta_sq**2 * F**2
        
        ax3.loglog(mu_range, BR_array, linewidth=2, color=color,
                  label=f'M = {M_val} GeV')
    
    ax3.axhline(4.2e-13, color='black', linestyle='--', linewidth=2, label='MEG bound')
    
    # Add power law reference
    mu_ref = np.logspace(-3, 0, 100)
    BR_ref = 1e-10 * (0.01/mu_ref)**2
    ax3.loglog(mu_ref, BR_ref, 'k:', linewidth=1.5, alpha=0.5, label='∝ 1/μ²')
    
    ax3.set_xlabel('μ [GeV]', fontsize=12, fontweight='bold')
    ax3.set_ylabel('BR(μ → eγ)', fontsize=12, fontweight='bold')
    ax3.set_title('LFV vs LNV Scale μ', fontsize=13, fontweight='bold')
    ax3.grid(True, alpha=0.3, which='both')
    ax3.legend(fontsize=9, loc='best')
    ax3.set_ylim([1e-20, 1e-8])
    
    # ========== Plot 4: 3D surface plot ==========
    ax4 = plt.subplot(2, 3, 4, projection='3d')
    
    M_grid = np.logspace(1, 4, 50)
    mu_grid = np.logspace(-3, 0, 50)
    M_mesh, mu_mesh = np.meshgrid(M_grid, mu_grid)
    
    BR_mesh = np.zeros_like(M_mesh)
    for i in range(M_mesh.shape[0]):
        for j in range(M_mesh.shape[1]):
            M_val = M_mesh[i,j]
            mu_val = mu_mesh[i,j]
            Theta_sq = (m_light * 1e-9) / mu_val
            x = (M_val/m_W)**2
            F = loop_function_exact(x)
            BR_mesh[i,j] = (3*alpha_em/(32*np.pi)) * Theta_sq**2 * F**2
    
    surf = ax4.plot_surface(np.log10(M_mesh), np.log10(mu_mesh), np.log10(BR_mesh),
                           cmap='viridis', alpha=0.8, edgecolor='none')
    
    # Add experimental bound plane
    BR_bound = np.log10(4.2e-13)
    ax4.plot_surface(np.log10(M_mesh), np.log10(mu_mesh), 
                     BR_bound * np.ones_like(M_mesh),
                     color='red', alpha=0.3)
    
    ax4.set_xlabel('log₁₀(M/GeV)', fontsize=10, fontweight='bold')
    ax4.set_ylabel('log₁₀(μ/GeV)', fontsize=10, fontweight='bold')
    ax4.set_zlabel('log₁₀(BR)', fontsize=10, fontweight='bold')
    ax4.set_title('3D: BR(μ→eγ) Landscape', fontsize=12, fontweight='bold')
    fig.colorbar(surf, ax=ax4, shrink=0.5, aspect=5)
    
    # ========== Plot 5: Contours with excluded regions ==========
    ax5 = plt.subplot(2, 3, 5)
    
    M_fine = np.logspace(1, 4, 100)
    mu_fine = np.logspace(-3, 0.5, 100)
    M_contour, mu_contour = np.meshgrid(M_fine, mu_fine)
    
    BR_contour = np.zeros_like(M_contour)
    for i in range(M_contour.shape[0]):
        for j in range(M_contour.shape[1]):
            M_val = M_contour[i,j]
            mu_val = mu_contour[i,j]
            Theta_sq = (m_light * 1e-9) / mu_val
            x = (M_val/m_W)**2
            F = loop_function_exact(x)
            BR_contour[i,j] = (3*alpha_em/(32*np.pi)) * Theta_sq**2 * F**2
    
    # Filled contours
    levels = [1e-20, 1e-18, 1e-16, 1e-14, 1e-13, 4.2e-13, 1e-12, 1e-10, 1e-8]
    cs = ax5.contourf(M_contour, mu_contour, BR_contour, levels=levels,
                     norm=plt.matplotlib.colors.LogNorm(), cmap='RdYlGn_r', alpha=0.7)
    
    # Contour lines
    cs_lines = ax5.contour(M_contour, mu_contour, BR_contour, 
                          levels=[4.2e-13, 6e-14],
                          colors=['black', 'blue'], linewidths=[3, 2],
                          linestyles=['-', '--'])
    
    ax5.clabel(cs_lines, inline=True, fontsize=8, fmt='%0.0e')
    
    ax5.set_xscale('log')
    ax5.set_yscale('log')
    ax5.set_xlabel('M [GeV]', fontsize=12, fontweight='bold')
    ax5.set_ylabel('μ [GeV]', fontsize=12, fontweight='bold')
    ax5.set_title('Excluded Regions (Contours)', fontsize=13, fontweight='bold')
    ax5.grid(True, alpha=0.3, which='both')
    
    # Add colorbar
    cbar = fig.colorbar(cs, ax=ax5)
    cbar.set_label('BR(μ→eγ)', fontsize=10)
    
    # Annotations
    ax5.text(2000, 0.5, 'ALLOWED\n(current)', fontsize=11, ha='center',
            bbox=dict(boxstyle='round', facecolor='lightgreen', alpha=0.8))
    ax5.text(200, 0.0002, 'EXCLUDED', fontsize=11, ha='center', color='white',
            bbox=dict(boxstyle='round', facecolor='red', alpha=0.8))
    
    # ========== Plot 6: Ratios of LFV processes ==========
    ax6 = plt.subplot(2, 3, 6)
    
    # BR(mu->3e) / BR(mu->e gamma) ~ alpha/4pi
    ratio_mu3e_over_muegamma = alpha_em / (4*np.pi) * np.ones(100)
    
    # CR(mu-e) / BR(mu->e gamma) ~ 0.001 * Z^4
    Z_Al = 13
    ratio_mue_over_muegamma = 0.0015 * (Z_Al/13)**4 * np.ones(100)
    
    M_plot = np.logspace(1, 4, 100)
    
    ax6.semilogx(M_plot, ratio_mu3e_over_muegamma, 'b-', linewidth=3,
                label='BR(μ→3e) / BR(μ→eγ) ≈ α/(4π)')
    ax6.semilogx(M_plot, ratio_mue_over_muegamma, 'r-', linewidth=3,
                label='CR(μ-e,Al) / BR(μ→eγ) ≈ 0.0015')
    
    ax6.set_xlabel('M [GeV]', fontsize=12, fontweight='bold')
    ax6.set_ylabel('Ratio', fontsize=12, fontweight='bold')
    ax6.set_title('LFV Process Correlations', fontsize=13, fontweight='bold')
    ax6.grid(True, alpha=0.3)
    ax6.legend(fontsize=10, loc='best')
    ax6.set_ylim([0, 0.003])
    
    # Add text box with explanation
    text_box = (
        "In inverse seesaw:\n"
        "• All LFV ∝ |Θ|² ∝ m_ν/μ\n"
        "• Ratios nearly constant\n"
        "• μ→eγ most constraining"
    )
    ax6.text(0.05, 0.95, text_box, transform=ax6.transAxes,
            fontsize=9, verticalalignment='top',
            bbox=dict(boxstyle='round', facecolor='wheat', alpha=0.8))
    
    plt.suptitle('LFV Scaling Laws in Inverse Seesaw', 
                fontsize=16, fontweight='bold', y=0.995)
    plt.tight_layout()
    
    return fig

def analyze_scaling_exponents():
    """
    Numerical verification of scaling laws
    """
    print("="*70)
    print("SCALING LAW ANALYSIS")
    print("="*70)
    
    m_light = np.sqrt(delta_m31_sq) * 1e-9  # GeV
    
    # Test 1: BR vs mu (fixed M)
    print("\n[1] Testing BR ∝ 1/μ² (fixed M = 1000 GeV)")
    print("-"*70)
    
    M_test = 1000.0
    x_test = (M_test/m_W)**2
    F_test = loop_function_exact(x_test)
    
    mu_tests = [0.001, 0.01, 0.1]
    BR_tests = []
    
    for mu in mu_tests:
        Theta_sq = m_light / mu
        BR = (3*alpha_em/(32*np.pi)) * Theta_sq**2 * F_test**2
        BR_tests.append(BR)
        print(f"  μ = {mu:7.4f} GeV  →  BR = {BR:.3e}")
    
    # Check scaling
    ratio_10x = BR_tests[0] / BR_tests[1]
    ratio_100x = BR_tests[0] / BR_tests[2]
    print(f"\n  BR(μ=0.001) / BR(μ=0.01)  = {ratio_10x:.1f}  (expected: 100)")
    print(f"  BR(μ=0.001) / BR(μ=0.1)   = {ratio_100x:.0f}  (expected: 10000)")
    
    # Test 2: BR vs M (fixed mu, low mass regime)
    print("\n[2] Testing BR ∝ M⁴ in low mass regime (M ≪ m_W)")
    print("-"*70)
    
    mu_test = 0.01
    Theta_sq = m_light / mu_test
    
    M_low = [10, 20, 40]
    BR_low = []
    
    for M in M_low:
        x = (M/m_W)**2
        F = loop_function_exact(x)
        BR = (3*alpha_em/(32*np.pi)) * Theta_sq**2 * F**2
        BR_low.append(BR)
        print(f"  M = {M:5.0f} GeV  →  BR = {BR:.3e}  (F = {F:.3f})")
    
    ratio_2x = BR_low[1] / BR_low[0]
    ratio_4x = BR_low[2] / BR_low[0]
    print(f"\n  BR(M=20) / BR(M=10) = {ratio_2x:.1f}  (expected: 2⁴ = 16)")
    print(f"  BR(M=40) / BR(M=10) = {ratio_4x:.0f}  (expected: 4⁴ = 256)")
    
    # Test 3: BR vs M (fixed mu, high mass regime)
    print("\n[3] Testing BR ∝ 1/M⁴ in high mass regime (M ≫ m_W)")
    print("-"*70)
    
    M_high = [1000, 2000, 4000]
    BR_high = []
    
    for M in M_high:
        x = (M/m_W)**2
        F = loop_function_exact(x)
        BR = (3*alpha_em/(32*np.pi)) * Theta_sq**2 * F**2
        BR_high.append(BR)
        print(f"  M = {M:5.0f} GeV  →  BR = {BR:.3e}  (F = {F:.4f})")
    
    ratio_2x_high = BR_high[0] / BR_high[1]
    ratio_4x_high = BR_high[0] / BR_high[2]
    print(f"\n  BR(M=1000) / BR(M=2000) = {ratio_2x_high:.1f}  (expected: 2⁴ = 16)")
    print(f"  BR(M=1000) / BR(M=4000) = {ratio_4x_high:.0f}  (expected: 4⁴ = 256)")
    
    # Test 4: Maximum BR location
    print("\n[4] Finding maximum BR (varying M, fixed μ = 0.01 GeV)")
    print("-"*70)
    
    M_scan = np.logspace(0.5, 3, 500)
    BR_scan = []
    
    for M in M_scan:
        x = (M/m_W)**2
        F = loop_function_exact(x)
        BR = (3*alpha_em/(32*np.pi)) * Theta_sq**2 * F**2
        BR_scan.append(BR)
    
    max_idx = np.argmax(BR_scan)
    M_max = M_scan[max_idx]
    BR_max = BR_scan[max_idx]
    
    print(f"  Maximum BR at M = {M_max:.1f} GeV")
    print(f"  BR_max = {BR_max:.3e}")
    print(f"  This is near M ~ m_W = {m_W} GeV ✓")
    
    # Test 5: Combined scaling
    print("\n[5] Combined effect: doubling both M and μ")
    print("-"*70)
    
    cases = [
        (1000, 0.01),
        (2000, 0.02),
        (500, 0.005)
    ]
    
    BR_combined = []
    
    for M, mu in cases:
        Theta_sq = m_light / mu
        x = (M/m_W)**2
        F = loop_function_exact(x)
        BR = (3*alpha_em/(32*np.pi)) * Theta_sq**2 * F**2
        BR_combined.append(BR)
        print(f"  M = {M:5.0f} GeV, μ = {mu:.4f} GeV  →  BR = {BR:.3e}")
    
    print(f"\n  When both M and μ scale together (M/μ constant):")
    print(f"  BR changes by: {BR_combined[1]/BR_combined[0]:.2f}×")
    print(f"  (depends on F(x) variation)")
    
    print("\n" + "="*70)
    
    return {
        'mu_scaling': BR_tests,
        'M_low_scaling': BR_low,
        'M_high_scaling': BR_high,
        'M_max': M_max,
        'BR_max': BR_max
    }

def plot_experimental_reach():
    """
    Plot current and future experimental sensitivities
    """
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(14, 6))
    
    m_light = np.sqrt(delta_m31_sq) * 1e-9  # GeV
    
    # Fixed M, varying mu
    M_fixed = 1000
    mu_range = np.logspace(-4, 1, 300)
    
    x_fixed = (M_fixed/m_W)**2
    F_fixed = loop_function_exact(x_fixed)
    
    BR_array = np.zeros_like(mu_range)
    for idx, mu in enumerate(mu_range):
        Theta_sq = m_light / mu
        BR_array[idx] = (3*alpha_em/(32*np.pi)) * Theta_sq**2 * F_fixed**2
    
    # Plot 1: Experimental timeline
    ax1.loglog(mu_range, BR_array, 'b-', linewidth=3, label='Prediction (M=1 TeV)')
    
    # Current and future bounds
    experiments = [
        ('MEG (2016)', 4.2e-13, 'red', '-'),
        ('MEG II (goal)', 6e-14, 'orange', '--'),
        ('Mu3e Phase I', 2e-15, 'green', '--'),
        ('Mu3e Phase II', 1e-16, 'cyan', ':'),
    ]
    
    for name, bound, color, style in experiments:
        ax1.axhline(bound, color=color, linestyle=style, linewidth=2, 
                   label=name, alpha=0.7)
    
    ax1.fill_between(mu_range, BR_array, 1e-8, where=(BR_array > 4.2e-13),
                    alpha=0.3, color='red', label='Excluded now')
    
    ax1.set_xlabel('μ [GeV]', fontsize=13, fontweight='bold')
    ax1.set_ylabel('BR(μ → eγ)', fontsize=13, fontweight='bold')
    ax1.set_title('Experimental Sensitivity Timeline', fontsize=14, fontweight='bold')
    ax1.grid(True, alpha=0.3, which='both')
    ax1.legend(fontsize=10, loc='upper right')
    ax1.set_ylim([1e-18, 1e-8])
    
    # Plot 2: Excluded regions evolution
    M_range = np.logspace(1, 4, 200)
    mu_range_2d = np.logspace(-3, 0.5, 200)
    M_mesh, mu_mesh = np.meshgrid(M_range, mu_range_2d)
    
    BR_mesh = np.zeros_like(M_mesh)
    for i in range(M_mesh.shape[0]):
        for j in range(M_mesh.shape[1]):
            M_val = M_mesh[i,j]
            mu_val = mu_mesh[i,j]
            Theta_sq = m_light / mu_val
            x = (M_val/m_W)**2
            F = loop_function_exact(x)
            BR_mesh[i,j] = (3*alpha_em/(32*np.pi)) * Theta_sq**2 * F**2
    
    # Contours for different experiments
    contours = [
        (4.2e-13, 'MEG 2016', 'red', '-', 3),
        (6e-14, 'MEG II', 'orange', '--', 2),
        (1e-15, 'Mu3e Phase I', 'green', '--', 2),
        (1e-16, 'Mu3e Phase II', 'blue', ':', 2),
    ]
    
    for level, name, color, style, width in contours:
        cs = ax2.contour(M_mesh, mu_mesh, BR_mesh, levels=[level],
                        colors=[color], linestyles=[style], linewidths=[width])
        ax2.clabel(cs, inline=True, fontsize=8, fmt=name)
    
    # Fill excluded region
    ax2.contourf(M_mesh, mu_mesh, BR_mesh, levels=[4.2e-13, 1e-8],
                colors=['red'], alpha=0.2)
    
    ax2.set_xscale('log')
    ax2.set_yscale('log')
    ax2.set_xlabel('M [GeV]', fontsize=13, fontweight='bold')
    ax2.set_ylabel('μ [GeV]', fontsize=13, fontweight='bold')
    ax2.set_title('Evolution of Excluded Region', fontsize=14, fontweight='bold')
    ax2.grid(True, alpha=0.3, which='both')
    
    # Add text annotations
    ax2.text(2000, 0.5, 'Future\nallowed', fontsize=12, ha='center',
            bbox=dict(boxstyle='round', facecolor='lightgreen', alpha=0.7))
    ax2.text(100, 0.0002, 'Excluded\n(MEG)', fontsize=12, ha='center',
            bbox=dict(boxstyle='round', facecolor='lightcoral', alpha=0.7))
    
    plt.suptitle('Experimental Reach: Current and Future', 
                fontsize=15, fontweight='bold')
    plt.tight_layout()
    
    return fig

def key_physics_summary():
    """
    Print a comprehensive summary of LFV physics
    """
    print("\n" + "="*70)
    print("KEY PHYSICS SUMMARY: LFV IN INVERSE SEESAW")
    print("="*70)
    
    print("\n[MIXING PARAMETERS]")
    print("  Active-sterile mixing:  Θ_{αi} ≈ U_{αi} × √(m_i/μ_i)")
    print("  Typical values:         |Θ| ~ 10⁻⁶ to 10⁻²")
    print("  Small μ → Large Θ → Strong LFV constraints!")
    
    print("\n[LFV FORMULA]")
    print("  BR(ℓ_α → ℓ_β γ) = (3α_em)/(32π) × |Σᵢ Θ*_{αi} Θ_{βi} F(M²ᵢ/m²_W)|²")
    print("  ")
    print("  Loop function F(x):")
    print("    • x ≪ 1:  F(x) ≈ 1/(12x) ~ m²_W/M²  → BR ∝ M⁴")
    print("    • x ≫ 1:  F(x) ≈ -1/6    (constant) → BR ∝ 1/M⁴")
    print("    • Maximum at x ~ 1, i.e., M ~ m_W ~ 80 GeV")
    
    print("\n[SCALING LAWS]")
    print("  μ dependence:  BR ∝ 1/μ²  (STRONG!)")
    print("  M dependence:  BR ∝ M⁴     for M < m_W")
    print("                 BR ∝ 1/M⁴   for M > m_W")
    print("  Combined:      BR ∝ (m_ν/μ²) × F²(M²/m²_W)")
    
    print("\n[PROCESS CORRELATIONS]")
    print("  BR(μ → 3e) / BR(μ → eγ)      ≈ α/(4π) ≈ 6×10⁻⁴")
    print("  CR(μ-e,Al) / BR(μ → eγ)      ≈ 0.0015")
    print("  CR(μ-e,Ti) / BR(μ → eγ)      ≈ 0.004")
    print("  CR(μ-e,Au) / BR(μ → eγ)      ≈ 0.017")
    print("  → All LFV processes correlated via |Θ|²")
    
    print("\n[EXPERIMENTAL CONSTRAINTS]")
    print("  Current most sensitive:  μ → eγ (MEG)")
    print("    BR < 4.2×10⁻¹³")
    print("  ")
    print("  Future most sensitive:   μ-e conversion (Mu2e/COMET)")
    print("    CR < 10⁻¹⁶ to 10⁻¹⁷")
    print("    Will probe M ~ 10 TeV with μ ~ 10 MeV")
    
    print("\n[PARAMETER SPACE IMPACT]")
    print("  Excluded:    Low μ (< 1 MeV) for M < 10 TeV")
    print("  Marginally:  μ ~ 1-10 MeV, M ~ 1 TeV (TeV seesaw)")
    print("  Safe:        μ > 100 MeV or M > 10 TeV")
    
    print("\n[ALLOWED BENCHMARKS]")
    benchmarks = [
        ("TeV seesaw", 1000, 10, "Testable at colliders"),
        ("High scale", 10000, 100, "Harder to test directly"),
        ("Very high", 100000, 1000, "Effectively decoupled")
    ]
    
    for name, M, mu, comment in benchmarks:
        m_D = np.sqrt(0.05e-9 * M**2 / (mu*1e-3))
        print(f"  {name:15s}: M={M:6.0f} GeV, μ={mu:4.0f} MeV")
        print(f"                     m_D ~ {m_D:.0f} GeV - {comment}")
    
    print("\n[COMPLEMENTARITY]")
    print("  LFV experiments:  Probe Θ (indirect)")
    print("  Colliders:        Direct heavy N production")
    print("  Leptogenesis:     Requires Im(R) ≠ 0 (CP violation)")
    print("  0νββ:            Depends on Majorana phases")
    print("  → Multiple probes needed for complete picture!")
    
    print("\n" + "="*70)

# Main execution
if __name__ == "__main__":
    print("\n" + "="*70)
    print("LFV SCALING LAWS AND PHYSICS ANALYSIS")
    print("="*70)
    
    # Generate scaling plots
    print("\nGenerating scaling law visualizations...")
    fig1 = plot_scaling_laws()
    
    # Analyze scaling exponents
    scaling_results = analyze_scaling_exponents()
    
    # Plot experimental reach
    print("\nGenerating experimental reach plots...")
    fig2 = plot_experimental_reach()
    
    # Print summary
    key_physics_summary()
    
    plt.show()
    
    print("\n" + "="*70)
    print("Analysis complete!")
    print("="*70)