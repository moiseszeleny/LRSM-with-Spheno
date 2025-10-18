"""
Optimized version using Monte Carlo sampling for parameter scan.
This approach is much more efficient than grid search for high-dimensional spaces.
"""

import numpy as np
import time

higgs_sm_mass = 125.20  #  125.20 +- 0.11 GeV, SM Higgs mass from PDG 2025
higgs_sm_mass_min = higgs_sm_mass - 0.11
higgs_sm_mass_max = higgs_sm_mass + 0.11
k1_value = 246.0        # GeV, SM Higgs VEV
vR_value = 1e5          # GeV, Right-handed VEV

# Precompute constants
k1_squared = k1_value**2
vR_squared = vR_value**2
eight_vR_squared = 8 * vR_squared
two_vR_squared = 2 * vR_squared
four_k1_squared = 4 * k1_squared

def mH10_square(lamb1, lamb2, alpha13, rho1):
    """Mass squared of the SM-like Higgs boson H10"""
    return (8*(lamb1 + lamb2) - 2*alpha13**2/rho1)*k1_squared

def mH20_square(alpha13, rho1):
    """Mass squared of the heavy neutral Higgs boson H20"""
    return eight_vR_squared*rho1 + (4*alpha13**2/rho1)*k1_squared

def mH30_square(alpha23, lamb2, lamb3, lamb5, lamb6):
    """Mass squared of the heavy neutral Higgs boson H30"""
    return two_vR_squared*alpha23 + four_k1_squared*(-lamb2 + 4*lamb3 + lamb5 + lamb6)

def mH40_square(rho1, rho2):
    """Mass squared of the heavy neutral Higgs boson H40"""
    return two_vR_squared*(rho2 + 2*rho1)


def scan_parameters_monte_carlo(n_samples=1000000, max_valid=1000, seed=42, verbose=True):
    """
    Scan parameters using Monte Carlo sampling (random sampling).
    This is MUCH more efficient than grid search for high-dimensional spaces.
    
    Parameters:
    -----------
    n_samples : int
        Number of random samples to generate
    max_valid : int
        Maximum number of valid points to collect before stopping
    seed : int
        Random seed for reproducibility
    verbose : bool
        Print detailed diagnostics
    
    Returns:
    --------
    list of tuples
        Valid parameter combinations
    """
    np.random.seed(seed)
    
    print(f"Starting Monte Carlo parameter scan with {n_samples:,} samples...")
    print(f"Will stop after finding {max_valid} valid points" if max_valid else "Scanning all samples")
    
    # Generate all random samples at once (vectorized)
    alpha1 = np.random.uniform(0.1, 10.0, n_samples)
    alpha2 = np.random.uniform(0.1, 10.0, n_samples)
    alpha3 = np.random.uniform(0.1, 10.0, n_samples)
    rho1 = np.random.uniform(0.1, 10.0, n_samples)
    rho2 = np.random.uniform(0.1, 10.0, n_samples)
    lamb1 = np.random.uniform(0.1, 10.0, n_samples)
    lamb2 = np.random.uniform(0.1, 10.0, n_samples)
    lamb3 = np.random.uniform(0.1, 10.0, n_samples)
    lamb4 = np.random.uniform(0.1, 10.0, n_samples)
    lamb5 = np.random.uniform(0.1, 10.0, n_samples)
    lamb6 = np.random.uniform(0.1, 10.0, n_samples)
    
    # Compute derived parameters (vectorized)
    alpha13 = alpha1 + alpha3
    alpha23 = alpha2 - alpha3
    
    # Compute mass squares (vectorized)
    mH10_sq = (8*(lamb1 + lamb2) - 2*alpha13**2/rho1)*k1_squared
    mH20_sq = eight_vR_squared*rho1 + (4*alpha13**2/rho1)*k1_squared
    mH30_sq = two_vR_squared*alpha23 + four_k1_squared*(-lamb2 + 4*lamb3 + lamb5 + lamb6)
    mH40_sq = two_vR_squared*(rho2 + 2*rho1)
    
    # Filter for physical masses (positive mass squared)
    physical_mask = (mH10_sq > 0) & (mH20_sq > 0) & (mH30_sq > 0) & (mH40_sq > 0)
    print(f"Physical masses: {np.sum(physical_mask):,} / {n_samples:,} ({100*np.sum(physical_mask)/n_samples:.2f}%)")
    
    # Compute masses only for physical points
    mH10 = np.sqrt(mH10_sq[physical_mask])
    mH20 = np.sqrt(mH20_sq[physical_mask])
    mH30 = np.sqrt(mH30_sq[physical_mask])
    mH40 = np.sqrt(mH40_sq[physical_mask])
    
    # Diagnostic: Check each constraint separately
    if verbose:
        print("\nDiagnostic: Constraint satisfaction rates (among physical points):")
        sm_higgs_mask = (mH10 > higgs_sm_mass_min) & (mH10 < higgs_sm_mass_max)
        hierarchy1_mask = mH10 < mH20
        hierarchy2_mask = mH20 < mH30
        hierarchy3_mask = mH30 < mH40
        
        print(f"  SM Higgs mass ({higgs_sm_mass_min:.2f} < mH10 < {higgs_sm_mass_max:.2f} GeV): "
              f"{np.sum(sm_higgs_mask):,} ({100*np.sum(sm_higgs_mask)/len(mH10):.2f}%)")
        print(f"  Hierarchy mH10 < mH20: {np.sum(hierarchy1_mask):,} ({100*np.sum(hierarchy1_mask)/len(mH10):.2f}%)")
        print(f"  Hierarchy mH20 < mH30: {np.sum(hierarchy2_mask):,} ({100*np.sum(hierarchy2_mask)/len(mH10):.2f}%)")
        print(f"  Hierarchy mH30 < mH40: {np.sum(hierarchy3_mask):,} ({100*np.sum(hierarchy3_mask)/len(mH10):.2f}%)")
        
        # Show mass ranges
        print(f"\nMass ranges for physical points:")
        print(f"  mH10: [{np.min(mH10):.2f}, {np.max(mH10):.2f}] GeV (mean: {np.mean(mH10):.2f})")
        print(f"  mH20: [{np.min(mH20):.2f}, {np.max(mH20):.2f}] GeV (mean: {np.mean(mH20):.2f})")
        print(f"  mH30: [{np.min(mH30):.2f}, {np.max(mH30):.2f}] GeV (mean: {np.mean(mH30):.2f})")
        print(f"  mH40: [{np.min(mH40):.2f}, {np.max(mH40):.2f}] GeV (mean: {np.mean(mH40):.2f})")
    
    # Filter for hierarchy and SM Higgs mass constraint
    valid_mask = ((mH10 > higgs_sm_mass_min) & (mH10 < higgs_sm_mass_max) &
                  (mH10 < mH20) & (mH20 < mH30) & (mH30 < mH40))
    
    print(f"\nValid points satisfying all constraints: {np.sum(valid_mask):,}")
    
    if np.sum(valid_mask) == 0:
        return []
    
    # Extract valid parameter combinations
    physical_indices = np.where(physical_mask)[0]
    valid_physical_indices = physical_indices[valid_mask]
    
    if max_valid and len(valid_physical_indices) > max_valid:
        valid_physical_indices = valid_physical_indices[:max_valid]
    
    valid_points = []
    for idx in valid_physical_indices:
        valid_points.append((
            alpha1[idx], alpha2[idx], alpha3[idx], 
            rho1[idx], rho2[idx],
            lamb1[idx], lamb2[idx], lamb3[idx], 
            lamb4[idx], lamb5[idx], lamb6[idx]
        ))
    
    return valid_points


def analyze_valid_points(valid_points):
    """Analyze and print statistics about valid points"""
    if not valid_points:
        print("\nNo valid points to analyze.")
        return
    
    valid_array = np.array(valid_points)
    param_names = ['alpha1', 'alpha2', 'alpha3', 'rho1', 'rho2', 
                   'lambda1', 'lambda2', 'lambda3', 'lambda4', 'lambda5', 'lambda6']
    
    print("\n" + "="*70)
    print("PARAMETER STATISTICS FOR VALID POINTS")
    print("="*70)
    print(f"{'Parameter':<12} {'Min':>10} {'Max':>10} {'Mean':>10} {'Std':>10}")
    print("-"*70)
    
    for i, name in enumerate(param_names):
        print(f"{name:<12} {valid_array[:,i].min():>10.4f} {valid_array[:,i].max():>10.4f} "
              f"{valid_array[:,i].mean():>10.4f} {valid_array[:,i].std():>10.4f}")
    
    # Calculate and display Higgs masses for a few sample points
    print("\n" + "="*70)
    print("SAMPLE HIGGS MASSES (first 5 valid points)")
    print("="*70)
    print(f"{'Point':<8} {'mH10 (GeV)':>12} {'mH20 (GeV)':>12} {'mH30 (GeV)':>12} {'mH40 (GeV)':>12}")
    print("-"*70)
    
    for i in range(min(5, len(valid_points))):
        alpha1, alpha2, alpha3, rho1, rho2, lamb1, lamb2, lamb3, lamb4, lamb5, lamb6 = valid_points[i]
        alpha13 = alpha1 + alpha3
        alpha23 = alpha2 - alpha3
        
        mH10 = np.sqrt(mH10_square(lamb1, lamb2, alpha13, rho1))
        mH20 = np.sqrt(mH20_square(alpha13, rho1))
        mH30 = np.sqrt(mH30_square(alpha23, lamb2, lamb3, lamb5, lamb6))
        mH40 = np.sqrt(mH40_square(rho1, rho2))
        
        print(f"{i+1:<8} {mH10:>12.2f} {mH20:>12.2f} {mH30:>12.2f} {mH40:>12.2f}")
    
    print("="*70 + "\n")


def plot_valid_points(valid_points):
    """Plot the valid points in the parameter space"""
    import matplotlib.pyplot as plt
    from mpl_toolkits.mplot3d import Axes3D
    
    if not valid_points:
        print("No valid points to plot.")
        return
    
    valid_array = np.array(valid_points)
    
    # Create multiple subplots for different parameter combinations
    fig = plt.figure(figsize=(15, 10))
    
    # Plot 1: alpha1, alpha2, alpha3
    ax1 = fig.add_subplot(2, 3, 1, projection='3d')
    ax1.scatter(valid_array[:,0], valid_array[:,1], valid_array[:,2], 
                c='r', marker='o', alpha=0.6, s=20)
    ax1.set_xlabel('alpha1')
    ax1.set_ylabel('alpha2')
    ax1.set_zlabel('alpha3')
    ax1.set_title('alpha parameters')
    
    # Plot 2: rho1, rho2, lambda1
    ax2 = fig.add_subplot(2, 3, 2, projection='3d')
    ax2.scatter(valid_array[:,3], valid_array[:,4], valid_array[:,5], 
                c='b', marker='o', alpha=0.6, s=20)
    ax2.set_xlabel('rho1')
    ax2.set_ylabel('rho2')
    ax2.set_zlabel('lambda1')
    ax2.set_title('rho and lambda1')
    
    # Plot 3: lambda2, lambda3, lambda4
    ax3 = fig.add_subplot(2, 3, 3, projection='3d')
    ax3.scatter(valid_array[:,6], valid_array[:,7], valid_array[:,8], 
                c='g', marker='o', alpha=0.6, s=20)
    ax3.set_xlabel('lambda2')
    ax3.set_ylabel('lambda3')
    ax3.set_zlabel('lambda4')
    ax3.set_title('lambda2,3,4')
    
    # Plot 4: lambda5, lambda6, alpha1
    ax4 = fig.add_subplot(2, 3, 4, projection='3d')
    ax4.scatter(valid_array[:,9], valid_array[:,10], valid_array[:,0], 
                c='m', marker='o', alpha=0.6, s=20)
    ax4.set_xlabel('lambda5')
    ax4.set_ylabel('lambda6')
    ax4.set_zlabel('alpha1')
    ax4.set_title('lambda5,6 vs alpha1')
    
    # Plot 5: 2D histogram - lambda1 vs lambda2
    ax5 = fig.add_subplot(2, 3, 5)
    ax5.hist2d(valid_array[:,5], valid_array[:,6], bins=20, cmap='YlOrRd')
    ax5.set_xlabel('lambda1')
    ax5.set_ylabel('lambda2')
    ax5.set_title('lambda1 vs lambda2 density')
    
    # Plot 6: 2D histogram - rho1 vs rho2
    ax6 = fig.add_subplot(2, 3, 6)
    ax6.hist2d(valid_array[:,3], valid_array[:,4], bins=20, cmap='YlGnBu')
    ax6.set_xlabel('rho1')
    ax6.set_ylabel('rho2')
    ax6.set_title('rho1 vs rho2 density')
    
    plt.suptitle(f'Valid Points in Parameter Space (n={len(valid_points)})', fontsize=14, y=0.995)
    plt.tight_layout()
    plt.show()


def save_valid_points(valid_points, filename='valid_higgs_parameters.csv'):
    """Save valid points to a CSV file"""
    if not valid_points:
        print("No valid points to save.")
        return
    
    valid_array = np.array(valid_points)
    header = 'alpha1,alpha2,alpha3,rho1,rho2,lambda1,lambda2,lambda3,lambda4,lambda5,lambda6'
    np.savetxt(filename, valid_array, delimiter=',', header=header, comments='')
    print(f"Saved {len(valid_points)} valid points to {filename}")


def main():
    start_time = time.time()
    
    # Run Monte Carlo scan with 10 million samples
    valid_points = scan_parameters_monte_carlo(n_samples=10_000_000, max_valid=1000)
    
    elapsed_time = time.time() - start_time
    print(f"\nScan completed in {elapsed_time:.2f} seconds")
    print(f"Sampling rate: {10_000_000/elapsed_time:,.0f} samples/second")
    
    if valid_points:
        analyze_valid_points(valid_points)
        save_valid_points(valid_points)
        
        # Ask before plotting (plotting can be slow)
        try:
            plot_valid_points(valid_points)
        except Exception as e:
            print(f"Could not create plots: {e}")
    else:
        print("\nNo valid points found. Suggestions:")
        print("  1. Increase n_samples (try 100 million or more)")
        print("  2. Adjust parameter ranges")
        print("  3. Relax some constraints")


if __name__ == "__main__":
    main()
