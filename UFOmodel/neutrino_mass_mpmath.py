import mpmath as mp
from sympy import sympify

def dagger(matrix):
    """
    Calculate the Hermitian conjugate (dagger) of an mpmath matrix.
    
    Parameters:
    -----------
    matrix : mp.matrix
        Input mpmath matrix.
    
    Returns:
    --------
    result : mp.matrix
        The Hermitian conjugate of the input matrix.
    """
    # Get dimensions of the matrix
    rows, cols = matrix.rows, matrix.cols
    
    # Initialize an empty matrix with swapped dimensions (transpose)
    result = mp.zeros(cols, rows)
    
    # Compute the transpose and take the complex conjugate
    for i in range(rows):
        for j in range(cols):
            result[j, i] = mp.conj(matrix[i, j])  # Transpose and conjugate
    
    return result

def conj_matrix(matrix):
    """
    Calculate the complex conjugate of an mpmath matrix.
    """
    # Get dimensions of the matrix
    rows, cols = matrix.rows, matrix.cols

    # Initialize an empty matrix with swapped dimensions (transpose)
    result = mp.zeros(cols, rows)
    
    # Compute the transpose and take the complex conjugate
    for i in range(rows):
        for j in range(cols):
            result[i, j] = mp.conj(matrix[i, j])  # conjugate
    
    return result

def matrix_root(A, n=2, tolerance=1e-10):
    """
    Compute the nth root of a matrix A using eigen-decomposition.

    Parameters:
    -----------
    A : mp.matrix
        Input square matrix (must be diagonalizable).
    n : int
        Degree of the root (e.g., n=2 for square root, n=3 for cube root).
    tolerance : float
        Threshold for treating eigenvalues as real.

    Returns:
    --------
    A_root : mp.matrix
        The nth root of the matrix A.
    """
    # Ensure A is square
    if A.rows != A.cols:
        raise ValueError("Matrix must be square.")
    
    # Compute eigenvalues and eigenvectors
    eigenvalues, eigenvectors = mp.eig(A)

    # Sort eigenvalues and eigenvectors
    eigenvalues, eigenvectors = mp.eig_sort(eigenvalues, eigenvectors)

    # Diagonal matrix of nth roots of eigenvalues
    D_root = mp.zeros(A.rows, A.cols)
    for i, eigenvalue in enumerate(eigenvalues):
        # Check if the eigenvalue is effectively real
        if abs(mp.im(eigenvalue)) < tolerance:
            eigenvalue = mp.re(eigenvalue)  # Treat as real
            if eigenvalue < 0 and n % 2 == 0:
                raise ValueError(f"Cannot compute even root of negative eigenvalue: {eigenvalue}")
        else:
            if n % 2 == 0:
                raise ValueError(f"Cannot compute even root of complex eigenvalue: {eigenvalue}")

        # Compute the nth root of the eigenvalue
        D_root[i, i] = mp.root(eigenvalue, n)

    # Reconstruct the matrix root: A^(1/n) = P * D^(1/n) * P^-1
    P = mp.matrix(eigenvectors)  # Eigenvectors matrix
    P_inv = P ** -1              # Inverse of the eigenvector matrix
    A_root = P * D_root * P_inv  # Reconstruct the nth root matrix

    return A_root

# delta=mp.radians(197)
def pmns_matrix(theta12=mp.radians(33.68), theta13=mp.radians(8.52), theta23=mp.radians(48.5), delta=0, alpha1=0, alpha2=0, precision=50):
    """
    Construct the PMNS mixing matrix using mpmath for arbitrary precision.

    Parameters:
    -----------
    theta12, theta13, theta23 : float
        Mixing angles in radians.
    delta : float
        Dirac CP phase in radians (default is 0).
    alpha1, alpha2 : float
        Majorana phases in radians (default is 0).
    precision : int
        Number of decimal places for arbitrary precision.

    Returns:
    --------
    U : mp.matrix
        PMNS mixing matrix (3x3).
    """
    # Set precision
    mp.mp.dps = precision

    # Compute sines and cosines of the angles
    c12, s12 = mp.cos(theta12), mp.sin(theta12)
    c13, s13 = mp.cos(theta13), mp.sin(theta13)
    c23, s23 = mp.cos(theta23), mp.sin(theta23)

    # Dirac CP phase matrix
    phase_delta = mp.matrix([
        [1, 0, 0],
        [0, 1, 0],
        [0, 0, mp.exp(-1j * delta)]
    ])

    # Majorana CP phase matrix
    phase_majorana = mp.matrix([
        [mp.exp(1j * alpha1 / 2), 0, 0],
        [0, mp.exp(1j * alpha2 / 2), 0],
        [0, 0, 1]
    ])

    # Mixing matrices for angles
    R12 = mp.matrix([
        [c12, s12, 0],
        [-s12, c12, 0],
        [0, 0, 1]
    ])

    R13 = mp.matrix([
        [c13, 0, s13],
        [0, 1, 0],
        [-s13, 0, c13]
    ])

    R23 = mp.matrix([
        [1, 0, 0],
        [0, c23, s23],
        [0, -s23, c23]
    ])

    # Combine into the PMNS matrix
    U = R23 * R13 * phase_delta * R12 * phase_majorana
    return U

def is_diagonal(matrix, tolerance=1e-10):
    """
    Check if a given mpmath matrix is diagonal.

    Parameters:
    -----------
    matrix : mp.matrix
        Input matrix to check.
    tolerance : float
        Threshold for numerical precision.

    Returns:
    --------
    bool
        True if the matrix is diagonal, False otherwise.
    """
    rows, cols = matrix.rows, matrix.cols

    # Ensure the matrix is square
    if rows != cols:
        raise ValueError("Matrix must be square to check for diagonal.")

    # Check all off-diagonal elements
    for i in range(rows):
        for j in range(cols):
            if i != j and abs(matrix[i, j]) > tolerance:
                return False
    return True


def hM_diag(a=1,b=2,c=3):
    return mp.matrix([[a, 0, 0], [0, b, 0], [0, 0, c]])

#def O_charge_conjugation_case(mnu_diag, MN_diag, V_L=pmns_matrix(), V_R=mp.eye(3)):
#    """
#    Compute the Ortogonal matrix O matrix for the charge conjugation case
#    """
#    O = matrix_root(MN_diag**-1)*dagger(V_R)*matrix_root(
#        V_R*MN_diag*V_R.T*conj_matrix(V_L)*mnu_diag*dagger(V_L)
#    )*V_L*matrix_root(mnu_diag**-1)
#    return O

#def mD_charge_conjugation_case(mnu_diag, MN_diag, V_L=pmns_matrix(), V_R=mp.eye(3)):
#    # Compute the matrix product
#    O = O_charge_conjugation_case(mnu_diag, MN_diag, V_L=V_L, V_R=V_R)
#    result = conj_matrix(V_R) * matrix_root(MN_diag) *O* matrix_root(mnu_diag) * dagger(V_L)
#    return result

# Step 1: Generate the neutrino mass matrix
def compute_MD(M_R, M_nu_light, v_L, v_R):
    """
    Compute the Dirac neutrino mass matrix M_D from the seesaw relation.
    
    Parameters:
    -----------
    M_R : mp.matrix
        Right-handed Majorana neutrino mass matrix (3x3).
    M_nu_light : mp.matrix
        Light neutrino mass matrix (3x3).
    v_L : float
        VEV of the left-handed Higgs triplet (very small, e.g., 1e-5 GeV).
    v_R : float
        VEV of the right-handed Higgs triplet (large, e.g., 1e4 GeV).
    
    Returns:
    --------
    M_D : mp.matrix
        Dirac neutrino mass matrix (3x3).
    """
    # Compute gamma = v_L / v_R
    gamma = v_L / v_R

    # Compute M_L = gamma * M_R
    M_L = gamma * M_R

    # Compute the term inside the square root: M_R (gamma * M_R - M_nu_light)
    term = M_R * (M_L - M_nu_light)

    # Compute the square root of the term
    M_D = matrix_root(term, n=2)  # Use matrix_root for the square root

    return M_D, M_L


def generate_symmetric_neutrino_mass_matrix(M_R, M_nu_light, v_L, v_R):
    """
    Constructs the full symmetric neutrino mass matrix.

    Parameters:
    -----------
    Same as before...

    Returns:
    --------
    M_full : mp.matrix
        Full 6x6 symmetric neutrino mass matrix.
    """
    
    M_D, M_L = compute_MD(M_R, M_nu_light, v_L, v_R)

    # Construct the symmetric full neutrino mass matrix
    M_full = mp.zeros(6, 6)
    M_full[:3, :3] = M_L
    M_full[:3, 3:] = M_D
    M_full[3:, :3] = M_D.T
    M_full[3:, 3:] = M_R

    return M_full


# Step 2: Diagonalize the mass matrix
# Step 2: Diagonalize the mass matrix
def diagonalize_symmetric_matrix(A):
    """
    Diagonalize a symmetric matrix A using mpmath.

    Parameters:
    -----------
    A : mp.matrix
        Input symmetric matrix.

    Returns:
    --------
    D : mp.matrix
        Diagonal matrix of eigenvalues.
    V : mp.matrix
        Matrix of eigenvectors (orthogonal, V^T = V^-1).
    """
    # Compute eigenvalues and eigenvectors
    eigenvalues, eigenvectors = mp.eig(A, left=False, right=True)

    # Sort eigenvalues and eigenvectors
    eigenvalues, eigenvectors = mp.eig_sort(eigenvalues, eigenvectors)

    # Construct the diagonal matrix D
    D = mp.zeros(A.rows, A.cols)
    for i, eigenvalue in enumerate(eigenvalues):
        D[i, i] = eigenvalue

    # Construct the eigenvector matrix V
    V = mp.matrix(eigenvectors)

    # Normalize eigenvectors
    for i in range(V.cols):
        norm = mp.sqrt(sum(abs(V[j, i])**2 for j in range(V.rows)))
        for j in range(V.rows):
            V[j, i] /= norm

    return D, V


def is_symmetric_diagonalization_correct(A, D, V, tolerance=1e-10):
    """
    Test if a diagonalization is correct for a symmetric matrix (A = V * D * V^T).

    Parameters:
    -----------
    A : mp.matrix
        Original symmetric matrix.
    D : mp.matrix
        Diagonal matrix of eigenvalues.
    V : mp.matrix
        Orthogonal eigenvector matrix (V^T = V^-1).
    tolerance : float
        Numerical precision threshold.

    Returns:
    --------
    bool
        True if the diagonalization is correct, False otherwise.
    """
    # Reconstruct A using V, D, and V^T
    A_reconstructed = V * D * V.T

    # Check element-wise differences
    for i in range(A.rows):
        for j in range(A.cols):
            abs_diff = abs(A[i, j] - A_reconstructed[i, j])
            rel_diff = abs_diff / max(abs(A[i, j]), abs(A_reconstructed[i, j]), tolerance)
            if rel_diff > tolerance:
                print(f"Element mismatch at ({i}, {j}): "
                    f"A[{i},{j}] = {mp.chop(A[i, j])}, "
                    f"Reconstructed[{i},{j}] = {mp.chop(A_reconstructed[i, j])}, "
                    f"Abs Diff = {mp.chop(abs_diff)}, Rel Diff = {mp.chop(rel_diff)}")
                return False

    print("Diagonalization passed with relative tolerance.")
    return True

# Step 3: Extract submatrices from V
def extract_submatrices(V):
    """
    Extract submatrices V_L^nu, V_R^nu from the full unitary matrix V.
    
    Parameters:
    -----------  
    V : mp.matrix
        Full 6x6 unitary mixing matrix.
    
    Returns:
    --------
    V_L_nu : mp.matrix
        Left-handed neutrino mixing submatrix (3x6).
    V_R_nu : mp.matrix
        Right-handed neutrino mixing submatrix (3x6).
    """
    # Submatrices for neutrinos
    V_L_nu = V[:3, :]  # First 3 rows of V
    V_R_nu = V[3:, :]  # Last 3 rows of V

    return V_L_nu, V_R_nu


# Step 4: Generate h_L, h_L_tilde, and h_M
def generate_hL_hLtilde_hM(m_nu_diag, m_l_diag, v1, v2, v_r, K_L, K_R):
    """
    Compute the Yukawa matrices h_L, h_L_tilde, and h_M.

    Parameters:
    -----------  
    m_nu_diag : mp.matrix
        Diagonal light neutrino mass matrix (3x3, in eV).
    m_l_diag : mp.matrix
        Diagonal charged lepton mass matrix (3x3, in eV).
    v1 : float
        VEV of the bidoublet Higgs field \( k_1 \) (electroweak scale, in eV).
    v2 : float
        VEV of the bidoublet Higgs field \( k_2 \) (electroweak scale, in eV).
    v_r : float
        VEV of the right-handed Higgs triplet (in eV).
    K_L : mp.matrix
        Left-handed mixing matrix (6x3).
    K_R : mp.matrix
        Right-handed mixing matrix (6x3).
    
    Returns:
    --------
    h_L : mp.matrix
        Yukawa matrix \( h_L \) (3x3).
    h_L_tilde : mp.matrix
        Yukawa matrix \( \tilde{h}_L \) (3x3).
    h_M : mp.matrix
        Yukawa matrix \( h_M \) (3x3).
    """
    # Extract light neutrino submatrices from K_L and K_R
    K_L_light = K_L[:3, :]  # (3x3)
    K_R_light = K_R[:3, :]  # (3x3)

    # Compute Yukawa matrices
    k_plus_squared = v1**2 - v2**2
    h_L = (mp.sqrt(2) / k_plus_squared) * (
        v1 * K_L_light @ m_nu_diag @ K_R_light.T - v2 * m_l_diag
    )
    h_L_tilde = (mp.sqrt(2) / k_plus_squared) * (
        -v2 * K_L_light @ m_nu_diag @ K_R_light.T + v1 * m_l_diag
    )
    h_M = (1 / mp.sqrt(2) / v_r) * (K_R_light.T @ m_nu_diag @ K_R_light)

    return h_L, h_L_tilde, h_M

def KL_KR_from_V(V, V_L_l=mp.eye(3), V_R_l=mp.eye(3)):
    # Extract left-handed mixing matrix K_L and right-handed mixing matrix K_R from V
    V_L_nu, V_R_nu = extract_submatrices(V)
    K_L = dagger(V_L_nu)*V_L_l
    K_R = dagger(V_R_nu)*V_R_l
    return K_L, K_R


def KL_KR_from_V_dict_sympy(V, KL_name = 'KL', KR_name = 'KR', V_L_l=mp.eye(3), V_R_l=mp.eye(3), tolerance=1e-10):
    # Extract left-handed mixing matrix K_L and right-handed mixing matrix K_R from V
    K_L, K_R = KL_KR_from_V(V, V_L_l=V_L_l, V_R_l=V_R_l)
    KL_dict = {}
    KR_dict = {}
    for i in range(K_L.rows):
        for j in range(K_L.cols):
            if abs(mp.im(K_L[i, j])) < tolerance:
                KL_dict[sympify(KL_name + str(i+1) + 'x' + str(j+1))] = mp.chop(mp.re(K_L[i, j]))
            else:
                KL_dict[sympify(KL_name + str(i+1) + 'x' + str(j+1))] = mp.chop(K_L[i, j])
            if abs(mp.im(K_R[i, j])) < tolerance:
                KR_dict[sympify(KR_name + str(i+1) + 'x' + str(j+1))] = mp.chop(mp.re(K_R[i, j]))
            else:
                KR_dict[sympify(KR_name + str(i+1) + 'x' + str(j+1))] = mp.chop(K_R[i, j])
    return KL_dict, KR_dict

def eigenvals_dict_sympy(eigenvalues, name = 'MN', tolerance=1e-10):
    # Convert eigenvalues to dictionary with sympy symbols
    eigenvals_dict = {}
    for i in range(len(eigenvalues)):
        if abs(mp.im(eigenvalues[i])) < tolerance:
            eigenvals_dict[sympify(name + str(i+1))] = mp.chop(mp.re(eigenvalues[i]))
        else:
            eigenvals_dict[sympify(name + str(i+1))] = mp.chop(eigenvalues[i])
    return eigenvals_dict

# Main computation
if __name__ == "__main__":
    # Set mpmath precision
    mp.mp.dps = 120 # Set precision to 80 decimal places
    mp.pretty = True 

    m1 = mp.mpf('1e-12')  #GeV 

    #current values to Square mass differences
    squareDm21 = mp.mpf('7.49e-5') # Solar mass difference in eV^2
    squareDm31 = mp.mpf('2.534e-3') # Atmospheric mass difference in eV^2
    d21 = mp.mpf(str(squareDm21))*mp.mpf('1e-18')# factor to convert eV^2 to GeV^2
    d31 = mp.mpf(str(squareDm31))*mp.mpf('1e-18')

    m2 = mp.sqrt(m1**2 + d21)
    m3 = mp.sqrt(m1**2 + d31)

    # Define input parameters
    m_nu_diag = mp.matrix([[m1, 0, 0], [0, m2, 0], [0, 0, m3]]) # Light neutrino masses (GeV)
    M_N_diag = mp.matrix([[1000, 0, 0], [0, 2000, 0], [0, 0, 3000]]) # Heavy neutrino masses (GeV)
    m_l_diag = mp.matrix([[0.511, 0, 0], [0, 105.66, 0], [0, 0, 1776.86]]) # Charged lepton masses (GeV)

    # Higgs VEVs
    v_L = mp.mpf('1e-5')  # Left-handed triplet VEV (very small, in GeV)
    v_R = mp.mpf('1e4')  # Right-handed triplet VEV (high scale, in GeV)
    #v = mp.mpf('246')  # Electroweak scale (in GeV)
    #th_v = mp.radians(30)  # angle bidoublet Higgs VEVs
    #v1 = v*mp.cos(th_v)  # Bidoublet Higgs VEV k1 (in GeV)
    #v2 = v*mp.sin(th_v) # Bidoublet Higgs VEV k2 (in GeV)

    # Construct the full neutrino mass matrix
    M_full = generate_symmetric_neutrino_mass_matrix(m_nu_diag, M_N_diag, v_L, v_R)
    print('Full neutrino mass matrix:')
    print(mp.nprint(mp.chop(M_full)))

    # Diagonalize the mass matrix
    D, V = diagonalize_symmetric_matrix(M_full)

    print("\nEigenvalues (Neutrino Masses in GeV):")
    print(mp.nprint(mp.chop(D)))

    # Comprobation
    print("Comprobation of the diagonalization")
    if is_symmetric_diagonalization_correct(M_full, D, V):
        print("The diagonalization is correct.")
    else:
        print("The diagonalization is not correct.")
    
    # Extract submatrices and calculate K_L, K_R
    #V_L_nu, V_R_nu = extract_submatrices(V)

    # Extract left-handed and right-handed mixing matrices KL, KR
    #K_L, K_R = KL_KR_from_V(V)

    # Print results
    #print("Full unitary mixing matrix (V):")
    #print(mp.nprint(mp.chop(V)))

    #print("\nLeft-handed neutrino mixing matrix (V_L^nu):")
    #print(mp.nprint(mp.chop(V_L_nu)))

    #print("\nRight-handed neutrino mixing matrix (V_R^nu):")
    #print(mp.nprint(mp.chop(V_R_nu)))

    #print("\nLeft-handed neutrino mixing matrix (K_L):")
    #print(mp.nprint(mp.chop(K_L)))

    #print("\nRight-handed neutrino mixing matrix (K_R):")
    #print(mp.nprint(mp.chop(K_R)))

    #print("\nKL and KR as sympy dictionaries:")
    #KL_dict, KR_dict = KL_KR_from_V_dict_sympy(V)
    #print(KL_dict)
    #print(KR_dict)

    #print("\nEigenvalues as sympy dictionary:")
    #eigenvals_dict = eigenvals_dict_sympy(eigenvalues)
    #print(eigenvals_dict)

