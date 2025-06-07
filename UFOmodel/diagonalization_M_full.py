from neutrino_mass_mpmath import pmns_matrix, dagger
from compute_seesaw_approximations import compute_MD_seesaw_I_mlrsm, M_full_typeI_seesaw, M_full_typeII_seesaw, M_full_type_i_plus_ii_seesaw
import mpmath as mp

#def diagonalize_and_reconstruct(M_full):
#    """
#    Diagonalize and reconstruct the full mass matrix with diagnostics.
#
#    Parameters:
#    -----------
#    M_full : mp.matrix
#        Full neutrino mass matrix (6x6).

#    Returns:
#    --------
#    D : mp.matrix
#        Diagonal matrix of eigenvalues.
#    V : mp.matrix
#        Unitary matrix of eigenvectors.
#    M_reconstructed : mp.matrix
#        Reconstructed matrix from D and V.
#    error : float
#        Reconstruction error (Frobenius norm).
#    """
#    # Step 1: Diagonalize
#    eigenvalues, eigenvectors = mp.eig(M_full, left=False, right=True)
#    eigenvalues, eigenvectors = mp.eig_sort(eigenvalues, eigenvectors)

#    # Construct diagonal and eigenvector matrices
#    D = mp.zeros(M_full.rows, M_full.cols)
#    for i, eigenvalue in enumerate(eigenvalues):
#        D[i, i] = eigenvalue
#    V = mp.matrix(eigenvectors)

    # Step 2: Reconstruct
#    M_reconstructed = V * D * dagger(V)

    # Step 3: Compute Reconstruction Error
#    diff = M_full - M_reconstructed
#    error = mp.norm(diff, p=2) / mp.norm(M_full, p=2)

    # Diagnostics
#    print("\nEigenvalues:")
#    print(mp.nprint(mp.chop(D)))
#    print("\nReconstructed M_full:")
#    print(mp.nprint(mp.chop(M_reconstructed)))
#    print(f"\nReconstruction Error: {mp.nstr(error, 5)}")

#    return D, V, M_reconstructed, error

def diagonalize_and_reconstruct(M_full, tol=1e-15):
    """
    Diagonalize and reconstruct the full mass matrix with enhanced diagnostics and error handling.

    Parameters:
    -----------
    M_full : mp.matrix
        Full neutrino mass matrix (6x6).
    tol : float, optional
        Tolerance for numerical chopping (default: 1e-15).

    Returns:
    --------
    D : mp.matrix
        Diagonal matrix of eigenvalues.
    V : mp.matrix
        Unitary matrix of eigenvectors.
    M_reconstructed : mp.matrix
        Reconstructed matrix from D and V.
    error : float
        Reconstruction error (Frobenius norm).
    """
    # Step 1: Symmetrize the matrix (to remove small asymmetries)
    #M_full = (M_full + dagger(M_full)) / 2

    # Step 2: Rescale the matrix to mitigate numerical instabilities
    scale_factor = mp.norm(M_full, p=2)
    M_full_rescaled = M_full / scale_factor

    # Step 3: Diagonalize the rescaled matrix
    eigenvalues, eigenvectors = mp.eig(M_full_rescaled, left=False, right=True)
    eigenvalues, eigenvectors = mp.eig_sort(eigenvalues, eigenvectors)

    # Construct diagonal matrix D
    D = mp.zeros(M_full.rows, M_full.cols)
    for i, eigenvalue in enumerate(eigenvalues):
        D[i, i] = scale_factor*eigenvalue

    # Construct eigenvector matrix V
    V = mp.matrix(eigenvectors)

    # Step 4: Check Orthonormality of V
    orthonormality_check = mp.norm(V.T * V - mp.eye(V.rows), p=2)
    if orthonormality_check < tol:
        V_normalized = V  # Already orthonormal, no need for further normalization
    else:
        # Regularize normalization to avoid division by zero
        normalization_factor = mp.sqrt(orthonormality_check + tol)
        V_normalized = V / normalization_factor

    # Step 5: Reconstruct the matrix
    M_reconstructed = scale_factor * (V_normalized * D * dagger(V_normalized))
    M_reconstructed = mp.chop(M_reconstructed, tol=tol)

    # Step 6: Compute Reconstruction Error
    diff = M_full - M_reconstructed
    error = mp.norm(diff, p=2) / mp.norm(M_full, p=2)

    # Diagnostics
    print("\nEigenvalues:")
    print(mp.nprint(mp.chop(D, tol=tol)))
    print("\nReconstructed M_full:")
    print(mp.nprint(mp.chop(M_reconstructed, tol=tol)))
    print(f"\nReconstruction Error: {mp.nstr(error, 5)}")

    return D, V_normalized, M_reconstructed, error




if __name__ == "__main__":
    mp.dps = 200  # Adjust precision to 150 decimal places
    # Define parameters
    m1 = mp.mpf('1e-12')  # Lightest neutrino mass (GeV)
    delta_m21_sq = mp.mpf('7.49e-5') * mp.mpf('1e-18')  # Solar mass-squared diff (GeV^2)
    delta_m31_sq = mp.mpf('2.534e-3') * mp.mpf('1e-18')  # Atmospheric mass-squared diff (GeV^2)

    m2 = mp.sqrt(m1**2 + delta_m21_sq) # Second lightest neutrino mass
    m3 = mp.sqrt(m1**2 + delta_m31_sq) # Third lightest neutrino mass
    v_L = mp.mpf('1e-5')  # Left-handed triplet VEV
    v_R = mp.mpf('1e3')  # Right-handed triplet VEV

    m_nu_diag = mp.matrix([[m1, 0, 0], [0, m2, 0], [0, 0, m3]])  # Light neutrino masses

    M_R_diag = mp.matrix([[1000, 0, 0], [0, 2000, 0], [0, 0, 3000]])  # Heavy neutrino masses
    U_PMNS = pmns_matrix()  # PMNS mixing matrix
    W_R = mp.eye(3)  # Assume M_R is already diagonal

    # Compute M_D
    M_D = compute_MD_seesaw_I_mlrsm(m_nu_diag, M_R_diag, U_PMNS, W_R)
    print("M_D (Dirac mass matrix):")
    print(mp.nprint(mp.chop(M_D)))
    print('M_D norm:', mp.norm(M_D, p=2))


    # Compute M_full for Type I seesaw
    M_full_I = M_full_typeI_seesaw(m_nu_diag, M_R_diag, U_PMNS, W_R)
    print("\nM_full (Type I):")
    print(mp.nprint(mp.chop(M_full_I, tol=1e-15)))

    # Diagonalize M_full for Type I
    #D_I, V_I = diagonalize_M_full(M_full_I)
    D_I, V_I, M_reconstructed_I, error_I = diagonalize_and_reconstruct(M_full_I)

    # Compute and diagonalize M_full for Type II seesaw
    M_full_II = M_full_typeII_seesaw(m_nu_diag, v_L, v_R, U_PMNS)
    print("\nM_full (Type II):")
    print(mp.nprint(mp.chop(M_full_II, tol=1e-15)))

    #D_II, V_II = diagonalize_M_full(M_full_II)
    D_II, V_II, M_reconstructed_II, error_II = diagonalize_and_reconstruct(M_full_II)

    # Compute and diagonalize M_full for Type I + II seesaw
    M_full_I_II = M_full_type_i_plus_ii_seesaw(m_nu_diag, M_R_diag, W_R, U_PMNS, v_R, v_L)
    print("\nM_full (Type I + II):")
    print(mp.nprint(mp.chop(M_full_I_II, tol=1e-15)))

    #D_I_II, V_I_II = diagonalize_M_full(M_full_I_II)
    D_I_II, V_I_II, M_reconstructed_I_II, error_I_II = diagonalize_and_reconstruct(M_full_I_II)
