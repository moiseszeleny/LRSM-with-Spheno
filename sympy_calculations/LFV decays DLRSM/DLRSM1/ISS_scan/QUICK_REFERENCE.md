# Quick Reference Guide - LFV in Inverse Seesaw

## 🚀 Quick Start

```bash
# Test calculations
python LFV_calculations.py

# Run full analysis
python ISS_scan_with_LFV.py

# See custom examples
python examples_custom_analysis.py
```

## 📦 What Each Module Does

| File | Purpose | Use When |
|------|---------|----------|
| `LFV_calculations.py` | Core physics calculations | Need to calculate specific observables |
| `ISS_scan.py` | Basic parameter space | Want simple ISS analysis without LFV |
| `ISS_scan_with_LFV.py` | Integrated analysis | Want comprehensive LFV analysis |
| `examples_custom_analysis.py` | Usage examples | Learning how to use the modules |

## 💡 Common Tasks

### Calculate BR(μ→eγ) for one point
```python
from LFV_calculations import calculate_BR_mu_to_e_gamma

BR = calculate_BR_mu_to_e_gamma(
    m_light=0.05,  # eV
    M=1000,        # GeV
    mu=0.01        # GeV
)
print(f"BR(μ→eγ) = {BR:.2e}")
```

### Check all constraints
```python
from LFV_calculations import check_LFV_constraints

results = check_LFV_constraints(0.05, 1000, 0.01, verbose=True)
```

### Scan parameter space
```python
from ISS_scan_with_LFV import scan_parameter_space_with_LFV

fig, masses, grids = scan_parameter_space_with_LFV(
    hierarchy='NH',  # or 'IH'
    m_lightest=0.0
)
```

### Calculate on custom grid
```python
from LFV_calculations import calculate_LFV_grid
import numpy as np

M_grid, mu_grid = np.meshgrid(
    np.logspace(2, 4, 100),  # M: 100 GeV to 10 TeV
    np.logspace(-2, 0, 100)  # μ: 10 MeV to 1 GeV
)

BR_grid = calculate_LFV_grid(
    m_light=0.05,
    M_grid=M_grid,
    mu_grid=mu_grid,
    observable='mu_e_gamma'
)
```

## 🔬 Available Observables

Use these strings with `calculate_LFV_grid()`:

- `'mu_e_gamma'` - BR(μ → eγ)
- `'tau_mu_gamma'` - BR(τ → μγ)
- `'tau_e_gamma'` - BR(τ → eγ)
- `'h_mu_tau'` - BR(h → μτ)
- `'h_e_tau'` - BR(h → eτ)
- `'h_e_mu'` - BR(h → eμ)
- `'mu_3e'` - BR(μ → 3e)
- `'mu_e_conversion'` - CR(μ-e, Al)

## 📊 Experimental Bounds

```python
from LFV_calculations import (
    BR_MU_E_GAMMA_BOUND,    # 4.2e-13
    BR_H_MU_TAU_BOUND,      # 2.5e-3
    BR_TAU_MU_GAMMA_BOUND,  # 4.4e-8
    BR_MU_3E_BOUND          # 1.0e-12
)
```

## 🎯 Typical Parameter Ranges

| Parameter | Typical Range | Units |
|-----------|---------------|-------|
| M (heavy mass) | 10 - 10⁶ | GeV |
| μ (LNV parameter) | 10⁻⁶ - 10³ | GeV |
| m_light (neutrino) | 10⁻³ - 0.1 | eV |
| Y (Yukawa) | 10⁻⁸ - 4π | dimensionless |

### "Sweet Spot" Region
- **M**: 100 - 1000 GeV (TeV scale)
- **μ**: 0.01 - 0.1 GeV (10-100 MeV)
- Satisfies all constraints
- Experimentally accessible

## ⚠️ Common Pitfalls

1. **Units!** 
   - `m_light` in eV
   - `M` and `μ` in GeV
   
2. **Hierarchy matters**
   - NH: use m₃ for LFV
   - IH: use m₂ for LFV

3. **Grid size**
   - 200×200 is good default
   - Finer grids slow down significantly

4. **Log scale**
   - Most quantities vary over many orders of magnitude
   - Always use LogNorm for plotting

## 🔧 Customization

### Change experimental bounds
Edit in `LFV_calculations.py`:
```python
BR_MU_E_GAMMA_BOUND = 4.2e-13  # Change to new limit
```

### Add new constraint
In `ISS_scan_with_LFV.py`, around line 240:
```python
# Add your constraint
new_constraint = (your_condition)

# Include in counting
n_constraints = (...existing... + 
                 new_constraint.astype(int))
```

### Custom plot
```python
import matplotlib.pyplot as plt
from matplotlib.colors import LogNorm

fig, ax = plt.subplots()
im = ax.contourf(M_grid, mu_grid, your_data,
                 norm=LogNorm(), cmap='viridis')
ax.set_xscale('log')
ax.set_yscale('log')
plt.colorbar(im, ax=ax)
plt.show()
```

## 📈 Output Files

| File | Content |
|------|---------|
| `ISS_with_LFV_constraints_NH.png` | Main 9-panel figure |
| `inverse_seesaw_scan_NH.png` | Basic ISS scan |
| `example_1D_scan.png` | 1D scan example |
| `example_2D_TeV_region.png` | Focused 2D scan |

## 🐛 Troubleshooting

### "Module not found"
```bash
# Make sure you're in the right directory
cd "sympy_calculations/LFV decays DLRSM/DLRSM1"

# Or add to Python path
export PYTHONPATH="${PYTHONPATH}:/path/to/directory"
```

### "Division by zero"
- Check that μ > 0
- Use `np.maximum(array, 1e-30)` to avoid log(0)

### Plots look weird
- Make sure to use `LogNorm` for log-scale colorbars
- Check axis scales (use log for most plots)
- Verify your data range isn't all zeros

### Slow performance
- Reduce grid resolution (e.g., 100×100 instead of 200×200)
- Use coarser scan first to find interesting region
- Consider vectorizing your calculations

## 📚 Learn More

See full documentation:
- `README_ISS_LFV.md` - Complete guide
- `SUMMARY_LFV_Integration.md` - Implementation details
- `examples_custom_analysis.py` - Working code examples

## 🎓 Physics Notes

### Inverse Seesaw Formula
```
m_ν ≈ m_D² μ / M²
```
Where m_D ≈ Y × v (Yukawa × VEV)

### Scaling Laws
- BR(μ→eγ) ∝ (m_ν/μ) for fixed M
- BR(h→μτ) ∝ (M/v)² × (m_ν/μ)
- Both ∝ 1/μ (smaller LNV = larger LFV)

### Key Insight
Inverse seesaw naturally suppresses LFV because:
1. Small m_ν (light neutrinos)
2. Divided by μ (can be O(GeV))
3. Loop suppression factors

Result: **Wide viable parameter space!**

---
*Last updated: October 2025*
