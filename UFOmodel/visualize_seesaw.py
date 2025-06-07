import numpy as np
import matplotlib.pyplot as plt
from neutrino_mass_mpmath import matrix_root, dagger, pmns_matrix, is_diagonal, conj_matrix
from compute_seesaw_approximations import compare_seesaw_approximations
import mpmath as mp

# (Include the previously defined functions like compare_seesaw_approximations)

def visualize_errors(m_nu_diag, U_PMNS, v_L_range, v_R_range, W_R=mp.eye(3)):
    """
    Visualize the reconstruction errors as functions of v_L and v_R.

    Parameters:
    -----------
    m_nu_diag : mp.matrix
        Diagonal light neutrino mass matrix (3x3).
    U_PMNS : mp.matrix
        PMNS mixing matrix (3x3).
    v_L_range : np.array
        Range of left-handed triplet VEVs (v_L) to scan.
    v_R_range : np.array
        Range of right-handed triplet VEVs (v_R) to scan.
    W_R : mp.matrix
        Matrix that diagonalizes M_R.

    Returns:
    --------
    None (Generates plots for Type I, Type II, and Type I + II errors).
    """
    # Initialize error grids
    errors_type_I = np.zeros((len(v_L_range), len(v_R_range)))
    errors_type_II = np.zeros((len(v_L_range), len(v_R_range)))
    errors_type_I_plus_II = np.zeros((len(v_L_range), len(v_R_range)))

    M_R_diag = lambda vR: mp.matrix([[v_R, 0, 0], [0, 2*v_R, 0], [0, 0, 3*v_R]])  # Heavy neutrino masses depending on v_R

    # Loop over v_L and v_R ranges
    for i, v_L in enumerate(v_L_range):
        for j, v_R in enumerate(v_R_range):
            # Convert v_L and v_R to mpmath format
            v_L_mpmath = mp.mpf(v_L)
            v_R_mpmath = mp.mpf(v_R)

            # Compute errors
            results = compare_seesaw_approximations(m_nu_diag, M_R_diag(v_R), U_PMNS, v_L_mpmath, v_R_mpmath, W_R)
            errors_type_I[i, j] = results["Type I Error"]
            errors_type_II[i, j] = results["Type II Error"]
            errors_type_I_plus_II[i, j] = results["Type I + II Error"]

    # Plotting
    fig, axes = plt.subplots(1, 3, figsize=(18, 5), constrained_layout=True)

    # Plot Type I Error
    im1 = axes[0].contourf(v_R_range, v_L_range, np.log10(errors_type_I), cmap='viridis', levels=50)
    axes[0].set_title('Type I Error (log10)')
    axes[0].set_xlabel(r'$v_R$ (GeV)')
    axes[0].set_ylabel(r'$v_L$ (GeV)')
    plt.colorbar(im1, ax=axes[0])

    # Plot Type II Error
    im2 = axes[1].contourf(v_R_range, v_L_range, np.log10(errors_type_II), cmap='viridis', levels=50)
    axes[1].set_title('Type II Error (log10)')
    axes[1].set_xlabel(r'$v_R$ (GeV)')
    axes[1].set_ylabel(r'$v_L$ (GeV)')
    plt.colorbar(im2, ax=axes[1])

    # Plot Type I + II Error
    im3 = axes[2].contourf(v_R_range, v_L_range, np.log10(errors_type_I_plus_II), cmap='viridis', levels=50)
    axes[2].set_title('Type I + II Error (log10)')
    axes[2].set_xlabel(r'$v_R$ (GeV)')
    axes[2].set_ylabel(r'$v_L$ (GeV)')
    plt.colorbar(im3, ax=axes[2])

    plt.show()


if __name__ == "__main__":
    # Define parameters
    m1 = mp.mpf('1e-12')  # Lightest neutrino mass (GeV)
    delta_m21_sq = mp.mpf('7.49e-5') * mp.mpf('1e-18')  # Solar mass-squared diff (GeV^2)
    delta_m31_sq = mp.mpf('2.534e-3') * mp.mpf('1e-18')  # Atmospheric mass-squared diff (GeV^2)

    m2 = mp.sqrt(m1**2 + delta_m21_sq)
    m3 = mp.sqrt(m1**2 + delta_m31_sq)
    m_nu_diag = mp.matrix([[m1, 0, 0], [0, m2, 0], [0, 0, m3]])  # Light neutrino masses

    U_PMNS = pmns_matrix()  # PMNS mixing matrix
    W_R = mp.eye(3)  # Assume M_R is already diagonal

    # Define v_L and v_R ranges
    v_L_range = np.logspace(-6, 2, 50)  # v_L from 1e-6 to 1e2 GeV
    v_R_range = np.logspace(3, 10, 50)   # v_R from 1e3 to 1e10 GeV

    # Visualize errors
    visualize_errors(m_nu_diag, U_PMNS, v_L_range, v_R_range, W_R)
