# Comparison of diferent implementations in qcdloop_pv.py of Passrino-Veltman functions
# to see if they agree numerically with each other and with QCDLoop library.
# The implementations are:
# - Native qcdloop functions (A0, B0, C0)
# - B1, C1, C2 defined in terms of A0, B0, C0 following Passarino-Veltman reduction formulas from Feyncalc.
# - B1_0, B2_0, C1_, C2_ following our notation in the paper.
import numpy as np
import matplotlib.pyplot as plt
from qcdloop_pv import A0, B0, C0, C0_, B1, C1, C2, B1_0, B2_0, B1_1, B2_1, C1_, C2_

#  The arguments of the functions are:
#  A0(m^2) # qcdloop native
#  B0(p^2, m1^2, m2^2) # qcdloop native
#  B1(p^2, m1^2, m2^2) # defined in terms of A0, B0 following Passarino-Veltman reduction formulas from Feyncalc.
#  B1_0(ma, M0, M1) # our notation in the paper.
#  B1_1(m_a, M0, M1) # our notation in the paper.
#  B2_0(mb, M0, M2) # our notation in the paper.
#  B2_1(m_a, M0, M2) # our notation in the paper.
#  C0(p1^2, p2^2, p3^2, m1^2, m2^2, m3^2) # qcdloop native
#  C0_(mX, ma, mb, M0, M1, M2) # our notation in the paper.
#  C1(p1^2, (p1-p2)^2, p2^2, m1^2, m2^2, m3^2) # defined in terms of A0, B0, C0 following Passarino-Veltman reduction formulas from Feyncalc.
#  C2(p1^2, (p1-p2)^2, p2^2, m1^2, m2^2, m3^2) # defined in terms of A0, B0, C0 following Passarino-Veltman reduction formulas from Feyncalc.
#  C1_(mX, ma, mb, M0, M1, M2) # our notation in the paper.
#  C2_(mX, ma, mb, M0, M1, M2) # our notation in the paper.

# The conventions in each case are:
# B0(p^2, m1^2, m2^2) = \int d^d k / (i pi^2) 1 / [ (k^2 - m1^2) ((k+p)^2 - m2^2) ] = B0
# B1_0(ma, M0, M1) = \int d^d k / (i pi^2) 1 / [ (k^2 - M0^2) ((k - pa)^2 - M1^2) ] = B0, with the onshell condition pa^2 = ma^2
# In comparison, B0(p^2, m1^2, m2^2) = B1_0(ma^2, M0^2, M1^2) with the identification p = -pa, p^2 = ma^2, m1^2 = M0^2, m2^2 = M1^2
# B2_0(mb, M0, M2) = \int d^d k / (i pi^2) 1 / [ (k^2 - M0^2) ((k + pb)^2 - M2^2) ] = B0, with the onshell condition pb^2 = mb^2
# In comparison, B0(p^2, m1^2, m2^2) = B2_0(mb^2, M0^2, M2^2) with the identification p = pb, p^2 = mb^2, m1^2 = M0^2, m2^2 = M2^2
# B1(p^2, m1^2, m2^2) = \int d^d k / (i pi^2) k_mu / [ (k^2 - m1^2) ((k+p)^2 - m2^2) ] = p_mu B1
# B1_1(ma, M0, M1) = \int d^d k / (i pi^2) k_mu / [ (k^2 - M0^2) ((k - pa)^2 - M1^2) ] = p_mu B1_1, with the onshell condition pa^2 = ma^2
# In comparison, B1(p^2, m1^2, m2^2) = - B1_1(ma^2, M0^2, M1^2) with the identification p = -pa, p^2 = ma^2, m1^2 = M0^2, m2^2 = M1^2
# B2_1(mb, M0, M2) = \int d^d k / (i pi^2) k_mu / [ (k^2 - M0^2) ((k + pb)^2 - M2^2) ] = -pb_mu B2_1, with the onshell condition pb^2 = mb^2
# In comparison, B1(p^2, m1^2, m2^2) = B2_1(mb^2, M0^2, M2^2) with the identification p = pb, p^2 = mb^2, m1^2 = M0^2, m2^2 = M2^2
# C0(p1^2, p2^2, p3^2, m1^2, m2^2, m3^2) = \int d^d k / (i pi ^2) 1 / [ (k^2 - m1^2) ((k+p1)^2 - m2^2) ((k+p1+p2)^2 - m3^2) ] = C0 
# with the onshell conditions p1^2 = ma^2, p2^2 = mX^2, p3^2 = mb^2 and (p1 + p2 + p3) = 0, i.e. p3 = - (p1 + p2)
# C0_(mX, ma, mb, M0, M1, M2) = \int d^d k / (i pi ^2) 1 / [ (k^2 - M0^2) ((k - pa)^2 - M1^2) ((k + pb)^2 - M2^2) ] = C0_, 
# with the onshell conditions pa^2 = ma^2, pb^2 = mb^2, (pa + pb)^2 = mX^2 and 2 pa pb = mX^2 - ma^2 - mb^2
# In comparison, C0(p1^2, p2^2, p3^2, m1^2, m2^2, m3^2) we should consider the momentum shift k -> -k + pa
# with the identification , p3 = -(p1 + p2) = -(-pa - (pa + pb)) = -(-pa - pa - pb) = -2pa - pb,
# p1^2 = ma^2, p2^2 = mX^2, p3^2 = (2pa + pb)^2 = 4 ma^2 + mb^2 + 4 pa pb = 4 ma^2 + mb^2 + 2(mX^2 - ma^2 - mb^2), m1^2 -> M1^2, m2^2 = M0^2, m3^2 = M2^2
# Cmu = \int d^d k / (i pi^2) k_mu / [ (k^2 - m1^2) ((k+p1)^2 - m2^2) ((k+p1+p2)^2 - m3^2) ] = p1_mu C1 + p2_mu C2
# Cmu_ = \int d^d k / (i pi^2) k_mu / [ (k^2 - M0^2) ((k - pa)^2 - M1^2) ((k + pb)^2 - M2^2) ] = pa_mu C1_ - pb_mu C2_
# with the momentum shift k -> -k + pa and p1 = -pa, p2 = - (pa + pb), m1 -> M1, m2 -> M0, m3 -> M2, then Cmunu goes to 
# Cmunu -> \int d^d k / (i pi^2) (-k_mu + pa_mu) / [ ((k - pa)^2 - M1^2) (k^2 - M0^2) ((k + pb)^2 - M2^2) ] = -Cmunu_ + pa_mu C0_ = Cmunu_prime
# However the momentum shift does not affect Cmunu, then in one hand we have
# Cmunu_prime = Cmunu = p1_mu C1 + p2_mu C2 = -pa_mu C1 + -(pa + pb)_mu C2 = -pa_mu C1 - pa_mu C2 - pb_mu C2 = -pa_mu (C1 + C2) - pb_mu C2
# and in the other hand we have
# Cmunu_prime = -Cmunu_ + pa_mu C0_ = -pa_mu C1_ - pb_mu C2_ + pa_mu C0_ = -pa_mu (C1_ - C0_) - pb_mu C2_
# then we identify C2 = C2_ and C1 + C2 = C1_ - C0_ -> C1 = C1_ - C2_ - C0_
# or equivalently C1_ = C1 + C2 + C0_, C2_ = C2

# We will compare the functions in a range of values for the arguments.
# We will use the following fixed values for the masses:
me = 0.511e-3 # electron mass in GeV
mmu = 0.10566 # muon mass in GeV
mtau = 1.77686 # tau mass in GeV
mN = 200 # heavy neutrino GeV
MW = 1000 # W' boson mass in GeV
mH = 125.06 # H boson mass in GeV



B0 = np.vectorize(B0)
B1 = np.vectorize(B1)
B1_0 = np.vectorize(B1_0)
B1_1 = np.vectorize(B1_1)
B2_0 = np.vectorize(B2_0)
B2_1 = np.vectorize(B2_1)
C0 = np.vectorize(C0)
C0_ = np.vectorize(C0_)
C1 = np.vectorize(C1)
C2 = np.vectorize(C2)
C1_ = np.vectorize(C1_)
C2_ = np.vectorize(C2_)

# Plotting safety options
clip_threshold = 1e6  # clip real parts to [-clip_threshold, clip_threshold] for plotting


# Calculate the results
# We will vary the neutrino mass
mN_val = np.linspace(1e-6, 1e6, 200)

B0_qcdloop_vals = B0(me**2, mN_val**2, MW**2)
B1_feyncalc_vals = B1(me**2, mN_val**2, MW**2)
B1_0_vals = B1_0(me, mN_val, MW)
B1_1_vals = B1_1(me, mN_val, MW)
B2_0_vals = B2_0(me, mN_val, MW)
B2_1_vals = B2_1(me, mN_val, MW)
C0_qcdloop_vals = C0(me**2, mmu**2, mH**2, MW**2, mN_val**2, MW**2) # 
C0_vals = C0_(mH, me, mmu, mN_val, MW, MW) # m1^2 -> M1^2, m2^2 = M0^2, m3^2 = M2^2
C1_qcdloop_vals = C1(me**2, (me - mmu)**2, mmu**2, MW**2, mN_val**2, MW**2)
C2_qcdloop_vals = C2(me**2, (me - mmu)**2, mmu**2, MW**2, mN_val**2, MW**2)
C1_vals = C1_(mH, me, mmu, mN_val, MW, MW)
C2_vals = C2_(mH, me, mmu, mN_val, MW, MW)


def safe_real(arr, clip_threshold=clip_threshold):
	"""Return a masked array of the real part with non-finite entries masked and
	values clipped to +/- clip_threshold for plotting.
	Also returns counts of non-finite and clipped entries for diagnostics.
	"""
	real = np.real(arr)
	finite_mask = np.isfinite(real)
	clipped = np.zeros_like(real, dtype=bool)
	safe = real.copy()
	# Clip values that exceed threshold
	too_large = np.abs(safe) > clip_threshold
	if np.any(too_large):
		clipped = too_large
		safe[too_large] = np.sign(safe[too_large]) * clip_threshold
	# Create masked array
	masked = np.ma.array(safe, mask=~finite_mask)
	return masked, int(np.sum(~finite_mask)), int(np.sum(clipped))


# Plot the results
plt.figure(figsize=(12, 8))
plt.subplot(2, 2, 1)
B0_masked, B0_nans, B0_clipped = safe_real(B0_qcdloop_vals)
B1_0_masked, B1_0_nans, B1_0_clipped = safe_real(B1_0_vals)
B2_0_masked, B2_0_nans, B2_0_clipped = safe_real(B2_0_vals)

plt.semilogx(mN_val, B0_masked, label='B0 (QCDLoop)', color='blue')
plt.semilogx(mN_val, B1_0_masked, label='B1_0 (Our notation)', color='green', linestyle='-.')
plt.semilogx(mN_val, B2_0_masked, label='B2_0 (Our notation)', color='red', linestyle=':')
plt.xlabel('$m_N$ [GeV]')
plt.ylabel('Real Part')
plt.title('Comparison of B0, B1_0, B2_0 (Real Part)')
plt.legend()
plt.grid()

plt.subplot(2, 2, 2)
B1_feyncalc_masked, B1_feyncalc_nans, B1_feyncalc_clipped = safe_real(B1_feyncalc_vals)
B1_1_masked, B1_1_nans, B1_1_clipped = safe_real(-B1_1_vals)
B2_1_masked, B2_1_nans, B2_1_clipped = safe_real(B2_1_vals)

plt.semilogx(mN_val, B1_feyncalc_masked, label='B1 (FeynCalc)', color='orange', linestyle='--')
plt.semilogx(mN_val, B1_1_masked, label='B1_1 (Our notation)', color='green', linestyle='-.')
plt.semilogx(mN_val, B2_1_masked, label='B2_1 (Our notation)', color='red', linestyle=':')
plt.xlabel('$m_N$ [GeV]')
plt.ylabel('Real Part')
plt.title('Comparison of B1, B1_1, B2_1 (Real Part)')
plt.legend()
plt.grid()

plt.subplot(2, 2, 3)
C0_masked, C0_nans, C0_clipped = safe_real(C0_qcdloop_vals)
C0__masked, C0__nans, C0__clipped = safe_real(C0_vals)

plt.semilogx(mN_val, C0_masked, label='C0 (QCDLoop)', color='blue')
plt.semilogx(mN_val, C0__masked, label='C0_ (Our notation)', color='purple', linestyle='--')
plt.xlabel('$m_N$ [GeV]')
plt.ylabel('Real Part')
plt.title('Comparison of C0, C0_ (Real Part)')
plt.legend()
plt.grid()

plt.subplot(2, 2, 4)
C1_qcdloop_masked, C1_qcdloop_nans, C1_qcdloop_clipped = safe_real(C1_qcdloop_vals)
C1_masked, C1_nans, C1_clipped = safe_real(C1_vals)
C2_qcdloop_masked, C2_qcdloop_nans, C2_qcdloop_clipped = safe_real(C2_qcdloop_vals)
C2_masked, C2_nans, C2_clipped = safe_real(C2_vals)

plt.semilogx(mN_val, C1_qcdloop_masked, label='C1 (FeynCalc)', color='orange', linestyle='--')
plt.semilogx(mN_val, C1_masked, label='C1_ (Our notation)', color='purple', linestyle='--')
plt.semilogx(mN_val, C2_qcdloop_masked, label='C2 (FeynCalc)', color='green', linestyle='-.')
plt.semilogx(mN_val, C2_masked, label='C2_ (Our notation)', color='red', linestyle=':')
plt.xlabel('$m_N$ [GeV]')
plt.ylabel('Real Part')
plt.title('Comparison of C1, C1_, C2, C2_ (Real Part)')
plt.legend()
plt.grid()

plt.tight_layout()

plt.show()

# plot of det M = p1sq * p2sq - p1dotp2 * p1dotp2
p1sq = me**2
p2sq = mmu**2
p1dotp2 = (mH**2 - me**2 - mmu**2) / 2
detM = p1sq * p2sq - p1dotp2 * p1dotp2
print(f'det M = {detM}') 

# Print diagnostics about masking/clipping
def print_masking_summary():
	pairs = [
		("B0", B0_nans, B0_clipped),
		("B1_0", B1_0_nans, B1_0_clipped),
		("B2_0", B2_0_nans, B2_0_clipped),
		("B1_feyncalc", B1_feyncalc_nans, B1_feyncalc_clipped),
		("B1_1", B1_1_nans, B1_1_clipped),
		("B2_1", B2_1_nans, B2_1_clipped),
		("C0", C0_nans, C0_clipped),
		("C0_", C0__nans, C0__clipped),
		("C1", C1_nans, C1_clipped),
		("C1_feyncalc", C1_qcdloop_nans, C1_qcdloop_clipped),
		("C2", C2_nans, C2_clipped),
		("C2_feyncalc", C2_qcdloop_nans, C2_qcdloop_clipped),
	]
	print('\nMasking/Clipping summary:')
	for name, n_nan, n_clip in pairs:
		print(f'  {name}: non-finite={n_nan}, clipped={n_clip}')

print_masking_summary()