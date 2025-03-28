ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c      written by the UFO converter
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

C     
C     NB: VECSIZE_MEMMAX is defined in vector.inc
C     NB: vector.inc must be included before coupl.inc
C     

      DOUBLE PRECISION G, ALL_G
      COMMON/STRONG/ G, ALL_G

      DOUBLE COMPLEX GAL(2)
      COMMON/WEAK/ GAL

      DOUBLE PRECISION MU_R, ALL_MU_R
      COMMON/RSCALE/ MU_R, ALL_MU_R

      DOUBLE PRECISION NF
      PARAMETER(NF=4D0)
      DOUBLE PRECISION NL
      PARAMETER(NL=2D0)

      DOUBLE PRECISION MDL_MB,MDL_MH,MDL_MT,MDL_MTA,MDL_MW,MDL_MZ

      COMMON/MASSES/ MDL_MB,MDL_MH,MDL_MT,MDL_MTA,MDL_MW,MDL_MZ


      DOUBLE PRECISION MDL_WH,MDL_WT,MDL_WW,MDL_WZ

      COMMON/WIDTHS/ MDL_WH,MDL_WT,MDL_WW,MDL_WZ


      DOUBLE COMPLEX GC_4, GC_5, GC_6, R2_3GQ, R2_3GG, R2_GQQ, R2_GGQ,
     $  R2_GGB, R2_GGT, R2_GGG_1, R2_GGG_2, R2_QQQ, R2_QQT,
     $  UV_3GG_1EPS, UV_3GB_1EPS, UV_GQQG_1EPS, UV_GQQB_1EPS,
     $  UV_TMASS_1EPS, UVWFCT_B_0_1EPS, UVWFCT_G_1_1EPS, UV_3GB,
     $  UV_3GT, UV_GQQB, UV_GQQT, UV_TMASS, UVWFCT_T_0, UVWFCT_G_1,
     $  UVWFCT_G_2

      COMMON/COUPLINGS/ GC_4, GC_5, GC_6, R2_3GQ, R2_3GG, R2_GQQ,
     $  R2_GGQ, R2_GGB, R2_GGT, R2_GGG_1, R2_GGG_2, R2_QQQ, R2_QQT,
     $  UV_3GG_1EPS, UV_3GB_1EPS, UV_GQQG_1EPS, UV_GQQB_1EPS,
     $  UV_TMASS_1EPS, UVWFCT_B_0_1EPS, UVWFCT_G_1_1EPS, UV_3GB,
     $  UV_3GT, UV_GQQB, UV_GQQT, UV_TMASS, UVWFCT_T_0, UVWFCT_G_1,
     $  UVWFCT_G_2

