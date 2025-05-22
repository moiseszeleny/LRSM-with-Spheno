# DLRSM Scalar Potential: LaTeX and SARAH Syntax Correspondence

| No. | LaTeX Expression | SARAH Representation |
|-----|------------------|----------------------|
| 1 | $-\mu_1^2 \, \operatorname{tr}(\Phi^\dagger \Phi)$ | `-mu12 Phi.conj[Phi]` |
| 2 | $\lambda_1 (\operatorname{tr}\Phi^\dagger\Phi)^2$ | `+ lam1 (Phi.conj[Phi])^2` |
| 3 | $\lambda_2 \, \operatorname{tr}(\Phi^\dagger \Phi \Phi^\dagger \Phi)$ | `+ lam2 Phi.conj[Phi].Phi.conj[Phi]` |
| 4 | $\frac{1}{2}\lambda_3 (\operatorname{tr}\Phi^\dagger\tilde{\Phi}+\operatorname{tr}\tilde{\Phi}^\dagger\Phi)^2$ | `+ (1/2) lam3 (EpsTensor[lef2,lef1] EpsTensor[rig2,rig1] conj[Phi].conj[Phi] + EpsTensor[lef2,lef1] EpsTensor[rig2,rig1] Phi.Phi)^2` |
| 5 | $\frac{1}{2}\lambda_4 (\operatorname{tr}\Phi^\dagger\tilde{\Phi}-\operatorname{tr}\tilde{\Phi}^\dagger\Phi)^2$ | `+ (1/2) lam4 (EpsTensor[lef2,lef1] EpsTensor[rig2,rig1] conj[Phi].conj[Phi] - EpsTensor[lef2,lef1] EpsTensor[rig2,rig1] Phi.Phi)^2` |
| 6 | $\lambda_5 \, \operatorname{tr}(\Phi^\dagger \Phi \tilde{\Phi}^\dagger \tilde{\Phi})$ | `+ lam5 EpsTensor[lef2,lef1] EpsTensor[rig2,rig1] Phi.Phi.conj[Phi].conj[Phi]` |
| 7 | $\frac{1}{2}\lambda_6 [\operatorname{tr}(\Phi^\dagger\tilde{\Phi}\Phi^\dagger\tilde{\Phi}) + \text{h.c.}]$ | `+ (1/2) lam6 (EpsTensor[lef2,lef1] EpsTensor[rig2,rig1] Phi.Phi.Phi.Phi + EpsTensor[lef2,lef1] EpsTensor[rig2,rig1] conj[Phi].conj[Phi].conj[Phi].conj[Phi])` |
| 8 | $-\mu_2^2 (\chi_L^\dagger \chi_L + \chi_R^\dagger \chi_R)$ | `- mu2 (conj[chiL].chiL + conj[chiR].chiR)` |
| 9 | $\rho_1 [ (\chi_L^\dagger \chi_L)^2 + (\chi_R^\dagger \chi_R)^2 ]$ | `+ rho1 (conj[chiL].chiL)^2 + rho1 (conj[chiR].chiR)^2` |
| 10 | $\rho_2 (\chi_L^\dagger \chi_L)(\chi_R^\dagger \chi_R)$ | `+ rho2 (conj[chiL].chiL) (conj[chiR].chiR)` |
| 11 | $\alpha_1 \operatorname{tr}(\Phi^\dagger\Phi)(\chi_L^\dagger\chi_L+\chi_R^\dagger\chi_R)$ | `+ alp1 Phi.conj[Phi] (conj[chiL].chiL + conj[chiR].chiR)` |
| 12 | $\alpha_2 [\chi_L^\dagger \Phi \Phi^\dagger \chi_L + \chi_R^\dagger \Phi^\dagger \Phi \chi_R]$ | `+ alp2 (conj[chiL].Phi.conj[Phi].chiL + conj[chiR].conj[Phi].Phi.chiR)` |
| 13 | $\alpha_3 [\chi_L^\dagger \tilde{\Phi} \tilde{\Phi}^\dagger \chi_L + \chi_R^\dagger \tilde{\Phi}^\dagger \tilde{\Phi} \chi_R]$ | `+ alp3 (conj[chiL].Phi.conj[Phi].chiL + conj[chiR].conj[Phi].Phi.chiR)` |

**Note:**
- $\tilde{\Phi} = \sigma_2 \Phi^* \sigma_2$ is implemented via EpsTensor contractions in SARAH.
- All SARAH expressions assume automatic index contraction as per the SARAH wiki.
