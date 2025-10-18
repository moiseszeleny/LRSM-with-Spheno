"""
Test script to demonstrate the plotting functionality using existing CSV data.
"""

import numpy as np
import sys
import os

# Add parent directory to path to import from main script
sys.path.insert(0, os.path.dirname(__file__))

try:
    from neutral_higges_masses_targeted import plot_valid_points, compute_masses
except ImportError:
    print("Error: Could not import from neutral_higges_masses_targeted.py")
    sys.exit(1)


def load_and_plot(csv_file='valid_higgs_parameters_targeted.csv'):
    """Load valid points from CSV and generate plots"""
    
    if not os.path.exists(csv_file):
        print(f"Error: {csv_file} not found")
        print("Please run neutral_higges_masses_targeted.py first to generate data.")
        return
    
    print(f"Loading data from {csv_file}...")
    
    # Load data
    data = np.loadtxt(csv_file, delimiter=',', skiprows=1)
    
    # Convert to list of tuples (format expected by plot_valid_points)
    valid_points = [tuple(row) for row in data]
    
    print(f"Loaded {len(valid_points)} valid parameter points")
    
    # Verify data by computing a few masses
    print("\nVerifying first 3 points:")
    for i in range(min(3, len(valid_points))):
        params = valid_points[i]
        masses = compute_masses(*params[:11], vR=params[11])
        if masses[0] is not None:
            print(f"  Point {i+1}: mH10={masses[0]:.2f} GeV, "
                  f"mH20={masses[1]:.2e} GeV, mH30={masses[2]:.2e} GeV, mH40={masses[3]:.2e} GeV")
    
    # Generate plots
    print("\nGenerating plots...")
    plot_valid_points(valid_points)
    print("Done!")


if __name__ == "__main__":
    load_and_plot()
