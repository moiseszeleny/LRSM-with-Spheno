# Inverse Seesaw Parameter Space Scanner with LFV Constraints

## Overview

This modular package analyzes the inverse seesaw mechanism parameter space and evaluates lepton flavor violating (LFV) observables to identify phenomenologically viable regions.

## Module Structure

```
ISS_scan.py                  # Base parameter space scanner
├─ Neutrino mass calculations
├─ Dirac mass & Yukawa couplings
└─ Basic parameter space visualization

LFV_calculations.py          # LFV observable calculations
├─ Loop functions (photonic, Z-penguin, box)
├─ μ → eγ, τ → μγ, τ → eγ
├─ h → μτ, h → eτ, h → eμ
├─ μ → 3e
├─ μ-e conversion in nuclei
└─ Constraint checking functions

ISS_scan_with_LFV.py        # Integrated analysis & visualization
├─ Imports from ISS_scan.py
├─ Imports from LFV_calculations.py
├─ Combined parameter space plots
├─ LFV constraint overlays
└─ Viable region identification
```

## Quick Start

### 1. Test the LFV calculations module:

```bash
python LFV_calculations.py
```

This will calculate LFV observables for several benchmark points and show which are excluded by current experiments.

### 2. Run the base parameter space scan (without LFV):

```bash
python ISS_scan.py
```

Produces: `inverse_seesaw_scan_NH.png` showing basic ISS parameter space.

### 3. Run the integrated scan with LFV constraints:

```bash
python ISS_scan_with_LFV.py
```

Produces: `ISS_with_LFV_constraints_NH.png` - a comprehensive 9-panel figure showing:
- Panel 1: BR(μ → eγ) with MEG II bound
- Panel 2: BR(h → μτ) with LHC bounds  
- Panel 3: BR(τ → μγ) with Belle II bounds
- Panel 4: Yukawa coupling with perturbativity bound
- Panel 5: Dirac mass distribution
- Panel 6: BR(μ → 3e) with Mu3e prospects
- Panel 7: Number of constraints satisfied
- Panel 8: Phenomenologically viable regions
- Panel 9: Effective scale Λ = M²/μ

## Usage Examples

### Basic usage (Normal Hierarchy):

```python
from ISS_scan_with_LFV import scan_parameter_space_with_LFV

# Scan with minimal lightest neutrino mass
fig, masses, LFV_grids = scan_parameter_space_with_LFV(
    hierarchy='NH',
    m_lightest=0.0,
    save_prefix='my_scan'
)
```

### Inverted Hierarchy:

```python
fig, masses, LFV_grids = scan_parameter_space_with_LFV(
    hierarchy='IH',
    m_lightest=0.0
)
```

### Calculate specific LFV observable:

```python
from LFV_calculations import (
    calculate_BR_mu_to_e_gamma,
    calculate_BR_h_to_mu_tau,
    check_LFV_constraints
)

# For a specific point in parameter space
m_light = 0.05  # eV (atmospheric scale)
M = 1000  # GeV (heavy neutrino mass)
mu = 0.001  # GeV (LNV parameter)

# Calculate individual observables
BR_mu_e_gamma = calculate_BR_mu_to_e_gamma(m_light, M, mu)
BR_h_mu_tau = calculate_BR_h_to_mu_tau(m_light, M, mu)

print(f"BR(μ→eγ) = {BR_mu_e_gamma:.2e}")
print(f"BR(h→μτ) = {BR_h_mu_tau:.2e}")

# Or check all constraints at once
results = check_LFV_constraints(m_light, M, mu, verbose=True)
```

### Calculate on a custom grid:

```python
import numpy as np
from LFV_calculations import calculate_LFV_grid

# Create custom grid
M_vals = np.logspace(2, 4, 100)  # 100 GeV to 10 TeV
mu_vals = np.logspace(-2, 0, 100)  # 10 MeV to 1 GeV
M_grid, mu_grid = np.meshgrid(M_vals, mu_vals)

# Calculate BR(μ→eγ) over the grid
m_light = 0.05  # eV
BR_grid = calculate_LFV_grid(m_light, M_grid, mu_grid, 
                             observable='mu_e_gamma')

# Plot
import matplotlib.pyplot as plt
plt.contourf(M_grid, mu_grid, BR_grid, levels=50)
plt.xscale('log')
plt.yscale('log')
plt.colorbar(label='BR(μ→eγ)')
plt.show()
```

## Physics Input

### Experimental Bounds (included in `LFV_calculations.py`):

| Observable | Bound (90/95% CL) | Experiment |
|-----------|------------------|------------|
| BR(μ → eγ) | < 4.2×10⁻¹³ | MEG II 2024 |
| BR(τ → μγ) | < 4.4×10⁻⁸ | Belle II |
| BR(τ → eγ) | < 3.3×10⁻⁸ | Belle II |
| BR(h → μτ) | < 2.5×10⁻³ | CMS+ATLAS |
| BR(h → eτ) | < 4.7×10⁻³ | CMS+ATLAS |
| BR(h → eμ) | < 6.1×10⁻⁵ | CMS+ATLAS |
| BR(μ → 3e) | < 1.0×10⁻¹² | Mu3e goal |

### Neutrino Oscillation Data (PDG 2024):

- Δm²₂₁ = 7.53×10⁻⁵ eV² (solar)
- Δm²₃₁ = 2.453×10⁻³ eV² (atmospheric, NO)
- Δm²₃₁ = -2.546×10⁻³ eV² (atmospheric, IO)

## Key Features

1. **Modular Design**: Easy to extend with new observables or constraints
2. **Vectorized Calculations**: Efficient grid scanning using NumPy
3. **Comprehensive Visualization**: 9-panel figure showing all key physics
4. **Experimental Bounds**: Up-to-date limits from MEG II, LHC, Belle II
5. **Flexible Hierarchies**: Support for both Normal and Inverted Ordering

## Output Files

- `inverse_seesaw_scan_NH.png` - Basic ISS scan (from ISS_scan.py)
- `ISS_with_LFV_constraints_NH.png` - Full analysis (from ISS_scan_with_LFV.py)
- `ISS_with_LFV_constraints_IH.png` - Inverted hierarchy version

## Constraints Applied

The "phenomenologically viable" regions satisfy:

1. ✓ BR(μ → eγ) < MEG II bound
2. ✓ BR(h → μτ) < LHC bound  
3. ✓ Yukawa coupling Y < 4π (perturbativity)
4. ✓ TeV-scale physics: 100 GeV < M < 10 TeV
5. ✓ Small LNV: μ < 1 GeV

## Customization

### Add new LFV observable:

```python
# In LFV_calculations.py, add:
def calculate_new_observable(m_light, M, mu):
    """Calculate your new observable"""
    # Your calculation here
    return result

# In ISS_scan_with_LFV.py, add to scan function:
new_obs_grid = calculate_LFV_grid(m_heavy, M_grid, mu_grid, 
                                  'new_observable')
```

### Modify constraints:

Edit the constraint definitions in `scan_parameter_space_with_LFV()`:

```python
# Example: tighten TeV-scale constraint
tev_scale = (M_grid > 200) & (M_grid < 5e3)  # 200 GeV to 5 TeV
```

## Dependencies

- `numpy` - Array operations
- `matplotlib` - Visualization
- `scipy` (optional) - For more advanced interpolation

## References

1. Inverse Seesaw: Mohapatra & Valle, Phys.Rev.D 34 (1986)
2. LFV in seesaw: Ilakovac & Pilaftsis, Nucl.Phys.B 437 (1995)
3. MEG II: MEG II Collaboration, arXiv:2310.12614
4. CMS h→μτ: CMS Collaboration, JHEP 06 (2021) 001

## Authors

Parameter space scanner for inverse seesaw mechanism with comprehensive LFV analysis.

## License

See repository LICENSE file.
