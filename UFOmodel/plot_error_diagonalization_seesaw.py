import numpy as np
import matplotlib.pyplot as plt
from mpmath import mp

from diagonalization_M_full import diagonalize_and_reconstruct
from neutrino_mass_mpmath import pmns_matrix
from compute_seesaw_approximations import M_full_typeI_seesaw, M_full_typeII_seesaw, M_full_type_i_plus_ii_seesaw

def scan_vL_vR_TypeI(m_nu_diag, U_PMNS, vR_range, M_R_diag, W_R):
    results = []
    for v_R in vR_range:
        M_full_I = M_full_typeI_seesaw(m_nu_diag, M_R_diag, U_PMNS, W_R)
        _, _, _, error_I = diagonalize_and_reconstruct(M_full_I)
        results.append((v_R, error_I))
    return results


def scan_vL_vR_TypeII(m_nu_diag, U_PMNS, vL_range, vR_range):
    results = []
    for v_L in vL_range:
        for v_R in vR_range:
            M_full_II = M_full_typeII_seesaw(m_nu_diag, v_L, v_R, U_PMNS)
            _, _, _, error_II = diagonalize_and_reconstruct(M_full_II)
            results.append((v_L, v_R, error_II))
    return results


def scan_vL_vR_TypeI_II(m_nu_diag, U_PMNS, vL_range, vR_range, M_R_diag, W_R):
    results = []
    for v_L in vL_range:
        for v_R in vR_range:
            try:
                M_full_I_II = M_full_type_i_plus_ii_seesaw(m_nu_diag, M_R_diag, W_R, U_PMNS, v_R, v_L)
                _, _, _, error_I_II = diagonalize_and_reconstruct(M_full_I_II)
                results.append((v_L, v_R, error_I_II))
            except ValueError as e:
                # Log invalid combinations for debugging
                print(f"Skipping v_L={v_L}, v_R={v_R} due to error: {e}")
    return results

import matplotlib.pyplot as plt
import numpy as np

if __name__ == "__main__":
    mp.dps = 500  # Adjust precision to 150 decimal places
    # Define parameters
    m1 = mp.mpf('1e-12')  # Lightest neutrino mass (GeV)
    delta_m21_sq = mp.mpf('7.49e-5') * mp.mpf('1e-18')  # Solar mass-squared diff (GeV^2)
    delta_m31_sq = mp.mpf('2.534e-3') * mp.mpf('1e-18')  # Atmospheric mass-squared diff (GeV^2)

    m2 = mp.sqrt(m1**2 + delta_m21_sq) # Second lightest neutrino mass
    m3 = mp.sqrt(m1**2 + delta_m31_sq) # Third lightest neutrino mass
    #v_L = mp.mpf('1e2')  # Left-handed triplet VEV
    v_R = mp.mpf('6e9')  # Right-handed triplet VEV

    m_nu_diag = mp.matrix([[m1, 0, 0], [0, m2, 0], [0, 0, m3]])  # Light neutrino masses

    M_R_diag = mp.matrix([[v_R, 0, 0], [0, 2*v_R, 0], [0, 0, 3*v_R]])  # Heavy neutrino masses
    U_PMNS = pmns_matrix()  # PMNS mixing matrix
    W_R = mp.eye(3)  # Assume M_R is already diagonal
    # Define ranges for each seesaw
    vR_range_TypeI = np.logspace(6, 16, 50)
    vL_range_TypeII = np.logspace(-6, -2, 20)
    vR_range_TypeII = np.logspace(4, 12, 20)
    vL_range_TypeI_II = np.logspace(-8, -2, 20)
    vR_range_TypeI_II = np.logspace(4, 16, 20)

    # Perform scans
    print('Calculating scan results type I')
    results_TypeI = scan_vL_vR_TypeI(m_nu_diag, U_PMNS, vR_range_TypeI, M_R_diag, W_R)
    print('Calculating scan results type II')
    results_TypeII = scan_vL_vR_TypeII(m_nu_diag, U_PMNS, vL_range_TypeII, vR_range_TypeII)
    print('Calculating scan results type I + II')
    results_TypeI_II = scan_vL_vR_TypeI_II(m_nu_diag, U_PMNS, vL_range_TypeI_II, vR_range_TypeI_II, M_R_diag, W_R)

    # Extract data for plots
    vR_TypeI, error_TypeI = zip(*results_TypeI)

    vL_TypeII, vR_TypeII, error_TypeII = zip(*results_TypeII)
    vL_TypeII = np.array(vL_TypeII)
    vR_TypeII = np.array(vR_TypeII)
    error_TypeII = np.array(error_TypeII)

    vL_TypeI_II, vR_TypeI_II, error_TypeI_II = zip(*results_TypeI_II)
    vL_TypeI_II = np.array(vL_TypeI_II)
    vR_TypeI_II = np.array(vR_TypeI_II)
    error_TypeI_II = np.array(error_TypeI_II)

    # Plot results
    plt.figure(figsize=(12, 8))

    # Type I
    plt.subplot(1, 3, 1)
    plt.loglog(vR_TypeI, error_TypeI, label='Type I')
    plt.xlabel(r'$v_R$ [GeV]')
    plt.ylabel('Reconstruction Error')
    plt.title('Type I Seesaw')
    plt.grid(True)

    # Type II
    plt.subplot(1, 3, 2)
    plt.scatter(vR_TypeII, vL_TypeII, c=error_TypeII, cmap='viridis', norm=plt.LogNorm())
    plt.colorbar(label='Reconstruction Error')
    plt.xlabel(r'$v_R$ [GeV]')
    plt.ylabel(r'$v_L$ [GeV]')
    plt.title('Type II Seesaw')
    plt.grid(True)

    # Type I + II
    plt.subplot(1, 3, 3)
    plt.scatter(vR_TypeI_II, vL_TypeI_II, c=error_TypeI_II, cmap='plasma', norm=plt.LogNorm())
    plt.colorbar(label='Reconstruction Error')
    plt.xlabel(r'$v_R$ [GeV]')
    plt.ylabel(r'$v_L$ [GeV]')
    plt.title('Type I + II Seesaw')
    plt.grid(True)

    plt.tight_layout()
    plt.show()
