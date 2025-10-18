"""
Targeted parameter scan for neutral Higgs masses in the DLRSM.
This version uses physics-motivated parameter ranges to find valid points more efficiently.
"""

import numpy as np
import time

higgs_sm_mass = 125.20  # GeV, SM Higgs mass from PDG 2025
higgs_sm_mass_min = higgs_sm_mass - 0.11
higgs_sm_mass_max = higgs_sm_mass + 0.11
k1_value = 246.0        # GeV, SM Higgs VEV
vR_value = 1e5          # GeV, Right-handed VEV (can be varied)

# Precompute constants
k1_squared = k1_value**2
vR_squared = vR_value**2


def compute_masses(alpha1, alpha2, alpha3, rho1, rho2, lamb1, lamb2, lamb3, lamb4, lamb5, lamb6, vR=vR_value):
    """Compute all four neutral Higgs masses"""
    k1_sq = k1_value**2
    vR_sq = vR**2
    
    alpha13 = alpha1 + alpha3
    alpha23 = alpha2 - alpha3
    
    mH10_sq = (8*(lamb1 + lamb2) - 2*alpha13**2/rho1) * k1_sq
    mH20_sq = 8*rho1*vR_sq + (4*alpha13**2/rho1)*k1_sq
    mH30_sq = 2*alpha23*vR_sq + 4*(-lamb2 + 4*lamb3 + lamb5 + lamb6)*k1_sq
    mH40_sq = 2*(rho2 + 2*rho1)*vR_sq
    
    # Return None if any mass squared is negative
    if mH10_sq <= 0 or mH20_sq <= 0 or mH30_sq <= 0 or mH40_sq <= 0:
        return None, None, None, None
    
    return np.sqrt(mH10_sq), np.sqrt(mH20_sq), np.sqrt(mH30_sq), np.sqrt(mH40_sq)


def scan_targeted(n_samples=1000000, max_valid=1000, seed=42, vR_range=(1e4, 1e6), batch_size=5_000_000):
    """
    Targeted scan with physics-motivated parameter ranges.
    Uses batching to avoid memory issues.
    
    Key insight: To get mH10 ~ 125 GeV, we need lamb1 + lamb2 to be small
    since mH10^2 = 8(lamb1 + lamb2)k1^2 - 2*alpha13^2/rho1 * k1^2
    
    For mH10 ~ 125 GeV: 8(lamb1 + lamb2) - 2*alpha13^2/rho1 ~ 125^2/246^2 ~ 0.26
    """
    np.random.seed(seed)
    
    print(f"Starting targeted Monte Carlo scan with {n_samples:,} samples (batch size: {batch_size:,})...")
    print(f"Target: mH10 ≈ {higgs_sm_mass} GeV")
    print(f"vR range: [{vR_range[0]:.0e}, {vR_range[1]:.0e}] GeV")
    
    n_batches = (n_samples + batch_size - 1) // batch_size
    valid_points_all = []
    total_physical = 0
    total_processed = 0
    
    for batch_idx in range(n_batches):
        batch_start = batch_idx * batch_size
        batch_end = min((batch_idx + 1) * batch_size, n_samples)
        current_batch_size = batch_end - batch_start
        
        if batch_idx > 0:
            print(f"\nBatch {batch_idx + 1}/{n_batches}: Processing samples {batch_start:,} to {batch_end:,}...")
        
        # Sample vR values (can vary the scale)
        vR_values = np.random.uniform(vR_range[0], vR_range[1], current_batch_size)
    
        # For mH10 ~ 125 GeV, we need (lamb1 + lamb2) to be small
        # Let's target the right ballpark
        target_value = (higgs_sm_mass / k1_value)**2  # ~ 0.26
        
        # Sample parameters with physics-motivated ranges
        # Keep alpha parameters moderate
        alpha1 = np.random.uniform(0.01, 2.0, current_batch_size)
        alpha2 = np.random.uniform(0.01, 2.0, current_batch_size)
        alpha3 = np.random.uniform(-2.0, 2.0, current_batch_size)
        
        # rho parameters affect heavy Higgs masses
        # Smaller rho1 gives smaller mH20 and mH40
        rho1 = np.random.uniform(0.01, 1.0, current_batch_size)
        rho2 = np.random.uniform(0.01, 1.0, current_batch_size)
        
        # Lambda parameters: need lamb1 + lamb2 small, but individual values can vary
        # Strategy: sample lamb1 + lamb2 around target, then split randomly
        lambda_sum = np.random.normal(target_value / 8, target_value / 16, current_batch_size)
        split_ratio = np.random.uniform(0, 1, current_batch_size)
        lamb1 = lambda_sum * split_ratio
        lamb2 = lambda_sum * (1 - split_ratio)
        
        # Other lambdas affect mH30
        lamb3 = np.random.uniform(0.01, 1.0, current_batch_size)
        lamb4 = np.random.uniform(0.01, 1.0, current_batch_size)
        lamb5 = np.random.uniform(0.01, 1.0, current_batch_size)
        lamb6 = np.random.uniform(0.01, 1.0, current_batch_size)
        
        # Compute derived parameters
        alpha13 = alpha1 + alpha3
        alpha23 = alpha2 - alpha3
        
        # Compute mass squares (vectorized)
        k1_sq_arr = k1_value**2
        vR_sq_arr = vR_values**2
        
        mH10_sq = (8*(lamb1 + lamb2) - 2*alpha13**2/rho1) * k1_sq_arr
        mH20_sq = 8*rho1*vR_sq_arr + (4*alpha13**2/rho1)*k1_sq_arr
        mH30_sq = 2*alpha23*vR_sq_arr + 4*(-lamb2 + 4*lamb3 + lamb5 + lamb6)*k1_sq_arr
        mH40_sq = 2*(rho2 + 2*rho1)*vR_sq_arr
        
        # Filter for physical masses
        physical_mask = (mH10_sq > 0) & (mH20_sq > 0) & (mH30_sq > 0) & (mH40_sq > 0)
        batch_physical = np.sum(physical_mask)
        total_physical += batch_physical
        total_processed += current_batch_size
        
        if batch_physical == 0:
            continue
        
        # Compute masses
        mH10 = np.sqrt(mH10_sq[physical_mask])
        mH20 = np.sqrt(mH20_sq[physical_mask])
        mH30 = np.sqrt(mH30_sq[physical_mask])
        mH40 = np.sqrt(mH40_sq[physical_mask])
        
        # Filter for all constraints
        sm_higgs_mask = (mH10 > higgs_sm_mass_min) & (mH10 < higgs_sm_mass_max)
        h1 = mH10 < mH20
        h2 = mH20 < mH30
        h3 = mH30 < mH40
        valid_mask = sm_higgs_mask & h1 & h2 & h3
        
        batch_valid = np.sum(valid_mask)
        if batch_valid > 0:
            print(f"  Found {batch_valid} valid points in this batch!")
            
            # Extract valid points from this batch
            physical_indices = np.where(physical_mask)[0]
            valid_physical_indices = physical_indices[valid_mask]
            
            for idx in valid_physical_indices:
                valid_points_all.append((
                    alpha1[idx], alpha2[idx], alpha3[idx],
                    rho1[idx], rho2[idx],
                    lamb1[idx], lamb2[idx], lamb3[idx],
                    lamb4[idx], lamb5[idx], lamb6[idx],
                    vR_values[idx]
                ))
                
                if max_valid and len(valid_points_all) >= max_valid:
                    print(f"Reached maximum of {max_valid} valid points. Stopping scan.")
                    break
        
        if max_valid and len(valid_points_all) >= max_valid:
            break
        
        # Clean up to free memory
        del alpha1, alpha2, alpha3, rho1, rho2, lamb1, lamb2, lamb3, lamb4, lamb5, lamb6
        del vR_values, alpha13, alpha23, mH10_sq, mH20_sq, mH30_sq, mH40_sq
        del physical_mask, mH10, mH20, mH30, mH40
    
    # Final summary
    print(f"\n{'='*80}")
    print(f"Physical masses: {total_physical:,} / {total_processed:,} ({100*total_physical/total_processed:.2f}%)")
    print(f"Valid points found: {len(valid_points_all):,}")
    print(f"{'='*80}")
    
    # Show diagnostics for all valid points if any found
    if len(valid_points_all) > 0:
        print("\nComputing statistics for all valid points...")
        valid_array = np.array(valid_points_all)
        
        # Recompute masses for statistics
        all_masses = []
        for point in valid_points_all[:min(1000, len(valid_points_all))]:  # Sample for stats
            masses = compute_masses(*point[:11], vR=point[11])
            if masses[0] is not None:
                all_masses.append(masses)
        
        if all_masses:
            all_masses = np.array(all_masses)
            print(f"\nMass statistics (from {len(all_masses)} valid points):")
            print(f"  mH10: mean={np.mean(all_masses[:,0]):.2f} GeV, std={np.std(all_masses[:,0]):.2f}")
            print(f"  mH20: mean={np.mean(all_masses[:,1]):.2e} GeV")
            print(f"  mH30: mean={np.mean(all_masses[:,2]):.2e} GeV")
            print(f"  mH40: mean={np.mean(all_masses[:,3]):.2e} GeV")
    
    return valid_points_all


def analyze_results(valid_points):
    """Analyze valid parameter points"""
    if not valid_points:
        print("\nNo valid points to analyze.")
        return
    
    valid_array = np.array(valid_points)
    param_names = ['alpha1', 'alpha2', 'alpha3', 'rho1', 'rho2',
                   'lambda1', 'lambda2', 'lambda3', 'lambda4', 'lambda5', 'lambda6', 'vR']
    
    print("\n" + "="*80)
    print("PARAMETER STATISTICS FOR VALID POINTS")
    print("="*80)
    print(f"{'Parameter':<12} {'Min':>12} {'Max':>12} {'Mean':>12} {'Std':>12}")
    print("-"*80)
    
    for i, name in enumerate(param_names):
        if name == 'vR':
            print(f"{name:<12} {valid_array[:,i].min():>12.2e} {valid_array[:,i].max():>12.2e} "
                  f"{valid_array[:,i].mean():>12.2e} {valid_array[:,i].std():>12.2e}")
        else:
            print(f"{name:<12} {valid_array[:,i].min():>12.6f} {valid_array[:,i].max():>12.6f} "
                  f"{valid_array[:,i].mean():>12.6f} {valid_array[:,i].std():>12.6f}")
    
    # Show sample Higgs masses
    print("\n" + "="*80)
    print(f"SAMPLE HIGGS MASSES (first {min(10, len(valid_points))} points)")
    print("="*80)
    print(f"{'#':<4} {'mH10':>10} {'mH20':>12} {'mH30':>12} {'mH40':>12} {'vR':>12}")
    print("-"*80)
    
    for i in range(min(10, len(valid_points))):
        params = valid_points[i]
        masses = compute_masses(*params[:11], vR=params[11])
        if masses[0] is not None:
            print(f"{i+1:<4} {masses[0]:>10.2f} {masses[1]:>12.2e} {masses[2]:>12.2e} {masses[3]:>12.2e} {params[11]:>12.2e}")
    
    print("="*80)


def plot_valid_points(valid_points):
    """Plot the valid points in the parameter space with multiple visualizations"""
    try:
        import matplotlib.pyplot as plt
        from mpl_toolkits.mplot3d import Axes3D
    except ImportError:
        print("Matplotlib not available. Skipping plots.")
        return
    
    if not valid_points:
        print("No valid points to plot.")
        return
    
    valid_array = np.array(valid_points)
    n_points = len(valid_points)
    
    print(f"\nGenerating plots for {n_points} valid points...")
    
    # Compute masses for all valid points
    masses_list = []
    for point in valid_points:
        masses = compute_masses(*point[:11], vR=point[11])
        if masses[0] is not None:
            masses_list.append(masses)
    
    if not masses_list:
        print("Could not compute masses for plotting.")
        return
    
    masses_array = np.array(masses_list)
    
    # Create a comprehensive figure with multiple subplots
    fig = plt.figure(figsize=(20, 12))
    
    # Plot 1: 3D scatter - alpha1, alpha2, alpha3
    ax1 = fig.add_subplot(3, 4, 1, projection='3d')
    scatter1 = ax1.scatter(valid_array[:,0], valid_array[:,1], valid_array[:,2], 
                c=masses_array[:,0], cmap='viridis', marker='o', alpha=0.7, s=30)
    ax1.set_xlabel('α₁')
    ax1.set_ylabel('α₂')
    ax1.set_zlabel('α₃')
    ax1.set_title('Alpha Parameters')
    plt.colorbar(scatter1, ax=ax1, label='mH10 (GeV)', shrink=0.6)
    
    # Plot 2: 3D scatter - rho1, rho2, lambda1
    ax2 = fig.add_subplot(3, 4, 2, projection='3d')
    scatter2 = ax2.scatter(valid_array[:,3], valid_array[:,4], valid_array[:,5], 
                c=masses_array[:,1], cmap='plasma', marker='o', alpha=0.7, s=30)
    ax2.set_xlabel('ρ₁')
    ax2.set_ylabel('ρ₂')
    ax2.set_zlabel('λ₁')
    ax2.set_title('ρ and λ₁ Parameters')
    plt.colorbar(scatter2, ax=ax2, label='mH20 (GeV)', shrink=0.6)
    
    # Plot 3: 3D scatter - lambda2, lambda3, lambda4
    ax3 = fig.add_subplot(3, 4, 3, projection='3d')
    ax3.scatter(valid_array[:,6], valid_array[:,7], valid_array[:,8], 
                c='green', marker='o', alpha=0.7, s=30)
    ax3.set_xlabel('λ₂')
    ax3.set_ylabel('λ₃')
    ax3.set_zlabel('λ₄')
    ax3.set_title('Lambda2,3,4 Parameters')
    
    # Plot 4: 3D scatter - lambda5, lambda6, vR
    ax4 = fig.add_subplot(3, 4, 4, projection='3d')
    scatter4 = ax4.scatter(valid_array[:,9], valid_array[:,10], valid_array[:,11], 
                c=masses_array[:,2], cmap='coolwarm', marker='o', alpha=0.7, s=30)
    ax4.set_xlabel('λ₅')
    ax4.set_ylabel('λ₆')
    ax4.set_zlabel('vR (GeV)')
    ax4.set_title('Lambda5,6 and vR')
    plt.colorbar(scatter4, ax=ax4, label='mH30 (GeV)', shrink=0.6)
    
    # Plot 5: 2D histogram - lambda1 vs lambda2
    ax5 = fig.add_subplot(3, 4, 5)
    h = ax5.hist2d(valid_array[:,5], valid_array[:,6], bins=min(20, n_points//2), cmap='YlOrRd')
    ax5.set_xlabel('λ₁')
    ax5.set_ylabel('λ₂')
    ax5.set_title('λ₁ vs λ₂ Density')
    plt.colorbar(h[3], ax=ax5)
    
    # Plot 6: 2D histogram - rho1 vs rho2
    ax6 = fig.add_subplot(3, 4, 6)
    h = ax6.hist2d(valid_array[:,3], valid_array[:,4], bins=min(20, n_points//2), cmap='YlGnBu')
    ax6.set_xlabel('ρ₁')
    ax6.set_ylabel('ρ₂')
    ax6.set_title('ρ₁ vs ρ₂ Density')
    plt.colorbar(h[3], ax=ax6)
    
    # Plot 7: Scatter - alpha1 vs alpha3
    ax7 = fig.add_subplot(3, 4, 7)
    scatter7 = ax7.scatter(valid_array[:,0], valid_array[:,2], 
                c=masses_array[:,0], cmap='viridis', alpha=0.7, s=30)
    ax7.set_xlabel('α₁')
    ax7.set_ylabel('α₃')
    ax7.set_title('α₁ vs α₃')
    ax7.grid(True, alpha=0.3)
    plt.colorbar(scatter7, ax=ax7, label='mH10 (GeV)')
    
    # Plot 8: Scatter - vR vs mH20
    ax8 = fig.add_subplot(3, 4, 8)
    ax8.scatter(valid_array[:,11], masses_array[:,1], c='blue', alpha=0.7, s=30)
    ax8.set_xlabel('vR (GeV)')
    ax8.set_ylabel('mH20 (GeV)')
    ax8.set_title('vR vs mH20')
    ax8.set_xscale('log')
    ax8.set_yscale('log')
    ax8.grid(True, alpha=0.3)
    
    # Plot 9: Higgs mass spectrum for each point
    ax9 = fig.add_subplot(3, 4, 9)
    for i in range(min(20, len(masses_array))):
        ax9.plot([1, 2, 3, 4], masses_array[i], 'o-', alpha=0.5, linewidth=1)
    ax9.set_xticks([1, 2, 3, 4])
    ax9.set_xticklabels(['H₁⁰', 'H₂⁰', 'H₃⁰', 'H₄⁰'])
    ax9.set_ylabel('Mass (GeV)')
    ax9.set_yscale('log')
    ax9.set_title(f'Mass Hierarchies (first {min(20, len(masses_array))} points)')
    ax9.grid(True, alpha=0.3)
    ax9.axhline(y=higgs_sm_mass, color='r', linestyle='--', label='SM Higgs')
    ax9.legend()
    
    # Plot 10: Distribution of mH10
    ax10 = fig.add_subplot(3, 4, 10)
    ax10.hist(masses_array[:,0], bins=min(30, n_points), color='skyblue', edgecolor='black', alpha=0.7)
    ax10.axvline(x=higgs_sm_mass, color='r', linestyle='--', linewidth=2, label='Target')
    ax10.set_xlabel('mH10 (GeV)')
    ax10.set_ylabel('Count')
    ax10.set_title('Distribution of SM-like Higgs Mass')
    ax10.legend()
    ax10.grid(True, alpha=0.3)
    
    # Plot 11: Lambda sum (lambda1 + lambda2) distribution
    ax11 = fig.add_subplot(3, 4, 11)
    lambda_sum = valid_array[:,5] + valid_array[:,6]
    ax11.hist(lambda_sum, bins=min(30, n_points), color='orange', edgecolor='black', alpha=0.7)
    ax11.set_xlabel('λ₁ + λ₂')
    ax11.set_ylabel('Count')
    ax11.set_title('Distribution of λ₁ + λ₂')
    ax11.grid(True, alpha=0.3)
    
    # Plot 12: Correlation matrix heatmap (for selected parameters)
    ax12 = fig.add_subplot(3, 4, 12)
    # Select key parameters
    key_params = valid_array[:, [0, 2, 3, 4, 5, 6]]  # alpha1, alpha3, rho1, rho2, lambda1, lambda2
    corr_matrix = np.corrcoef(key_params.T)
    im = ax12.imshow(corr_matrix, cmap='coolwarm', vmin=-1, vmax=1, aspect='auto')
    ax12.set_xticks(range(6))
    ax12.set_yticks(range(6))
    ax12.set_xticklabels(['α₁', 'α₃', 'ρ₁', 'ρ₂', 'λ₁', 'λ₂'], rotation=45)
    ax12.set_yticklabels(['α₁', 'α₃', 'ρ₁', 'ρ₂', 'λ₁', 'λ₂'])
    ax12.set_title('Parameter Correlation Matrix')
    plt.colorbar(im, ax=ax12)
    
    # Add values to correlation matrix
    for i in range(6):
        for j in range(6):
            text = ax12.text(j, i, f'{corr_matrix[i, j]:.2f}',
                           ha="center", va="center", color="black", fontsize=8)
    
    plt.suptitle(f'Valid Parameter Space Analysis (n={n_points} points)', 
                 fontsize=16, fontweight='bold', y=0.995)
    plt.tight_layout()
    
    # Save the figure
    filename = 'valid_higgs_parameters_plots.png'
    plt.savefig(filename, dpi=150, bbox_inches='tight')
    print(f"Plots saved to {filename}")
    
    plt.show()


def save_results(valid_points, filename='valid_higgs_parameters_targeted.csv'):
    """Save valid points to CSV"""
    if not valid_points:
        return
    
    valid_array = np.array(valid_points)
    header = 'alpha1,alpha2,alpha3,rho1,rho2,lambda1,lambda2,lambda3,lambda4,lambda5,lambda6,vR'
    np.savetxt(filename, valid_array, delimiter=',', header=header, comments='')
    print(f"\nSaved {len(valid_points)} valid points to {filename}")


def main():
    start_time = time.time()
    
    # Try with 20 million samples and varying vR
    valid_points = scan_targeted(
        n_samples=20_000_000,
        max_valid=1000,
        vR_range=(1e4, 5e5),  # Try lower vR to reduce heavy Higgs masses
        batch_size=2_000_000
    )
    
    elapsed_time = time.time() - start_time
    print(f"\n{'='*80}")
    print(f"Scan completed in {elapsed_time:.2f} seconds")
    print(f"Sampling rate: {20_000_000/elapsed_time:,.0f} samples/second")
    print(f"{'='*80}")
    
    if valid_points:
        analyze_results(valid_points)
        save_results(valid_points)
        
        # Generate plots
        try:
            plot_valid_points(valid_points)
        except Exception as e:
            print(f"Could not generate plots: {e}")
    else:
        print("\nNo valid points found. The parameter space may need further adjustment.")
        print("Consider:")
        print("  1. Adjusting vR range (lower values reduce heavy Higgs masses)")
        print("  2. Refining lambda parameter ranges")
        print("  3. Increasing sample size further")


if __name__ == "__main__":
    main()
