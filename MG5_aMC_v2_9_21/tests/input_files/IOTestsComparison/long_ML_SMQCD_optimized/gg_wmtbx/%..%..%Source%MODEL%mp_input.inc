ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c      written by the UFO converter
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

      REAL*16 MP__MDL_SQRT__AS,MP__MDL_G__EXP__4,MP__MDL_G__EXP__2
     $ ,MP__MDL_R2MIXEDFACTOR_FIN_,MP__MDL_G_UVG_1EPS_
     $ ,MP__MDL_G_UVB_1EPS_,MP__MDL_GWCFT_UV_B_1EPS_
     $ ,MP__MDL_GWCFT_UV_T_1EPS_,MP__MDL_BWCFT_UV_1EPS_
     $ ,MP__MDL_TWCFT_UV_1EPS_,MP__MDL_G__EXP__3,MP__MDL_MU_R__EXP__2
     $ ,MP__MDL_G_UVB_FIN_,MP__MDL_G_UVT_FIN_,MP__MDL_GWCFT_UV_B_FIN_
     $ ,MP__MDL_GWCFT_UV_T_FIN_,MP__MDL_BWCFT_UV_FIN_
     $ ,MP__MDL_TWCFT_UV_FIN_,MP__MDL_CONJG__CKM3X3,MP__MDL_CKM22
     $ ,MP__MDL_CKM33,MP__MDL_LHV,MP__MDL_CKM3X3,MP__MDL_CONJG__CKM22
     $ ,MP__MDL_NCOL,MP__MDL_CA,MP__MDL_TF,MP__MDL_CF
     $ ,MP__MDL_MZ__EXP__2,MP__MDL_MZ__EXP__4,MP__MDL_SQRT__2
     $ ,MP__MDL_MH__EXP__2,MP__MDL_NCOL__EXP__2,MP__MDL_MB__EXP__2
     $ ,MP__MDL_MT__EXP__2,MP__MDL_AEW,MP__MDL_SQRT__AEW,MP__MDL_EE
     $ ,MP__MDL_MW__EXP__2,MP__MDL_SW2,MP__MDL_CW,MP__MDL_SQRT__SW2
     $ ,MP__MDL_SW,MP__MDL_G1,MP__MDL_GW,MP__MDL_V,MP__MDL_V__EXP__2
     $ ,MP__MDL_LAM,MP__MDL_YB,MP__MDL_YT,MP__MDL_YTAU,MP__MDL_MUH
     $ ,MP__MDL_AXIALZUP,MP__MDL_AXIALZDOWN,MP__MDL_VECTORZUP
     $ ,MP__MDL_VECTORZDOWN,MP__MDL_VECTORAUP,MP__MDL_VECTORADOWN
     $ ,MP__MDL_VECTORWMDXU,MP__MDL_AXIALWMDXU,MP__MDL_VECTORWPUXD
     $ ,MP__MDL_AXIALWPUXD,MP__MDL_GW__EXP__2,MP__MDL_CW__EXP__2
     $ ,MP__MDL_EE__EXP__2,MP__MDL_SW__EXP__2,MP__MDL_YB__EXP__2
     $ ,MP__MDL_YT__EXP__2,MP__AEWM1,MP__MDL_GF,MP__AS,MP__MDL_YMB
     $ ,MP__MDL_YMT,MP__MDL_YMTAU

      COMMON/MP_PARAMS_R/ MP__MDL_SQRT__AS,MP__MDL_G__EXP__4
     $ ,MP__MDL_G__EXP__2,MP__MDL_R2MIXEDFACTOR_FIN_
     $ ,MP__MDL_G_UVG_1EPS_,MP__MDL_G_UVB_1EPS_
     $ ,MP__MDL_GWCFT_UV_B_1EPS_,MP__MDL_GWCFT_UV_T_1EPS_
     $ ,MP__MDL_BWCFT_UV_1EPS_,MP__MDL_TWCFT_UV_1EPS_
     $ ,MP__MDL_G__EXP__3,MP__MDL_MU_R__EXP__2,MP__MDL_G_UVB_FIN_
     $ ,MP__MDL_G_UVT_FIN_,MP__MDL_GWCFT_UV_B_FIN_
     $ ,MP__MDL_GWCFT_UV_T_FIN_,MP__MDL_BWCFT_UV_FIN_
     $ ,MP__MDL_TWCFT_UV_FIN_,MP__MDL_CONJG__CKM3X3,MP__MDL_CKM22
     $ ,MP__MDL_CKM33,MP__MDL_LHV,MP__MDL_CKM3X3,MP__MDL_CONJG__CKM22
     $ ,MP__MDL_NCOL,MP__MDL_CA,MP__MDL_TF,MP__MDL_CF
     $ ,MP__MDL_MZ__EXP__2,MP__MDL_MZ__EXP__4,MP__MDL_SQRT__2
     $ ,MP__MDL_MH__EXP__2,MP__MDL_NCOL__EXP__2,MP__MDL_MB__EXP__2
     $ ,MP__MDL_MT__EXP__2,MP__MDL_AEW,MP__MDL_SQRT__AEW,MP__MDL_EE
     $ ,MP__MDL_MW__EXP__2,MP__MDL_SW2,MP__MDL_CW,MP__MDL_SQRT__SW2
     $ ,MP__MDL_SW,MP__MDL_G1,MP__MDL_GW,MP__MDL_V,MP__MDL_V__EXP__2
     $ ,MP__MDL_LAM,MP__MDL_YB,MP__MDL_YT,MP__MDL_YTAU,MP__MDL_MUH
     $ ,MP__MDL_AXIALZUP,MP__MDL_AXIALZDOWN,MP__MDL_VECTORZUP
     $ ,MP__MDL_VECTORZDOWN,MP__MDL_VECTORAUP,MP__MDL_VECTORADOWN
     $ ,MP__MDL_VECTORWMDXU,MP__MDL_AXIALWMDXU,MP__MDL_VECTORWPUXD
     $ ,MP__MDL_AXIALWPUXD,MP__MDL_GW__EXP__2,MP__MDL_CW__EXP__2
     $ ,MP__MDL_EE__EXP__2,MP__MDL_SW__EXP__2,MP__MDL_YB__EXP__2
     $ ,MP__MDL_YT__EXP__2,MP__AEWM1,MP__MDL_GF,MP__AS,MP__MDL_YMB
     $ ,MP__MDL_YMT,MP__MDL_YMTAU


      COMPLEX*32 MP__MDL_BMASS_UV_1EPS_,MP__MDL_TMASS_UV_1EPS_
     $ ,MP__MDL_BMASS_UV_FIN_,MP__MDL_TMASS_UV_FIN_,MP__MDL_COMPLEXI
     $ ,MP__MDL_I1X33,MP__MDL_I2X33,MP__MDL_I3X33,MP__MDL_I4X33
     $ ,MP__MDL_VECTOR_TBGP,MP__MDL_AXIAL_TBGP,MP__MDL_VECTOR_TBGM
     $ ,MP__MDL_AXIAL_TBGM

      COMMON/MP_PARAMS_C/ MP__MDL_BMASS_UV_1EPS_
     $ ,MP__MDL_TMASS_UV_1EPS_,MP__MDL_BMASS_UV_FIN_
     $ ,MP__MDL_TMASS_UV_FIN_,MP__MDL_COMPLEXI,MP__MDL_I1X33
     $ ,MP__MDL_I2X33,MP__MDL_I3X33,MP__MDL_I4X33,MP__MDL_VECTOR_TBGP
     $ ,MP__MDL_AXIAL_TBGP,MP__MDL_VECTOR_TBGM,MP__MDL_AXIAL_TBGM

