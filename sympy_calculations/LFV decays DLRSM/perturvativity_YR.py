"""
Perturbativity Bound Analysis for Yukawa Couplings in DLRSM Model

This module calculates the perturbativity bound on the Yukawa YR couplings 
of the DLRSM model. Following the definitions:
- YRi^2 = (2/vR^2) * Mn_i^+ * Mn_i^-
- Mn_i^+ = Mn_i^- + μ_{ii}
- The perturbativity bound is |YRi|^2 < 6π

Author: Moises Zeleny
Date: July 2025
"""

import numpy as np
import matplotlib.pyplot as plt
import os
import traceback

class PerturbativityAnalyzer:
    """
    A class to analyze perturbativity bounds for Yukawa couplings in the DLRSM model.
    """
    
    def __init__(self, vR):
        """
        Initialize the analyzer with the vacuum expectation value.
        
        Args:
            vR (float): Vacuum expectation value of the right-handed Higgs field.
        """
        self.vR = vR
        self.perturbativity_limit = 6 * np.pi
    
    def calculate_yukawa_coupling_squared(self, Mn_i_minus, muii):
        """
        Calculate the Yukawa coupling YRi^2.
        
        Args:
            Mn_i_minus (float or array): Mass of the right-handed neutrino for index i.
            muii (float or array): The parameter μ_{ii}.
            
        Returns:
            float or array: The Yukawa coupling YRi^2 for index i.
        """
        Mn_i_plus = Mn_i_minus + muii
        return (2 / self.vR**2) * Mn_i_plus * Mn_i_minus
    
    def calculate_perturbativity_margin(self, Mn_i_minus, muii):
        """
        Calculate how much margin exists before hitting the perturbativity bound.
        
        Args:
            Mn_i_minus (float or array): Mass of the right-handed neutrino for index i.
            muii (float or array): The parameter μ_{ii}.
            
        Returns:
            float or array: The margin (positive means within bound, negative means outside).
        """
        YRi_sq = self.calculate_yukawa_coupling_squared(Mn_i_minus, muii)
        return self.perturbativity_limit - YRi_sq
    
    def is_perturbative(self, Mn_i_minus, muii):
        """
        Check if the Yukawa coupling YRi is within the perturbativity bound.
        
        Args:
            Mn_i_minus (float or array): Mass of the right-handed neutrino for index i.
            muii (float or array): The parameter μ_{ii}.
            
        Returns:
            bool or array: True if YRi is within the perturbativity bound, False otherwise.
        """
        margin = self.calculate_perturbativity_margin(Mn_i_minus, muii)
        return margin > 0

def generate_parameter_samples(sample_size=1000, muii_range=(1e-4, 1e0), 
                             Mn_range=(1e2, 1e4), random_seed=None):
    """
    Generate random samples for parameter scanning.
    
    Args:
        sample_size (int): Number of samples to generate.
        muii_range (tuple): Range for μ_{ii} values (min, max).
        Mn_range (tuple): Range for Mn_i^- values (min, max).
        random_seed (int, optional): Random seed for reproducibility.
        
    Returns:
        tuple: (muii_values, Mn_i_minus_values) arrays.
    """
    if random_seed is not None:
        np.random.seed(random_seed)
    
    muii_values = np.random.uniform(*muii_range, sample_size)
    Mn_i_minus_values = np.random.uniform(*Mn_range, sample_size)
    
    return muii_values, Mn_i_minus_values

def generate_parameter_samples_log(sample_size=1000, muii_range=(1e-4, 1e0), 
                                 Mn_range=(1e2, 1e4), random_seed=None):
    """
    Generate random samples for parameter scanning in logarithmic scale.
    
    Args:
        sample_size (int): Number of samples to generate.
        muii_range (tuple): Range for μ_{ii} values (min, max).
        Mn_range (tuple): Range for Mn_i^- values (min, max).
        random_seed (int, optional): Random seed for reproducibility.
        
    Returns:
        tuple: (muii_values, Mn_i_minus_values) arrays.
    """
    if random_seed is not None:
        np.random.seed(random_seed)
    
    log_muii_min, log_muii_max = np.log10(muii_range[0]), np.log10(muii_range[1])
    log_Mn_min, log_Mn_max = np.log10(Mn_range[0]), np.log10(Mn_range[1])
    
    muii_values = 10 ** np.random.uniform(log_muii_min, log_muii_max, sample_size)
    Mn_i_minus_values = 10 ** np.random.uniform(log_Mn_min, log_Mn_max, sample_size)
    
    return muii_values, Mn_i_minus_values


def plot_perturbativity_results(Mn_i_minus_values, muii_values, perturbativity_results, vR,
                               title="Perturbativity Bound",
                               figsize=(12, 8), save_path=None):
    """
    Plot the perturbativity analysis results.
    
    Args:
        Mn_i_minus_values (array): Array of Mn_i^- values.
        muii_values (array): Array of μ_{ii} values.
        perturbativity_results (array): Boolean array indicating perturbativity.
        title (str): Plot title.
        figsize (tuple): Figure size.
        save_path (str, optional): Path to save the plot.
    """
    # Separate good and bad points
    muii_good = muii_values[perturbativity_results]
    muii_bad = muii_values[~perturbativity_results]
    Mn_i_minus_good = Mn_i_minus_values[perturbativity_results]
    Mn_i_minus_bad = Mn_i_minus_values[~perturbativity_results]

    # Create the plot
    plt.figure(figsize=figsize)
    
    # Plot points
    plt.scatter(Mn_i_minus_good, muii_good, c='blue', alpha=0.6, s=20,
                label=f'Within Perturbativity Bound ({len(muii_good)} points)')
    plt.scatter(Mn_i_minus_bad, muii_bad, c='red', alpha=0.6, s=20,
                label=f'Outside Perturbativity Bound ({len(muii_bad)} points)')
    
    # Formatting
    plt.title(title + f' for ($v_R = {vR}$ GeV)', fontsize=18, fontweight='bold')
    plt.xlabel('$M_{n_i}^-$ (GeV)', fontsize=18)
    plt.ylabel('$\\mu_{ii}$ (GeV)', fontsize=18)
    plt.xticks(fontsize=16)
    plt.yticks(fontsize=16)
    plt.yscale('log')
    
    # Add reference lines
    plt.axhline(y=muii_values.min(), color='gray', linestyle=':', alpha=0.5, 
                label=f'Min $\\mu_{{ii}}$ = {muii_values.min():.2e}')
    plt.axvline(x=Mn_i_minus_values.min(), color='gray', linestyle=':', alpha=0.5,
                label=f'Min $M_i^-$ = {Mn_i_minus_values.min():.0f}')
    
    plt.legend(fontsize=10)
    plt.grid(True, alpha=0.3)
    plt.tight_layout()
    
    if save_path:
        try:
            # Create directory if it doesn't exist
            os.makedirs(os.path.dirname(save_path), exist_ok=True)
            
            # Remove existing file if it exists to ensure fresh save
            if os.path.exists(save_path):
                os.remove(save_path)
                print(f"Removed existing file: {save_path}")
            
            # Save the plot
            plt.savefig(save_path, dpi=300, bbox_inches='tight', facecolor='white', edgecolor='none')
            print(f"Plot saved to: {save_path}")
            
            # Verify the file was actually saved
            if os.path.exists(save_path):
                file_size = os.path.getsize(save_path)
                print(f"File size: {file_size} bytes")
            else:
                print("Warning: File was not created successfully")
                
        except Exception as e:
            print(f"Warning: Could not save plot to {save_path}. Error: {e}")
            traceback.print_exc()
    
    plt.show()
    
    # Clear the figure to prevent memory issues
    plt.close()

def plot_perturbativity_results_log(Mn_i_minus_values, muii_values, perturbativity_results, vR,
                                   title="Perturbativity Bound",
                                   figsize=(12, 8), save_path=None):
    """
    Plot the perturbativity analysis results with logarithmic scales.
    Args:
        Mn_i_minus_values (array): Array of Mn_i^- values.
        muii_values (array): Array of μ_{ii} values.
        perturbativity_results (array): Boolean array indicating perturbativity.
        vR (float): Vacuum expectation value of the right-handed Higgs field.
        title (str): Plot title.
        figsize (tuple): Figure size.
        save_path (str, optional): Path to save the plot.
    """
    # Separate good and bad points
    muii_good = muii_values[perturbativity_results]
    muii_bad = muii_values[~perturbativity_results]
    Mn_i_minus_good = Mn_i_minus_values[perturbativity_results]
    Mn_i_minus_bad = Mn_i_minus_values[~perturbativity_results]
    # Create the plot
    plt.figure(figsize=figsize)
    # Plot points
    plt.scatter(Mn_i_minus_good, muii_good, c='blue', alpha=0.6, s=20,
                label=f'Within Perturbativity Bound ({len(muii_good)} points)')
    plt.scatter(Mn_i_minus_bad, muii_bad, c='red', alpha=0.6, s=20,
                label=f'Outside Perturbativity Bound ({len(muii_bad)} points)')
    # Formatting
    plt.title(title + f' for ($v_R = {vR}$ GeV)', fontsize=18, fontweight='bold')
    plt.xlabel('$M_{n_i}^-$ (GeV)', fontsize=18)
    plt.ylabel('$\\mu_{ii}$ (GeV)', fontsize=18)
    plt.xticks(fontsize=16)
    plt.yticks(fontsize=16)
    plt.xscale('log')
    plt.yscale('log')
    # Add reference lines
    plt.axhline(y=muii_values.min(), color='gray', linestyle=':', alpha=0.5, 
                label=f'Min $\\mu_{{ii}}$ = {muii_values.min():.2e}')
    plt.axvline(x=Mn_i_minus_values.min(), color='gray', linestyle=':', alpha=0.5,
                label=f'Min $M_i^-$ = {Mn_i_minus_values.min():.0f}')
    plt.legend(fontsize=10)
    plt.grid(True, alpha=0.3)
    plt.tight_layout()
    if save_path:
        try:
            # Create directory if it doesn't exist
            os.makedirs(os.path.dirname(save_path), exist_ok=True)
            # Remove existing file if it exists to ensure fresh save
            if os.path.exists(save_path):
                os.remove(save_path)
                print(f"Removed existing file: {save_path}")
            # Save the plot
            plt.savefig(save_path, dpi=300, bbox_inches='tight', facecolor='white', edgecolor='none')
            print(f"Plot saved to: {save_path}")
            # Verify the file was actually saved
            if os.path.exists(save_path):
                file_size = os.path.getsize(save_path)
                print(f"File size: {file_size} bytes")
            else:
                print("Warning: File was not created successfully")
        except Exception as e:
            print(f"Warning: Could not save plot to {save_path}. Error: {e}")
            traceback.print_exc()
    plt.show()
    # Clear the figure to prevent memory issues
    plt.close()


def print_analysis_summary(perturbativity_results, analyzer, muii_values, Mn_i_minus_values):
    """
    Print a summary of the perturbativity analysis.
    
    Args:
        perturbativity_results (array): Boolean array indicating perturbativity.
        analyzer (PerturbativityAnalyzer): The analyzer instance.
        muii_values (array): Array of μ_{ii} values.
        Mn_i_minus_values (array): Array of Mn_i^- values.
    """
    within_bound_count = np.sum(perturbativity_results)
    total_count = len(perturbativity_results)
    percentage = (within_bound_count / total_count) * 100
    
    print("=" * 60)
    print("PERTURBATIVITY ANALYSIS SUMMARY")
    print("=" * 60)
    print(f"VEV (vR): {analyzer.vR} GeV")
    print(f"Perturbativity limit: {analyzer.perturbativity_limit:.4f}")
    print(f"Total sample size: {total_count}")
    print(f"Points within perturbativity bound: {within_bound_count}")
    print(f"Points outside perturbativity bound: {total_count - within_bound_count}")
    print(f"Percentage within bound: {percentage:.2f}%")
    print()
    print("Parameter ranges:")
    print(f"  μ_{{ii}} range: [{muii_values.min():.2e}, {muii_values.max():.2e}] GeV")
    print(f"  M_{{n_i}}^- range: [{Mn_i_minus_values.min():.0f}, {Mn_i_minus_values.max():.0f}] GeV")
    print("=" * 60)


def main():
    """
    Main function to run the perturbativity analysis.
    """
    # Configuration parameters
    CONFIG = {
        'vR': 100000,  # GeV
        'sample_size': 2000,
        'muii_range': (1e-5, 1e0),  # GeV
        'Mn_range': (1e3, 1e6),  # GeV
        'random_seed': 42,  # For reproducibility
        'save_plot': 'images/YRi_bound_plot_vR_log_100000.png',  # Set to filename if you want to save
        'save_csv': 'data/YRi_bound_data_vR_log_100000.csv'  # Set to filename if you want to save CSV
    }
    
    # Initialize analyzer
    analyzer = PerturbativityAnalyzer(CONFIG['vR'])
    
    # Generate parameter samples
    muii_values, Mn_i_minus_values = generate_parameter_samples_log(
        sample_size=CONFIG['sample_size'],
        muii_range=CONFIG['muii_range'],
        Mn_range=CONFIG['Mn_range'],
        random_seed=CONFIG['random_seed']
    )
    
    # Perform perturbativity analysis
    perturbativity_results = analyzer.is_perturbative(Mn_i_minus_values, muii_values)

    # save to csv file
    if CONFIG['save_csv']:
        try:
            import pandas as pd
            
            # Create directory if it doesn't exist
            os.makedirs(os.path.dirname(CONFIG['save_csv']), exist_ok=True)
            
            # Remove existing file if it exists to ensure fresh save
            if os.path.exists(CONFIG['save_csv']):
                os.remove(CONFIG['save_csv'])
                print(f"Removed existing CSV file: {CONFIG['save_csv']}")
            
            df = pd.DataFrame({
                'Mn_i_minus': Mn_i_minus_values[perturbativity_results],
                'muii': muii_values[perturbativity_results],
            })
            
            df.to_csv(CONFIG['save_csv'], index=False)
            print(f"Data saved to {CONFIG['save_csv']}")
            
            # Verify the file was actually saved
            if os.path.exists(CONFIG['save_csv']):
                file_size = os.path.getsize(CONFIG['save_csv'])
                print(f"CSV file size: {file_size} bytes")
            else:
                print("Warning: CSV file was not created successfully")
                
        except ImportError:
            print("Pandas is not installed. Skipping CSV save.")
        except Exception as e:
            print(f"Warning: Could not save CSV to {CONFIG['save_csv']}. Error: {e}")
            traceback.print_exc()
    
    # Print summary
    print_analysis_summary(perturbativity_results, analyzer, muii_values, Mn_i_minus_values)
    
    # Plot results
    plot_perturbativity_results_log(
        Mn_i_minus_values, muii_values, perturbativity_results, CONFIG['vR'],
        save_path=CONFIG['save_plot']
    )


if __name__ == "__main__":
    main()
