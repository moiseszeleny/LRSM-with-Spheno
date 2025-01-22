from neutrinos import UpmnsStandardParametrization
from neutrinos import NuOscObservables
from mpmath import mp
import numpy as np
from scipy import linalg as LAsp
LAnp = np.linalg
Nudata = NuOscObservables
# ################# MPMATH  ##################


def mndsqrt_mp(mn1, mn2, mn3):
    return mp.matrix(
        [
            [mp.sqrt(mn1), 0, 0],
            [0, mp.sqrt(mn2), 0],
            [0, 0, mp.sqrt(mn3)]
        ]
        )


def MNdsqrt_mp(mn4, mn5, mn6):
    return mp.matrix(
        [
            [mp.sqrt(mn4), 0, 0],
            [0, mp.sqrt(mn5), 0],
            [0, 0, mp.sqrt(mn6)]
        ]
        )
# #############################


def angle(sin2):
    return mp.asin(mp.sqrt(sin2))


th12 = angle(Nudata.sin2theta12.central)
th13 = angle(Nudata.sin2theta13.central)
th23 = angle(Nudata.sin2theta23.central)


Upmns_mp = UpmnsStandardParametrization(
    theta12=th12, theta13=th13, theta23=th23,
    delta=0.0, alpha1=0.0, alpha2=0.0
)


Upmns_mp = mp.matrix([[Upmns_mp[r, s] for r in range(3)] for s in range(3)]).T


# Upmns_mp = mp.matrix([
# [ 0.821302075974486,  0.550502406897554, 0.149699699398496],
# [-0.463050759961518,  0.489988544456971, 0.738576482160108], # 21 corregido
# [ 0.333236993293153, -0.675912957636513, 0.657339166640784]])#Is real


##########################################
def MD_mp(mn1, mn2, mn3, MR1, MR2, MR3, mu1, mu2, mu3):
    return 1j*Upmns_mp*MNdsqrt_mp(
        MR1**2/mu1, MR2**2/mu2, MR3**2/mu3
        )*mndsqrt_mp(mn1, mn2, mn3)


# ###### Diagonalizando con mpmath
def MD_NO(m1, m2, m3, MR1, MR2, MR3, mu1, mu2, mu3):
    return MD_mp(m1, m2, m3, MR1, MR2, MR3, mu1, mu2, mu3)


def Ynu(m1, m2, m3, MR1, MR2, MR3, mu1, mu2, mu3):
    v = mp.mpf('246')
    return MD_NO(m1, m2, m3, MR1, MR2, MR3, mu1, mu2, mu3)*(mp.sqrt('2')/v)


def Mnu(m1, m2, m3, MR1, MR2, MR3, mu1, mu2, mu3):
    M = MD_NO(m1, m2, m3, MR1, MR2, MR3, mu1, mu2, mu3)
    return mp.matrix(
        [
            [0.0, 0.0, 0.0, M[0, 0], M[0, 1], M[0, 2], 0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0, M[1, 0], M[1, 1], M[1, 2], 0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0, M[2, 0], M[2, 1], M[2, 2], 0.0, 0.0, 0.0],
            [M[0, 0], M[1, 0], M[2, 0], 0.0, 0.0, 0.0, MR1, 0.0, 0.0],
            [M[0, 1], M[1, 1], M[2, 1], 0.0, 0.0, 0.0, 0.0, MR2, 0.0],
            [M[0, 2], M[1, 2], M[2, 2], 0.0, 0.0, 0.0, 0.0, 0.0, MR3],
            [0.0, 0.0, 0.0, MR1, 0.0, 0.0, mu1, 0.0, 0.0],
            [0.0, 0.0, 0.0, 0.0, MR2, 0.0, 0.0, mu2, 0.0],
            [0.0, 0.0, 0.0, 0.0, 0.0, MR3, 0.0, 0.0, mu3]
        ]
    )


def diagonalizationMnu_ISS(m1, m2, m3, MR1, MR2, MR3, mu1, mu2, mu3):
    Mi, UL, UR = mp.eig(
        Mnu(m1, m2, m3, MR1, MR2, MR3, mu1, mu2, mu3),
        left=True, right=True
        )
    Mi, UL, UR = mp.eig_sort(Mi, UL, UR)
    return Mi, UL, UR


def diagonalizationMnu_ISS_svd(m1, m2, m3, MR1, MR2, MR3, mu1, mu2, mu3):
    UL, Mi, UR = mp.svd_c(Mnu(m1, m2, m3, MR1, MR2, MR3, mu1, mu2, mu3))
    return Mi, UL, UR

# ################# NUMPY  ###################


def mndsqrt_np(mn1, mn2, mn3):
    return np.array(
        [
            [np.sqrt(mn1), 0, 0],
            [0, np.sqrt(mn2), 0],
            [0, 0, np.sqrt(mn3)]
        ]
    )


def MNdsqrt_np(mn4, mn5, mn6):
    return np.array(
        [
            [np.sqrt(mn4), 0, 0],
            [0, np.sqrt(mn5), 0],
            [0, 0, np.sqrt(mn6)]
        ]
    )


def MNdsqrtinv_np(mn4, mn5, mn6):
    return np.array(
        [
            [1/np.sqrt(mn4), 0, 0],
            [0, 1/np.sqrt(mn5), 0],
            [0, 0, 1/np.sqrt(mn6)]
        ]
    )


def MNdinv_np(mn4, mn5, mn6):
    return np.array(
        [
            [1/mn4, 0, 0],
            [0, 1/mn5, 0],
            [0, 0, 1/mn6]
        ]
    )
#####################################


def angle_np(sin2):
    return np.arcsin(np.sqrt(sin2))


th12 = angle_np(Nudata.sin2theta12.central)
th13 = angle_np(Nudata.sin2theta13.central)
th23 = angle_np(Nudata.sin2theta23.central)


Upmns_sp = UpmnsStandardParametrization(
    theta12=th12, theta13=th13, theta23=th23,
    delta=0.0, alpha1=0.0, alpha2=0.0
    )


Upmns_np = np.array(Upmns_sp).astype(np.float64)
# print(Upmns_np)

# ############################################


def MD_np(mn1, mn2, mn3, mn4, mn5, mn6):
    return 1j*Upmns_np*MNdsqrt_np(mn4, mn5, mn6)*mndsqrt_np(mn1, mn2, mn3)
# ###### Diagonalizando con mpmath


def MD_NO_np(m1, m2, m3, m4, m5, m6):
    return MD_np(m1, m2, m3, m4, m5, m6)


def Mnu_np(m1, m2, m3, m4, m5, m6):
    M = MD_NO_np(m1, m2, m3, m4, m5, m6)
    return np.array(
        [
            [0.0, 0.0, 0.0, M[0, 0], M[0, 1], M[0, 2]],
            [0.0, 0.0, 0.0, M[1, 0], M[1, 1], M[1, 2]],
            [0.0, 0.0, 0.0, M[2, 0], M[2, 1], M[2, 2]],
            [M[0, 0], M[1, 0], M[2, 0], m4, 0.0, 0.0],
            [M[0, 1], M[1, 1], M[2, 1], 0.0, m5, 0.0],
            [M[0, 2], M[1, 2], M[2, 2], 0.0, 0.0, m6]
        ]
    )


# M = Mnu_np(1,2,3,4,5,6)
# print(LA.eig(M))


def diagonalizationMnu_np(m1, m2, m3, m4, m5, m6):
    M = Mnu_np(1, 2, 3, 4, 5, 6)
    Mi, U = LAnp.eig(M)
    return Mi, U


def diagonalizationMnu_sp(m1, m2, m3, m4, m5, m6):
    M = Mnu_np(1, 2, 3, 4, 5, 6)
    Mi, UL, UR = LAsp.eig(M)
    return Mi, UL, UR

# print(diagonalizationMnu_np(1,2,3,4,5,6))
if __name__ == '__main__':


    m1 = mp.mpf('1e-12')  # GeV
    m2 = mp.sqrt(m1**2 + d21)
    m3 = mp.sqrt(m1**2 + d31)


    def m4(m6):
        '''
            Mass of heavy neutrino mn4 in terms of mn6.
        '''
        return m6/3


    def m5(m6):
        '''
            Mass of heavy neutrino mn5 in terms of mn6.
        '''
        return m6/2


    import matplotlib.pyplot as plt
    M = np.logspace(-1.0, 18.0, num=100)
    Y01_2 = []
    Y02_2 = []
    Y12_2 = []
    for m in M:
        Y01_2.append(abs(Ynu(m1, m2, m3, m4(m), m5(m), m)[0, 1])**2)
        Y02_2.append(abs(Ynu(m1, m2, m3, m4(m), m5(m), m)[0, 2])**2)
        Y12_2.append(abs(Ynu(m1, m2, m3, m4(m), m5(m), m)[1, 2])**2)

    Y01_2 = np.array(Y01_2)
    Y02_2 = np.array(Y02_2)
    Y12_2 = np.array(Y12_2)

    # print(Y01_2)
    cond_01 = Y01_2 < 1.5*4*np.pi
    cond_02 = Y02_2 < 1.5*4*np.pi
    cond_12 = Y12_2 < 1.5*4*np.pi

    plt.figure(figsize=(10, 8))
    plt.loglog(M, Y01_2, label=r'Y01 total', alpha=0.5)
    plt.loglog(M, Y02_2, label=r'Y02 total', alpha=0.5)
    plt.loglog(M, Y12_2, label=r'Y12 total', alpha=0.5)

    # print(Y01_2[cond_01])
    plt.loglog(M[cond_01], Y01_2[cond_01], label=r'Y01 perturvatividad')
    plt.loglog(M[cond_02], Y02_2[cond_02], label=r'Y02 perturvatividad')
    plt.loglog(M[cond_12], Y12_2[cond_12], label=r'Y12 perturvatividad')

    plt.legend()
    plt.show()