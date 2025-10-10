"""ff_fits.py

Helpers for fitting form-factor vs vR data using:
 - power-law fit (linear fit in log10 space)
 - Theil-Sen robust fit (in log10 space)

Each function returns (slope, intercept, fitted_values) where the model is
 log10(y) = slope * log10(x) + intercept
 so y_pred(x) = 10**(slope * log10(x) + intercept)

Small usage example is provided in the __main__ block.

Dependencies: numpy, scipy
"""

from typing import Tuple, Dict
import numpy as np
from scipy.stats import theilslopes


def _validate_xy(x: np.ndarray, y: np.ndarray) -> Tuple[np.ndarray, np.ndarray]:
    """Ensure inputs are 1D float arrays of the same length."""
    x = np.asarray(x, dtype=float).ravel()
    y = np.asarray(y, dtype=float).ravel()
    if x.shape[0] != y.shape[0]:
        raise ValueError("x and y must have the same length")
    return x, y


def fit_power_law(x, y, mask_positive: bool = True) -> Dict:
    """Fit a power-law y = A * x^n by linear fit in log10 space.

    Parameters
    - x, y: array-like
    - mask_positive: if True, keep only x>0 and y>0 for log transform

    Returns dict with keys:
    - slope: exponent n
    - intercept: log10(A)
    - A: 10**intercept
    - y_fit: fitted y values on the original x grid
    - mask: boolean mask used for fitting
    - r2: coefficient of determination on fit points (may be nan if degenerate)
    """
    x, y = _validate_xy(x, y)
    mask = np.isfinite(x) & np.isfinite(y)
    if mask_positive:
        mask &= (x > 0) & (y > 0)

    if mask.sum() < 2:
        raise ValueError("Not enough valid points for power-law fit")

    lx = np.log10(x[mask])
    ly = np.log10(y[mask])
    slope, intercept = np.polyfit(lx, ly, 1)
    A = 10 ** intercept
    y_fit = 10 ** (slope * np.log10(x) + intercept)

    # R^2 on fit points
    ss_res = np.sum((ly - (slope * lx + intercept)) ** 2)
    ss_tot = np.sum((ly - np.mean(ly)) ** 2)
    r2 = 1 - ss_res / ss_tot if ss_tot > 0 else float('nan')

    return {
        'slope': float(slope),
        'intercept': float(intercept),
        'A': float(A),
        'y_fit': y_fit,
        'mask': mask,
        'r2': float(r2),
    }


def fit_theil_sen_log(x, y, mask_positive: bool = True) -> Dict:
    """Robust Theil-Sen fit in log10 space (suitable for power-law behavior).

    The function fits log10(y) vs log10(x) using Theil-Sen and returns the same
    dictionary layout as fit_power_law.
    """
    x, y = _validate_xy(x, y)
    mask = np.isfinite(x) & np.isfinite(y)
    if mask_positive:
        mask &= (x > 0) & (y > 0)

    if mask.sum() < 2:
        raise ValueError("Not enough valid points for Theil-Sen fit")

    lx = np.log10(x[mask])
    ly = np.log10(y[mask])

    slope, intercept, lo, hi = theilslopes(ly, lx)
    A = 10 ** intercept
    y_fit = 10 ** (slope * np.log10(x) + intercept)

    # Compute a robust R^2-like measure using Pearson on fit points
    try:
        corr = np.corrcoef(ly, slope * lx + intercept)[0, 1]
        r2 = float(corr ** 2)
    except Exception:
        r2 = float('nan')

    return {
        'slope': float(slope),
        'intercept': float(intercept),
        'A': float(A),
        'y_fit': y_fit,
        'mask': mask,
        'r2': r2,
        'theilslopes_result': (slope, intercept, lo, hi),
    }


def remove_outliers_by_fit(x, y, fit_func, n_sigma: float = 3.0, max_iter: int = 5,
                           mask_positive: bool = True, min_points: int = 3,
                           verbose: bool = False) -> Dict:
    """Iteratively remove outliers relative to a fit and return cleaned data.

    Procedure:
    - Fit using `fit_func(x,y)` which must return a dict containing 'y_fit'
      and optionally 'mask'. The fit is performed on the currently kept points.
    - Compute residuals in log10 space: r = log10(y) - log10(y_fit) for points
      where x>0 and y>0 (if mask_positive=True).
    - Estimate robust scatter using MAD and flag points with |r - med(r)| > n_sigma*MAD
      (converted to sigma via 1.4826).
    - Remove flagged points and refit. Repeat up to max_iter times.

    Returns a dict with keys: 'x_clean','y_clean','mask_clean','fit','history'
    where history is a list of dicts with 'iter','n_points','n_removed','fit'.
    """
    x = np.asarray(x, dtype=float).ravel()
    y = np.asarray(y, dtype=float).ravel()
    if x.shape[0] != y.shape[0]:
        raise ValueError('x and y must have same length')

    # initial mask: finite and optionally positive
    mask = np.isfinite(x) & np.isfinite(y)
    if mask_positive:
        mask &= (x > 0) & (y > 0)

    history = []
    prev_n_removed = -1
    for it in range(1, max_iter + 1):
        if mask.sum() < min_points:
            if verbose:
                print(f"Stopping: too few points ({mask.sum()}) to continue fitting")
            break

        # perform fit on current kept points
        fit = fit_func(x[mask], y[mask]) if callable(fit_func) else fit_func(x[mask], y[mask])
        # produce y_fit on full x grid (fit implementations return 'y_fit')
        # Normalize fit output to a full-length y_fit array matching x
        y_fit_raw = fit.get('y_fit')
        if y_fit_raw is None:
            # compute from slope/intercept if provided
            slope = fit.get('slope')
            intercept = fit.get('intercept')
            if slope is None or intercept is None:
                raise RuntimeError('fit_func must provide y_fit or slope/intercept')
            y_fit_full = 10 ** (slope * np.log10(x) + intercept)
        else:
            y_fit_raw = np.asarray(y_fit_raw, dtype=float)
            # If fit returned values on full grid, use them
            if y_fit_raw.shape[0] == x.shape[0]:
                y_fit_full = y_fit_raw
            # If fit returned values only for the fit points (mask.sum()),
            # place them back into a full-length array
            elif y_fit_raw.shape[0] == mask.sum():
                y_fit_full = np.full_like(x, np.nan, dtype=float)
                y_fit_full[mask] = y_fit_raw
            else:
                # fallback: compute from slope/intercept if available
                slope = fit.get('slope')
                intercept = fit.get('intercept')
                if slope is not None and intercept is not None:
                    y_fit_full = 10 ** (slope * np.log10(x) + intercept)
                else:
                    # last resort: fill with NaNs
                    y_fit_full = np.full_like(x, np.nan, dtype=float)

        # compute residuals in log-space where defined
        valid = np.isfinite(x) & np.isfinite(y) & np.isfinite(y_fit_full)
        if mask_positive:
            valid &= (x > 0) & (y > 0) & (y_fit_full > 0)

        if valid.sum() == 0:
            if verbose:
                print('No valid points to compute residuals')
            break

        r = np.log10(y[valid]) - np.log10(y_fit_full[valid])
        med = np.median(r)
        mad = np.median(np.abs(r - med))
        sigma = max(mad * 1.4826, 1e-16)
        thresh = n_sigma * sigma

        is_outlier = np.zeros_like(valid, dtype=bool)
        is_outlier[valid] = np.abs(r - med) > thresh

        # Map back to full index space
        full_outlier_mask = np.zeros_like(mask, dtype=bool)
        full_outlier_mask[np.where(valid)[0]] = is_outlier

        n_removed = np.count_nonzero(full_outlier_mask & mask)
        history.append({'iter': it, 'n_points': int(mask.sum()), 'n_removed': int(n_removed), 'fit': fit})

        if verbose:
            print(f"iter={it}: points={mask.sum()}, removed={n_removed}, thresh(log10)={thresh:.3e}")

        # remove outliers
        if n_removed == 0 or n_removed == prev_n_removed:
            # no change -> stop
            break
        mask = mask & (~full_outlier_mask)
        prev_n_removed = n_removed

    # final fit on cleaned points
    final_fit = fit if 'fit' in locals() else fit_func(x[mask], y[mask])

    return {
        'x_clean': x[mask],
        'y_clean': y[mask],
        'mask_clean': mask,
        'fit': final_fit,
        'history': history,
    }


def fit_power_law_cleaned(x, y, **kwargs):
    """Convenience wrapper: power-law fit with iterative outlier removal."""
    return remove_outliers_by_fit(x, y, lambda xx, yy: fit_power_law(xx, yy), **kwargs)


def fit_theil_sen_log_cleaned(x, y, **kwargs):
    """Convenience wrapper: Theil-Sen fit with iterative outlier removal."""
    return remove_outliers_by_fit(x, y, lambda xx, yy: fit_theil_sen_log(xx, yy), **kwargs)


if __name__ == '__main__':
    # Small demo with synthetic data + outliers
    import matplotlib.pyplot as plt

    np.random.seed(1)
    x = np.logspace(2, 6, 50)
    # true law y = 1e-6 * x**(-2.5)
    y_true = 1e-6 * x ** (-2.5)
    # noisier observations
    y_obs = y_true * (1 + 0.1 * np.random.randn(len(x)))
    # add spikes
    y_obs[5] *= 1e2
    y_obs[30] *= 1e3

    p = fit_power_law(x, y_obs)
    ts = fit_theil_sen_log(x, y_obs)

    print('Power-law fit: slope={slope:.4f}, intercept={intercept:.4f}, r2={r2:.4f}'.format(**p))
    print('Theil-Sen fit: slope={slope:.4f}, intercept={intercept:.4f}, r2={r2:.4f}'.format(**ts))

    plt.loglog(x, y_obs, 'k.', alpha=0.4, label='observed')
    plt.loglog(x, p['y_fit'], '-C1', label=f"power-law (s={p['slope']:.3f})")
    plt.loglog(x, ts['y_fit'], '-C2', label=f"theil-sen (s={ts['slope']:.3f})")
    plt.loglog(x, y_true, '--C0', label='true')
    plt.legend()
    plt.xlabel('x (vR)')
    plt.ylabel('y (form factor)')
    plt.show()
