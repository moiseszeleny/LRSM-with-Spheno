"""
In this file we do a scan of the neutral Higgs masses in the DLRSM,
varying the parameters alpha1, alpha2, alpha3, rho1, rho2, lambda1, 
lambda2, lambda3, lambda4, lambda5, lambda6 of the Higgs potential.
"""

import numpy as np
from itertools import product

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

# the neutral Higgs masses follow the hierarchy: mH10 < mH20 < mH30 < mH40
# We will scan the parameters to find regions where mH10 is around the SM Higgs mass
# and the other Higgs masses are heavier
# the parameters of the potential also, should be in the perturbative regime, i.e., < 4 pi


def scan_parameters(n_points=10, max_valid=1000):
    """
    Scan the parameters of the Higgs potential using vectorized operations.
    
    Parameters:
    -----------
    n_points : int
        Number of points to sample for each parameter (default: 10)
    max_valid : int
        Maximum number of valid points to collect before stopping (default: 1000)
        Set to None to scan all combinations
    
    Returns:
    --------
    list of tuples
        Valid parameter combinations
    """
    # Define the ranges for the parameters
    alpha1_range = np.linspace(0.1, 10.0, n_points)
    alpha2_range = np.linspace(0.1, 10.0, n_points)
    alpha3_range = np.linspace(0.1, 10.0, n_points)
    rho1_range = np.linspace(0.1, 10.0, n_points)
    rho2_range = np.linspace(0.1, 10.0, n_points)
    lambda1_range = np.linspace(0.1, 10.0, n_points)
    lambda2_range = np.linspace(0.1, 10.0, n_points)
    lambda3_range = np.linspace(0.1, 10.0, n_points)
    lambda4_range = np.linspace(0.1, 10.0, n_points)
    lambda5_range = np.linspace(0.1, 10.0, n_points)
    lambda6_range = np.linspace(0.1, 10.0, n_points)

    valid_points = []
    total_combinations = n_points ** 11
    print(f"Starting parameter scan with {total_combinations:,} total combinations...")
    print(f"Will stop after finding {max_valid} valid points" if max_valid else "Scanning all combinations")
    
    checked = 0
    # Use itertools.product for efficient iteration
    param_iterator = product(alpha1_range, alpha2_range, alpha3_range, rho1_range, rho2_range,
                            lambda1_range, lambda2_range, lambda3_range, lambda4_range, 
                            lambda5_range, lambda6_range)
    
    for params in param_iterator:
        alpha1, alpha2, alpha3, rho1, rho2, lamb1, lamb2, lamb3, lamb4, lamb5, lamb6 = params
        
        # Calculate derived parameters
        alpha13 = alpha1 + alpha3
        alpha23 = alpha2 - alpha3
        
        # Calculate mass squares
        mH10_sq = mH10_square(lamb1, lamb2, alpha13, rho1)
        mH20_sq = mH20_square(alpha13, rho1)
        mH30_sq = mH30_square(alpha23, lamb2, lamb3, lamb5, lamb6)
        mH40_sq = mH40_square(rho1, rho2)
        
        # Check for physical masses (positive mass squared)
        if mH10_sq <= 0 or mH20_sq <= 0 or mH30_sq <= 0 or mH40_sq <= 0:
            checked += 1
            continue
        
        # Calculate masses
        mH10 = np.sqrt(mH10_sq)
        mH20 = np.sqrt(mH20_sq)
        mH30 = np.sqrt(mH30_sq)
        mH40 = np.sqrt(mH40_sq)
        
        # Check hierarchy and SM Higgs mass constraint
        if (higgs_sm_mass_min < mH10 < higgs_sm_mass_max and
            mH10 < mH20 < mH30 < mH40):
            valid_points.append((alpha1, alpha2, alpha3, rho1, rho2,
                               lamb1, lamb2, lamb3, lamb4, lamb5, lamb6))
            
            if max_valid and len(valid_points) >= max_valid:
                print(f"Found {max_valid} valid points. Stopping scan.")
                break
        
        checked += 1
        if checked % 100000 == 0:
            print(f"Checked {checked:,} combinations, found {len(valid_points)} valid points...")

    print(f"Scan complete. Checked {checked:,} combinations, found {len(valid_points)} valid points.")
    return valid_points

def plot_valid_points(valid_points):
    """Plot the valid points in the parameter space"""
    import matplotlib.pyplot as plt
    from mpl_toolkits.mplot3d import Axes3D

    if not valid_points:
        print("No valid points found.")
        return

    valid_points_array = np.array(valid_points)
    fig = plt.figure(figsize=(10, 8))
    ax = fig.add_subplot(111, projection='3d')
    ax.scatter(valid_points_array[:,0], valid_points_array[:,1], valid_points_array[:,2], 
               c='r', marker='o', alpha=0.6)
    ax.set_xlabel('Alpha1')
    ax.set_ylabel('Alpha2')
    ax.set_zlabel('Alpha3')
    plt.title(f'Valid Points in Parameter Space (n={len(valid_points)})')
    plt.tight_layout()
    plt.show()

def save_valid_points(valid_points, filename='valid_higgs_parameters.csv'):
    """Save valid points to a CSV file"""
    if not valid_points:
        print("No valid points to save.")
        return
    
    valid_points_array = np.array(valid_points)
    header = 'alpha1,alpha2,alpha3,rho1,rho2,lambda1,lambda2,lambda3,lambda4,lambda5,lambda6'
    np.savetxt(filename, valid_points_array, delimiter=',', header=header, comments='')
    print(f"Saved {len(valid_points)} valid points to {filename}")

def main():
    import time
    
    start_time = time.time()
    valid_points = scan_parameters(n_points=10, max_valid=1000)
    elapsed_time = time.time() - start_time
    
    print(f"\nScan completed in {elapsed_time:.2f} seconds")
    
    if valid_points:
        save_valid_points(valid_points)
        plot_valid_points(valid_points)
    else:
        print("No valid points found. Try adjusting parameter ranges or increasing n_points.")

if __name__ == "__main__":
    main()