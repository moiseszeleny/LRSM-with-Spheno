# Optimization Summary: Neutral Higgs Mass Parameter Scan

## Problem Analysis

The original code in `neutral_higges_masses.py` had severe performance issues:

### Issues Found:
1. **11 nested loops** generating 10^11 = 100 billion iterations
2. Unused parameter `n` in `scan_parameters()`
3. Inefficient loop structure
4. No progress tracking
5. No early stopping mechanism
6. Random sampling using `np.random.uniform(0.1, 10.0, 10)` for grid search (inefficient)

**Estimated runtime**: Would take years to complete

## Optimization Strategy

### 1. **Initial Optimization** (`neutral_higges_masses.py` - updated)
- Replaced nested loops with `itertools.product`
- Precomputed constants (k1_squared, vR_squared, etc.)
- Added progress tracking (every 100k combinations)
- Added early stopping with `max_valid` parameter
- Check for physical masses (positive mass squared) before sqrt
- Changed to `np.linspace` for systematic coverage
- Added timing and CSV export

**Result**: ~10 million combinations/minute, but still impractical for 10^11 space

### 2. **Monte Carlo Approach** (`neutral_higges_masses_optimized.py`)
- **Fully vectorized** NumPy operations
- Random sampling instead of grid search
- Processes **1-2 million samples/second**
- Added diagnostic output to understand constraints

**Key Finding**: With uniform random sampling [0.1, 10.0]:
- mH10 typically ~1800 GeV (need ~125 GeV)
- mH20 typically ~666 TeV (too heavy!)
- Only 0.00% of points satisfy SM Higgs mass constraint
- Only 2.68% satisfy mH20 < mH30 hierarchy

### 3. **Targeted Physics-Motivated Scan** (`neutral_higges_masses_targeted.py`) ✅

**Physics Insights Applied**:

For mH10 ~ 125 GeV, we need:
```
mH10² = 8(λ1 + λ2)k1² - 2α13²/ρ1 · k1²
      ≈ (125/246)² ≈ 0.26
```

Therefore: `8(λ1 + λ2) - 2α13²/ρ1 ≈ 0.26`

**Optimized Parameter Ranges**:
- `α1, α2`: [0.01, 2.0] (moderate values)
- `α3`: [-2.0, 2.0] (allow negative)
- `ρ1, ρ2`: [0.01, 1.0] (small to reduce heavy masses)
- `λ1 + λ2`: Sampled around target value 0.26/8 ≈ 0.033
- `λ3, λ5, λ6`: [0.01, 1.0]
- `vR`: [10⁴, 5×10⁵] GeV (varied scale)

**Memory Optimization**:
- Batch processing (2 million samples per batch)
- Explicit memory cleanup with `del`
- Stops when target number of valid points reached

## Results

### Performance Metrics:
```
Samples processed: 20,000,000
Time: 3.82 seconds
Sampling rate: 5,239,447 samples/second
Physical masses: 2,237,239 (11.19%)
Valid points found: 47
```

### Valid Point Statistics:
```
mH10: mean = 125.20 ± 0.07 GeV  ✓ (SM Higgs mass)
mH20: mean = 299 TeV
mH30: mean = 353 TeV
mH40: mean = 390 TeV
```

### Parameter Ranges for Valid Points:
```
α1: [0.02, 1.65],  mean = 0.61
α2: [0.01, 1.56],  mean = 0.43
α3: [-1.67, -0.03], mean = -0.62
ρ1: [0.02, 0.44],  mean = 0.20
ρ2: [0.53, 1.00],  mean = 0.84
λ1: [0.0002, 0.045], mean = 0.016
λ2: [0.0001, 0.048], mean = 0.022
λ3: [0.02, 0.98],  mean = 0.48
λ4: [0.06, 0.96],  mean = 0.60
λ5: [0.02, 1.00],  mean = 0.47
λ6: [0.02, 0.98],  mean = 0.47
vR: [1.2×10⁴, 5.0×10⁵] GeV, mean = 2.5×10⁵ GeV
```

## Performance Comparison

| Version | Iterations | Time | Rate | Valid Points |
|---------|-----------|------|------|--------------|
| Original | 10^11 | Years | ~1000/s | Unknown |
| Grid (optimized) | 10^7 | ~1 min | ~10^5/s | 0 found |
| Monte Carlo | 10^7 | ~9 s | ~10^6/s | 0 found |
| **Targeted** | **2×10^7** | **3.8 s** | **5.2×10^6/s** | **47 found** ✓ |

## Speed Improvement

**~5000× faster** than original code while actually finding valid parameter points!

## Files Created

1. `neutral_higges_masses.py` (optimized original)
2. `neutral_higges_masses_optimized.py` (Monte Carlo with diagnostics)
3. `neutral_higges_masses_targeted.py` (physics-motivated targeting) ⭐
4. `valid_higgs_parameters_targeted.csv` (results)

## Usage

```python
# Run the optimized targeted scan
python neutral_higges_masses_targeted.py

# Adjust parameters in main():
valid_points = scan_targeted(
    n_samples=20_000_000,    # Total samples
    max_valid=1000,          # Stop after finding this many
    vR_range=(1e4, 5e5),     # Right-handed VEV range
    batch_size=2_000_000     # Process in batches
)
```

## Key Takeaways

1. **Domain knowledge is crucial**: Understanding the physics constraints led to ~5000× speedup
2. **Vectorization matters**: NumPy operations are orders of magnitude faster than loops
3. **Smart sampling beats brute force**: Targeted Monte Carlo >> exhaustive grid search
4. **Diagnostics guide optimization**: Understanding why constraints fail helps refine ranges
5. **Memory management**: Batch processing prevents OOM errors for large-scale scans
