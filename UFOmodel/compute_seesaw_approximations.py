from neutrino_mass_mpmath import matrix_root, dagger, pmns_matrix, is_diagonal, diagonalize_symmetric_matrix, conj_matrix
#from neutrino_mass_mpmath import is_symmetric_diagonalization_correct
import mpmath as mp

#def matrix_root_fix(A, n):
#    eigenvalues, eigenvectors = mp.eig(A)
#    # Replace small negative eigenvalues with zero
#    eigenvalues_fixed = [mp.mpf(0) if ev < 0 else ev for ev in eigenvalues]
#    D = mp.diag(*[ev**(1/n) for ev in eigenvalues_fixed])
#    return eigenvectors * D * dagger(eigenvectors)

def matrix_root_fix(A, n, threshold=1e-10):
    """
    Compute the nth root of a matrix A, ensuring positive eigenvalues.

    Parameters:
    -----------
    A : mp.matrix
        Input matrix to be rooted.
    n : int
        Root degree (e.g., 2 for square root).
    threshold : float
        Threshold below which negative eigenvalues are treated as zero.

    Returns:
    --------
    A_root : mp.matrix
        Matrix such that A_root^n = A.
    """
    eigenvalues, eigenvectors = mp.eig(A)

    # Fix eigenvalues to handle numerical or physical inconsistencies
    eigenvalues_fixed = []
    for ev in eigenvalues:
        real_part = mp.re(ev)
        imag_part = mp.im(ev)

        # Handle numerical artifacts in eigenvalues
        if real_part < 0:
            if abs(real_part) < threshold:  # Treat small negatives as zero
                real_part = 0
            else:
                raise ValueError(f"Cannot compute even root of negative eigenvalue: {ev}")

        if imag_part != 0:
            raise ValueError(f"Cannot compute even root of complex eigenvalue: {ev}")

        eigenvalues_fixed.append(real_part)

    # Compute the root of the fixed eigenvalues
    #D = mp.diag(*[ev**(1/n) for ev in eigenvalues_fixed])
    D = mp.zeros(A.rows, A.cols)
    for i in range(A.rows):
        D[i, i] = eigenvalues_fixed[i]**(1/n)

    # Reconstruct the matrix root
    A_root = eigenvectors * D * dagger(eigenvectors)
    return A_root




def casas_ibarra_MD(m_nu_diag, M_R_diag, U_PMNS, R):
    """
    Compute the Dirac mass matrix M_D using the Casas-Ibarra parametrization.

    Parameters:
    -----------
    m_nu_diag : mp.matrix
        Diagonal light neutrino mass matrix (3x3).
    M_R_diag : mp.matrix
        Diagonal heavy neutrino mass matrix (3x3).
    U_PMNS : mp.matrix
        PMNS mixing matrix (3x3).
    R : mp.matrix
        Orthogonal matrix (3x3) parameterizing heavy-light mixing.

    Returns:
    --------
    M_D : mp.matrix
        Dirac neutrino mass matrix (3x3).
    """
    # Square roots of the light and heavy neutrino mass matrices
    sqrt_m_nu_diag = matrix_root(m_nu_diag, n=2)
    sqrt_M_R_diag = matrix_root(M_R_diag, n=2)
    
    # Construct M_D
    M_D = 1j * U_PMNS * sqrt_m_nu_diag * R * sqrt_M_R_diag
    return M_D

def compute_MD_seesaw_I_mlrsm(m_nu_diag, M_R_diag, U_PMNS=pmns_matrix(), W_R=mp.eye(3)):
    """
    Compute the symmetric Dirac mass matrix M_D in the MLRSM, incorporating 
    the PMNS matrix and W_R.

    Parameters:
    -----------
    m_nu_diag : mp.matrix
        Diagonal light neutrino mass matrix (3x3).
    M_R_diag : mp.matrix
        Diagonal heavy neutrino mass matrix (3x3).
    U_PMNS : mp.matrix
        PMNS mixing matrix (3x3).
    W_R : mp.matrix
        Unitary matrix that diagonalizes M_R (3x3).

    Returns:
    --------
    M_D : mp.matrix
        Symmetric Dirac mass matrix (3x3).
    """
    # Compute the diagonal square root of -m_nu_diag * M_R_diag
    Mnu = conj_matrix(U_PMNS)*m_nu_diag*dagger(U_PMNS)
    MR = W_R * M_R_diag * W_R.T
    sqrt_mnu_MR = matrix_root(Mnu*MR, n=2)

    # Construct M_D
    M_D = 1j*sqrt_mnu_MR
    return M_D

def M_full_typeI_seesaw(m_nu_diag, M_R_diag, U_PMNS=pmns_matrix(delta=0), W_R=mp.eye(3)):
    """
    Compute the full neutrino mass matrix M_full in Type I Seesaw.
    """
    M_D = compute_MD_seesaw_I_mlrsm(m_nu_diag, M_R_diag, U_PMNS, W_R)
    M_R = mp.matrix([[M_R_diag[0,0], 0, 0],[0, M_R_diag[1,1], 0], [0, 0, M_R_diag[2,2]]])
    M_full = mp.zeros(6,6)
    M_full[:3,:3] = mp.zeros(3,3)
    M_full[:3,3:] = M_D
    M_full[3:,:3] = M_D.T
    M_full[3:,3:] = M_R
    return M_full

def compute_hM_type_ii_seesaw(m_nu_diag, v_L, v_R, U_PMNS=pmns_matrix()):
    """
    Compute the Yukawa matrix h_M in Type II Seesaw.

    Parameters:
    -----------
    m_nu_diag : mp.matrix
        Diagonal light neutrino mass matrix (3x3, in GeV).
    U_PMNS : mp.matrix
        PMNS mixing matrix (3x3).
    gamma : float
        Ratio of triplet VEVs, v_L / v_R.
    v_R : float
        Right-handed triplet VEV (in GeV).

    Returns:
    --------
    h_M : mp.matrix
        Symmetric Yukawa matrix \( h_M \) (3x3).
    """
    # Compute the light neutrino mass matrix
    M_nu = U_PMNS * m_nu_diag * dagger(U_PMNS)

    # Compute h_M
    gamma = v_L / v_R
    h_M = M_nu / (gamma * v_R)

    return h_M

def M_full_typeII_seesaw(m_nu_diag, v_L, v_R, U_PMNS=pmns_matrix()):
    """
    Compute the full neutrino mass matrix M_full in Type II Seesaw.
    M_L = v_L/v_R * M_R
    M_R = v_R * h_M
    M_D = 0
    """
    h_M = compute_hM_type_ii_seesaw(m_nu_diag, v_L, v_R, U_PMNS)
    M_D = mp.matrix([[0, 0, 0],[0, 0, 0], [0, 0, 0]])
    M_R = v_R * h_M
    M_L = v_L/v_R * M_R

    # Ensure M_L and M_R are in `mpmath.matrix` format
    M_L = mp.matrix(M_L.tolist())
    M_R = mp.matrix(M_R.tolist())

    # Dimension checks
    if M_L.rows != 3 or M_L.cols != 3:
        raise ValueError(f"M_L has incorrect dimensions: {M_L.rows}x{M_L.cols}")
    if M_R.rows != 3 or M_R.cols != 3:
        raise ValueError(f"M_R has incorrect dimensions: {M_R.rows}x{M_R.cols}")

    M_full = mp.zeros(6,6)
    M_full[:3,:3] = M_L
    M_full[:3,3:] = M_D
    M_full[3:,:3] = M_D.T
    M_full[3:,3:] = M_R
    return M_full

def type_i_plus_ii_seesaw(mnu_diag, MR_diag, WR=mp.eye(3), VL=pmns_matrix(),vR=1e5, vL=1e-5):
    """
    Compute the Dirac mass matrix (M_D) using Type I + Type II seesaw mechanism
    with the inclusion of the W_R matrix that diagonalizes M_R.

    Parameters:
    -----------
    mnu_diag : mp.matrix
        Diagonal light neutrino mass matrix (3x3, in GeV).
    MR_diag : mp.matrix
        Diagonal heavy neutrino mass matrix (3x3, in GeV).
    WR : mp.matrix
        Right-handed mixing matrix that diagonalizes M_R.
    VL : mp.matrix
        PMNS matrix that diagonalizes the light neutrino mass matrix.
    vL : float
        Left-handed triplet VEV (in GeV).

    Returns:
    --------
    MD : mp.matrix
        Dirac neutrino mass matrix (3x3).
    ML : mp.matrix
        Left-handed Majorana mass matrix (3x3).
    """
    # Ensure inputs are symmetric and consistent
    if not is_diagonal(mnu_diag):
        raise ValueError("The light neutrino mass matrix (mnu_diag) must be diagonal.")
    if not is_diagonal(MR_diag):
        raise ValueError("The heavy neutrino mass matrix (MR_diag) must be diagonal.")

    # Step 1: Write M_R in terms of W_R and MR_diag
    MR = WR * MR_diag * WR.T  # M_R = W_R * diag(M_R) * W_R.T
    ML = vL/vR * MR  # M_L = v_L/v_R * M_R

    # Step 2: Term I
    term1 = (vL / vR) * (MR**2)
    # Step 3: Term II
    Mnu = conj_matrix(VL) * mnu_diag * dagger(VL)  # Diagonal form of the light neutrino mass matrix
    term2 = MR*Mnu
    # Step 3: Solve for M_D
    # M_D^2 = v_L/v_R * MR**2 -M_R*Mnu
    intermediate = term1 - term2

    # Debugging: Check eigenvalues of intermediate
    eigenvalues = mp.eig(intermediate)[0]
    print("Intermediate eigenvalues (real parts):", [mp.re(ev) for ev in eigenvalues])
    print("Intermediate eigenvalues (imag parts):", [mp.im(ev) for ev in eigenvalues])
    # Step 4: Compute M_D from the square root of the intermediate matrix
    MD = matrix_root_fix(intermediate, n=2)  # Solve for M_D

    return MD, ML 


def M_full_type_i_plus_ii_seesaw(mnu_diag, MR_diag, WR=mp.eye(3), VL=pmns_matrix(),v_R=1e5, v_L=1e-5):
    """
    Compute the full neutrino mass matrix M_full in Type I + Type II Seesaw.

    Parameters:
    -----------
    mnu_diag : mp.matrix
        Diagonal light neutrino mass matrix (3x3, in GeV).
    MR_diag : mp.matrix
        Diagonal heavy neutrino mass matrix (3x3, in GeV).
    WR : mp.matrix
    Right-handed mixing matrix that diagonalizes M_R.
    VL : mp.matrix
        PMNS matrix that diagonalizes the light neutrino mass matrix.
    vL : float
        Left-handed triplet VEV (in GeV).
    v_R : float
        Right-handed triplet VEV (in GeV).
    """
    # Ensure inputs are symmetric and consistent
    if not is_diagonal(mnu_diag):
        raise ValueError("The light neutrino mass matrix (mnu_diag) must be diagonal.")
    if not is_diagonal(MR_diag):
        raise ValueError("The heavy neutrino mass matrix (MR_diag) must be diagonal.")
    
    # Compute M_D and M_L
    MD, ML = type_i_plus_ii_seesaw(mnu_diag, MR_diag, WR, VL, v_R, v_L)
    M_R = v_R/v_L * ML
    # Construct M_full
    M_full = mp.zeros(6,6)
    M_full[:3,:3] = ML
    M_full[:3,3:] = MD
    M_full[3:,:3] = MD.T
    M_full[3:,3:] = M_R
    return M_full

def reconstruct_light_neutrino_mass(M_full):
    """
    Reconstruct the effective light neutrino mass matrix M_nu^eff from M_full.
    
    Parameters:
    -----------
    M_full : mp.matrix
        Full neutrino mass matrix (6x6).
    
    Returns:
    --------
    M_nu_eff : mp.matrix
        Effective light neutrino mass matrix (3x3).
    """
    M_L = M_full[:3, :3]
    M_D = M_full[:3, 3:]
    M_R = M_full[3:, 3:]
    M_R_inv = M_R ** -1  # Inverse of M_R
    return M_L - M_D * M_R_inv * M_D.T


def compute_reconstruction_error(M_nu_target, M_nu_reconstructed):
    """
    Compute the Frobenius norm reconstruction error.
    
    Parameters:
    -----------
    M_nu_target : mp.matrix
        Target light neutrino mass matrix (3x3).
    M_nu_reconstructed : mp.matrix
        Reconstructed light neutrino mass matrix (3x3).
    
    Returns:
    --------
    error : float
        Relative reconstruction error.
    """
    diff = M_nu_target - M_nu_reconstructed
    norm_diff = mp.norm(diff, p=2)  # Use 'frobenius' to compute Frobenius norm
    norm_target = mp.norm(M_nu_target, p=2)
    return norm_diff / norm_target


def compare_seesaw_approximations(m_nu_diag, M_R_diag, U_PMNS, v_L, v_R, W_R=mp.eye(3)):
    """
    Compare the Type I, Type II, and Type I + II seesaw approximations.
    
    Parameters:
    -----------
    m_nu_diag : mp.matrix
        Diagonal light neutrino mass matrix (3x3).
    M_R_diag : mp.matrix
        Diagonal heavy neutrino mass matrix (3x3).
    U_PMNS : mp.matrix
        PMNS mixing matrix (3x3).
    v_L : float
        Left-handed triplet VEV.
    v_R : float
        Right-handed triplet VEV.
    W_R : mp.matrix
        Matrix that diagonalizes M_R.
    
    Returns:
    --------
    results : dict
        Reconstruction errors for each seesaw approximation.
    """
    # Target light neutrino mass matrix
    M_nu_target = U_PMNS * m_nu_diag * dagger(U_PMNS)

    # Type I seesaw
    M_full_I = M_full_typeI_seesaw(m_nu_diag, M_R_diag, U_PMNS, W_R)
    M_nu_I = reconstruct_light_neutrino_mass(M_full_I)
    error_I = compute_reconstruction_error(M_nu_target, M_nu_I)
    
    # Type II seesaw
    M_full_II = M_full_typeII_seesaw(m_nu_diag, v_L, v_R, U_PMNS)
    M_nu_II = reconstruct_light_neutrino_mass(M_full_II)
    error_II = compute_reconstruction_error(M_nu_target, M_nu_II)
    
    # Compute relative contribution of each term
    type_I_contrib = mp.norm(M_nu_I, p=2) / mp.norm(M_nu_target, p=2)
    type_II_contrib = mp.norm(M_nu_II, p=2) / mp.norm(M_nu_target, p=2)

    print(f"Type I Contribution: {type_I_contrib}")
    print(f"Type II Contribution: {type_II_contrib}")

    # Type I + II seesaw
    M_full_I_II = M_full_type_i_plus_ii_seesaw(m_nu_diag, M_R_diag, W_R, U_PMNS, v_R, v_L)
    M_nu_I_II = reconstruct_light_neutrino_mass(M_full_I_II)
    error_I_II = compute_reconstruction_error(M_nu_target, M_nu_I_II)

    # Collect results
    results = {
        "Type I Error": error_I,
        "Type II Error": error_II,
        "Type I + II Error": error_I_II
    }
    return results

if __name__ == "__main__":
    # Define parameters
    m1 = mp.mpf('1e-12')  # Lightest neutrino mass (GeV)
    delta_m21_sq = mp.mpf('7.49e-5') * mp.mpf('1e-18')  # Solar mass-squared diff (GeV^2)
    delta_m31_sq = mp.mpf('2.534e-3') * mp.mpf('1e-18')  # Atmospheric mass-squared diff (GeV^2)

    m2 = mp.sqrt(m1**2 + delta_m21_sq)
    m3 = mp.sqrt(m1**2 + delta_m31_sq)
    v_L = mp.mpf('1e-1')  # Left-handed triplet VEV
    v_R = mp.mpf('1e4')  # Right-handed triplet VEV

    m_nu_diag = mp.matrix([[m1, 0, 0], [0, m2, 0], [0, 0, m3]])  # Light neutrino masses

    M_R_diag = mp.matrix([[v_R, 0, 0], [0, 2*v_R, 0], [0, 0, 3*v_R]])  # Heavy neutrino masses
    U_PMNS = pmns_matrix()  # PMNS mixing matrix
    W_R = mp.eye(3)  # Assume M_R is already diagonal

    # Compute M_D
    M_D = compute_MD_seesaw_I_mlrsm(m_nu_diag, M_R_diag, U_PMNS=pmns_matrix(), W_R=mp.eye(3))
    print("M_D (Dirac mass matrix):")
    print(mp.nprint(mp.chop(M_D)))
    print('M_D norm :', mp.norm(M_D, p=2))

    # Compare approximations
    results = compare_seesaw_approximations(m_nu_diag, M_R_diag, U_PMNS, v_L, v_R, W_R)

    # Print results
    print("v_L = ", mp.nprint(mp.chop(v_L)))
    print("v_R = ", mp.nprint(mp.chop(v_R)))
    for model, error in results.items():
        print(f"{model}: {mp.nstr(error, 5)}")

