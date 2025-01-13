# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 14.0.0 for Microsoft Windows (64-bit) (December 13, 2023)
# Date: Sat 11 Jan 2025 17:32:46


from object_library import all_couplings, Coupling

from function_library import complexconjugate, re, im, csc, sec, acsc, asec, cot



GC_1 = Coupling(name = 'GC_1',
                value = '-gs',
                order = {'QCD':1})

GC_2 = Coupling(name = 'GC_2',
                value = 'complex(0,1)*gs',
                order = {'QCD':1})

GC_3 = Coupling(name = 'GC_3',
                value = 'complex(0,1)*gs**2',
                order = {'QCD':2})

GC_4 = Coupling(name = 'GC_4',
                value = '-(cxi*complex(0,1)*gw)',
                order = {'QED':1})

GC_5 = Coupling(name = 'GC_5',
                value = 'cxi*complex(0,1)*gw',
                order = {'QED':1})

GC_6 = Coupling(name = 'GC_6',
                value = '-((cxi*complex(0,1)*gw)/cmath.sqrt(2))',
                order = {'QED':1})

GC_7 = Coupling(name = 'GC_7',
                value = '(cxi*complex(0,1)*gw)/cmath.sqrt(2)',
                order = {'QED':1})

GC_8 = Coupling(name = 'GC_8',
                value = '(cxi*gw)/cmath.sqrt(2)',
                order = {'QED':1})

GC_9 = Coupling(name = 'GC_9',
                value = '(CKML1x1*cxi*complex(0,1)*gw)/cmath.sqrt(2)',
                order = {'QED':1})

GC_10 = Coupling(name = 'GC_10',
                 value = '(CKML1x2*cxi*complex(0,1)*gw)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_11 = Coupling(name = 'GC_11',
                 value = '(CKML1x3*cxi*complex(0,1)*gw)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_12 = Coupling(name = 'GC_12',
                 value = '(CKML2x1*cxi*complex(0,1)*gw)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_13 = Coupling(name = 'GC_13',
                 value = '(CKML2x2*cxi*complex(0,1)*gw)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_14 = Coupling(name = 'GC_14',
                 value = '(CKML2x3*cxi*complex(0,1)*gw)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_15 = Coupling(name = 'GC_15',
                 value = '(CKML3x1*cxi*complex(0,1)*gw)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_16 = Coupling(name = 'GC_16',
                 value = '(CKML3x2*cxi*complex(0,1)*gw)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_17 = Coupling(name = 'GC_17',
                 value = '(CKML3x3*cxi*complex(0,1)*gw)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_18 = Coupling(name = 'GC_18',
                 value = '(CKMR1x1*cxi*complex(0,1)*gw)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_19 = Coupling(name = 'GC_19',
                 value = '(CKMR1x2*cxi*complex(0,1)*gw)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_20 = Coupling(name = 'GC_20',
                 value = '(CKMR1x3*cxi*complex(0,1)*gw)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_21 = Coupling(name = 'GC_21',
                 value = '(CKMR2x1*cxi*complex(0,1)*gw)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_22 = Coupling(name = 'GC_22',
                 value = '(CKMR2x2*cxi*complex(0,1)*gw)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_23 = Coupling(name = 'GC_23',
                 value = '(CKMR2x3*cxi*complex(0,1)*gw)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_24 = Coupling(name = 'GC_24',
                 value = '(CKMR3x1*cxi*complex(0,1)*gw)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_25 = Coupling(name = 'GC_25',
                 value = '(CKMR3x2*cxi*complex(0,1)*gw)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_26 = Coupling(name = 'GC_26',
                 value = '(CKMR3x3*cxi*complex(0,1)*gw)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_27 = Coupling(name = 'GC_27',
                 value = 'cxi**2*complex(0,1)*gw**2',
                 order = {'QED':2})

GC_28 = Coupling(name = 'GC_28',
                 value = '2*cxi**2*complex(0,1)*gw**2',
                 order = {'QED':2})

GC_29 = Coupling(name = 'GC_29',
                 value = '-(cxi**2*gw**2*cmath.sqrt(2))',
                 order = {'QED':2})

GC_30 = Coupling(name = 'GC_30',
                 value = '-(cxi**2*complex(0,1)*gw**2*cmath.sqrt(2))',
                 order = {'QED':2})

GC_31 = Coupling(name = 'GC_31',
                 value = 'cxi**2*gw**2*cmath.sqrt(2)',
                 order = {'QED':2})

GC_32 = Coupling(name = 'GC_32',
                 value = '(cxi*complex(0,1)*gw*KL1x1)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_33 = Coupling(name = 'GC_33',
                 value = '(cxi*complex(0,1)*gw*KL2x2)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_34 = Coupling(name = 'GC_34',
                 value = '(cxi*complex(0,1)*gw*KL3x3)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_35 = Coupling(name = 'GC_35',
                 value = '(cxi*complex(0,1)*gw*KL4x1)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_36 = Coupling(name = 'GC_36',
                 value = '(cxi*complex(0,1)*gw*KL5x2)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_37 = Coupling(name = 'GC_37',
                 value = '(cxi*complex(0,1)*gw*KL6x3)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_38 = Coupling(name = 'GC_38',
                 value = '(cxi*complex(0,1)*gw*KR1x1)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_39 = Coupling(name = 'GC_39',
                 value = '(cxi*complex(0,1)*gw*KR2x2)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_40 = Coupling(name = 'GC_40',
                 value = '(cxi*complex(0,1)*gw*KR3x3)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_41 = Coupling(name = 'GC_41',
                 value = '(cxi*complex(0,1)*gw*KR4x1)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_42 = Coupling(name = 'GC_42',
                 value = '(cxi*complex(0,1)*gw*KR5x2)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_43 = Coupling(name = 'GC_43',
                 value = '(cxi*complex(0,1)*gw*KR6x3)/cmath.sqrt(2)',
                 order = {'QED':1})

GC_44 = Coupling(name = 'GC_44',
                 value = '-2*complex(0,1)*rho1',
                 order = {'QED':2})

GC_45 = Coupling(name = 'GC_45',
                 value = '-4*complex(0,1)*rho1',
                 order = {'QED':2})

GC_46 = Coupling(name = 'GC_46',
                 value = '-6*complex(0,1)*rho1',
                 order = {'QED':2})

GC_47 = Coupling(name = 'GC_47',
                 value = '-2*complex(0,1)*rho1 - 4*complex(0,1)*rho2',
                 order = {'QED':2})

GC_48 = Coupling(name = 'GC_48',
                 value = '-4*complex(0,1)*rho1 - 4*complex(0,1)*rho2',
                 order = {'QED':2})

GC_49 = Coupling(name = 'GC_49',
                 value = '-2*rho2*cmath.sqrt(2)',
                 order = {'QED':2})

GC_50 = Coupling(name = 'GC_50',
                 value = '-2*complex(0,1)*rho2*cmath.sqrt(2)',
                 order = {'QED':2})

GC_51 = Coupling(name = 'GC_51',
                 value = '2*rho2*cmath.sqrt(2)',
                 order = {'QED':2})

GC_52 = Coupling(name = 'GC_52',
                 value = '-(complex(0,1)*rho3)',
                 order = {'QED':2})

GC_53 = Coupling(name = 'GC_53',
                 value = '-2*rho4',
                 order = {'QED':2})

GC_54 = Coupling(name = 'GC_54',
                 value = '-2*complex(0,1)*rho4',
                 order = {'QED':2})

GC_55 = Coupling(name = 'GC_55',
                 value = '-4*complex(0,1)*rho4',
                 order = {'QED':2})

GC_56 = Coupling(name = 'GC_56',
                 value = '2*rho4',
                 order = {'QED':2})

GC_57 = Coupling(name = 'GC_57',
                 value = '-2*rho4*cmath.sqrt(2)',
                 order = {'QED':2})

GC_58 = Coupling(name = 'GC_58',
                 value = '-2*complex(0,1)*rho4*cmath.sqrt(2)',
                 order = {'QED':2})

GC_59 = Coupling(name = 'GC_59',
                 value = '2*rho4*cmath.sqrt(2)',
                 order = {'QED':2})

GC_60 = Coupling(name = 'GC_60',
                 value = '-0.3333333333333333*(complex(0,1)*gw*sw)',
                 order = {'QED':1})

GC_61 = Coupling(name = 'GC_61',
                 value = '(2*complex(0,1)*gw*sw)/3.',
                 order = {'QED':1})

GC_62 = Coupling(name = 'GC_62',
                 value = '-(complex(0,1)*gw*sw)',
                 order = {'QED':1})

GC_63 = Coupling(name = 'GC_63',
                 value = '-(complex(0,1)*g1*cmath.sqrt(1 - 2*sw**2))',
                 order = {'QED':1})

GC_64 = Coupling(name = 'GC_64',
                 value = '2*complex(0,1)*g1**2 - 4*complex(0,1)*g1**2*sw**2',
                 order = {'QED':2})

GC_65 = Coupling(name = 'GC_65',
                 value = '(cphi*cw*complex(0,1)*gw)/2. + (complex(0,1)*g1*sphi*sw)/(6.*cw) - (cphi*complex(0,1)*gw*sw**2)/(6.*cw)',
                 order = {'QED':1})

GC_66 = Coupling(name = 'GC_66',
                 value = '-0.5*(cphi*cw*complex(0,1)*gw) - (complex(0,1)*g1*sphi*sw)/(2.*cw) + (cphi*complex(0,1)*gw*sw**2)/(2.*cw)',
                 order = {'QED':1})

GC_67 = Coupling(name = 'GC_67',
                 value = '(cw*complex(0,1)*gw*sphi)/2. - (cphi*complex(0,1)*g1*sw)/(6.*cw) - (complex(0,1)*gw*sphi*sw**2)/(6.*cw)',
                 order = {'QED':1})

GC_68 = Coupling(name = 'GC_68',
                 value = '-0.5*(cw*complex(0,1)*gw*sphi) + (cphi*complex(0,1)*g1*sw)/(2.*cw) + (complex(0,1)*gw*sphi*sw**2)/(2.*cw)',
                 order = {'QED':1})

GC_69 = Coupling(name = 'GC_69',
                 value = '-0.5*(complex(0,1)*gw*sw) + (complex(0,1)*g1*cmath.sqrt(1 - 2*sw**2))/6.',
                 order = {'QED':1})

GC_70 = Coupling(name = 'GC_70',
                 value = '-(complex(0,1)*gw*sw) - complex(0,1)*g1*cmath.sqrt(1 - 2*sw**2)',
                 order = {'QED':1})

GC_71 = Coupling(name = 'GC_71',
                 value = '-(gw*sw) + g1*cmath.sqrt(1 - 2*sw**2)',
                 order = {'QED':1})

GC_72 = Coupling(name = 'GC_72',
                 value = '-0.16666666666666666*(cphi*complex(0,1)*g1*sw)/cw + (complex(0,1)*gw*sphi*sw**2)/(3.*cw) - (cphi*complex(0,1)*gw*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                 order = {'QED':1})

GC_73 = Coupling(name = 'GC_73',
                 value = '(cphi*complex(0,1)*g1*sw)/(2.*cw) + (complex(0,1)*gw*sphi*sw**2)/cw - (cphi*complex(0,1)*gw*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                 order = {'QED':1})

GC_74 = Coupling(name = 'GC_74',
                 value = '-0.16666666666666666*(cphi*complex(0,1)*g1*sw)/cw - (2*complex(0,1)*gw*sphi*sw**2)/(3.*cw) + (cphi*complex(0,1)*gw*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                 order = {'QED':1})

GC_75 = Coupling(name = 'GC_75',
                 value = '-(cxi*complex(0,1)*gw**2*sw) - 2*cxi*complex(0,1)*g1*gw*cmath.sqrt(1 - 2*sw**2)',
                 order = {'QED':2})

GC_76 = Coupling(name = 'GC_76',
                 value = '(cxi*gw**2*sw)/cmath.sqrt(2) - cxi*g1*gw*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2)',
                 order = {'QED':2})

GC_77 = Coupling(name = 'GC_77',
                 value = '-((cxi*complex(0,1)*gw**2*sw)/cmath.sqrt(2)) + cxi*complex(0,1)*g1*gw*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2)',
                 order = {'QED':2})

GC_78 = Coupling(name = 'GC_78',
                 value = '-((cxi*gw**2*sw)/cmath.sqrt(2)) + cxi*g1*gw*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2)',
                 order = {'QED':2})

GC_79 = Coupling(name = 'GC_79',
                 value = '(cw*complex(0,1)*gw*I55c11*sphi)/2. + (cphi*complex(0,1)*g1*I55c11*sw)/(2.*cw) - (cphi*complex(0,1)*g1*I56c11*sw)/(2.*cw) + (complex(0,1)*gw*I55c11*sphi*sw**2)/(2.*cw) - (cphi*complex(0,1)*gw*I56c11*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                 order = {'QED':1})

GC_80 = Coupling(name = 'GC_80',
                 value = '(cw*complex(0,1)*gw*I55c22*sphi)/2. + (cphi*complex(0,1)*g1*I55c22*sw)/(2.*cw) - (cphi*complex(0,1)*g1*I56c22*sw)/(2.*cw) + (complex(0,1)*gw*I55c22*sphi*sw**2)/(2.*cw) - (cphi*complex(0,1)*gw*I56c22*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                 order = {'QED':1})

GC_81 = Coupling(name = 'GC_81',
                 value = '(cw*complex(0,1)*gw*I55c33*sphi)/2. + (cphi*complex(0,1)*g1*I55c33*sw)/(2.*cw) - (cphi*complex(0,1)*g1*I56c33*sw)/(2.*cw) + (complex(0,1)*gw*I55c33*sphi*sw**2)/(2.*cw) - (cphi*complex(0,1)*gw*I56c33*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                 order = {'QED':1})

GC_82 = Coupling(name = 'GC_82',
                 value = '(cw*complex(0,1)*gw*I55c44*sphi)/2. + (cphi*complex(0,1)*g1*I55c44*sw)/(2.*cw) - (cphi*complex(0,1)*g1*I56c44*sw)/(2.*cw) + (complex(0,1)*gw*I55c44*sphi*sw**2)/(2.*cw) - (cphi*complex(0,1)*gw*I56c44*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                 order = {'QED':1})

GC_83 = Coupling(name = 'GC_83',
                 value = '(cw*complex(0,1)*gw*I55c55*sphi)/2. + (cphi*complex(0,1)*g1*I55c55*sw)/(2.*cw) - (cphi*complex(0,1)*g1*I56c55*sw)/(2.*cw) + (complex(0,1)*gw*I55c55*sphi*sw**2)/(2.*cw) - (cphi*complex(0,1)*gw*I56c55*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                 order = {'QED':1})

GC_84 = Coupling(name = 'GC_84',
                 value = '(cw*complex(0,1)*gw*I55c66*sphi)/2. + (cphi*complex(0,1)*g1*I55c66*sw)/(2.*cw) - (cphi*complex(0,1)*g1*I56c66*sw)/(2.*cw) + (complex(0,1)*gw*I55c66*sphi*sw**2)/(2.*cw) - (cphi*complex(0,1)*gw*I56c66*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                 order = {'QED':1})

GC_85 = Coupling(name = 'GC_85',
                 value = '-0.5*(cw*complex(0,1)*gw*I57c11*sphi) - (cphi*complex(0,1)*g1*I57c11*sw)/(2.*cw) + (cphi*complex(0,1)*g1*I58c11*sw)/(2.*cw) - (complex(0,1)*gw*I57c11*sphi*sw**2)/(2.*cw) + (cphi*complex(0,1)*gw*I58c11*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                 order = {'QED':1})

GC_86 = Coupling(name = 'GC_86',
                 value = '-0.25*(cw*complex(0,1)*gw*I55c41*sphi) - (cw*complex(0,1)*gw*I57c14*sphi)/4. - (cphi*complex(0,1)*g1*I55c41*sw)/(4.*cw) + (cphi*complex(0,1)*g1*I56c41*sw)/(4.*cw) - (cphi*complex(0,1)*g1*I57c14*sw)/(4.*cw) + (cphi*complex(0,1)*g1*I58c14*sw)/(4.*cw) - (complex(0,1)*gw*I55c41*sphi*sw**2)/(4.*cw) - (complex(0,1)*gw*I57c14*sphi*sw**2)/(4.*cw) + (cphi*complex(0,1)*gw*I56c41*cmath.sqrt(1 - 2*sw**2))/(4.*cw) + (cphi*complex(0,1)*gw*I58c14*cmath.sqrt(1 - 2*sw**2))/(4.*cw)',
                 order = {'QED':1})

GC_87 = Coupling(name = 'GC_87',
                 value = '-0.5*(cw*complex(0,1)*gw*I57c22*sphi) - (cphi*complex(0,1)*g1*I57c22*sw)/(2.*cw) + (cphi*complex(0,1)*g1*I58c22*sw)/(2.*cw) - (complex(0,1)*gw*I57c22*sphi*sw**2)/(2.*cw) + (cphi*complex(0,1)*gw*I58c22*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                 order = {'QED':1})

GC_88 = Coupling(name = 'GC_88',
                 value = '-0.25*(cw*complex(0,1)*gw*I55c52*sphi) - (cw*complex(0,1)*gw*I57c25*sphi)/4. - (cphi*complex(0,1)*g1*I55c52*sw)/(4.*cw) + (cphi*complex(0,1)*g1*I56c52*sw)/(4.*cw) - (cphi*complex(0,1)*g1*I57c25*sw)/(4.*cw) + (cphi*complex(0,1)*g1*I58c25*sw)/(4.*cw) - (complex(0,1)*gw*I55c52*sphi*sw**2)/(4.*cw) - (complex(0,1)*gw*I57c25*sphi*sw**2)/(4.*cw) + (cphi*complex(0,1)*gw*I56c52*cmath.sqrt(1 - 2*sw**2))/(4.*cw) + (cphi*complex(0,1)*gw*I58c25*cmath.sqrt(1 - 2*sw**2))/(4.*cw)',
                 order = {'QED':1})

GC_89 = Coupling(name = 'GC_89',
                 value = '-0.5*(cw*complex(0,1)*gw*I57c33*sphi) - (cphi*complex(0,1)*g1*I57c33*sw)/(2.*cw) + (cphi*complex(0,1)*g1*I58c33*sw)/(2.*cw) - (complex(0,1)*gw*I57c33*sphi*sw**2)/(2.*cw) + (cphi*complex(0,1)*gw*I58c33*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                 order = {'QED':1})

GC_90 = Coupling(name = 'GC_90',
                 value = '-0.25*(cw*complex(0,1)*gw*I55c63*sphi) - (cw*complex(0,1)*gw*I57c36*sphi)/4. - (cphi*complex(0,1)*g1*I55c63*sw)/(4.*cw) + (cphi*complex(0,1)*g1*I56c63*sw)/(4.*cw) - (cphi*complex(0,1)*g1*I57c36*sw)/(4.*cw) + (cphi*complex(0,1)*g1*I58c36*sw)/(4.*cw) - (complex(0,1)*gw*I55c63*sphi*sw**2)/(4.*cw) - (complex(0,1)*gw*I57c36*sphi*sw**2)/(4.*cw) + (cphi*complex(0,1)*gw*I56c63*cmath.sqrt(1 - 2*sw**2))/(4.*cw) + (cphi*complex(0,1)*gw*I58c36*cmath.sqrt(1 - 2*sw**2))/(4.*cw)',
                 order = {'QED':1})

GC_91 = Coupling(name = 'GC_91',
                 value = '(cw*complex(0,1)*gw*I55c14*sphi)/4. + (cw*complex(0,1)*gw*I57c41*sphi)/4. + (cphi*complex(0,1)*g1*I55c14*sw)/(4.*cw) - (cphi*complex(0,1)*g1*I56c14*sw)/(4.*cw) + (cphi*complex(0,1)*g1*I57c41*sw)/(4.*cw) - (cphi*complex(0,1)*g1*I58c41*sw)/(4.*cw) + (complex(0,1)*gw*I55c14*sphi*sw**2)/(4.*cw) + (complex(0,1)*gw*I57c41*sphi*sw**2)/(4.*cw) - (cphi*complex(0,1)*gw*I56c14*cmath.sqrt(1 - 2*sw**2))/(4.*cw) - (cphi*complex(0,1)*gw*I58c41*cmath.sqrt(1 - 2*sw**2))/(4.*cw)',
                 order = {'QED':1})

GC_92 = Coupling(name = 'GC_92',
                 value = '-0.5*(cw*complex(0,1)*gw*I57c44*sphi) - (cphi*complex(0,1)*g1*I57c44*sw)/(2.*cw) + (cphi*complex(0,1)*g1*I58c44*sw)/(2.*cw) - (complex(0,1)*gw*I57c44*sphi*sw**2)/(2.*cw) + (cphi*complex(0,1)*gw*I58c44*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                 order = {'QED':1})

GC_93 = Coupling(name = 'GC_93',
                 value = '(cw*complex(0,1)*gw*I55c25*sphi)/4. + (cw*complex(0,1)*gw*I57c52*sphi)/4. + (cphi*complex(0,1)*g1*I55c25*sw)/(4.*cw) - (cphi*complex(0,1)*g1*I56c25*sw)/(4.*cw) + (cphi*complex(0,1)*g1*I57c52*sw)/(4.*cw) - (cphi*complex(0,1)*g1*I58c52*sw)/(4.*cw) + (complex(0,1)*gw*I55c25*sphi*sw**2)/(4.*cw) + (complex(0,1)*gw*I57c52*sphi*sw**2)/(4.*cw) - (cphi*complex(0,1)*gw*I56c25*cmath.sqrt(1 - 2*sw**2))/(4.*cw) - (cphi*complex(0,1)*gw*I58c52*cmath.sqrt(1 - 2*sw**2))/(4.*cw)',
                 order = {'QED':1})

GC_94 = Coupling(name = 'GC_94',
                 value = '-0.5*(cw*complex(0,1)*gw*I57c55*sphi) - (cphi*complex(0,1)*g1*I57c55*sw)/(2.*cw) + (cphi*complex(0,1)*g1*I58c55*sw)/(2.*cw) - (complex(0,1)*gw*I57c55*sphi*sw**2)/(2.*cw) + (cphi*complex(0,1)*gw*I58c55*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                 order = {'QED':1})

GC_95 = Coupling(name = 'GC_95',
                 value = '(cw*complex(0,1)*gw*I55c36*sphi)/4. + (cw*complex(0,1)*gw*I57c63*sphi)/4. + (cphi*complex(0,1)*g1*I55c36*sw)/(4.*cw) - (cphi*complex(0,1)*g1*I56c36*sw)/(4.*cw) + (cphi*complex(0,1)*g1*I57c63*sw)/(4.*cw) - (cphi*complex(0,1)*g1*I58c63*sw)/(4.*cw) + (complex(0,1)*gw*I55c36*sphi*sw**2)/(4.*cw) + (complex(0,1)*gw*I57c63*sphi*sw**2)/(4.*cw) - (cphi*complex(0,1)*gw*I56c36*cmath.sqrt(1 - 2*sw**2))/(4.*cw) - (cphi*complex(0,1)*gw*I58c63*cmath.sqrt(1 - 2*sw**2))/(4.*cw)',
                 order = {'QED':1})

GC_96 = Coupling(name = 'GC_96',
                 value = '-0.5*(cw*complex(0,1)*gw*I57c66*sphi) - (cphi*complex(0,1)*g1*I57c66*sw)/(2.*cw) + (cphi*complex(0,1)*g1*I58c66*sw)/(2.*cw) - (complex(0,1)*gw*I57c66*sphi*sw**2)/(2.*cw) + (cphi*complex(0,1)*gw*I58c66*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                 order = {'QED':1})

GC_97 = Coupling(name = 'GC_97',
                 value = '(complex(0,1)*g1*sphi*sw)/(6.*cw) - (2*cphi*complex(0,1)*gw*sw**2)/(3.*cw) - (complex(0,1)*gw*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                 order = {'QED':1})

GC_98 = Coupling(name = 'GC_98',
                 value = '(complex(0,1)*g1*sphi*sw)/(6.*cw) + (cphi*complex(0,1)*gw*sw**2)/(3.*cw) + (complex(0,1)*gw*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                 order = {'QED':1})

GC_99 = Coupling(name = 'GC_99',
                 value = '-0.5*(complex(0,1)*g1*sphi*sw)/cw + (cphi*complex(0,1)*gw*sw**2)/cw + (complex(0,1)*gw*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                 order = {'QED':1})

GC_100 = Coupling(name = 'GC_100',
                  value = '(cphi*cw*complex(0,1)*gw*I55c11)/2. - (complex(0,1)*g1*I55c11*sphi*sw)/(2.*cw) + (complex(0,1)*g1*I56c11*sphi*sw)/(2.*cw) + (cphi*complex(0,1)*gw*I55c11*sw**2)/(2.*cw) + (complex(0,1)*gw*I56c11*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                  order = {'QED':1})

GC_101 = Coupling(name = 'GC_101',
                  value = '(cphi*cw*complex(0,1)*gw*I55c22)/2. - (complex(0,1)*g1*I55c22*sphi*sw)/(2.*cw) + (complex(0,1)*g1*I56c22*sphi*sw)/(2.*cw) + (cphi*complex(0,1)*gw*I55c22*sw**2)/(2.*cw) + (complex(0,1)*gw*I56c22*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                  order = {'QED':1})

GC_102 = Coupling(name = 'GC_102',
                  value = '(cphi*cw*complex(0,1)*gw*I55c33)/2. - (complex(0,1)*g1*I55c33*sphi*sw)/(2.*cw) + (complex(0,1)*g1*I56c33*sphi*sw)/(2.*cw) + (cphi*complex(0,1)*gw*I55c33*sw**2)/(2.*cw) + (complex(0,1)*gw*I56c33*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                  order = {'QED':1})

GC_103 = Coupling(name = 'GC_103',
                  value = '(cphi*cw*complex(0,1)*gw*I55c44)/2. - (complex(0,1)*g1*I55c44*sphi*sw)/(2.*cw) + (complex(0,1)*g1*I56c44*sphi*sw)/(2.*cw) + (cphi*complex(0,1)*gw*I55c44*sw**2)/(2.*cw) + (complex(0,1)*gw*I56c44*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                  order = {'QED':1})

GC_104 = Coupling(name = 'GC_104',
                  value = '(cphi*cw*complex(0,1)*gw*I55c55)/2. - (complex(0,1)*g1*I55c55*sphi*sw)/(2.*cw) + (complex(0,1)*g1*I56c55*sphi*sw)/(2.*cw) + (cphi*complex(0,1)*gw*I55c55*sw**2)/(2.*cw) + (complex(0,1)*gw*I56c55*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                  order = {'QED':1})

GC_105 = Coupling(name = 'GC_105',
                  value = '(cphi*cw*complex(0,1)*gw*I55c66)/2. - (complex(0,1)*g1*I55c66*sphi*sw)/(2.*cw) + (complex(0,1)*g1*I56c66*sphi*sw)/(2.*cw) + (cphi*complex(0,1)*gw*I55c66*sw**2)/(2.*cw) + (complex(0,1)*gw*I56c66*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                  order = {'QED':1})

GC_106 = Coupling(name = 'GC_106',
                  value = '-0.5*(cphi*cw*complex(0,1)*gw*I57c11) + (complex(0,1)*g1*I57c11*sphi*sw)/(2.*cw) - (complex(0,1)*g1*I58c11*sphi*sw)/(2.*cw) - (cphi*complex(0,1)*gw*I57c11*sw**2)/(2.*cw) - (complex(0,1)*gw*I58c11*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                  order = {'QED':1})

GC_107 = Coupling(name = 'GC_107',
                  value = '-0.25*(cphi*cw*complex(0,1)*gw*I55c41) - (cphi*cw*complex(0,1)*gw*I57c14)/4. + (complex(0,1)*g1*I55c41*sphi*sw)/(4.*cw) - (complex(0,1)*g1*I56c41*sphi*sw)/(4.*cw) + (complex(0,1)*g1*I57c14*sphi*sw)/(4.*cw) - (complex(0,1)*g1*I58c14*sphi*sw)/(4.*cw) - (cphi*complex(0,1)*gw*I55c41*sw**2)/(4.*cw) - (cphi*complex(0,1)*gw*I57c14*sw**2)/(4.*cw) - (complex(0,1)*gw*I56c41*sphi*cmath.sqrt(1 - 2*sw**2))/(4.*cw) - (complex(0,1)*gw*I58c14*sphi*cmath.sqrt(1 - 2*sw**2))/(4.*cw)',
                  order = {'QED':1})

GC_108 = Coupling(name = 'GC_108',
                  value = '-0.5*(cphi*cw*complex(0,1)*gw*I57c22) + (complex(0,1)*g1*I57c22*sphi*sw)/(2.*cw) - (complex(0,1)*g1*I58c22*sphi*sw)/(2.*cw) - (cphi*complex(0,1)*gw*I57c22*sw**2)/(2.*cw) - (complex(0,1)*gw*I58c22*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                  order = {'QED':1})

GC_109 = Coupling(name = 'GC_109',
                  value = '-0.25*(cphi*cw*complex(0,1)*gw*I55c52) - (cphi*cw*complex(0,1)*gw*I57c25)/4. + (complex(0,1)*g1*I55c52*sphi*sw)/(4.*cw) - (complex(0,1)*g1*I56c52*sphi*sw)/(4.*cw) + (complex(0,1)*g1*I57c25*sphi*sw)/(4.*cw) - (complex(0,1)*g1*I58c25*sphi*sw)/(4.*cw) - (cphi*complex(0,1)*gw*I55c52*sw**2)/(4.*cw) - (cphi*complex(0,1)*gw*I57c25*sw**2)/(4.*cw) - (complex(0,1)*gw*I56c52*sphi*cmath.sqrt(1 - 2*sw**2))/(4.*cw) - (complex(0,1)*gw*I58c25*sphi*cmath.sqrt(1 - 2*sw**2))/(4.*cw)',
                  order = {'QED':1})

GC_110 = Coupling(name = 'GC_110',
                  value = '-0.5*(cphi*cw*complex(0,1)*gw*I57c33) + (complex(0,1)*g1*I57c33*sphi*sw)/(2.*cw) - (complex(0,1)*g1*I58c33*sphi*sw)/(2.*cw) - (cphi*complex(0,1)*gw*I57c33*sw**2)/(2.*cw) - (complex(0,1)*gw*I58c33*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                  order = {'QED':1})

GC_111 = Coupling(name = 'GC_111',
                  value = '-0.25*(cphi*cw*complex(0,1)*gw*I55c63) - (cphi*cw*complex(0,1)*gw*I57c36)/4. + (complex(0,1)*g1*I55c63*sphi*sw)/(4.*cw) - (complex(0,1)*g1*I56c63*sphi*sw)/(4.*cw) + (complex(0,1)*g1*I57c36*sphi*sw)/(4.*cw) - (complex(0,1)*g1*I58c36*sphi*sw)/(4.*cw) - (cphi*complex(0,1)*gw*I55c63*sw**2)/(4.*cw) - (cphi*complex(0,1)*gw*I57c36*sw**2)/(4.*cw) - (complex(0,1)*gw*I56c63*sphi*cmath.sqrt(1 - 2*sw**2))/(4.*cw) - (complex(0,1)*gw*I58c36*sphi*cmath.sqrt(1 - 2*sw**2))/(4.*cw)',
                  order = {'QED':1})

GC_112 = Coupling(name = 'GC_112',
                  value = '(cphi*cw*complex(0,1)*gw*I55c14)/4. + (cphi*cw*complex(0,1)*gw*I57c41)/4. - (complex(0,1)*g1*I55c14*sphi*sw)/(4.*cw) + (complex(0,1)*g1*I56c14*sphi*sw)/(4.*cw) - (complex(0,1)*g1*I57c41*sphi*sw)/(4.*cw) + (complex(0,1)*g1*I58c41*sphi*sw)/(4.*cw) + (cphi*complex(0,1)*gw*I55c14*sw**2)/(4.*cw) + (cphi*complex(0,1)*gw*I57c41*sw**2)/(4.*cw) + (complex(0,1)*gw*I56c14*sphi*cmath.sqrt(1 - 2*sw**2))/(4.*cw) + (complex(0,1)*gw*I58c41*sphi*cmath.sqrt(1 - 2*sw**2))/(4.*cw)',
                  order = {'QED':1})

GC_113 = Coupling(name = 'GC_113',
                  value = '-0.5*(cphi*cw*complex(0,1)*gw*I57c44) + (complex(0,1)*g1*I57c44*sphi*sw)/(2.*cw) - (complex(0,1)*g1*I58c44*sphi*sw)/(2.*cw) - (cphi*complex(0,1)*gw*I57c44*sw**2)/(2.*cw) - (complex(0,1)*gw*I58c44*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                  order = {'QED':1})

GC_114 = Coupling(name = 'GC_114',
                  value = '(cphi*cw*complex(0,1)*gw*I55c25)/4. + (cphi*cw*complex(0,1)*gw*I57c52)/4. - (complex(0,1)*g1*I55c25*sphi*sw)/(4.*cw) + (complex(0,1)*g1*I56c25*sphi*sw)/(4.*cw) - (complex(0,1)*g1*I57c52*sphi*sw)/(4.*cw) + (complex(0,1)*g1*I58c52*sphi*sw)/(4.*cw) + (cphi*complex(0,1)*gw*I55c25*sw**2)/(4.*cw) + (cphi*complex(0,1)*gw*I57c52*sw**2)/(4.*cw) + (complex(0,1)*gw*I56c25*sphi*cmath.sqrt(1 - 2*sw**2))/(4.*cw) + (complex(0,1)*gw*I58c52*sphi*cmath.sqrt(1 - 2*sw**2))/(4.*cw)',
                  order = {'QED':1})

GC_115 = Coupling(name = 'GC_115',
                  value = '-0.5*(cphi*cw*complex(0,1)*gw*I57c55) + (complex(0,1)*g1*I57c55*sphi*sw)/(2.*cw) - (complex(0,1)*g1*I58c55*sphi*sw)/(2.*cw) - (cphi*complex(0,1)*gw*I57c55*sw**2)/(2.*cw) - (complex(0,1)*gw*I58c55*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                  order = {'QED':1})

GC_116 = Coupling(name = 'GC_116',
                  value = '(cphi*cw*complex(0,1)*gw*I55c36)/4. + (cphi*cw*complex(0,1)*gw*I57c63)/4. - (complex(0,1)*g1*I55c36*sphi*sw)/(4.*cw) + (complex(0,1)*g1*I56c36*sphi*sw)/(4.*cw) - (complex(0,1)*g1*I57c63*sphi*sw)/(4.*cw) + (complex(0,1)*g1*I58c63*sphi*sw)/(4.*cw) + (cphi*complex(0,1)*gw*I55c36*sw**2)/(4.*cw) + (cphi*complex(0,1)*gw*I57c63*sw**2)/(4.*cw) + (complex(0,1)*gw*I56c36*sphi*cmath.sqrt(1 - 2*sw**2))/(4.*cw) + (complex(0,1)*gw*I58c63*sphi*cmath.sqrt(1 - 2*sw**2))/(4.*cw)',
                  order = {'QED':1})

GC_117 = Coupling(name = 'GC_117',
                  value = '-0.5*(cphi*cw*complex(0,1)*gw*I57c66) + (complex(0,1)*g1*I57c66*sphi*sw)/(2.*cw) - (complex(0,1)*g1*I58c66*sphi*sw)/(2.*cw) - (cphi*complex(0,1)*gw*I57c66*sw**2)/(2.*cw) - (complex(0,1)*gw*I58c66*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw)',
                  order = {'QED':1})

GC_118 = Coupling(name = 'GC_118',
                  value = '-(cphi*cw*gw) + (g1*sphi*sw)/cw - (cphi*g1*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_119 = Coupling(name = 'GC_119',
                  value = '(g1*sphi*sw)/cw + (cphi*gw*sw**2)/cw + (gw*sphi*cmath.sqrt(1 - 2*sw**2))/cw - (cphi*g1*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_120 = Coupling(name = 'GC_120',
                  value = '-0.5*(cphi*cw*complex(0,1)*gw) + (complex(0,1)*g1*sphi*sw)/(6.*cw) - (cphi*complex(0,1)*g1*sw*cmath.sqrt(1 - 2*sw**2))/(6.*cw)',
                  order = {'QED':1})

GC_121 = Coupling(name = 'GC_121',
                  value = '-((complex(0,1)*g1*sphi*sw)/cw) + (cphi*complex(0,1)*g1*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_122 = Coupling(name = 'GC_122',
                  value = '-(cphi*cw*complex(0,1)*gw) - (complex(0,1)*g1*sphi*sw)/cw + (cphi*complex(0,1)*g1*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_123 = Coupling(name = 'GC_123',
                  value = '-((complex(0,1)*g1*sphi*sw)/cw) + (cphi*complex(0,1)*gw*sw**2)/cw + (complex(0,1)*gw*sphi*cmath.sqrt(1 - 2*sw**2))/cw + (cphi*complex(0,1)*g1*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_124 = Coupling(name = 'GC_124',
                  value = '(-2*complex(0,1)*g1**2*sphi*sw)/cw + (4*complex(0,1)*g1**2*sphi*sw**3)/cw - (2*cphi*complex(0,1)*g1**2*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_125 = Coupling(name = 'GC_125',
                  value = '2*complex(0,1)*g1**2 - 4*complex(0,1)*g1**2*sw**2 + 2*complex(0,1)*gw**2*sw**2 - 4*complex(0,1)*g1*gw*sw*cmath.sqrt(1 - 2*sw**2)',
                  order = {'QED':2})

GC_126 = Coupling(name = 'GC_126',
                  value = '2*complex(0,1)*g1**2 - 4*complex(0,1)*g1**2*sw**2 + 2*complex(0,1)*gw**2*sw**2 + 4*complex(0,1)*g1*gw*sw*cmath.sqrt(1 - 2*sw**2)',
                  order = {'QED':2})

GC_127 = Coupling(name = 'GC_127',
                  value = '-(cphi*cw*cxi*complex(0,1)*gw**2) - (2*cxi*complex(0,1)*g1*gw*sphi*sw)/cw + (2*cphi*cxi*complex(0,1)*g1*gw*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_128 = Coupling(name = 'GC_128',
                  value = '(-2*cxi*complex(0,1)*g1*gw*sphi*sw)/cw + (cphi*cxi*complex(0,1)*gw**2*sw**2)/cw + (cxi*complex(0,1)*gw**2*sphi*cmath.sqrt(1 - 2*sw**2))/cw + (2*cphi*cxi*complex(0,1)*g1*gw*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_129 = Coupling(name = 'GC_129',
                  value = '-((cphi*cw*cxi*gw**2)/cmath.sqrt(2)) + (cxi*g1*gw*sphi*sw*cmath.sqrt(2))/cw - (cphi*cxi*g1*gw*sw*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_130 = Coupling(name = 'GC_130',
                  value = '(cphi*cxi*gw**2*sw**2)/(cw*cmath.sqrt(2)) + (cxi*g1*gw*sphi*sw*cmath.sqrt(2))/cw + (cxi*gw**2*sphi*cmath.sqrt(1 - 2*sw**2))/(cw*cmath.sqrt(2)) - (cphi*cxi*g1*gw*sw*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_131 = Coupling(name = 'GC_131',
                  value = '-((cphi*cw*cxi*complex(0,1)*gw**2)/cmath.sqrt(2)) + (cxi*complex(0,1)*g1*gw*sphi*sw*cmath.sqrt(2))/cw - (cphi*cxi*complex(0,1)*g1*gw*sw*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_132 = Coupling(name = 'GC_132',
                  value = '(cphi*cxi*complex(0,1)*gw**2*sw**2)/(cw*cmath.sqrt(2)) + (cxi*complex(0,1)*g1*gw*sphi*sw*cmath.sqrt(2))/cw + (cxi*complex(0,1)*gw**2*sphi*cmath.sqrt(1 - 2*sw**2))/(cw*cmath.sqrt(2)) - (cphi*cxi*complex(0,1)*g1*gw*sw*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_133 = Coupling(name = 'GC_133',
                  value = '(cphi*cw*cxi*gw**2)/cmath.sqrt(2) - (cxi*g1*gw*sphi*sw*cmath.sqrt(2))/cw + (cphi*cxi*g1*gw*sw*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_134 = Coupling(name = 'GC_134',
                  value = '-((cphi*cxi*gw**2*sw**2)/(cw*cmath.sqrt(2))) - (cxi*g1*gw*sphi*sw*cmath.sqrt(2))/cw - (cxi*gw**2*sphi*cmath.sqrt(1 - 2*sw**2))/(cw*cmath.sqrt(2)) + (cphi*cxi*g1*gw*sw*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_135 = Coupling(name = 'GC_135',
                  value = '-(cw*gw*sphi) - (cphi*g1*sw)/cw - (g1*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_136 = Coupling(name = 'GC_136',
                  value = '-((cphi*g1*sw)/cw) + (gw*sphi*sw**2)/cw - (cphi*gw*cmath.sqrt(1 - 2*sw**2))/cw - (g1*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_137 = Coupling(name = 'GC_137',
                  value = '-0.5*(cw*complex(0,1)*gw*sphi) - (cphi*complex(0,1)*g1*sw)/(6.*cw) - (complex(0,1)*g1*sphi*sw*cmath.sqrt(1 - 2*sw**2))/(6.*cw)',
                  order = {'QED':1})

GC_138 = Coupling(name = 'GC_138',
                  value = '-((cphi*complex(0,1)*g1*sw)/cw) - (complex(0,1)*g1*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_139 = Coupling(name = 'GC_139',
                  value = 'cw*complex(0,1)*gw*sphi - (cphi*complex(0,1)*g1*sw)/cw - (complex(0,1)*g1*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_140 = Coupling(name = 'GC_140',
                  value = '-((cphi*complex(0,1)*g1*sw)/cw) - (complex(0,1)*gw*sphi*sw**2)/cw + (cphi*complex(0,1)*gw*cmath.sqrt(1 - 2*sw**2))/cw - (complex(0,1)*g1*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_141 = Coupling(name = 'GC_141',
                  value = '(cphi*complex(0,1)*g1*sw)/cw + (complex(0,1)*g1*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_142 = Coupling(name = 'GC_142',
                  value = '-(cw*complex(0,1)*gw*sphi) + (cphi*complex(0,1)*g1*sw)/cw + (complex(0,1)*g1*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_143 = Coupling(name = 'GC_143',
                  value = '(cphi*complex(0,1)*g1*sw)/cw + (complex(0,1)*gw*sphi*sw**2)/cw - (cphi*complex(0,1)*gw*cmath.sqrt(1 - 2*sw**2))/cw + (complex(0,1)*g1*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_144 = Coupling(name = 'GC_144',
                  value = 'cw*gw*sphi + (cphi*g1*sw)/cw + (g1*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_145 = Coupling(name = 'GC_145',
                  value = '(cphi*g1*sw)/cw - (gw*sphi*sw**2)/cw + (cphi*gw*cmath.sqrt(1 - 2*sw**2))/cw + (g1*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_146 = Coupling(name = 'GC_146',
                  value = '(-2*cphi*complex(0,1)*g1**2*sw)/cw + (4*cphi*complex(0,1)*g1**2*sw**3)/cw + (2*complex(0,1)*g1**2*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_147 = Coupling(name = 'GC_147',
                  value = '-(cw*cxi*complex(0,1)*gw**2*sphi) + (2*cphi*cxi*complex(0,1)*g1*gw*sw)/cw + (2*cxi*complex(0,1)*g1*gw*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_148 = Coupling(name = 'GC_148',
                  value = '(2*cphi*cxi*complex(0,1)*g1*gw*sw)/cw + (cxi*complex(0,1)*gw**2*sphi*sw**2)/cw - (cphi*cxi*complex(0,1)*gw**2*cmath.sqrt(1 - 2*sw**2))/cw + (2*cxi*complex(0,1)*g1*gw*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_149 = Coupling(name = 'GC_149',
                  value = '-((cw*cxi*gw**2*sphi)/cmath.sqrt(2)) - (cphi*cxi*g1*gw*sw*cmath.sqrt(2))/cw - (cxi*g1*gw*sphi*sw*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_150 = Coupling(name = 'GC_150',
                  value = '(cxi*gw**2*sphi*sw**2)/(cw*cmath.sqrt(2)) - (cphi*cxi*g1*gw*sw*cmath.sqrt(2))/cw - (cphi*cxi*gw**2*cmath.sqrt(1 - 2*sw**2))/(cw*cmath.sqrt(2)) - (cxi*g1*gw*sphi*sw*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_151 = Coupling(name = 'GC_151',
                  value = '-((cw*cxi*complex(0,1)*gw**2*sphi)/cmath.sqrt(2)) - (cphi*cxi*complex(0,1)*g1*gw*sw*cmath.sqrt(2))/cw - (cxi*complex(0,1)*g1*gw*sphi*sw*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_152 = Coupling(name = 'GC_152',
                  value = '(cxi*complex(0,1)*gw**2*sphi*sw**2)/(cw*cmath.sqrt(2)) - (cphi*cxi*complex(0,1)*g1*gw*sw*cmath.sqrt(2))/cw - (cphi*cxi*complex(0,1)*gw**2*cmath.sqrt(1 - 2*sw**2))/(cw*cmath.sqrt(2)) - (cxi*complex(0,1)*g1*gw*sphi*sw*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_153 = Coupling(name = 'GC_153',
                  value = '(cw*cxi*gw**2*sphi)/cmath.sqrt(2) + (cphi*cxi*g1*gw*sw*cmath.sqrt(2))/cw + (cxi*g1*gw*sphi*sw*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_154 = Coupling(name = 'GC_154',
                  value = '-((cxi*gw**2*sphi*sw**2)/(cw*cmath.sqrt(2))) + (cphi*cxi*g1*gw*sw*cmath.sqrt(2))/cw + (cphi*cxi*gw**2*cmath.sqrt(1 - 2*sw**2))/(cw*cmath.sqrt(2)) + (cxi*g1*gw*sphi*sw*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_155 = Coupling(name = 'GC_155',
                  value = '(-2*cphi*complex(0,1)*g1**2*sw)/cw + 2*cphi*cw*complex(0,1)*gw**2*sw + (2*complex(0,1)*g1*gw*sphi*sw**2)/cw + (4*cphi*complex(0,1)*g1**2*sw**3)/cw + 2*cphi*cw*complex(0,1)*g1*gw*cmath.sqrt(1 - 2*sw**2) + (2*complex(0,1)*g1**2*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw - (2*cphi*complex(0,1)*g1*gw*sw**2*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_156 = Coupling(name = 'GC_156',
                  value = '(-2*cphi*complex(0,1)*g1**2*sw)/cw + 2*cphi*cw*complex(0,1)*gw**2*sw - (2*complex(0,1)*g1*gw*sphi*sw**2)/cw + (4*cphi*complex(0,1)*g1**2*sw**3)/cw - 2*cphi*cw*complex(0,1)*g1*gw*cmath.sqrt(1 - 2*sw**2) + (2*complex(0,1)*g1**2*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw + (2*cphi*complex(0,1)*g1*gw*sw**2*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_157 = Coupling(name = 'GC_157',
                  value = '(-2*complex(0,1)*g1*gw*sphi)/cw - (2*cphi*complex(0,1)*g1**2*sw)/cw + (6*complex(0,1)*g1*gw*sphi*sw**2)/cw + (4*cphi*complex(0,1)*g1**2*sw**3)/cw - (2*cphi*complex(0,1)*gw**2*sw**3)/cw + (2*complex(0,1)*g1**2*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw - (2*complex(0,1)*gw**2*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw - (4*cphi*complex(0,1)*g1*gw*sw**2*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_158 = Coupling(name = 'GC_158',
                  value = '(2*complex(0,1)*g1*gw*sphi)/cw - (2*cphi*complex(0,1)*g1**2*sw)/cw - (6*complex(0,1)*g1*gw*sphi*sw**2)/cw + (4*cphi*complex(0,1)*g1**2*sw**3)/cw - (2*cphi*complex(0,1)*gw**2*sw**3)/cw + (2*complex(0,1)*g1**2*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw - (2*complex(0,1)*gw**2*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw + (4*cphi*complex(0,1)*g1*gw*sw**2*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_159 = Coupling(name = 'GC_159',
                  value = '(2*cphi**2*complex(0,1)*g1**2*sw**2)/cw**2 + (2*complex(0,1)*g1**2*sphi**2*sw**2)/cw**2 - (4*cphi**2*complex(0,1)*g1**2*sw**4)/cw**2 - (4*cphi*complex(0,1)*g1**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_160 = Coupling(name = 'GC_160',
                  value = '2*cphi**2*cw**2*complex(0,1)*gw**2 + 4*cphi*complex(0,1)*g1*gw*sphi*sw + (2*cphi**2*complex(0,1)*g1**2*sw**2)/cw**2 + (2*complex(0,1)*g1**2*sphi**2*sw**2)/cw**2 - (4*cphi**2*complex(0,1)*g1**2*sw**4)/cw**2 - 4*cphi**2*complex(0,1)*g1*gw*sw*cmath.sqrt(1 - 2*sw**2) - (4*cphi*complex(0,1)*g1**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_161 = Coupling(name = 'GC_161',
                  value = '2*cphi**2*cw**2*complex(0,1)*gw**2 - 4*cphi*complex(0,1)*g1*gw*sphi*sw + (2*cphi**2*complex(0,1)*g1**2*sw**2)/cw**2 + (2*complex(0,1)*g1**2*sphi**2*sw**2)/cw**2 - (4*cphi**2*complex(0,1)*g1**2*sw**4)/cw**2 + 4*cphi**2*complex(0,1)*g1*gw*sw*cmath.sqrt(1 - 2*sw**2) - (4*cphi*complex(0,1)*g1**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_162 = Coupling(name = 'GC_162',
                  value = '(2*cphi**2*complex(0,1)*g1**2*sw**2)/cw**2 + (2*complex(0,1)*g1**2*sphi**2*sw**2)/cw**2 - (4*complex(0,1)*g1**2*sphi**2*sw**4)/cw**2 + (4*cphi*complex(0,1)*g1**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_163 = Coupling(name = 'GC_163',
                  value = '2*cw**2*complex(0,1)*gw**2*sphi**2 - 4*cphi*complex(0,1)*g1*gw*sphi*sw + (2*cphi**2*complex(0,1)*g1**2*sw**2)/cw**2 + (2*complex(0,1)*g1**2*sphi**2*sw**2)/cw**2 - (4*complex(0,1)*g1**2*sphi**2*sw**4)/cw**2 - 4*complex(0,1)*g1*gw*sphi**2*sw*cmath.sqrt(1 - 2*sw**2) + (4*cphi*complex(0,1)*g1**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_164 = Coupling(name = 'GC_164',
                  value = '2*cw**2*complex(0,1)*gw**2*sphi**2 + 4*cphi*complex(0,1)*g1*gw*sphi*sw + (2*cphi**2*complex(0,1)*g1**2*sw**2)/cw**2 + (2*complex(0,1)*g1**2*sphi**2*sw**2)/cw**2 - (4*complex(0,1)*g1**2*sphi**2*sw**4)/cw**2 + 4*complex(0,1)*g1*gw*sphi**2*sw*cmath.sqrt(1 - 2*sw**2) + (4*cphi*complex(0,1)*g1**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_165 = Coupling(name = 'GC_165',
                  value = '(-2*complex(0,1)*g1**2*sphi*sw)/cw + 2*cw*complex(0,1)*gw**2*sphi*sw - (2*cphi*complex(0,1)*g1*gw*sw**2)/cw + (4*complex(0,1)*g1**2*sphi*sw**3)/cw + 2*cw*complex(0,1)*g1*gw*sphi*cmath.sqrt(1 - 2*sw**2) - (2*cphi*complex(0,1)*g1**2*sw*cmath.sqrt(1 - 2*sw**2))/cw - (2*complex(0,1)*g1*gw*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_166 = Coupling(name = 'GC_166',
                  value = '(-2*complex(0,1)*g1**2*sphi*sw)/cw + 2*cw*complex(0,1)*gw**2*sphi*sw + (2*cphi*complex(0,1)*g1*gw*sw**2)/cw + (4*complex(0,1)*g1**2*sphi*sw**3)/cw - 2*cw*complex(0,1)*g1*gw*sphi*cmath.sqrt(1 - 2*sw**2) - (2*cphi*complex(0,1)*g1**2*sw*cmath.sqrt(1 - 2*sw**2))/cw + (2*complex(0,1)*g1*gw*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_167 = Coupling(name = 'GC_167',
                  value = '(2*cphi*complex(0,1)*g1*gw)/cw - (2*complex(0,1)*g1**2*sphi*sw)/cw - (6*cphi*complex(0,1)*g1*gw*sw**2)/cw + (4*complex(0,1)*g1**2*sphi*sw**3)/cw - (2*complex(0,1)*gw**2*sphi*sw**3)/cw - (2*cphi*complex(0,1)*g1**2*sw*cmath.sqrt(1 - 2*sw**2))/cw + (2*cphi*complex(0,1)*gw**2*sw*cmath.sqrt(1 - 2*sw**2))/cw - (4*complex(0,1)*g1*gw*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_168 = Coupling(name = 'GC_168',
                  value = '(-2*cphi*complex(0,1)*g1*gw)/cw - (2*complex(0,1)*g1**2*sphi*sw)/cw + (6*cphi*complex(0,1)*g1*gw*sw**2)/cw + (4*complex(0,1)*g1**2*sphi*sw**3)/cw - (2*complex(0,1)*gw**2*sphi*sw**3)/cw - (2*cphi*complex(0,1)*g1**2*sw*cmath.sqrt(1 - 2*sw**2))/cw + (2*cphi*complex(0,1)*gw**2*sw*cmath.sqrt(1 - 2*sw**2))/cw + (4*complex(0,1)*g1*gw*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_169 = Coupling(name = 'GC_169',
                  value = '(-4*cphi*complex(0,1)*g1**2*sphi*sw**4)/cw**2 + (2*cphi**2*complex(0,1)*g1**2*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2 - (2*complex(0,1)*g1**2*sphi**2*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_170 = Coupling(name = 'GC_170',
                  value = '2*cphi*cw**2*complex(0,1)*gw**2*sphi - 2*cphi**2*complex(0,1)*g1*gw*sw + 2*complex(0,1)*g1*gw*sphi**2*sw - (4*cphi*complex(0,1)*g1**2*sphi*sw**4)/cw**2 - 4*cphi*complex(0,1)*g1*gw*sphi*sw*cmath.sqrt(1 - 2*sw**2) + (2*cphi**2*complex(0,1)*g1**2*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2 - (2*complex(0,1)*g1**2*sphi**2*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_171 = Coupling(name = 'GC_171',
                  value = '2*cphi*cw**2*complex(0,1)*gw**2*sphi + 2*cphi**2*complex(0,1)*g1*gw*sw - 2*complex(0,1)*g1*gw*sphi**2*sw - (4*cphi*complex(0,1)*g1**2*sphi*sw**4)/cw**2 + 4*cphi*complex(0,1)*g1*gw*sphi*sw*cmath.sqrt(1 - 2*sw**2) + (2*cphi**2*complex(0,1)*g1**2*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2 - (2*complex(0,1)*g1**2*sphi**2*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_172 = Coupling(name = 'GC_172',
                  value = '(2*complex(0,1)*gw**2*sphi**2)/cw**2 - (4*cphi*complex(0,1)*g1*gw*sphi*sw)/cw**2 + (2*cphi**2*complex(0,1)*g1**2*sw**2)/cw**2 + (2*complex(0,1)*g1**2*sphi**2*sw**2)/cw**2 - (4*complex(0,1)*gw**2*sphi**2*sw**2)/cw**2 + (12*cphi*complex(0,1)*g1*gw*sphi*sw**3)/cw**2 - (4*cphi**2*complex(0,1)*g1**2*sw**4)/cw**2 + (2*cphi**2*complex(0,1)*gw**2*sw**4)/cw**2 + (4*complex(0,1)*g1*gw*sphi**2*sw*cmath.sqrt(1 - 2*sw**2))/cw**2 - (4*cphi*complex(0,1)*g1**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2 + (4*cphi*complex(0,1)*gw**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2 - (4*cphi**2*complex(0,1)*g1*gw*sw**3*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_173 = Coupling(name = 'GC_173',
                  value = '(2*complex(0,1)*gw**2*sphi**2)/cw**2 + (4*cphi*complex(0,1)*g1*gw*sphi*sw)/cw**2 + (2*cphi**2*complex(0,1)*g1**2*sw**2)/cw**2 + (2*complex(0,1)*g1**2*sphi**2*sw**2)/cw**2 - (4*complex(0,1)*gw**2*sphi**2*sw**2)/cw**2 - (12*cphi*complex(0,1)*g1*gw*sphi*sw**3)/cw**2 - (4*cphi**2*complex(0,1)*g1**2*sw**4)/cw**2 + (2*cphi**2*complex(0,1)*gw**2*sw**4)/cw**2 - (4*complex(0,1)*g1*gw*sphi**2*sw*cmath.sqrt(1 - 2*sw**2))/cw**2 - (4*cphi*complex(0,1)*g1**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2 + (4*cphi*complex(0,1)*gw**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2 + (4*cphi**2*complex(0,1)*g1*gw*sw**3*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_174 = Coupling(name = 'GC_174',
                  value = '(-2*cphi*complex(0,1)*gw**2*sphi)/cw**2 + (2*cphi**2*complex(0,1)*g1*gw*sw)/cw**2 - (2*complex(0,1)*g1*gw*sphi**2*sw)/cw**2 + (4*cphi*complex(0,1)*gw**2*sphi*sw**2)/cw**2 - (6*cphi**2*complex(0,1)*g1*gw*sw**3)/cw**2 + (6*complex(0,1)*g1*gw*sphi**2*sw**3)/cw**2 - (4*cphi*complex(0,1)*g1**2*sphi*sw**4)/cw**2 + (2*cphi*complex(0,1)*gw**2*sphi*sw**4)/cw**2 - (4*cphi*complex(0,1)*g1*gw*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw**2 + (2*cphi**2*complex(0,1)*g1**2*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2 - (2*cphi**2*complex(0,1)*gw**2*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2 - (2*complex(0,1)*g1**2*sphi**2*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2 + (2*complex(0,1)*gw**2*sphi**2*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2 - (4*cphi*complex(0,1)*g1*gw*sphi*sw**3*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_175 = Coupling(name = 'GC_175',
                  value = '(-2*cphi*complex(0,1)*gw**2*sphi)/cw**2 - (2*cphi**2*complex(0,1)*g1*gw*sw)/cw**2 + (2*complex(0,1)*g1*gw*sphi**2*sw)/cw**2 + (4*cphi*complex(0,1)*gw**2*sphi*sw**2)/cw**2 + (6*cphi**2*complex(0,1)*g1*gw*sw**3)/cw**2 - (6*complex(0,1)*g1*gw*sphi**2*sw**3)/cw**2 - (4*cphi*complex(0,1)*g1**2*sphi*sw**4)/cw**2 + (2*cphi*complex(0,1)*gw**2*sphi*sw**4)/cw**2 + (4*cphi*complex(0,1)*g1*gw*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw**2 + (2*cphi**2*complex(0,1)*g1**2*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2 - (2*cphi**2*complex(0,1)*gw**2*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2 - (2*complex(0,1)*g1**2*sphi**2*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2 + (2*complex(0,1)*gw**2*sphi**2*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2 + (4*cphi*complex(0,1)*g1*gw*sphi*sw**3*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_176 = Coupling(name = 'GC_176',
                  value = '(2*cphi**2*complex(0,1)*gw**2)/cw**2 + (4*cphi*complex(0,1)*g1*gw*sphi*sw)/cw**2 + (2*cphi**2*complex(0,1)*g1**2*sw**2)/cw**2 - (4*cphi**2*complex(0,1)*gw**2*sw**2)/cw**2 + (2*complex(0,1)*g1**2*sphi**2*sw**2)/cw**2 - (12*cphi*complex(0,1)*g1*gw*sphi*sw**3)/cw**2 - (4*complex(0,1)*g1**2*sphi**2*sw**4)/cw**2 + (2*complex(0,1)*gw**2*sphi**2*sw**4)/cw**2 + (4*cphi**2*complex(0,1)*g1*gw*sw*cmath.sqrt(1 - 2*sw**2))/cw**2 + (4*cphi*complex(0,1)*g1**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2 - (4*cphi*complex(0,1)*gw**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2 - (4*complex(0,1)*g1*gw*sphi**2*sw**3*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_177 = Coupling(name = 'GC_177',
                  value = '(2*cphi**2*complex(0,1)*gw**2)/cw**2 - (4*cphi*complex(0,1)*g1*gw*sphi*sw)/cw**2 + (2*cphi**2*complex(0,1)*g1**2*sw**2)/cw**2 - (4*cphi**2*complex(0,1)*gw**2*sw**2)/cw**2 + (2*complex(0,1)*g1**2*sphi**2*sw**2)/cw**2 + (12*cphi*complex(0,1)*g1*gw*sphi*sw**3)/cw**2 - (4*complex(0,1)*g1**2*sphi**2*sw**4)/cw**2 + (2*complex(0,1)*gw**2*sphi**2*sw**4)/cw**2 - (4*cphi**2*complex(0,1)*g1*gw*sw*cmath.sqrt(1 - 2*sw**2))/cw**2 + (4*cphi*complex(0,1)*g1**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2 - (4*cphi*complex(0,1)*gw**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2 + (4*complex(0,1)*g1*gw*sphi**2*sw**3*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_178 = Coupling(name = 'GC_178',
                  value = '-(complex(0,1)*gw*sxi)',
                  order = {'QED':1})

GC_179 = Coupling(name = 'GC_179',
                  value = 'complex(0,1)*gw*sxi',
                  order = {'QED':1})

GC_180 = Coupling(name = 'GC_180',
                  value = '-((gw*sxi)/cmath.sqrt(2))',
                  order = {'QED':1})

GC_181 = Coupling(name = 'GC_181',
                  value = '-((complex(0,1)*gw*sxi)/cmath.sqrt(2))',
                  order = {'QED':1})

GC_182 = Coupling(name = 'GC_182',
                  value = '(complex(0,1)*gw*sxi)/cmath.sqrt(2)',
                  order = {'QED':1})

GC_183 = Coupling(name = 'GC_183',
                  value = '(gw*sxi)/cmath.sqrt(2)',
                  order = {'QED':1})

GC_184 = Coupling(name = 'GC_184',
                  value = '(CKML1x1*complex(0,1)*gw*sxi)/cmath.sqrt(2)',
                  order = {'QED':1})

GC_185 = Coupling(name = 'GC_185',
                  value = '(CKML1x2*complex(0,1)*gw*sxi)/cmath.sqrt(2)',
                  order = {'QED':1})

GC_186 = Coupling(name = 'GC_186',
                  value = '(CKML1x3*complex(0,1)*gw*sxi)/cmath.sqrt(2)',
                  order = {'QED':1})

GC_187 = Coupling(name = 'GC_187',
                  value = '(CKML2x1*complex(0,1)*gw*sxi)/cmath.sqrt(2)',
                  order = {'QED':1})

GC_188 = Coupling(name = 'GC_188',
                  value = '(CKML2x2*complex(0,1)*gw*sxi)/cmath.sqrt(2)',
                  order = {'QED':1})

GC_189 = Coupling(name = 'GC_189',
                  value = '(CKML2x3*complex(0,1)*gw*sxi)/cmath.sqrt(2)',
                  order = {'QED':1})

GC_190 = Coupling(name = 'GC_190',
                  value = '(CKML3x1*complex(0,1)*gw*sxi)/cmath.sqrt(2)',
                  order = {'QED':1})

GC_191 = Coupling(name = 'GC_191',
                  value = '(CKML3x2*complex(0,1)*gw*sxi)/cmath.sqrt(2)',
                  order = {'QED':1})

GC_192 = Coupling(name = 'GC_192',
                  value = '(CKML3x3*complex(0,1)*gw*sxi)/cmath.sqrt(2)',
                  order = {'QED':1})

GC_193 = Coupling(name = 'GC_193',
                  value = '-((CKMR1x1*complex(0,1)*gw*sxi)/cmath.sqrt(2))',
                  order = {'QED':1})

GC_194 = Coupling(name = 'GC_194',
                  value = '-((CKMR1x2*complex(0,1)*gw*sxi)/cmath.sqrt(2))',
                  order = {'QED':1})

GC_195 = Coupling(name = 'GC_195',
                  value = '-((CKMR1x3*complex(0,1)*gw*sxi)/cmath.sqrt(2))',
                  order = {'QED':1})

GC_196 = Coupling(name = 'GC_196',
                  value = '-((CKMR2x1*complex(0,1)*gw*sxi)/cmath.sqrt(2))',
                  order = {'QED':1})

GC_197 = Coupling(name = 'GC_197',
                  value = '-((CKMR2x2*complex(0,1)*gw*sxi)/cmath.sqrt(2))',
                  order = {'QED':1})

GC_198 = Coupling(name = 'GC_198',
                  value = '-((CKMR2x3*complex(0,1)*gw*sxi)/cmath.sqrt(2))',
                  order = {'QED':1})

GC_199 = Coupling(name = 'GC_199',
                  value = '-((CKMR3x1*complex(0,1)*gw*sxi)/cmath.sqrt(2))',
                  order = {'QED':1})

GC_200 = Coupling(name = 'GC_200',
                  value = '-((CKMR3x2*complex(0,1)*gw*sxi)/cmath.sqrt(2))',
                  order = {'QED':1})

GC_201 = Coupling(name = 'GC_201',
                  value = '-((CKMR3x3*complex(0,1)*gw*sxi)/cmath.sqrt(2))',
                  order = {'QED':1})

GC_202 = Coupling(name = 'GC_202',
                  value = '-(cxi*complex(0,1)*gw**2*sxi)',
                  order = {'QED':2})

GC_203 = Coupling(name = 'GC_203',
                  value = 'cxi*complex(0,1)*gw**2*sxi',
                  order = {'QED':2})

GC_204 = Coupling(name = 'GC_204',
                  value = '-2*cxi*complex(0,1)*gw**2*sxi',
                  order = {'QED':2})

GC_205 = Coupling(name = 'GC_205',
                  value = '2*cxi*complex(0,1)*gw**2*sxi',
                  order = {'QED':2})

GC_206 = Coupling(name = 'GC_206',
                  value = '-(cxi*gw**2*sxi*cmath.sqrt(2))',
                  order = {'QED':2})

GC_207 = Coupling(name = 'GC_207',
                  value = '-(cxi*complex(0,1)*gw**2*sxi*cmath.sqrt(2))',
                  order = {'QED':2})

GC_208 = Coupling(name = 'GC_208',
                  value = 'cxi*complex(0,1)*gw**2*sxi*cmath.sqrt(2)',
                  order = {'QED':2})

GC_209 = Coupling(name = 'GC_209',
                  value = 'cxi*gw**2*sxi*cmath.sqrt(2)',
                  order = {'QED':2})

GC_210 = Coupling(name = 'GC_210',
                  value = '(complex(0,1)*gw*KL1x1*sxi)/cmath.sqrt(2)',
                  order = {'QED':1})

GC_211 = Coupling(name = 'GC_211',
                  value = '(complex(0,1)*gw*KL2x2*sxi)/cmath.sqrt(2)',
                  order = {'QED':1})

GC_212 = Coupling(name = 'GC_212',
                  value = '(complex(0,1)*gw*KL3x3*sxi)/cmath.sqrt(2)',
                  order = {'QED':1})

GC_213 = Coupling(name = 'GC_213',
                  value = '(complex(0,1)*gw*KL4x1*sxi)/cmath.sqrt(2)',
                  order = {'QED':1})

GC_214 = Coupling(name = 'GC_214',
                  value = '(complex(0,1)*gw*KL5x2*sxi)/cmath.sqrt(2)',
                  order = {'QED':1})

GC_215 = Coupling(name = 'GC_215',
                  value = '(complex(0,1)*gw*KL6x3*sxi)/cmath.sqrt(2)',
                  order = {'QED':1})

GC_216 = Coupling(name = 'GC_216',
                  value = '-((complex(0,1)*gw*KR1x1*sxi)/cmath.sqrt(2))',
                  order = {'QED':1})

GC_217 = Coupling(name = 'GC_217',
                  value = '-((complex(0,1)*gw*KR2x2*sxi)/cmath.sqrt(2))',
                  order = {'QED':1})

GC_218 = Coupling(name = 'GC_218',
                  value = '-((complex(0,1)*gw*KR3x3*sxi)/cmath.sqrt(2))',
                  order = {'QED':1})

GC_219 = Coupling(name = 'GC_219',
                  value = '-((complex(0,1)*gw*KR4x1*sxi)/cmath.sqrt(2))',
                  order = {'QED':1})

GC_220 = Coupling(name = 'GC_220',
                  value = '-((complex(0,1)*gw*KR5x2*sxi)/cmath.sqrt(2))',
                  order = {'QED':1})

GC_221 = Coupling(name = 'GC_221',
                  value = '-((complex(0,1)*gw*KR6x3*sxi)/cmath.sqrt(2))',
                  order = {'QED':1})

GC_222 = Coupling(name = 'GC_222',
                  value = 'complex(0,1)*gw**2*sxi**2',
                  order = {'QED':2})

GC_223 = Coupling(name = 'GC_223',
                  value = '2*complex(0,1)*gw**2*sxi**2',
                  order = {'QED':2})

GC_224 = Coupling(name = 'GC_224',
                  value = '-(gw**2*sxi**2*cmath.sqrt(2))',
                  order = {'QED':2})

GC_225 = Coupling(name = 'GC_225',
                  value = '-(complex(0,1)*gw**2*sxi**2*cmath.sqrt(2))',
                  order = {'QED':2})

GC_226 = Coupling(name = 'GC_226',
                  value = 'gw**2*sxi**2*cmath.sqrt(2)',
                  order = {'QED':2})

GC_227 = Coupling(name = 'GC_227',
                  value = '-2*cxi**2*complex(0,1)*gw**2*sxi**2',
                  order = {'QED':2})

GC_228 = Coupling(name = 'GC_228',
                  value = 'cw*cxi*complex(0,1)*gw*sphi*sxi + (cxi*complex(0,1)*gw*sphi*sw**2*sxi)/cw - (cphi*cxi*complex(0,1)*gw*sxi*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_229 = Coupling(name = 'GC_229',
                  value = '-(complex(0,1)*gw**2*sw*sxi) - 2*complex(0,1)*g1*gw*sxi*cmath.sqrt(1 - 2*sw**2)',
                  order = {'QED':2})

GC_230 = Coupling(name = 'GC_230',
                  value = 'complex(0,1)*gw**2*sw*sxi + 2*complex(0,1)*g1*gw*sxi*cmath.sqrt(1 - 2*sw**2)',
                  order = {'QED':2})

GC_231 = Coupling(name = 'GC_231',
                  value = '(gw**2*sw*sxi)/cmath.sqrt(2) - g1*gw*sxi*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2)',
                  order = {'QED':2})

GC_232 = Coupling(name = 'GC_232',
                  value = '(complex(0,1)*gw**2*sw*sxi)/cmath.sqrt(2) - complex(0,1)*g1*gw*sxi*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2)',
                  order = {'QED':2})

GC_233 = Coupling(name = 'GC_233',
                  value = '-((complex(0,1)*gw**2*sw*sxi)/cmath.sqrt(2)) + complex(0,1)*g1*gw*sxi*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2)',
                  order = {'QED':2})

GC_234 = Coupling(name = 'GC_234',
                  value = '-((gw**2*sw*sxi)/cmath.sqrt(2)) + g1*gw*sxi*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2)',
                  order = {'QED':2})

GC_235 = Coupling(name = 'GC_235',
                  value = 'cphi*cw*cxi*complex(0,1)*gw*sxi + (cphi*cxi*complex(0,1)*gw*sw**2*sxi)/cw + (cxi*complex(0,1)*gw*sphi*sxi*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_236 = Coupling(name = 'GC_236',
                  value = '(2*complex(0,1)*g1*gw*sphi*sw*sxi)/cw - (cphi*complex(0,1)*gw**2*sw**2*sxi)/cw - (complex(0,1)*gw**2*sphi*sxi*cmath.sqrt(1 - 2*sw**2))/cw - (2*cphi*complex(0,1)*g1*gw*sw*sxi*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_237 = Coupling(name = 'GC_237',
                  value = '-(cphi*cw*complex(0,1)*gw**2*sxi) - (2*complex(0,1)*g1*gw*sphi*sw*sxi)/cw + (2*cphi*complex(0,1)*g1*gw*sw*sxi*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_238 = Coupling(name = 'GC_238',
                  value = '-((cphi*cw*gw**2*sxi)/cmath.sqrt(2)) + (g1*gw*sphi*sw*sxi*cmath.sqrt(2))/cw - (cphi*g1*gw*sw*sxi*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_239 = Coupling(name = 'GC_239',
                  value = '(cphi*gw**2*sw**2*sxi)/(cw*cmath.sqrt(2)) + (g1*gw*sphi*sw*sxi*cmath.sqrt(2))/cw + (gw**2*sphi*sxi*cmath.sqrt(1 - 2*sw**2))/(cw*cmath.sqrt(2)) - (cphi*g1*gw*sw*sxi*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_240 = Coupling(name = 'GC_240',
                  value = '-((cphi*cw*complex(0,1)*gw**2*sxi)/cmath.sqrt(2)) + (complex(0,1)*g1*gw*sphi*sw*sxi*cmath.sqrt(2))/cw - (cphi*complex(0,1)*g1*gw*sw*sxi*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_241 = Coupling(name = 'GC_241',
                  value = '-((cphi*complex(0,1)*gw**2*sw**2*sxi)/(cw*cmath.sqrt(2))) - (complex(0,1)*g1*gw*sphi*sw*sxi*cmath.sqrt(2))/cw - (complex(0,1)*gw**2*sphi*sxi*cmath.sqrt(1 - 2*sw**2))/(cw*cmath.sqrt(2)) + (cphi*complex(0,1)*g1*gw*sw*sxi*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_242 = Coupling(name = 'GC_242',
                  value = '(cphi*cw*gw**2*sxi)/cmath.sqrt(2) - (g1*gw*sphi*sw*sxi*cmath.sqrt(2))/cw + (cphi*g1*gw*sw*sxi*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_243 = Coupling(name = 'GC_243',
                  value = '-((cphi*gw**2*sw**2*sxi)/(cw*cmath.sqrt(2))) - (g1*gw*sphi*sw*sxi*cmath.sqrt(2))/cw - (gw**2*sphi*sxi*cmath.sqrt(1 - 2*sw**2))/(cw*cmath.sqrt(2)) + (cphi*g1*gw*sw*sxi*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_244 = Coupling(name = 'GC_244',
                  value = 'cw*cxi*complex(0,1)*gw**2*sphi*sw*sxi + (cxi*complex(0,1)*gw**2*sphi*sw**3*sxi)/cw - (cphi*cxi*complex(0,1)*gw**2*sw*sxi*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_245 = Coupling(name = 'GC_245',
                  value = '-2*cw*cxi*complex(0,1)*gw**2*sphi*sw*sxi - (2*cxi*complex(0,1)*gw**2*sphi*sw**3*sxi)/cw + (2*cphi*cxi*complex(0,1)*gw**2*sw*sxi*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_246 = Coupling(name = 'GC_246',
                  value = '(-2*cphi*complex(0,1)*g1*gw*sw*sxi)/cw - (complex(0,1)*gw**2*sphi*sw**2*sxi)/cw + (cphi*complex(0,1)*gw**2*sxi*cmath.sqrt(1 - 2*sw**2))/cw - (2*complex(0,1)*g1*gw*sphi*sw*sxi*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_247 = Coupling(name = 'GC_247',
                  value = '-(cw*complex(0,1)*gw**2*sphi*sxi) + (2*cphi*complex(0,1)*g1*gw*sw*sxi)/cw + (2*complex(0,1)*g1*gw*sphi*sw*sxi*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_248 = Coupling(name = 'GC_248',
                  value = '-((cw*gw**2*sphi*sxi)/cmath.sqrt(2)) - (cphi*g1*gw*sw*sxi*cmath.sqrt(2))/cw - (g1*gw*sphi*sw*sxi*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_249 = Coupling(name = 'GC_249',
                  value = '(gw**2*sphi*sw**2*sxi)/(cw*cmath.sqrt(2)) - (cphi*g1*gw*sw*sxi*cmath.sqrt(2))/cw - (cphi*gw**2*sxi*cmath.sqrt(1 - 2*sw**2))/(cw*cmath.sqrt(2)) - (g1*gw*sphi*sw*sxi*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_250 = Coupling(name = 'GC_250',
                  value = '-((cw*complex(0,1)*gw**2*sphi*sxi)/cmath.sqrt(2)) - (cphi*complex(0,1)*g1*gw*sw*sxi*cmath.sqrt(2))/cw - (complex(0,1)*g1*gw*sphi*sw*sxi*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_251 = Coupling(name = 'GC_251',
                  value = '-((complex(0,1)*gw**2*sphi*sw**2*sxi)/(cw*cmath.sqrt(2))) + (cphi*complex(0,1)*g1*gw*sw*sxi*cmath.sqrt(2))/cw + (cphi*complex(0,1)*gw**2*sxi*cmath.sqrt(1 - 2*sw**2))/(cw*cmath.sqrt(2)) + (complex(0,1)*g1*gw*sphi*sw*sxi*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_252 = Coupling(name = 'GC_252',
                  value = '(cw*gw**2*sphi*sxi)/cmath.sqrt(2) + (cphi*g1*gw*sw*sxi*cmath.sqrt(2))/cw + (g1*gw*sphi*sw*sxi*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_253 = Coupling(name = 'GC_253',
                  value = '-((gw**2*sphi*sw**2*sxi)/(cw*cmath.sqrt(2))) + (cphi*g1*gw*sw*sxi*cmath.sqrt(2))/cw + (cphi*gw**2*sxi*cmath.sqrt(1 - 2*sw**2))/(cw*cmath.sqrt(2)) + (g1*gw*sphi*sw*sxi*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_254 = Coupling(name = 'GC_254',
                  value = 'cphi*cw*cxi*complex(0,1)*gw**2*sw*sxi + (cphi*cxi*complex(0,1)*gw**2*sw**3*sxi)/cw + (cxi*complex(0,1)*gw**2*sphi*sw*sxi*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_255 = Coupling(name = 'GC_255',
                  value = '-2*cphi*cw*cxi*complex(0,1)*gw**2*sw*sxi - (2*cphi*cxi*complex(0,1)*gw**2*sw**3*sxi)/cw - (2*cxi*complex(0,1)*gw**2*sphi*sw*sxi*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_256 = Coupling(name = 'GC_256',
                  value = 'cphi**2*cw**2*cxi*complex(0,1)*gw**2*sxi - (cxi*complex(0,1)*gw**2*sphi**2*sxi)/cw**2 + (2*cxi*complex(0,1)*gw**2*sphi**2*sw**2*sxi)/cw**2 - (cphi**2*cxi*complex(0,1)*gw**2*sw**4*sxi)/cw**2 - (2*cphi*cxi*complex(0,1)*gw**2*sphi*sw**2*sxi*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_257 = Coupling(name = 'GC_257',
                  value = '-((cphi**2*cxi*complex(0,1)*gw**2*sxi)/cw**2) + cw**2*cxi*complex(0,1)*gw**2*sphi**2*sxi + (2*cphi**2*cxi*complex(0,1)*gw**2*sw**2*sxi)/cw**2 - (cxi*complex(0,1)*gw**2*sphi**2*sw**4*sxi)/cw**2 + (2*cphi*cxi*complex(0,1)*gw**2*sphi*sw**2*sxi*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_258 = Coupling(name = 'GC_258',
                  value = '(2*cphi**2*cxi*complex(0,1)*gw**2*sxi)/cw**2 - 2*cw**2*cxi*complex(0,1)*gw**2*sphi**2*sxi - (4*cphi**2*cxi*complex(0,1)*gw**2*sw**2*sxi)/cw**2 + (2*cxi*complex(0,1)*gw**2*sphi**2*sw**4*sxi)/cw**2 - (4*cphi*cxi*complex(0,1)*gw**2*sphi*sw**2*sxi*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_259 = Coupling(name = 'GC_259',
                  value = '-2*cphi**2*cw**2*cxi*complex(0,1)*gw**2*sxi + (2*cxi*complex(0,1)*gw**2*sphi**2*sxi)/cw**2 - (4*cxi*complex(0,1)*gw**2*sphi**2*sw**2*sxi)/cw**2 + (2*cphi**2*cxi*complex(0,1)*gw**2*sw**4*sxi)/cw**2 + (4*cphi*cxi*complex(0,1)*gw**2*sphi*sw**2*sxi*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_260 = Coupling(name = 'GC_260',
                  value = '(cphi*cxi*complex(0,1)*gw**2*sphi*sxi)/cw**2 + cphi*cw**2*cxi*complex(0,1)*gw**2*sphi*sxi - (2*cphi*cxi*complex(0,1)*gw**2*sphi*sw**2*sxi)/cw**2 - (cphi*cxi*complex(0,1)*gw**2*sphi*sw**4*sxi)/cw**2 + (cphi**2*cxi*complex(0,1)*gw**2*sw**2*sxi*cmath.sqrt(1 - 2*sw**2))/cw**2 - (cxi*complex(0,1)*gw**2*sphi**2*sw**2*sxi*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_261 = Coupling(name = 'GC_261',
                  value = '(-2*cphi*cxi*complex(0,1)*gw**2*sphi*sxi)/cw**2 - 2*cphi*cw**2*cxi*complex(0,1)*gw**2*sphi*sxi + (4*cphi*cxi*complex(0,1)*gw**2*sphi*sw**2*sxi)/cw**2 + (2*cphi*cxi*complex(0,1)*gw**2*sphi*sw**4*sxi)/cw**2 - (2*cphi**2*cxi*complex(0,1)*gw**2*sw**2*sxi*cmath.sqrt(1 - 2*sw**2))/cw**2 + (2*cxi*complex(0,1)*gw**2*sphi**2*sw**2*sxi*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_262 = Coupling(name = 'GC_262',
                  value = '-((cphi*cxi**2*complex(0,1)*gw*sw**2)/cw) + cphi*cw*complex(0,1)*gw*sxi**2 - (cxi**2*complex(0,1)*gw*sphi*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_263 = Coupling(name = 'GC_263',
                  value = '(cxi**2*complex(0,1)*gw**2*sphi**2)/cw**2 - (2*cxi**2*complex(0,1)*gw**2*sphi**2*sw**2)/cw**2 + (cphi**2*cxi**2*complex(0,1)*gw**2*sw**4)/cw**2 + cphi**2*cw**2*complex(0,1)*gw**2*sxi**2 + (2*cphi*cxi**2*complex(0,1)*gw**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_264 = Coupling(name = 'GC_264',
                  value = '(-2*cxi**2*complex(0,1)*gw**2*sphi**2)/cw**2 + (4*cxi**2*complex(0,1)*gw**2*sphi**2*sw**2)/cw**2 - (2*cphi**2*cxi**2*complex(0,1)*gw**2*sw**4)/cw**2 - 2*cphi**2*cw**2*complex(0,1)*gw**2*sxi**2 - (4*cphi*cxi**2*complex(0,1)*gw**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_265 = Coupling(name = 'GC_265',
                  value = '-((cxi**2*complex(0,1)*gw*sphi*sw**2)/cw) + cw*complex(0,1)*gw*sphi*sxi**2 + (cphi*cxi**2*complex(0,1)*gw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_266 = Coupling(name = 'GC_266',
                  value = '-((cphi*cxi**2*complex(0,1)*gw**2*sphi)/cw**2) + (2*cphi*cxi**2*complex(0,1)*gw**2*sphi*sw**2)/cw**2 + (cphi*cxi**2*complex(0,1)*gw**2*sphi*sw**4)/cw**2 + cphi*cw**2*complex(0,1)*gw**2*sphi*sxi**2 - (cphi**2*cxi**2*complex(0,1)*gw**2*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2 + (cxi**2*complex(0,1)*gw**2*sphi**2*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_267 = Coupling(name = 'GC_267',
                  value = '(2*cphi*cxi**2*complex(0,1)*gw**2*sphi)/cw**2 - (4*cphi*cxi**2*complex(0,1)*gw**2*sphi*sw**2)/cw**2 - (2*cphi*cxi**2*complex(0,1)*gw**2*sphi*sw**4)/cw**2 - 2*cphi*cw**2*complex(0,1)*gw**2*sphi*sxi**2 + (2*cphi**2*cxi**2*complex(0,1)*gw**2*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2 - (2*cxi**2*complex(0,1)*gw**2*sphi**2*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_268 = Coupling(name = 'GC_268',
                  value = '(cphi**2*cxi**2*complex(0,1)*gw**2)/cw**2 - (2*cphi**2*cxi**2*complex(0,1)*gw**2*sw**2)/cw**2 + (cxi**2*complex(0,1)*gw**2*sphi**2*sw**4)/cw**2 + cw**2*complex(0,1)*gw**2*sphi**2*sxi**2 - (2*cphi*cxi**2*complex(0,1)*gw**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_269 = Coupling(name = 'GC_269',
                  value = '(-2*cphi**2*cxi**2*complex(0,1)*gw**2)/cw**2 + (4*cphi**2*cxi**2*complex(0,1)*gw**2*sw**2)/cw**2 - (2*cxi**2*complex(0,1)*gw**2*sphi**2*sw**4)/cw**2 - 2*cw**2*complex(0,1)*gw**2*sphi**2*sxi**2 + (4*cphi*cxi**2*complex(0,1)*gw**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_270 = Coupling(name = 'GC_270',
                  value = 'cxi**2*complex(0,1)*gw*sw + complex(0,1)*gw*sw*sxi**2',
                  order = {'QED':1})

GC_271 = Coupling(name = 'GC_271',
                  value = '-((cphi*cxi**2*complex(0,1)*gw**2*sw**3)/cw) + cphi*cw*complex(0,1)*gw**2*sw*sxi**2 - (cxi**2*complex(0,1)*gw**2*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_272 = Coupling(name = 'GC_272',
                  value = '(2*cphi*cxi**2*complex(0,1)*gw**2*sw**3)/cw - 2*cphi*cw*complex(0,1)*gw**2*sw*sxi**2 + (2*cxi**2*complex(0,1)*gw**2*sphi*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_273 = Coupling(name = 'GC_273',
                  value = '-((cxi**2*complex(0,1)*gw**2*sphi*sw**3)/cw) + cw*complex(0,1)*gw**2*sphi*sw*sxi**2 + (cphi*cxi**2*complex(0,1)*gw**2*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_274 = Coupling(name = 'GC_274',
                  value = '(2*cxi**2*complex(0,1)*gw**2*sphi*sw**3)/cw - 2*cw*complex(0,1)*gw**2*sphi*sw*sxi**2 - (2*cphi*cxi**2*complex(0,1)*gw**2*sw*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_275 = Coupling(name = 'GC_275',
                  value = 'cxi**2*complex(0,1)*gw**2*sw**2 + complex(0,1)*gw**2*sw**2*sxi**2',
                  order = {'QED':2})

GC_276 = Coupling(name = 'GC_276',
                  value = 'cw*cxi**2*complex(0,1)*gw*sphi - (complex(0,1)*gw*sphi*sw**2*sxi**2)/cw + (cphi*complex(0,1)*gw*sxi**2*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_277 = Coupling(name = 'GC_277',
                  value = 'cphi*cw*cxi**2*complex(0,1)*gw - (cphi*complex(0,1)*gw*sw**2*sxi**2)/cw - (complex(0,1)*gw*sphi*sxi**2*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_278 = Coupling(name = 'GC_278',
                  value = 'cw*cxi**2*complex(0,1)*gw**2*sphi*sw - (complex(0,1)*gw**2*sphi*sw**3*sxi**2)/cw + (cphi*complex(0,1)*gw**2*sw*sxi**2*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_279 = Coupling(name = 'GC_279',
                  value = '-2*cw*cxi**2*complex(0,1)*gw**2*sphi*sw + (2*complex(0,1)*gw**2*sphi*sw**3*sxi**2)/cw - (2*cphi*complex(0,1)*gw**2*sw*sxi**2*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_280 = Coupling(name = 'GC_280',
                  value = 'cphi*cw*cxi**2*complex(0,1)*gw**2*sw - (cphi*complex(0,1)*gw**2*sw**3*sxi**2)/cw - (complex(0,1)*gw**2*sphi*sw*sxi**2*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_281 = Coupling(name = 'GC_281',
                  value = '-2*cphi*cw*cxi**2*complex(0,1)*gw**2*sw + (2*cphi*complex(0,1)*gw**2*sw**3*sxi**2)/cw + (2*complex(0,1)*gw**2*sphi*sw*sxi**2*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':2})

GC_282 = Coupling(name = 'GC_282',
                  value = 'cw**2*cxi**2*complex(0,1)*gw**2*sphi**2 + (cphi**2*complex(0,1)*gw**2*sxi**2)/cw**2 - (2*cphi**2*complex(0,1)*gw**2*sw**2*sxi**2)/cw**2 + (complex(0,1)*gw**2*sphi**2*sw**4*sxi**2)/cw**2 - (2*cphi*complex(0,1)*gw**2*sphi*sw**2*sxi**2*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_283 = Coupling(name = 'GC_283',
                  value = 'cphi**2*cw**2*cxi**2*complex(0,1)*gw**2 + (complex(0,1)*gw**2*sphi**2*sxi**2)/cw**2 - (2*complex(0,1)*gw**2*sphi**2*sw**2*sxi**2)/cw**2 + (cphi**2*complex(0,1)*gw**2*sw**4*sxi**2)/cw**2 + (2*cphi*complex(0,1)*gw**2*sphi*sw**2*sxi**2*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_284 = Coupling(name = 'GC_284',
                  value = '-2*cphi**2*cw**2*cxi**2*complex(0,1)*gw**2 - (2*complex(0,1)*gw**2*sphi**2*sxi**2)/cw**2 + (4*complex(0,1)*gw**2*sphi**2*sw**2*sxi**2)/cw**2 - (2*cphi**2*complex(0,1)*gw**2*sw**4*sxi**2)/cw**2 - (4*cphi*complex(0,1)*gw**2*sphi*sw**2*sxi**2*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_285 = Coupling(name = 'GC_285',
                  value = '-2*cw**2*cxi**2*complex(0,1)*gw**2*sphi**2 - (2*cphi**2*complex(0,1)*gw**2*sxi**2)/cw**2 + (4*cphi**2*complex(0,1)*gw**2*sw**2*sxi**2)/cw**2 - (2*complex(0,1)*gw**2*sphi**2*sw**4*sxi**2)/cw**2 + (4*cphi*complex(0,1)*gw**2*sphi*sw**2*sxi**2*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_286 = Coupling(name = 'GC_286',
                  value = 'cphi*cw**2*cxi**2*complex(0,1)*gw**2*sphi - (cphi*complex(0,1)*gw**2*sphi*sxi**2)/cw**2 + (2*cphi*complex(0,1)*gw**2*sphi*sw**2*sxi**2)/cw**2 + (cphi*complex(0,1)*gw**2*sphi*sw**4*sxi**2)/cw**2 - (cphi**2*complex(0,1)*gw**2*sw**2*sxi**2*cmath.sqrt(1 - 2*sw**2))/cw**2 + (complex(0,1)*gw**2*sphi**2*sw**2*sxi**2*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_287 = Coupling(name = 'GC_287',
                  value = '-2*cphi*cw**2*cxi**2*complex(0,1)*gw**2*sphi + (2*cphi*complex(0,1)*gw**2*sphi*sxi**2)/cw**2 - (4*cphi*complex(0,1)*gw**2*sphi*sw**2*sxi**2)/cw**2 - (2*cphi*complex(0,1)*gw**2*sphi*sw**4*sxi**2)/cw**2 + (2*cphi**2*complex(0,1)*gw**2*sw**2*sxi**2*cmath.sqrt(1 - 2*sw**2))/cw**2 - (2*complex(0,1)*gw**2*sphi**2*sw**2*sxi**2*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':2})

GC_288 = Coupling(name = 'GC_288',
                  value = 'cxi**3*complex(0,1)*gw**2*sxi - cxi*complex(0,1)*gw**2*sxi**3',
                  order = {'QED':2})

GC_289 = Coupling(name = 'GC_289',
                  value = '-(cxi**3*complex(0,1)*gw**2*sxi) + cxi*complex(0,1)*gw**2*sxi**3',
                  order = {'QED':2})

GC_290 = Coupling(name = 'GC_290',
                  value = '-(cxi**4*complex(0,1)*gw**2) - complex(0,1)*gw**2*sxi**4',
                  order = {'QED':2})

GC_291 = Coupling(name = 'GC_291',
                  value = '(-2*complex(0,1)*k1**4*lambda1)/vev**4 - (4*complex(0,1)*k1**2*k2**2*lambda1)/vev**4 - (2*complex(0,1)*k2**4*lambda1)/vev**4 + (16*complex(0,1)*k1**2*k2**2*lambda2)/vev**4 + (8*complex(0,1)*k1**2*k2**2*lambda3)/vev**4',
                  order = {'QED':2})

GC_292 = Coupling(name = 'GC_292',
                  value = '(-8*complex(0,1)*k1**4*lambda2)/vev**4 - (8*complex(0,1)*k2**4*lambda2)/vev**4 + (8*complex(0,1)*k1**2*k2**2*lambda3)/vev**4',
                  order = {'QED':2})

GC_293 = Coupling(name = 'GC_293',
                  value = '(-16*complex(0,1)*k1**4*lambda2)/vev**4 - (16*complex(0,1)*k2**4*lambda2)/vev**4 + (16*complex(0,1)*k1**2*k2**2*lambda3)/vev**4',
                  order = {'QED':2})

GC_294 = Coupling(name = 'GC_294',
                  value = '(4*k1**4*lambda2)/vev**4 + (8*k1**2*k2**2*lambda2)/vev**4 + (4*k2**4*lambda2)/vev**4 - (2*k1**4*lambda3)/vev**4 - (4*k1**2*k2**2*lambda3)/vev**4 - (2*k2**4*lambda3)/vev**4',
                  order = {'QED':2})

GC_295 = Coupling(name = 'GC_295',
                  value = '(4*complex(0,1)*k1**4*lambda2)/vev**4 - (8*complex(0,1)*k1**2*k2**2*lambda2)/vev**4 + (4*complex(0,1)*k2**4*lambda2)/vev**4 + (2*complex(0,1)*k1**4*lambda3)/vev**4 - (4*complex(0,1)*k1**2*k2**2*lambda3)/vev**4 + (2*complex(0,1)*k2**4*lambda3)/vev**4',
                  order = {'QED':2})

GC_296 = Coupling(name = 'GC_296',
                  value = '(-2*complex(0,1)*k1**4*lambda1)/vev**4 - (4*complex(0,1)*k1**2*k2**2*lambda1)/vev**4 - (2*complex(0,1)*k2**4*lambda1)/vev**4 + (8*complex(0,1)*k1**4*lambda2)/vev**4 + (32*complex(0,1)*k1**2*k2**2*lambda2)/vev**4 + (8*complex(0,1)*k2**4*lambda2)/vev**4 - (4*complex(0,1)*k1**4*lambda3)/vev**4 - (4*complex(0,1)*k2**4*lambda3)/vev**4',
                  order = {'QED':2})

GC_297 = Coupling(name = 'GC_297',
                  value = '(-2*complex(0,1)*k1**4*lambda1)/vev**4 - (4*complex(0,1)*k1**2*k2**2*lambda1)/vev**4 - (2*complex(0,1)*k2**4*lambda1)/vev**4 + (32*complex(0,1)*k1**2*k2**2*lambda2)/vev**4 - (4*complex(0,1)*k1**4*lambda3)/vev**4 + (8*complex(0,1)*k1**2*k2**2*lambda3)/vev**4 - (4*complex(0,1)*k2**4*lambda3)/vev**4',
                  order = {'QED':2})

GC_298 = Coupling(name = 'GC_298',
                  value = '(-2*complex(0,1)*k1**4*lambda1)/vev**4 - (4*complex(0,1)*k1**2*k2**2*lambda1)/vev**4 - (2*complex(0,1)*k2**4*lambda1)/vev**4 - (8*complex(0,1)*k1**4*lambda2)/vev**4 + (32*complex(0,1)*k1**2*k2**2*lambda2)/vev**4 - (8*complex(0,1)*k2**4*lambda2)/vev**4 - (4*complex(0,1)*k1**4*lambda3)/vev**4 + (16*complex(0,1)*k1**2*k2**2*lambda3)/vev**4 - (4*complex(0,1)*k2**4*lambda3)/vev**4',
                  order = {'QED':2})

GC_299 = Coupling(name = 'GC_299',
                  value = '(-4*k1**4*lambda2)/vev**4 - (8*k1**2*k2**2*lambda2)/vev**4 - (4*k2**4*lambda2)/vev**4 + (2*k1**4*lambda3)/vev**4 + (4*k1**2*k2**2*lambda3)/vev**4 + (2*k2**4*lambda3)/vev**4',
                  order = {'QED':2})

GC_300 = Coupling(name = 'GC_300',
                  value = '(-2*complex(0,1)*k1**4*lambda1)/vev**4 - (4*complex(0,1)*k1**2*k2**2*lambda1)/vev**4 - (2*complex(0,1)*k2**4*lambda1)/vev**4 - (16*complex(0,1)*k1**2*k2**2*lambda2)/vev**4 - (8*complex(0,1)*k1**2*k2**2*lambda3)/vev**4 - (8*complex(0,1)*k1**3*k2*lambda4)/vev**4 - (8*complex(0,1)*k1*k2**3*lambda4)/vev**4',
                  order = {'QED':2})

GC_301 = Coupling(name = 'GC_301',
                  value = '(-2*complex(0,1)*k1**4*lambda1)/vev**4 - (4*complex(0,1)*k1**2*k2**2*lambda1)/vev**4 - (2*complex(0,1)*k2**4*lambda1)/vev**4 - (16*complex(0,1)*k1**2*k2**2*lambda2)/vev**4 - (8*complex(0,1)*k1**2*k2**2*lambda3)/vev**4 + (8*complex(0,1)*k1**3*k2*lambda4)/vev**4 + (8*complex(0,1)*k1*k2**3*lambda4)/vev**4',
                  order = {'QED':2})

GC_302 = Coupling(name = 'GC_302',
                  value = '(-4*complex(0,1)*k1**4*lambda1)/vev**4 - (8*complex(0,1)*k1**2*k2**2*lambda1)/vev**4 - (4*complex(0,1)*k2**4*lambda1)/vev**4 - (32*complex(0,1)*k1**2*k2**2*lambda2)/vev**4 - (16*complex(0,1)*k1**2*k2**2*lambda3)/vev**4 - (16*complex(0,1)*k1**3*k2*lambda4)/vev**4 - (16*complex(0,1)*k1*k2**3*lambda4)/vev**4',
                  order = {'QED':2})

GC_303 = Coupling(name = 'GC_303',
                  value = '(-4*complex(0,1)*k1**4*lambda1)/vev**4 - (8*complex(0,1)*k1**2*k2**2*lambda1)/vev**4 - (4*complex(0,1)*k2**4*lambda1)/vev**4 - (32*complex(0,1)*k1**2*k2**2*lambda2)/vev**4 - (16*complex(0,1)*k1**2*k2**2*lambda3)/vev**4 + (16*complex(0,1)*k1**3*k2*lambda4)/vev**4 + (16*complex(0,1)*k1*k2**3*lambda4)/vev**4',
                  order = {'QED':2})

GC_304 = Coupling(name = 'GC_304',
                  value = '(-6*complex(0,1)*k1**4*lambda1)/vev**4 - (12*complex(0,1)*k1**2*k2**2*lambda1)/vev**4 - (6*complex(0,1)*k2**4*lambda1)/vev**4 - (48*complex(0,1)*k1**2*k2**2*lambda2)/vev**4 - (24*complex(0,1)*k1**2*k2**2*lambda3)/vev**4 - (24*complex(0,1)*k1**3*k2*lambda4)/vev**4 - (24*complex(0,1)*k1*k2**3*lambda4)/vev**4',
                  order = {'QED':2})

GC_305 = Coupling(name = 'GC_305',
                  value = '(-6*complex(0,1)*k1**4*lambda1)/vev**4 - (12*complex(0,1)*k1**2*k2**2*lambda1)/vev**4 - (6*complex(0,1)*k2**4*lambda1)/vev**4 - (48*complex(0,1)*k1**2*k2**2*lambda2)/vev**4 - (24*complex(0,1)*k1**2*k2**2*lambda3)/vev**4 + (24*complex(0,1)*k1**3*k2*lambda4)/vev**4 + (24*complex(0,1)*k1*k2**3*lambda4)/vev**4',
                  order = {'QED':2})

GC_306 = Coupling(name = 'GC_306',
                  value = '(8*complex(0,1)*k1**3*k2*lambda2)/vev**4 - (8*complex(0,1)*k1*k2**3*lambda2)/vev**4 + (4*complex(0,1)*k1**3*k2*lambda3)/vev**4 - (4*complex(0,1)*k1*k2**3*lambda3)/vev**4 + (2*complex(0,1)*k1**4*lambda4)/vev**4 - (2*complex(0,1)*k2**4*lambda4)/vev**4',
                  order = {'QED':2})

GC_307 = Coupling(name = 'GC_307',
                  value = '(-8*complex(0,1)*k1**3*k2*lambda2)/vev**4 + (8*complex(0,1)*k1*k2**3*lambda2)/vev**4 - (4*complex(0,1)*k1**3*k2*lambda3)/vev**4 + (4*complex(0,1)*k1*k2**3*lambda3)/vev**4 + (2*complex(0,1)*k1**4*lambda4)/vev**4 - (2*complex(0,1)*k2**4*lambda4)/vev**4',
                  order = {'QED':2})

GC_308 = Coupling(name = 'GC_308',
                  value = '(8*complex(0,1)*k1**3*k2*lambda2)/vev**4 - (8*complex(0,1)*k1*k2**3*lambda2)/vev**4 + (4*complex(0,1)*k1**3*k2*lambda3)/vev**4 - (4*complex(0,1)*k1*k2**3*lambda3)/vev**4 - (2*complex(0,1)*k1**4*lambda4)/vev**4 + (2*complex(0,1)*k2**4*lambda4)/vev**4',
                  order = {'QED':2})

GC_309 = Coupling(name = 'GC_309',
                  value = '(-8*complex(0,1)*k1**3*k2*lambda2)/vev**4 + (8*complex(0,1)*k1*k2**3*lambda2)/vev**4 - (4*complex(0,1)*k1**3*k2*lambda3)/vev**4 + (4*complex(0,1)*k1*k2**3*lambda3)/vev**4 - (2*complex(0,1)*k1**4*lambda4)/vev**4 + (2*complex(0,1)*k2**4*lambda4)/vev**4',
                  order = {'QED':2})

GC_310 = Coupling(name = 'GC_310',
                  value = '(16*complex(0,1)*k1**3*k2*lambda2)/vev**4 - (16*complex(0,1)*k1*k2**3*lambda2)/vev**4 + (8*complex(0,1)*k1**3*k2*lambda3)/vev**4 - (8*complex(0,1)*k1*k2**3*lambda3)/vev**4 + (4*complex(0,1)*k1**4*lambda4)/vev**4 - (4*complex(0,1)*k2**4*lambda4)/vev**4',
                  order = {'QED':2})

GC_311 = Coupling(name = 'GC_311',
                  value = '(-16*complex(0,1)*k1**3*k2*lambda2)/vev**4 + (16*complex(0,1)*k1*k2**3*lambda2)/vev**4 - (8*complex(0,1)*k1**3*k2*lambda3)/vev**4 + (8*complex(0,1)*k1*k2**3*lambda3)/vev**4 + (4*complex(0,1)*k1**4*lambda4)/vev**4 - (4*complex(0,1)*k2**4*lambda4)/vev**4',
                  order = {'QED':2})

GC_312 = Coupling(name = 'GC_312',
                  value = '(24*complex(0,1)*k1**3*k2*lambda2)/vev**4 - (24*complex(0,1)*k1*k2**3*lambda2)/vev**4 + (12*complex(0,1)*k1**3*k2*lambda3)/vev**4 - (12*complex(0,1)*k1*k2**3*lambda3)/vev**4 - (6*complex(0,1)*k1**4*lambda4)/vev**4 + (6*complex(0,1)*k2**4*lambda4)/vev**4',
                  order = {'QED':2})

GC_313 = Coupling(name = 'GC_313',
                  value = '(-24*complex(0,1)*k1**3*k2*lambda2)/vev**4 + (24*complex(0,1)*k1*k2**3*lambda2)/vev**4 - (12*complex(0,1)*k1**3*k2*lambda3)/vev**4 + (12*complex(0,1)*k1*k2**3*lambda3)/vev**4 - (6*complex(0,1)*k1**4*lambda4)/vev**4 + (6*complex(0,1)*k2**4*lambda4)/vev**4',
                  order = {'QED':2})

GC_314 = Coupling(name = 'GC_314',
                  value = '(-2*complex(0,1)*k1**4*lambda1)/vev**3 - (4*complex(0,1)*k1**2*k2**2*lambda1)/vev**3 - (2*complex(0,1)*k2**4*lambda1)/vev**3 + (16*complex(0,1)*k1**2*k2**2*lambda2)/vev**3 + (8*complex(0,1)*k1**2*k2**2*lambda3)/vev**3',
                  order = {'QED':1})

GC_315 = Coupling(name = 'GC_315',
                  value = '(-8*complex(0,1)*k1**4*lambda2)/vev**3 - (8*complex(0,1)*k2**4*lambda2)/vev**3 + (8*complex(0,1)*k1**2*k2**2*lambda3)/vev**3',
                  order = {'QED':1})

GC_316 = Coupling(name = 'GC_316',
                  value = '(4*k1**4*lambda2)/vev**3 + (8*k1**2*k2**2*lambda2)/vev**3 + (4*k2**4*lambda2)/vev**3 - (2*k1**4*lambda3)/vev**3 - (4*k1**2*k2**2*lambda3)/vev**3 - (2*k2**4*lambda3)/vev**3',
                  order = {'QED':1})

GC_317 = Coupling(name = 'GC_317',
                  value = '(4*complex(0,1)*k1**4*lambda2)/vev**3 - (8*complex(0,1)*k1**2*k2**2*lambda2)/vev**3 + (4*complex(0,1)*k2**4*lambda2)/vev**3 + (2*complex(0,1)*k1**4*lambda3)/vev**3 - (4*complex(0,1)*k1**2*k2**2*lambda3)/vev**3 + (2*complex(0,1)*k2**4*lambda3)/vev**3',
                  order = {'QED':1})

GC_318 = Coupling(name = 'GC_318',
                  value = '(-2*complex(0,1)*k1**4*lambda1)/vev**3 - (4*complex(0,1)*k1**2*k2**2*lambda1)/vev**3 - (2*complex(0,1)*k2**4*lambda1)/vev**3 + (8*complex(0,1)*k1**4*lambda2)/vev**3 + (32*complex(0,1)*k1**2*k2**2*lambda2)/vev**3 + (8*complex(0,1)*k2**4*lambda2)/vev**3 - (4*complex(0,1)*k1**4*lambda3)/vev**3 - (4*complex(0,1)*k2**4*lambda3)/vev**3',
                  order = {'QED':1})

GC_319 = Coupling(name = 'GC_319',
                  value = '(-2*complex(0,1)*k1**4*lambda1)/vev**3 - (4*complex(0,1)*k1**2*k2**2*lambda1)/vev**3 - (2*complex(0,1)*k2**4*lambda1)/vev**3 - (8*complex(0,1)*k1**4*lambda2)/vev**3 + (32*complex(0,1)*k1**2*k2**2*lambda2)/vev**3 - (8*complex(0,1)*k2**4*lambda2)/vev**3 - (4*complex(0,1)*k1**4*lambda3)/vev**3 + (16*complex(0,1)*k1**2*k2**2*lambda3)/vev**3 - (4*complex(0,1)*k2**4*lambda3)/vev**3',
                  order = {'QED':1})

GC_320 = Coupling(name = 'GC_320',
                  value = '(-4*k1**4*lambda2)/vev**3 - (8*k1**2*k2**2*lambda2)/vev**3 - (4*k2**4*lambda2)/vev**3 + (2*k1**4*lambda3)/vev**3 + (4*k1**2*k2**2*lambda3)/vev**3 + (2*k2**4*lambda3)/vev**3',
                  order = {'QED':1})

GC_321 = Coupling(name = 'GC_321',
                  value = '(-2*complex(0,1)*k1**4*lambda1)/vev**3 - (4*complex(0,1)*k1**2*k2**2*lambda1)/vev**3 - (2*complex(0,1)*k2**4*lambda1)/vev**3 - (16*complex(0,1)*k1**2*k2**2*lambda2)/vev**3 - (8*complex(0,1)*k1**2*k2**2*lambda3)/vev**3 - (8*complex(0,1)*k1**3*k2*lambda4)/vev**3 - (8*complex(0,1)*k1*k2**3*lambda4)/vev**3',
                  order = {'QED':1})

GC_322 = Coupling(name = 'GC_322',
                  value = '(-6*complex(0,1)*k1**4*lambda1)/vev**3 - (12*complex(0,1)*k1**2*k2**2*lambda1)/vev**3 - (6*complex(0,1)*k2**4*lambda1)/vev**3 - (48*complex(0,1)*k1**2*k2**2*lambda2)/vev**3 - (24*complex(0,1)*k1**2*k2**2*lambda3)/vev**3 - (24*complex(0,1)*k1**3*k2*lambda4)/vev**3 - (24*complex(0,1)*k1*k2**3*lambda4)/vev**3',
                  order = {'QED':1})

GC_323 = Coupling(name = 'GC_323',
                  value = '(8*complex(0,1)*k1**3*k2*lambda2)/vev**3 - (8*complex(0,1)*k1*k2**3*lambda2)/vev**3 + (4*complex(0,1)*k1**3*k2*lambda3)/vev**3 - (4*complex(0,1)*k1*k2**3*lambda3)/vev**3 + (2*complex(0,1)*k1**4*lambda4)/vev**3 - (2*complex(0,1)*k2**4*lambda4)/vev**3',
                  order = {'QED':1})

GC_324 = Coupling(name = 'GC_324',
                  value = '(8*complex(0,1)*k1**3*k2*lambda2)/vev**3 - (8*complex(0,1)*k1*k2**3*lambda2)/vev**3 + (4*complex(0,1)*k1**3*k2*lambda3)/vev**3 - (4*complex(0,1)*k1*k2**3*lambda3)/vev**3 - (2*complex(0,1)*k1**4*lambda4)/vev**3 + (2*complex(0,1)*k2**4*lambda4)/vev**3',
                  order = {'QED':1})

GC_325 = Coupling(name = 'GC_325',
                  value = '(-8*complex(0,1)*k1**3*k2*lambda2)/vev**3 + (8*complex(0,1)*k1*k2**3*lambda2)/vev**3 - (4*complex(0,1)*k1**3*k2*lambda3)/vev**3 + (4*complex(0,1)*k1*k2**3*lambda3)/vev**3 - (2*complex(0,1)*k1**4*lambda4)/vev**3 + (2*complex(0,1)*k2**4*lambda4)/vev**3',
                  order = {'QED':1})

GC_326 = Coupling(name = 'GC_326',
                  value = '(24*complex(0,1)*k1**3*k2*lambda2)/vev**3 - (24*complex(0,1)*k1*k2**3*lambda2)/vev**3 + (12*complex(0,1)*k1**3*k2*lambda3)/vev**3 - (12*complex(0,1)*k1*k2**3*lambda3)/vev**3 - (6*complex(0,1)*k1**4*lambda4)/vev**3 + (6*complex(0,1)*k2**4*lambda4)/vev**3',
                  order = {'QED':1})

GC_327 = Coupling(name = 'GC_327',
                  value = '(-24*complex(0,1)*k1**3*k2*lambda2)/vev**3 + (24*complex(0,1)*k1*k2**3*lambda2)/vev**3 - (12*complex(0,1)*k1**3*k2*lambda3)/vev**3 + (12*complex(0,1)*k1*k2**3*lambda3)/vev**3 - (6*complex(0,1)*k1**4*lambda4)/vev**3 + (6*complex(0,1)*k2**4*lambda4)/vev**3',
                  order = {'QED':1})

GC_328 = Coupling(name = 'GC_328',
                  value = '-((alpha1*complex(0,1)*k1**2)/vev**2) - (alpha3*complex(0,1)*k1**2)/vev**2 - (4*alpha2*complex(0,1)*k1*k2)/vev**2 - (alpha1*complex(0,1)*k2**2)/vev**2',
                  order = {'QED':2})

GC_329 = Coupling(name = 'GC_329',
                  value = '-((alpha1*complex(0,1)*k1**2)/vev**2) - (alpha3*complex(0,1)*k1**2)/vev**2 + (4*alpha2*complex(0,1)*k1*k2)/vev**2 - (alpha1*complex(0,1)*k2**2)/vev**2',
                  order = {'QED':2})

GC_330 = Coupling(name = 'GC_330',
                  value = '(2*alpha2*complex(0,1)*k1**2)/vev**2 - (2*alpha2*complex(0,1)*k2**2)/vev**2',
                  order = {'QED':2})

GC_331 = Coupling(name = 'GC_331',
                  value = '(2*alpha2*complex(0,1)*k1**2)/vev**2 - (alpha3*complex(0,1)*k1*k2)/vev**2 - (2*alpha2*complex(0,1)*k2**2)/vev**2',
                  order = {'QED':2})

GC_332 = Coupling(name = 'GC_332',
                  value = '(2*alpha2*complex(0,1)*k1**2)/vev**2 + (alpha3*complex(0,1)*k1*k2)/vev**2 - (2*alpha2*complex(0,1)*k2**2)/vev**2',
                  order = {'QED':2})

GC_333 = Coupling(name = 'GC_333',
                  value = '(-2*alpha2*complex(0,1)*k1**2)/vev**2 + (2*alpha2*complex(0,1)*k2**2)/vev**2',
                  order = {'QED':2})

GC_334 = Coupling(name = 'GC_334',
                  value = '(-2*alpha2*complex(0,1)*k1**2)/vev**2 - (alpha3*complex(0,1)*k1*k2)/vev**2 + (2*alpha2*complex(0,1)*k2**2)/vev**2',
                  order = {'QED':2})

GC_335 = Coupling(name = 'GC_335',
                  value = '(-2*alpha2*complex(0,1)*k1**2)/vev**2 + (alpha3*complex(0,1)*k1*k2)/vev**2 + (2*alpha2*complex(0,1)*k2**2)/vev**2',
                  order = {'QED':2})

GC_336 = Coupling(name = 'GC_336',
                  value = '(alpha3*k1**2)/(2.*vev**2) - (alpha3*k2**2)/(2.*vev**2)',
                  order = {'QED':2})

GC_337 = Coupling(name = 'GC_337',
                  value = '(alpha3*complex(0,1)*k1**2)/(2.*vev**2) - (alpha3*complex(0,1)*k2**2)/(2.*vev**2)',
                  order = {'QED':2})

GC_338 = Coupling(name = 'GC_338',
                  value = '-((alpha1*complex(0,1)*k1**2)/vev**2) - (alpha3*complex(0,1)*k1**2)/(2.*vev**2) - (4*alpha2*complex(0,1)*k1*k2)/vev**2 - (alpha1*complex(0,1)*k2**2)/vev**2 - (alpha3*complex(0,1)*k2**2)/(2.*vev**2)',
                  order = {'QED':2})

GC_339 = Coupling(name = 'GC_339',
                  value = '-((alpha1*complex(0,1)*k1**2)/vev**2) - (alpha3*complex(0,1)*k1**2)/(2.*vev**2) + (4*alpha2*complex(0,1)*k1*k2)/vev**2 - (alpha1*complex(0,1)*k2**2)/vev**2 - (alpha3*complex(0,1)*k2**2)/(2.*vev**2)',
                  order = {'QED':2})

GC_340 = Coupling(name = 'GC_340',
                  value = '-((alpha1*complex(0,1)*k1**2)/vev**2) - (4*alpha2*complex(0,1)*k1*k2)/vev**2 - (alpha1*complex(0,1)*k2**2)/vev**2 - (alpha3*complex(0,1)*k2**2)/vev**2',
                  order = {'QED':2})

GC_341 = Coupling(name = 'GC_341',
                  value = '-((alpha1*complex(0,1)*k1**2)/vev**2) + (4*alpha2*complex(0,1)*k1*k2)/vev**2 - (alpha1*complex(0,1)*k2**2)/vev**2 - (alpha3*complex(0,1)*k2**2)/vev**2',
                  order = {'QED':2})

GC_342 = Coupling(name = 'GC_342',
                  value = '-0.5*(alpha3*k1**2)/vev**2 + (alpha3*k2**2)/(2.*vev**2)',
                  order = {'QED':2})

GC_343 = Coupling(name = 'GC_343',
                  value = '(alpha3*k1**2)/(2.*vev**2*cmath.sqrt(2)) - (alpha3*k2**2)/(2.*vev**2*cmath.sqrt(2))',
                  order = {'QED':2})

GC_344 = Coupling(name = 'GC_344',
                  value = '-0.5*(alpha3*complex(0,1)*k1**2)/(vev**2*cmath.sqrt(2)) + (alpha3*complex(0,1)*k2**2)/(2.*vev**2*cmath.sqrt(2))',
                  order = {'QED':2})

GC_345 = Coupling(name = 'GC_345',
                  value = '-0.5*(alpha3*k1**2)/(vev**2*cmath.sqrt(2)) + (alpha3*k2**2)/(2.*vev**2*cmath.sqrt(2))',
                  order = {'QED':2})

GC_346 = Coupling(name = 'GC_346',
                  value = '(cxi*gw*k1**2)/(2.*vev**2) - (cxi*gw*k2**2)/(2.*vev**2)',
                  order = {'QED':1})

GC_347 = Coupling(name = 'GC_347',
                  value = '(cxi*complex(0,1)*gw*k1**2)/(2.*vev**2) - (cxi*complex(0,1)*gw*k2**2)/(2.*vev**2)',
                  order = {'QED':1})

GC_348 = Coupling(name = 'GC_348',
                  value = '-0.5*(cxi*complex(0,1)*gw*k1**2)/vev**2 + (cxi*complex(0,1)*gw*k2**2)/(2.*vev**2)',
                  order = {'QED':1})

GC_349 = Coupling(name = 'GC_349',
                  value = '-0.5*(cxi*gw*k1**2)/vev**2 + (cxi*gw*k2**2)/(2.*vev**2)',
                  order = {'QED':1})

GC_350 = Coupling(name = 'GC_350',
                  value = '(cphi*cw*cxi*gw**2*k1**2)/(2.*vev**2) - (cphi*cw*cxi*gw**2*k2**2)/(2.*vev**2)',
                  order = {'QED':2})

GC_351 = Coupling(name = 'GC_351',
                  value = '(cphi*cw*cxi*complex(0,1)*gw**2*k1**2)/(2.*vev**2) - (cphi*cw*cxi*complex(0,1)*gw**2*k2**2)/(2.*vev**2)',
                  order = {'QED':2})

GC_352 = Coupling(name = 'GC_352',
                  value = '-0.5*(cphi*cw*cxi*complex(0,1)*gw**2*k1**2)/vev**2 + (cphi*cw*cxi*complex(0,1)*gw**2*k2**2)/(2.*vev**2)',
                  order = {'QED':2})

GC_353 = Coupling(name = 'GC_353',
                  value = '-0.5*(cphi*cw*cxi*gw**2*k1**2)/vev**2 + (cphi*cw*cxi*gw**2*k2**2)/(2.*vev**2)',
                  order = {'QED':2})

GC_354 = Coupling(name = 'GC_354',
                  value = '(cw*cxi*gw**2*k1**2*sphi)/(2.*vev**2) - (cw*cxi*gw**2*k2**2*sphi)/(2.*vev**2)',
                  order = {'QED':2})

GC_355 = Coupling(name = 'GC_355',
                  value = '(cw*cxi*complex(0,1)*gw**2*k1**2*sphi)/(2.*vev**2) - (cw*cxi*complex(0,1)*gw**2*k2**2*sphi)/(2.*vev**2)',
                  order = {'QED':2})

GC_356 = Coupling(name = 'GC_356',
                  value = '-0.5*(cw*cxi*complex(0,1)*gw**2*k1**2*sphi)/vev**2 + (cw*cxi*complex(0,1)*gw**2*k2**2*sphi)/(2.*vev**2)',
                  order = {'QED':2})

GC_357 = Coupling(name = 'GC_357',
                  value = '-0.5*(cw*cxi*gw**2*k1**2*sphi)/vev**2 + (cw*cxi*gw**2*k2**2*sphi)/(2.*vev**2)',
                  order = {'QED':2})

GC_358 = Coupling(name = 'GC_358',
                  value = '-((complex(0,1)*gw*k1**2*sw)/vev**2) - (complex(0,1)*gw*k2**2*sw)/vev**2',
                  order = {'QED':1})

GC_359 = Coupling(name = 'GC_359',
                  value = '(cxi*gw**2*k1**2*sw)/(2.*vev**2) - (cxi*gw**2*k2**2*sw)/(2.*vev**2)',
                  order = {'QED':2})

GC_360 = Coupling(name = 'GC_360',
                  value = '(cxi*complex(0,1)*gw**2*k1**2*sw)/(2.*vev**2) - (cxi*complex(0,1)*gw**2*k2**2*sw)/(2.*vev**2)',
                  order = {'QED':2})

GC_361 = Coupling(name = 'GC_361',
                  value = '-0.5*(cxi*complex(0,1)*gw**2*k1**2*sw)/vev**2 + (cxi*complex(0,1)*gw**2*k2**2*sw)/(2.*vev**2)',
                  order = {'QED':2})

GC_362 = Coupling(name = 'GC_362',
                  value = '-0.5*(cxi*gw**2*k1**2*sw)/vev**2 + (cxi*gw**2*k2**2*sw)/(2.*vev**2)',
                  order = {'QED':2})

GC_363 = Coupling(name = 'GC_363',
                  value = '(2*complex(0,1)*gw**2*k1**2*sw**2)/vev**2 + (2*complex(0,1)*gw**2*k2**2*sw**2)/vev**2',
                  order = {'QED':2})

GC_364 = Coupling(name = 'GC_364',
                  value = '(cw*gw*k1**2*sphi)/(2.*vev**2) + (cw*gw*k2**2*sphi)/(2.*vev**2) + (gw*k1**2*sphi*sw**2)/(2.*cw*vev**2) + (gw*k2**2*sphi*sw**2)/(2.*cw*vev**2) - (cphi*gw*k1**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) - (cphi*gw*k2**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':1})

GC_365 = Coupling(name = 'GC_365',
                  value = '-0.5*(cw*complex(0,1)*gw*k1**2*sphi)/vev**2 - (cw*complex(0,1)*gw*k2**2*sphi)/(2.*vev**2) + (complex(0,1)*gw*k1**2*sphi*sw**2)/(2.*cw*vev**2) + (complex(0,1)*gw*k2**2*sphi*sw**2)/(2.*cw*vev**2) - (cphi*complex(0,1)*gw*k1**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) - (cphi*complex(0,1)*gw*k2**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':1})

GC_366 = Coupling(name = 'GC_366',
                  value = '(cw*complex(0,1)*gw*k1**2*sphi)/(2.*vev**2) + (cw*complex(0,1)*gw*k2**2*sphi)/(2.*vev**2) - (complex(0,1)*gw*k1**2*sphi*sw**2)/(2.*cw*vev**2) - (complex(0,1)*gw*k2**2*sphi*sw**2)/(2.*cw*vev**2) + (cphi*complex(0,1)*gw*k1**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) + (cphi*complex(0,1)*gw*k2**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':1})

GC_367 = Coupling(name = 'GC_367',
                  value = '-0.5*(cw*gw*k1**2*sphi)/vev**2 - (cw*gw*k2**2*sphi)/(2.*vev**2) - (gw*k1**2*sphi*sw**2)/(2.*cw*vev**2) - (gw*k2**2*sphi*sw**2)/(2.*cw*vev**2) + (cphi*gw*k1**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) + (cphi*gw*k2**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':1})

GC_368 = Coupling(name = 'GC_368',
                  value = '-0.5*(cphi*cw*gw*k1**2)/vev**2 - (cphi*cw*gw*k2**2)/(2.*vev**2) - (cphi*gw*k1**2*sw**2)/(2.*cw*vev**2) - (cphi*gw*k2**2*sw**2)/(2.*cw*vev**2) - (gw*k1**2*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) - (gw*k2**2*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':1})

GC_369 = Coupling(name = 'GC_369',
                  value = '-0.5*(cphi*cw*complex(0,1)*gw*k1**2)/vev**2 - (cphi*cw*complex(0,1)*gw*k2**2)/(2.*vev**2) + (cphi*complex(0,1)*gw*k1**2*sw**2)/(2.*cw*vev**2) + (cphi*complex(0,1)*gw*k2**2*sw**2)/(2.*cw*vev**2) + (complex(0,1)*gw*k1**2*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) + (complex(0,1)*gw*k2**2*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':1})

GC_370 = Coupling(name = 'GC_370',
                  value = '(cw*complex(0,1)*gw**2*k1**2*sphi*sw)/vev**2 + (cw*complex(0,1)*gw**2*k2**2*sphi*sw)/vev**2 - (complex(0,1)*gw**2*k1**2*sphi*sw**3)/(cw*vev**2) - (complex(0,1)*gw**2*k2**2*sphi*sw**3)/(cw*vev**2) + (cphi*complex(0,1)*gw**2*k1**2*sw*cmath.sqrt(1 - 2*sw**2))/(cw*vev**2) + (cphi*complex(0,1)*gw**2*k2**2*sw*cmath.sqrt(1 - 2*sw**2))/(cw*vev**2)',
                  order = {'QED':2})

GC_371 = Coupling(name = 'GC_371',
                  value = '(cphi*cw*complex(0,1)*gw**2*k1**2*sw)/vev**2 + (cphi*cw*complex(0,1)*gw**2*k2**2*sw)/vev**2 - (cphi*complex(0,1)*gw**2*k1**2*sw**3)/(cw*vev**2) - (cphi*complex(0,1)*gw**2*k2**2*sw**3)/(cw*vev**2) - (complex(0,1)*gw**2*k1**2*sphi*sw*cmath.sqrt(1 - 2*sw**2))/(cw*vev**2) - (complex(0,1)*gw**2*k2**2*sphi*sw*cmath.sqrt(1 - 2*sw**2))/(cw*vev**2)',
                  order = {'QED':2})

GC_372 = Coupling(name = 'GC_372',
                  value = '(cphi**2*complex(0,1)*gw**2*k1**2)/(2.*cw**2*vev**2) + (cphi**2*complex(0,1)*gw**2*k2**2)/(2.*cw**2*vev**2) + (cw**2*complex(0,1)*gw**2*k1**2*sphi**2)/(2.*vev**2) + (cw**2*complex(0,1)*gw**2*k2**2*sphi**2)/(2.*vev**2) - (cphi**2*complex(0,1)*gw**2*k1**2*sw**2)/(cw**2*vev**2) - (cphi**2*complex(0,1)*gw**2*k2**2*sw**2)/(cw**2*vev**2) + (complex(0,1)*gw**2*k1**2*sphi**2*sw**2)/vev**2 + (complex(0,1)*gw**2*k2**2*sphi**2*sw**2)/vev**2 + (complex(0,1)*gw**2*k1**2*sphi**2*sw**4)/(2.*cw**2*vev**2) + (complex(0,1)*gw**2*k2**2*sphi**2*sw**4)/(2.*cw**2*vev**2) - (cphi*complex(0,1)*gw**2*k1**2*sphi*cmath.sqrt(1 - 2*sw**2))/vev**2 - (cphi*complex(0,1)*gw**2*k2**2*sphi*cmath.sqrt(1 - 2*sw**2))/vev**2 - (cphi*complex(0,1)*gw**2*k1**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/(cw**2*vev**2) - (cphi*complex(0,1)*gw**2*k2**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/(cw**2*vev**2)',
                  order = {'QED':2})

GC_373 = Coupling(name = 'GC_373',
                  value = '(cphi**2*complex(0,1)*gw**2*k1**2)/(2.*cw**2*vev**2) + (cphi**2*complex(0,1)*gw**2*k2**2)/(2.*cw**2*vev**2) + (cw**2*complex(0,1)*gw**2*k1**2*sphi**2)/(2.*vev**2) + (cw**2*complex(0,1)*gw**2*k2**2*sphi**2)/(2.*vev**2) - (cphi**2*complex(0,1)*gw**2*k1**2*sw**2)/(cw**2*vev**2) - (cphi**2*complex(0,1)*gw**2*k2**2*sw**2)/(cw**2*vev**2) - (complex(0,1)*gw**2*k1**2*sphi**2*sw**2)/vev**2 - (complex(0,1)*gw**2*k2**2*sphi**2*sw**2)/vev**2 + (complex(0,1)*gw**2*k1**2*sphi**2*sw**4)/(2.*cw**2*vev**2) + (complex(0,1)*gw**2*k2**2*sphi**2*sw**4)/(2.*cw**2*vev**2) + (cphi*complex(0,1)*gw**2*k1**2*sphi*cmath.sqrt(1 - 2*sw**2))/vev**2 + (cphi*complex(0,1)*gw**2*k2**2*sphi*cmath.sqrt(1 - 2*sw**2))/vev**2 - (cphi*complex(0,1)*gw**2*k1**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/(cw**2*vev**2) - (cphi*complex(0,1)*gw**2*k2**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/(cw**2*vev**2)',
                  order = {'QED':2})

GC_374 = Coupling(name = 'GC_374',
                  value = '(cphi**2*cw**2*complex(0,1)*gw**2*k1**2)/(2.*vev**2) + (cphi**2*cw**2*complex(0,1)*gw**2*k2**2)/(2.*vev**2) + (complex(0,1)*gw**2*k1**2*sphi**2)/(2.*cw**2*vev**2) + (complex(0,1)*gw**2*k2**2*sphi**2)/(2.*cw**2*vev**2) - (cphi**2*complex(0,1)*gw**2*k1**2*sw**2)/vev**2 - (cphi**2*complex(0,1)*gw**2*k2**2*sw**2)/vev**2 - (complex(0,1)*gw**2*k1**2*sphi**2*sw**2)/(cw**2*vev**2) - (complex(0,1)*gw**2*k2**2*sphi**2*sw**2)/(cw**2*vev**2) + (cphi**2*complex(0,1)*gw**2*k1**2*sw**4)/(2.*cw**2*vev**2) + (cphi**2*complex(0,1)*gw**2*k2**2*sw**4)/(2.*cw**2*vev**2) - (cphi*complex(0,1)*gw**2*k1**2*sphi*cmath.sqrt(1 - 2*sw**2))/vev**2 - (cphi*complex(0,1)*gw**2*k2**2*sphi*cmath.sqrt(1 - 2*sw**2))/vev**2 + (cphi*complex(0,1)*gw**2*k1**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/(cw**2*vev**2) + (cphi*complex(0,1)*gw**2*k2**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/(cw**2*vev**2)',
                  order = {'QED':2})

GC_375 = Coupling(name = 'GC_375',
                  value = '(cphi**2*cw**2*complex(0,1)*gw**2*k1**2)/(2.*vev**2) + (cphi**2*cw**2*complex(0,1)*gw**2*k2**2)/(2.*vev**2) + (complex(0,1)*gw**2*k1**2*sphi**2)/(2.*cw**2*vev**2) + (complex(0,1)*gw**2*k2**2*sphi**2)/(2.*cw**2*vev**2) + (cphi**2*complex(0,1)*gw**2*k1**2*sw**2)/vev**2 + (cphi**2*complex(0,1)*gw**2*k2**2*sw**2)/vev**2 - (complex(0,1)*gw**2*k1**2*sphi**2*sw**2)/(cw**2*vev**2) - (complex(0,1)*gw**2*k2**2*sphi**2*sw**2)/(cw**2*vev**2) + (cphi**2*complex(0,1)*gw**2*k1**2*sw**4)/(2.*cw**2*vev**2) + (cphi**2*complex(0,1)*gw**2*k2**2*sw**4)/(2.*cw**2*vev**2) + (cphi*complex(0,1)*gw**2*k1**2*sphi*cmath.sqrt(1 - 2*sw**2))/vev**2 + (cphi*complex(0,1)*gw**2*k2**2*sphi*cmath.sqrt(1 - 2*sw**2))/vev**2 + (cphi*complex(0,1)*gw**2*k1**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/(cw**2*vev**2) + (cphi*complex(0,1)*gw**2*k2**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/(cw**2*vev**2)',
                  order = {'QED':2})

GC_376 = Coupling(name = 'GC_376',
                  value = '-0.5*(cphi*complex(0,1)*gw**2*k1**2*sphi)/(cw**2*vev**2) + (cphi*cw**2*complex(0,1)*gw**2*k1**2*sphi)/(2.*vev**2) - (cphi*complex(0,1)*gw**2*k2**2*sphi)/(2.*cw**2*vev**2) + (cphi*cw**2*complex(0,1)*gw**2*k2**2*sphi)/(2.*vev**2) - (cphi*complex(0,1)*gw**2*k1**2*sphi*sw**2)/vev**2 + (cphi*complex(0,1)*gw**2*k1**2*sphi*sw**2)/(cw**2*vev**2) - (cphi*complex(0,1)*gw**2*k2**2*sphi*sw**2)/vev**2 + (cphi*complex(0,1)*gw**2*k2**2*sphi*sw**2)/(cw**2*vev**2) + (cphi*complex(0,1)*gw**2*k1**2*sphi*sw**4)/(2.*cw**2*vev**2) + (cphi*complex(0,1)*gw**2*k2**2*sphi*sw**4)/(2.*cw**2*vev**2) + (cphi**2*complex(0,1)*gw**2*k1**2*cmath.sqrt(1 - 2*sw**2))/(2.*vev**2) + (cphi**2*complex(0,1)*gw**2*k2**2*cmath.sqrt(1 - 2*sw**2))/(2.*vev**2) - (complex(0,1)*gw**2*k1**2*sphi**2*cmath.sqrt(1 - 2*sw**2))/(2.*vev**2) - (complex(0,1)*gw**2*k2**2*sphi**2*cmath.sqrt(1 - 2*sw**2))/(2.*vev**2) - (cphi**2*complex(0,1)*gw**2*k1**2*sw**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw**2*vev**2) - (cphi**2*complex(0,1)*gw**2*k2**2*sw**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw**2*vev**2) + (complex(0,1)*gw**2*k1**2*sphi**2*sw**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw**2*vev**2) + (complex(0,1)*gw**2*k2**2*sphi**2*sw**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw**2*vev**2)',
                  order = {'QED':2})

GC_377 = Coupling(name = 'GC_377',
                  value = '-0.5*(cphi*complex(0,1)*gw**2*k1**2*sphi)/(cw**2*vev**2) + (cphi*cw**2*complex(0,1)*gw**2*k1**2*sphi)/(2.*vev**2) - (cphi*complex(0,1)*gw**2*k2**2*sphi)/(2.*cw**2*vev**2) + (cphi*cw**2*complex(0,1)*gw**2*k2**2*sphi)/(2.*vev**2) + (cphi*complex(0,1)*gw**2*k1**2*sphi*sw**2)/vev**2 + (cphi*complex(0,1)*gw**2*k1**2*sphi*sw**2)/(cw**2*vev**2) + (cphi*complex(0,1)*gw**2*k2**2*sphi*sw**2)/vev**2 + (cphi*complex(0,1)*gw**2*k2**2*sphi*sw**2)/(cw**2*vev**2) + (cphi*complex(0,1)*gw**2*k1**2*sphi*sw**4)/(2.*cw**2*vev**2) + (cphi*complex(0,1)*gw**2*k2**2*sphi*sw**4)/(2.*cw**2*vev**2) - (cphi**2*complex(0,1)*gw**2*k1**2*cmath.sqrt(1 - 2*sw**2))/(2.*vev**2) - (cphi**2*complex(0,1)*gw**2*k2**2*cmath.sqrt(1 - 2*sw**2))/(2.*vev**2) + (complex(0,1)*gw**2*k1**2*sphi**2*cmath.sqrt(1 - 2*sw**2))/(2.*vev**2) + (complex(0,1)*gw**2*k2**2*sphi**2*cmath.sqrt(1 - 2*sw**2))/(2.*vev**2) - (cphi**2*complex(0,1)*gw**2*k1**2*sw**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw**2*vev**2) - (cphi**2*complex(0,1)*gw**2*k2**2*sw**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw**2*vev**2) + (complex(0,1)*gw**2*k1**2*sphi**2*sw**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw**2*vev**2) + (complex(0,1)*gw**2*k2**2*sphi**2*sw**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw**2*vev**2)',
                  order = {'QED':2})

GC_378 = Coupling(name = 'GC_378',
                  value = '-0.5*(cxi*complex(0,1)*gw*k1**2)/vev**2 - (cxi*complex(0,1)*gw*k2**2)/(2.*vev**2) - (complex(0,1)*gw*k1*k2*sxi)/vev**2',
                  order = {'QED':1})

GC_379 = Coupling(name = 'GC_379',
                  value = '(cxi*complex(0,1)*gw*k1**2)/(2.*vev**2) + (cxi*complex(0,1)*gw*k2**2)/(2.*vev**2) - (complex(0,1)*gw*k1*k2*sxi)/vev**2',
                  order = {'QED':1})

GC_380 = Coupling(name = 'GC_380',
                  value = '-0.5*(cxi*complex(0,1)*gw*k1**2)/vev**2 - (cxi*complex(0,1)*gw*k2**2)/(2.*vev**2) + (complex(0,1)*gw*k1*k2*sxi)/vev**2',
                  order = {'QED':1})

GC_381 = Coupling(name = 'GC_381',
                  value = '(cxi*complex(0,1)*gw*k1**2)/(2.*vev**2) + (cxi*complex(0,1)*gw*k2**2)/(2.*vev**2) + (complex(0,1)*gw*k1*k2*sxi)/vev**2',
                  order = {'QED':1})

GC_382 = Coupling(name = 'GC_382',
                  value = '-0.5*(cxi*gw*k1**2)/vev**2 - (cxi*gw*k2**2)/(2.*vev**2) + (gw*k1*k2*sxi)/vev**2',
                  order = {'QED':1})

GC_383 = Coupling(name = 'GC_383',
                  value = '(cxi*gw*k1**2)/(2.*vev**2) + (cxi*gw*k2**2)/(2.*vev**2) + (gw*k1*k2*sxi)/vev**2',
                  order = {'QED':1})

GC_384 = Coupling(name = 'GC_384',
                  value = '-0.5*(cphi*cxi*gw**2*k1**2*sw**2)/(cw*vev**2) - (cphi*cxi*gw**2*k2**2*sw**2)/(2.*cw*vev**2) - (cphi*cw*gw**2*k1*k2*sxi)/vev**2 - (cxi*gw**2*k1**2*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) - (cxi*gw**2*k2**2*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_385 = Coupling(name = 'GC_385',
                  value = '(cphi*cxi*gw**2*k1**2*sw**2)/(2.*cw*vev**2) + (cphi*cxi*gw**2*k2**2*sw**2)/(2.*cw*vev**2) - (cphi*cw*gw**2*k1*k2*sxi)/vev**2 + (cxi*gw**2*k1**2*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) + (cxi*gw**2*k2**2*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_386 = Coupling(name = 'GC_386',
                  value = '-0.5*(cphi*cxi*complex(0,1)*gw**2*k1**2*sw**2)/(cw*vev**2) - (cphi*cxi*complex(0,1)*gw**2*k2**2*sw**2)/(2.*cw*vev**2) - (cphi*cw*complex(0,1)*gw**2*k1*k2*sxi)/vev**2 - (cxi*complex(0,1)*gw**2*k1**2*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) - (cxi*complex(0,1)*gw**2*k2**2*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_387 = Coupling(name = 'GC_387',
                  value = '(cphi*cxi*complex(0,1)*gw**2*k1**2*sw**2)/(2.*cw*vev**2) + (cphi*cxi*complex(0,1)*gw**2*k2**2*sw**2)/(2.*cw*vev**2) - (cphi*cw*complex(0,1)*gw**2*k1*k2*sxi)/vev**2 + (cxi*complex(0,1)*gw**2*k1**2*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) + (cxi*complex(0,1)*gw**2*k2**2*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_388 = Coupling(name = 'GC_388',
                  value = '-0.5*(cphi*cxi*gw**2*k1**2*sw**2)/(cw*vev**2) - (cphi*cxi*gw**2*k2**2*sw**2)/(2.*cw*vev**2) + (cphi*cw*gw**2*k1*k2*sxi)/vev**2 - (cxi*gw**2*k1**2*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) - (cxi*gw**2*k2**2*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_389 = Coupling(name = 'GC_389',
                  value = '(cphi*cxi*gw**2*k1**2*sw**2)/(2.*cw*vev**2) + (cphi*cxi*gw**2*k2**2*sw**2)/(2.*cw*vev**2) + (cphi*cw*gw**2*k1*k2*sxi)/vev**2 + (cxi*gw**2*k1**2*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) + (cxi*gw**2*k2**2*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_390 = Coupling(name = 'GC_390',
                  value = '-((cxi*gw*k1*k2)/vev**2) - (gw*k1**2*sxi)/(2.*vev**2) - (gw*k2**2*sxi)/(2.*vev**2)',
                  order = {'QED':1})

GC_391 = Coupling(name = 'GC_391',
                  value = '(gw*k1**2*sxi)/(2.*vev**2) - (gw*k2**2*sxi)/(2.*vev**2)',
                  order = {'QED':1})

GC_392 = Coupling(name = 'GC_392',
                  value = '-((cxi*complex(0,1)*gw*k1*k2)/vev**2) - (complex(0,1)*gw*k1**2*sxi)/(2.*vev**2) - (complex(0,1)*gw*k2**2*sxi)/(2.*vev**2)',
                  order = {'QED':1})

GC_393 = Coupling(name = 'GC_393',
                  value = '(cxi*complex(0,1)*gw*k1*k2)/vev**2 - (complex(0,1)*gw*k1**2*sxi)/(2.*vev**2) - (complex(0,1)*gw*k2**2*sxi)/(2.*vev**2)',
                  order = {'QED':1})

GC_394 = Coupling(name = 'GC_394',
                  value = '(complex(0,1)*gw*k1**2*sxi)/(2.*vev**2) - (complex(0,1)*gw*k2**2*sxi)/(2.*vev**2)',
                  order = {'QED':1})

GC_395 = Coupling(name = 'GC_395',
                  value = '-0.5*(complex(0,1)*gw*k1**2*sxi)/vev**2 + (complex(0,1)*gw*k2**2*sxi)/(2.*vev**2)',
                  order = {'QED':1})

GC_396 = Coupling(name = 'GC_396',
                  value = '-((cxi*complex(0,1)*gw*k1*k2)/vev**2) + (complex(0,1)*gw*k1**2*sxi)/(2.*vev**2) + (complex(0,1)*gw*k2**2*sxi)/(2.*vev**2)',
                  order = {'QED':1})

GC_397 = Coupling(name = 'GC_397',
                  value = '(cxi*complex(0,1)*gw*k1*k2)/vev**2 + (complex(0,1)*gw*k1**2*sxi)/(2.*vev**2) + (complex(0,1)*gw*k2**2*sxi)/(2.*vev**2)',
                  order = {'QED':1})

GC_398 = Coupling(name = 'GC_398',
                  value = '-0.5*(gw*k1**2*sxi)/vev**2 + (gw*k2**2*sxi)/(2.*vev**2)',
                  order = {'QED':1})

GC_399 = Coupling(name = 'GC_399',
                  value = '-((cxi*gw*k1*k2)/vev**2) + (gw*k1**2*sxi)/(2.*vev**2) + (gw*k2**2*sxi)/(2.*vev**2)',
                  order = {'QED':1})

GC_400 = Coupling(name = 'GC_400',
                  value = '(cphi*cw*gw**2*k1**2*sxi)/(2.*vev**2) - (cphi*cw*gw**2*k2**2*sxi)/(2.*vev**2)',
                  order = {'QED':2})

GC_401 = Coupling(name = 'GC_401',
                  value = '(cphi*cw*complex(0,1)*gw**2*k1**2*sxi)/(2.*vev**2) - (cphi*cw*complex(0,1)*gw**2*k2**2*sxi)/(2.*vev**2)',
                  order = {'QED':2})

GC_402 = Coupling(name = 'GC_402',
                  value = '-0.5*(cphi*cw*complex(0,1)*gw**2*k1**2*sxi)/vev**2 + (cphi*cw*complex(0,1)*gw**2*k2**2*sxi)/(2.*vev**2)',
                  order = {'QED':2})

GC_403 = Coupling(name = 'GC_403',
                  value = '-0.5*(cphi*cw*gw**2*k1**2*sxi)/vev**2 + (cphi*cw*gw**2*k2**2*sxi)/(2.*vev**2)',
                  order = {'QED':2})

GC_404 = Coupling(name = 'GC_404',
                  value = '(cxi*complex(0,1)*gw**2*k1**2*sxi)/vev**2 - (cxi*complex(0,1)*gw**2*k2**2*sxi)/vev**2',
                  order = {'QED':2})

GC_405 = Coupling(name = 'GC_405',
                  value = '-((cxi*complex(0,1)*gw**2*k1**2*sxi)/vev**2) + (cxi*complex(0,1)*gw**2*k2**2*sxi)/vev**2',
                  order = {'QED':2})

GC_406 = Coupling(name = 'GC_406',
                  value = '(2*cxi*complex(0,1)*gw**2*k1**2*sxi)/vev**2 - (2*cxi*complex(0,1)*gw**2*k2**2*sxi)/vev**2',
                  order = {'QED':2})

GC_407 = Coupling(name = 'GC_407',
                  value = '(-2*cxi*complex(0,1)*gw**2*k1**2*sxi)/vev**2 + (2*cxi*complex(0,1)*gw**2*k2**2*sxi)/vev**2',
                  order = {'QED':2})

GC_408 = Coupling(name = 'GC_408',
                  value = '(cxi*gw**2*k1**2*sphi*sw**2)/(2.*cw*vev**2) + (cxi*gw**2*k2**2*sphi*sw**2)/(2.*cw*vev**2) - (cw*gw**2*k1*k2*sphi*sxi)/vev**2 - (cphi*cxi*gw**2*k1**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) - (cphi*cxi*gw**2*k2**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_409 = Coupling(name = 'GC_409',
                  value = '-0.5*(cxi*gw**2*k1**2*sphi*sw**2)/(cw*vev**2) - (cxi*gw**2*k2**2*sphi*sw**2)/(2.*cw*vev**2) - (cw*gw**2*k1*k2*sphi*sxi)/vev**2 + (cphi*cxi*gw**2*k1**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) + (cphi*cxi*gw**2*k2**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_410 = Coupling(name = 'GC_410',
                  value = '(cxi*complex(0,1)*gw**2*k1**2*sphi*sw**2)/(2.*cw*vev**2) + (cxi*complex(0,1)*gw**2*k2**2*sphi*sw**2)/(2.*cw*vev**2) - (cw*complex(0,1)*gw**2*k1*k2*sphi*sxi)/vev**2 - (cphi*cxi*complex(0,1)*gw**2*k1**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) - (cphi*cxi*complex(0,1)*gw**2*k2**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_411 = Coupling(name = 'GC_411',
                  value = '-0.5*(cxi*complex(0,1)*gw**2*k1**2*sphi*sw**2)/(cw*vev**2) - (cxi*complex(0,1)*gw**2*k2**2*sphi*sw**2)/(2.*cw*vev**2) - (cw*complex(0,1)*gw**2*k1*k2*sphi*sxi)/vev**2 + (cphi*cxi*complex(0,1)*gw**2*k1**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) + (cphi*cxi*complex(0,1)*gw**2*k2**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_412 = Coupling(name = 'GC_412',
                  value = '(cxi*gw**2*k1**2*sphi*sw**2)/(2.*cw*vev**2) + (cxi*gw**2*k2**2*sphi*sw**2)/(2.*cw*vev**2) + (cw*gw**2*k1*k2*sphi*sxi)/vev**2 - (cphi*cxi*gw**2*k1**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) - (cphi*cxi*gw**2*k2**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_413 = Coupling(name = 'GC_413',
                  value = '-0.5*(cxi*gw**2*k1**2*sphi*sw**2)/(cw*vev**2) - (cxi*gw**2*k2**2*sphi*sw**2)/(2.*cw*vev**2) + (cw*gw**2*k1*k2*sphi*sxi)/vev**2 + (cphi*cxi*gw**2*k1**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) + (cphi*cxi*gw**2*k2**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_414 = Coupling(name = 'GC_414',
                  value = '(cw*gw**2*k1**2*sphi*sxi)/(2.*vev**2) - (cw*gw**2*k2**2*sphi*sxi)/(2.*vev**2)',
                  order = {'QED':2})

GC_415 = Coupling(name = 'GC_415',
                  value = '(cw*complex(0,1)*gw**2*k1**2*sphi*sxi)/(2.*vev**2) - (cw*complex(0,1)*gw**2*k2**2*sphi*sxi)/(2.*vev**2)',
                  order = {'QED':2})

GC_416 = Coupling(name = 'GC_416',
                  value = '-0.5*(cw*complex(0,1)*gw**2*k1**2*sphi*sxi)/vev**2 + (cw*complex(0,1)*gw**2*k2**2*sphi*sxi)/(2.*vev**2)',
                  order = {'QED':2})

GC_417 = Coupling(name = 'GC_417',
                  value = '-0.5*(cw*gw**2*k1**2*sphi*sxi)/vev**2 + (cw*gw**2*k2**2*sphi*sxi)/(2.*vev**2)',
                  order = {'QED':2})

GC_418 = Coupling(name = 'GC_418',
                  value = '-0.5*(cxi*gw**2*k1**2*sw)/vev**2 - (cxi*gw**2*k2**2*sw)/(2.*vev**2) - (gw**2*k1*k2*sw*sxi)/vev**2',
                  order = {'QED':2})

GC_419 = Coupling(name = 'GC_419',
                  value = '(cxi*gw**2*k1**2*sw)/(2.*vev**2) + (cxi*gw**2*k2**2*sw)/(2.*vev**2) - (gw**2*k1*k2*sw*sxi)/vev**2',
                  order = {'QED':2})

GC_420 = Coupling(name = 'GC_420',
                  value = '-0.5*(cxi*complex(0,1)*gw**2*k1**2*sw)/vev**2 - (cxi*complex(0,1)*gw**2*k2**2*sw)/(2.*vev**2) - (complex(0,1)*gw**2*k1*k2*sw*sxi)/vev**2',
                  order = {'QED':2})

GC_421 = Coupling(name = 'GC_421',
                  value = '(cxi*complex(0,1)*gw**2*k1**2*sw)/(2.*vev**2) + (cxi*complex(0,1)*gw**2*k2**2*sw)/(2.*vev**2) - (complex(0,1)*gw**2*k1*k2*sw*sxi)/vev**2',
                  order = {'QED':2})

GC_422 = Coupling(name = 'GC_422',
                  value = '-0.5*(cxi*gw**2*k1**2*sw)/vev**2 - (cxi*gw**2*k2**2*sw)/(2.*vev**2) + (gw**2*k1*k2*sw*sxi)/vev**2',
                  order = {'QED':2})

GC_423 = Coupling(name = 'GC_423',
                  value = '(cxi*gw**2*k1**2*sw)/(2.*vev**2) + (cxi*gw**2*k2**2*sw)/(2.*vev**2) + (gw**2*k1*k2*sw*sxi)/vev**2',
                  order = {'QED':2})

GC_424 = Coupling(name = 'GC_424',
                  value = '-((cxi*gw**2*k1*k2*sw)/vev**2) - (gw**2*k1**2*sw*sxi)/(2.*vev**2) - (gw**2*k2**2*sw*sxi)/(2.*vev**2)',
                  order = {'QED':2})

GC_425 = Coupling(name = 'GC_425',
                  value = '(cxi*gw**2*k1*k2*sw)/vev**2 - (gw**2*k1**2*sw*sxi)/(2.*vev**2) - (gw**2*k2**2*sw*sxi)/(2.*vev**2)',
                  order = {'QED':2})

GC_426 = Coupling(name = 'GC_426',
                  value = '(gw**2*k1**2*sw*sxi)/(2.*vev**2) - (gw**2*k2**2*sw*sxi)/(2.*vev**2)',
                  order = {'QED':2})

GC_427 = Coupling(name = 'GC_427',
                  value = '(cxi*complex(0,1)*gw**2*k1*k2*sw)/vev**2 - (complex(0,1)*gw**2*k1**2*sw*sxi)/(2.*vev**2) - (complex(0,1)*gw**2*k2**2*sw*sxi)/(2.*vev**2)',
                  order = {'QED':2})

GC_428 = Coupling(name = 'GC_428',
                  value = '(complex(0,1)*gw**2*k1**2*sw*sxi)/(2.*vev**2) - (complex(0,1)*gw**2*k2**2*sw*sxi)/(2.*vev**2)',
                  order = {'QED':2})

GC_429 = Coupling(name = 'GC_429',
                  value = '-0.5*(complex(0,1)*gw**2*k1**2*sw*sxi)/vev**2 + (complex(0,1)*gw**2*k2**2*sw*sxi)/(2.*vev**2)',
                  order = {'QED':2})

GC_430 = Coupling(name = 'GC_430',
                  value = '(cxi*complex(0,1)*gw**2*k1*k2*sw)/vev**2 + (complex(0,1)*gw**2*k1**2*sw*sxi)/(2.*vev**2) + (complex(0,1)*gw**2*k2**2*sw*sxi)/(2.*vev**2)',
                  order = {'QED':2})

GC_431 = Coupling(name = 'GC_431',
                  value = '-0.5*(gw**2*k1**2*sw*sxi)/vev**2 + (gw**2*k2**2*sw*sxi)/(2.*vev**2)',
                  order = {'QED':2})

GC_432 = Coupling(name = 'GC_432',
                  value = '-((cxi*gw**2*k1*k2*sw)/vev**2) + (gw**2*k1**2*sw*sxi)/(2.*vev**2) + (gw**2*k2**2*sw*sxi)/(2.*vev**2)',
                  order = {'QED':2})

GC_433 = Coupling(name = 'GC_433',
                  value = '(cxi*gw**2*k1*k2*sw)/vev**2 + (gw**2*k1**2*sw*sxi)/(2.*vev**2) + (gw**2*k2**2*sw*sxi)/(2.*vev**2)',
                  order = {'QED':2})

GC_434 = Coupling(name = 'GC_434',
                  value = '-((cw*cxi*gw**2*k1*k2*sphi)/vev**2) + (gw**2*k1**2*sphi*sw**2*sxi)/(2.*cw*vev**2) + (gw**2*k2**2*sphi*sw**2*sxi)/(2.*cw*vev**2) - (cphi*gw**2*k1**2*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) - (cphi*gw**2*k2**2*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_435 = Coupling(name = 'GC_435',
                  value = '(cw*cxi*gw**2*k1*k2*sphi)/vev**2 + (gw**2*k1**2*sphi*sw**2*sxi)/(2.*cw*vev**2) + (gw**2*k2**2*sphi*sw**2*sxi)/(2.*cw*vev**2) - (cphi*gw**2*k1**2*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) - (cphi*gw**2*k2**2*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_436 = Coupling(name = 'GC_436',
                  value = '(cw*cxi*complex(0,1)*gw**2*k1*k2*sphi)/vev**2 + (complex(0,1)*gw**2*k1**2*sphi*sw**2*sxi)/(2.*cw*vev**2) + (complex(0,1)*gw**2*k2**2*sphi*sw**2*sxi)/(2.*cw*vev**2) - (cphi*complex(0,1)*gw**2*k1**2*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) - (cphi*complex(0,1)*gw**2*k2**2*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_437 = Coupling(name = 'GC_437',
                  value = '(cw*cxi*complex(0,1)*gw**2*k1*k2*sphi)/vev**2 - (complex(0,1)*gw**2*k1**2*sphi*sw**2*sxi)/(2.*cw*vev**2) - (complex(0,1)*gw**2*k2**2*sphi*sw**2*sxi)/(2.*cw*vev**2) + (cphi*complex(0,1)*gw**2*k1**2*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) + (cphi*complex(0,1)*gw**2*k2**2*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_438 = Coupling(name = 'GC_438',
                  value = '-((cw*cxi*gw**2*k1*k2*sphi)/vev**2) - (gw**2*k1**2*sphi*sw**2*sxi)/(2.*cw*vev**2) - (gw**2*k2**2*sphi*sw**2*sxi)/(2.*cw*vev**2) + (cphi*gw**2*k1**2*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) + (cphi*gw**2*k2**2*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_439 = Coupling(name = 'GC_439',
                  value = '(cw*cxi*gw**2*k1*k2*sphi)/vev**2 - (gw**2*k1**2*sphi*sw**2*sxi)/(2.*cw*vev**2) - (gw**2*k2**2*sphi*sw**2*sxi)/(2.*cw*vev**2) + (cphi*gw**2*k1**2*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) + (cphi*gw**2*k2**2*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_440 = Coupling(name = 'GC_440',
                  value = '-((cphi*cw*cxi*gw**2*k1*k2)/vev**2) - (cphi*gw**2*k1**2*sw**2*sxi)/(2.*cw*vev**2) - (cphi*gw**2*k2**2*sw**2*sxi)/(2.*cw*vev**2) - (gw**2*k1**2*sphi*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) - (gw**2*k2**2*sphi*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_441 = Coupling(name = 'GC_441',
                  value = '(cphi*cw*cxi*gw**2*k1*k2)/vev**2 - (cphi*gw**2*k1**2*sw**2*sxi)/(2.*cw*vev**2) - (cphi*gw**2*k2**2*sw**2*sxi)/(2.*cw*vev**2) - (gw**2*k1**2*sphi*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) - (gw**2*k2**2*sphi*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_442 = Coupling(name = 'GC_442',
                  value = '(cphi*cw*cxi*complex(0,1)*gw**2*k1*k2)/vev**2 - (cphi*complex(0,1)*gw**2*k1**2*sw**2*sxi)/(2.*cw*vev**2) - (cphi*complex(0,1)*gw**2*k2**2*sw**2*sxi)/(2.*cw*vev**2) - (complex(0,1)*gw**2*k1**2*sphi*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) - (complex(0,1)*gw**2*k2**2*sphi*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_443 = Coupling(name = 'GC_443',
                  value = '(cphi*cw*cxi*complex(0,1)*gw**2*k1*k2)/vev**2 + (cphi*complex(0,1)*gw**2*k1**2*sw**2*sxi)/(2.*cw*vev**2) + (cphi*complex(0,1)*gw**2*k2**2*sw**2*sxi)/(2.*cw*vev**2) + (complex(0,1)*gw**2*k1**2*sphi*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) + (complex(0,1)*gw**2*k2**2*sphi*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_444 = Coupling(name = 'GC_444',
                  value = '-((cphi*cw*cxi*gw**2*k1*k2)/vev**2) + (cphi*gw**2*k1**2*sw**2*sxi)/(2.*cw*vev**2) + (cphi*gw**2*k2**2*sw**2*sxi)/(2.*cw*vev**2) + (gw**2*k1**2*sphi*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) + (gw**2*k2**2*sphi*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_445 = Coupling(name = 'GC_445',
                  value = '(cphi*cw*cxi*gw**2*k1*k2)/vev**2 + (cphi*gw**2*k1**2*sw**2*sxi)/(2.*cw*vev**2) + (cphi*gw**2*k2**2*sw**2*sxi)/(2.*cw*vev**2) + (gw**2*k1**2*sphi*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2) + (gw**2*k2**2*sphi*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev**2)',
                  order = {'QED':2})

GC_446 = Coupling(name = 'GC_446',
                  value = '-((cxi**2*gw**2*k1*k2)/vev**2) - (gw**2*k1*k2*sxi**2)/vev**2',
                  order = {'QED':2})

GC_447 = Coupling(name = 'GC_447',
                  value = '(cxi**2*complex(0,1)*gw**2*k1*k2)/vev**2 - (complex(0,1)*gw**2*k1*k2*sxi**2)/vev**2',
                  order = {'QED':2})

GC_448 = Coupling(name = 'GC_448',
                  value = '-((cxi**2*complex(0,1)*gw**2*k1*k2)/vev**2) + (complex(0,1)*gw**2*k1*k2*sxi**2)/vev**2',
                  order = {'QED':2})

GC_449 = Coupling(name = 'GC_449',
                  value = '(2*cxi**2*complex(0,1)*gw**2*k1*k2)/vev**2 - (2*complex(0,1)*gw**2*k1*k2*sxi**2)/vev**2',
                  order = {'QED':2})

GC_450 = Coupling(name = 'GC_450',
                  value = '(-2*cxi**2*complex(0,1)*gw**2*k1*k2)/vev**2 + (2*complex(0,1)*gw**2*k1*k2*sxi**2)/vev**2',
                  order = {'QED':2})

GC_451 = Coupling(name = 'GC_451',
                  value = '(cxi**2*gw**2*k1*k2)/vev**2 + (gw**2*k1*k2*sxi**2)/vev**2',
                  order = {'QED':2})

GC_452 = Coupling(name = 'GC_452',
                  value = '(cxi**2*gw**2*k1**2)/(2.*vev**2) - (cxi**2*gw**2*k2**2)/(2.*vev**2) + (gw**2*k1**2*sxi**2)/(2.*vev**2) - (gw**2*k2**2*sxi**2)/(2.*vev**2)',
                  order = {'QED':2})

GC_453 = Coupling(name = 'GC_453',
                  value = '-0.5*(cxi**2*complex(0,1)*gw**2*k1**2)/vev**2 + (cxi**2*complex(0,1)*gw**2*k2**2)/(2.*vev**2) + (complex(0,1)*gw**2*k1**2*sxi**2)/(2.*vev**2) - (complex(0,1)*gw**2*k2**2*sxi**2)/(2.*vev**2)',
                  order = {'QED':2})

GC_454 = Coupling(name = 'GC_454',
                  value = '(cxi**2*complex(0,1)*gw**2*k1**2)/(2.*vev**2) - (cxi**2*complex(0,1)*gw**2*k2**2)/(2.*vev**2) - (complex(0,1)*gw**2*k1**2*sxi**2)/(2.*vev**2) + (complex(0,1)*gw**2*k2**2*sxi**2)/(2.*vev**2)',
                  order = {'QED':2})

GC_455 = Coupling(name = 'GC_455',
                  value = '(cxi**2*complex(0,1)*gw**2*k1**2)/(2.*vev**2) + (cxi**2*complex(0,1)*gw**2*k2**2)/(2.*vev**2) + (complex(0,1)*gw**2*k1**2*sxi**2)/(2.*vev**2) + (complex(0,1)*gw**2*k2**2*sxi**2)/(2.*vev**2)',
                  order = {'QED':2})

GC_456 = Coupling(name = 'GC_456',
                  value = '(cxi**2*complex(0,1)*gw**2*k1**2)/(2.*vev**2) + (cxi**2*complex(0,1)*gw**2*k2**2)/(2.*vev**2) - (2*cxi*complex(0,1)*gw**2*k1*k2*sxi)/vev**2 + (complex(0,1)*gw**2*k1**2*sxi**2)/(2.*vev**2) + (complex(0,1)*gw**2*k2**2*sxi**2)/(2.*vev**2)',
                  order = {'QED':2})

GC_457 = Coupling(name = 'GC_457',
                  value = '(cxi**2*complex(0,1)*gw**2*k1**2)/(2.*vev**2) + (cxi**2*complex(0,1)*gw**2*k2**2)/(2.*vev**2) + (2*cxi*complex(0,1)*gw**2*k1*k2*sxi)/vev**2 + (complex(0,1)*gw**2*k1**2*sxi**2)/(2.*vev**2) + (complex(0,1)*gw**2*k2**2*sxi**2)/(2.*vev**2)',
                  order = {'QED':2})

GC_458 = Coupling(name = 'GC_458',
                  value = '-((cxi**2*complex(0,1)*gw**2*k1**2)/vev**2) + (cxi**2*complex(0,1)*gw**2*k2**2)/vev**2 + (complex(0,1)*gw**2*k1**2*sxi**2)/vev**2 - (complex(0,1)*gw**2*k2**2*sxi**2)/vev**2',
                  order = {'QED':2})

GC_459 = Coupling(name = 'GC_459',
                  value = '-0.5*(cxi**2*gw**2*k1**2)/vev**2 + (cxi**2*gw**2*k2**2)/(2.*vev**2) - (gw**2*k1**2*sxi**2)/(2.*vev**2) + (gw**2*k2**2*sxi**2)/(2.*vev**2)',
                  order = {'QED':2})

GC_460 = Coupling(name = 'GC_460',
                  value = '-((alpha1*complex(0,1)*k1**2)/vev) - (alpha3*complex(0,1)*k1**2)/vev - (4*alpha2*complex(0,1)*k1*k2)/vev - (alpha1*complex(0,1)*k2**2)/vev',
                  order = {'QED':1})

GC_461 = Coupling(name = 'GC_461',
                  value = '(-2*alpha2*complex(0,1)*k1**2)/vev + (2*alpha2*complex(0,1)*k2**2)/vev',
                  order = {'QED':1})

GC_462 = Coupling(name = 'GC_462',
                  value = '(-2*alpha2*complex(0,1)*k1**2)/vev - (alpha3*complex(0,1)*k1*k2)/vev + (2*alpha2*complex(0,1)*k2**2)/vev',
                  order = {'QED':1})

GC_463 = Coupling(name = 'GC_463',
                  value = '(-2*alpha2*complex(0,1)*k1**2)/vev + (alpha3*complex(0,1)*k1*k2)/vev + (2*alpha2*complex(0,1)*k2**2)/vev',
                  order = {'QED':1})

GC_464 = Coupling(name = 'GC_464',
                  value = '(alpha3*complex(0,1)*k1**2)/(2.*vev) - (alpha3*complex(0,1)*k2**2)/(2.*vev)',
                  order = {'QED':1})

GC_465 = Coupling(name = 'GC_465',
                  value = '-((alpha1*complex(0,1)*k1**2)/vev) - (alpha3*complex(0,1)*k1**2)/(2.*vev) - (4*alpha2*complex(0,1)*k1*k2)/vev - (alpha1*complex(0,1)*k2**2)/vev - (alpha3*complex(0,1)*k2**2)/(2.*vev)',
                  order = {'QED':1})

GC_466 = Coupling(name = 'GC_466',
                  value = '-((alpha1*complex(0,1)*k1**2)/vev) - (4*alpha2*complex(0,1)*k1*k2)/vev - (alpha1*complex(0,1)*k2**2)/vev - (alpha3*complex(0,1)*k2**2)/vev',
                  order = {'QED':1})

GC_467 = Coupling(name = 'GC_467',
                  value = '(alpha3*k1**2)/(2.*vev*cmath.sqrt(2)) - (alpha3*k2**2)/(2.*vev*cmath.sqrt(2))',
                  order = {'QED':1})

GC_468 = Coupling(name = 'GC_468',
                  value = '-0.5*(alpha3*complex(0,1)*k1**2)/(vev*cmath.sqrt(2)) + (alpha3*complex(0,1)*k2**2)/(2.*vev*cmath.sqrt(2))',
                  order = {'QED':1})

GC_469 = Coupling(name = 'GC_469',
                  value = '-0.5*(alpha3*k1**2)/(vev*cmath.sqrt(2)) + (alpha3*k2**2)/(2.*vev*cmath.sqrt(2))',
                  order = {'QED':1})

GC_470 = Coupling(name = 'GC_470',
                  value = '-0.5*(cphi*cw*cxi*complex(0,1)*gw**2*k1**2)/vev + (cphi*cw*cxi*complex(0,1)*gw**2*k2**2)/(2.*vev)',
                  order = {'QED':1})

GC_471 = Coupling(name = 'GC_471',
                  value = '-((complex(0,1)*I10c11*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I9c11*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I10c11*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_472 = Coupling(name = 'GC_472',
                  value = '-((complex(0,1)*I10c12*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I9c12*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I10c12*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_473 = Coupling(name = 'GC_473',
                  value = '-((complex(0,1)*I10c13*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I9c13*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I10c13*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_474 = Coupling(name = 'GC_474',
                  value = '-((complex(0,1)*I10c21*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I9c21*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I10c21*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_475 = Coupling(name = 'GC_475',
                  value = '-((complex(0,1)*I10c22*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I9c22*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I10c22*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_476 = Coupling(name = 'GC_476',
                  value = '-((complex(0,1)*I10c23*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I9c23*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I10c23*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_477 = Coupling(name = 'GC_477',
                  value = '-((complex(0,1)*I10c31*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I9c31*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I10c31*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_478 = Coupling(name = 'GC_478',
                  value = '-((complex(0,1)*I10c32*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I9c32*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I10c32*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_479 = Coupling(name = 'GC_479',
                  value = '-((complex(0,1)*I10c33*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I9c33*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I10c33*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_480 = Coupling(name = 'GC_480',
                  value = '(complex(0,1)*I11c11*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I12c11*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I11c11*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_481 = Coupling(name = 'GC_481',
                  value = '(complex(0,1)*I11c12*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I12c12*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I11c12*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_482 = Coupling(name = 'GC_482',
                  value = '(complex(0,1)*I11c13*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I12c13*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I11c13*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_483 = Coupling(name = 'GC_483',
                  value = '(complex(0,1)*I11c21*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I12c21*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I11c21*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_484 = Coupling(name = 'GC_484',
                  value = '(complex(0,1)*I11c22*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I12c22*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I11c22*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_485 = Coupling(name = 'GC_485',
                  value = '(complex(0,1)*I11c23*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I12c23*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I11c23*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_486 = Coupling(name = 'GC_486',
                  value = '(complex(0,1)*I11c31*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I12c31*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I11c31*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_487 = Coupling(name = 'GC_487',
                  value = '(complex(0,1)*I11c32*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I12c32*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I11c32*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_488 = Coupling(name = 'GC_488',
                  value = '(complex(0,1)*I11c33*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I12c33*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I11c33*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_489 = Coupling(name = 'GC_489',
                  value = '-((complex(0,1)*I12c11*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I12c11*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_490 = Coupling(name = 'GC_490',
                  value = '-((complex(0,1)*I12c12*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I12c12*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_491 = Coupling(name = 'GC_491',
                  value = '-((complex(0,1)*I12c13*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I12c13*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_492 = Coupling(name = 'GC_492',
                  value = '-((complex(0,1)*I12c21*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I12c21*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_493 = Coupling(name = 'GC_493',
                  value = '-((complex(0,1)*I12c22*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I12c22*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_494 = Coupling(name = 'GC_494',
                  value = '-((complex(0,1)*I12c23*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I12c23*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_495 = Coupling(name = 'GC_495',
                  value = '-((complex(0,1)*I12c31*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I12c31*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_496 = Coupling(name = 'GC_496',
                  value = '-((complex(0,1)*I12c32*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I12c32*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_497 = Coupling(name = 'GC_497',
                  value = '-((complex(0,1)*I12c33*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I12c33*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_498 = Coupling(name = 'GC_498',
                  value = '-((complex(0,1)*I17c11*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I18c11*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I13c11*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I14c11*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I17c11*k2**2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I18c11*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_499 = Coupling(name = 'GC_499',
                  value = '(I17c11*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (I18c11*k1**2)/((k1 - k2)*(k1 + k2)*vev) - (2*I13c11*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (2*I14c11*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (I17c11*k2**2)/((k1 - k2)*(k1 + k2)*vev) + (I18c11*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_500 = Coupling(name = 'GC_500',
                  value = '-((complex(0,1)*I17c22*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I18c22*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I13c22*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I14c22*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I17c22*k2**2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I18c22*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_501 = Coupling(name = 'GC_501',
                  value = '(I17c22*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (I18c22*k1**2)/((k1 - k2)*(k1 + k2)*vev) - (2*I13c22*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (2*I14c22*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (I17c22*k2**2)/((k1 - k2)*(k1 + k2)*vev) + (I18c22*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_502 = Coupling(name = 'GC_502',
                  value = '-((complex(0,1)*I17c33*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I18c33*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I13c33*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I14c33*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I17c33*k2**2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I18c33*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_503 = Coupling(name = 'GC_503',
                  value = '(I17c33*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (I18c33*k1**2)/((k1 - k2)*(k1 + k2)*vev) - (2*I13c33*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (2*I14c33*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (I17c33*k2**2)/((k1 - k2)*(k1 + k2)*vev) + (I18c33*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_504 = Coupling(name = 'GC_504',
                  value = '-0.5*(complex(0,1)*I17c14*k1**2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I17c41*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I18c14*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I18c41*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I13c14*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I13c41*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I14c14*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I14c41*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I17c14*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I17c41*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I18c14*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I18c41*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_505 = Coupling(name = 'GC_505',
                  value = '(I17c14*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (I17c41*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (I18c14*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (I18c41*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (I13c14*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (I13c41*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (I14c14*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (I14c41*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (I17c14*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (I17c41*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (I18c14*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (I18c41*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_506 = Coupling(name = 'GC_506',
                  value = '-((complex(0,1)*I17c44*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I18c44*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I13c44*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I14c44*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I17c44*k2**2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I18c44*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_507 = Coupling(name = 'GC_507',
                  value = '(I17c44*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (I18c44*k1**2)/((k1 - k2)*(k1 + k2)*vev) - (2*I13c44*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (2*I14c44*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (I17c44*k2**2)/((k1 - k2)*(k1 + k2)*vev) + (I18c44*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_508 = Coupling(name = 'GC_508',
                  value = '-0.5*(complex(0,1)*I17c25*k1**2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I17c52*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I18c25*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I18c52*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I13c25*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I13c52*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I14c25*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I14c52*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I17c25*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I17c52*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I18c25*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I18c52*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_509 = Coupling(name = 'GC_509',
                  value = '(I17c25*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (I17c52*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (I18c25*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (I18c52*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (I13c25*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (I13c52*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (I14c25*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (I14c52*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (I17c25*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (I17c52*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (I18c25*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (I18c52*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_510 = Coupling(name = 'GC_510',
                  value = '-((complex(0,1)*I17c55*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I18c55*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I13c55*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I14c55*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I17c55*k2**2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I18c55*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_511 = Coupling(name = 'GC_511',
                  value = '(I17c55*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (I18c55*k1**2)/((k1 - k2)*(k1 + k2)*vev) - (2*I13c55*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (2*I14c55*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (I17c55*k2**2)/((k1 - k2)*(k1 + k2)*vev) + (I18c55*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_512 = Coupling(name = 'GC_512',
                  value = '-0.5*(complex(0,1)*I17c36*k1**2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I17c63*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I18c36*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I18c63*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I13c36*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I13c63*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I14c36*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I14c63*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I17c36*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I17c63*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I18c36*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I18c63*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_513 = Coupling(name = 'GC_513',
                  value = '(I17c36*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (I17c63*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (I18c36*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (I18c63*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (I13c36*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (I13c63*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (I14c36*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (I14c63*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (I17c36*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (I17c63*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (I18c36*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (I18c63*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_514 = Coupling(name = 'GC_514',
                  value = '-((complex(0,1)*I17c66*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I18c66*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I13c66*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I14c66*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I17c66*k2**2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I18c66*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_515 = Coupling(name = 'GC_515',
                  value = '(I17c66*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (I18c66*k1**2)/((k1 - k2)*(k1 + k2)*vev) - (2*I13c66*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (2*I14c66*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (I17c66*k2**2)/((k1 - k2)*(k1 + k2)*vev) + (I18c66*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_516 = Coupling(name = 'GC_516',
                  value = '-((complex(0,1)*I1c11*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I1c11*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_517 = Coupling(name = 'GC_517',
                  value = '-((complex(0,1)*I1c12*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I1c12*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_518 = Coupling(name = 'GC_518',
                  value = '-((complex(0,1)*I1c13*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I1c13*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_519 = Coupling(name = 'GC_519',
                  value = '-((complex(0,1)*I1c21*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I1c21*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_520 = Coupling(name = 'GC_520',
                  value = '-((complex(0,1)*I1c22*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I1c22*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_521 = Coupling(name = 'GC_521',
                  value = '-((complex(0,1)*I1c23*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I1c23*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_522 = Coupling(name = 'GC_522',
                  value = '-((complex(0,1)*I1c31*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I1c31*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_523 = Coupling(name = 'GC_523',
                  value = '-((complex(0,1)*I1c32*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I1c32*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_524 = Coupling(name = 'GC_524',
                  value = '-((complex(0,1)*I1c33*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I1c33*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_525 = Coupling(name = 'GC_525',
                  value = '-((I19c11*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (I20c11*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (2*I15c11*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (2*I16c11*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (I19c11*k2**2)/((k1 - k2)*(k1 + k2)*vev) - (I20c11*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_526 = Coupling(name = 'GC_526',
                  value = '-((complex(0,1)*I19c11*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I20c11*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I15c11*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I16c11*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I19c11*k2**2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I20c11*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_527 = Coupling(name = 'GC_527',
                  value = '-((I19c22*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (I20c22*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (2*I15c22*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (2*I16c22*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (I19c22*k2**2)/((k1 - k2)*(k1 + k2)*vev) - (I20c22*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_528 = Coupling(name = 'GC_528',
                  value = '-((complex(0,1)*I19c22*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I20c22*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I15c22*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I16c22*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I19c22*k2**2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I20c22*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_529 = Coupling(name = 'GC_529',
                  value = '-((I19c33*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (I20c33*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (2*I15c33*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (2*I16c33*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (I19c33*k2**2)/((k1 - k2)*(k1 + k2)*vev) - (I20c33*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_530 = Coupling(name = 'GC_530',
                  value = '-((complex(0,1)*I19c33*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I20c33*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I15c33*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I16c33*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I19c33*k2**2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I20c33*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_531 = Coupling(name = 'GC_531',
                  value = '-0.5*(I19c14*k1**2)/((k1 - k2)*(k1 + k2)*vev) - (I19c41*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (I20c14*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (I20c41*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (I15c14*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (I15c41*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (I16c14*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (I16c41*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (I19c14*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (I19c41*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (I20c14*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (I20c41*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_532 = Coupling(name = 'GC_532',
                  value = '-0.5*(complex(0,1)*I19c14*k1**2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I19c41*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I20c14*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I20c41*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I15c14*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I15c41*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I16c14*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I16c41*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I19c14*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I19c41*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I20c14*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I20c41*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_533 = Coupling(name = 'GC_533',
                  value = '-((I19c44*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (I20c44*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (2*I15c44*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (2*I16c44*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (I19c44*k2**2)/((k1 - k2)*(k1 + k2)*vev) - (I20c44*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_534 = Coupling(name = 'GC_534',
                  value = '-((complex(0,1)*I19c44*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I20c44*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I15c44*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I16c44*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I19c44*k2**2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I20c44*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_535 = Coupling(name = 'GC_535',
                  value = '-0.5*(I19c25*k1**2)/((k1 - k2)*(k1 + k2)*vev) - (I19c52*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (I20c25*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (I20c52*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (I15c25*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (I15c52*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (I16c25*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (I16c52*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (I19c25*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (I19c52*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (I20c25*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (I20c52*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_536 = Coupling(name = 'GC_536',
                  value = '-0.5*(complex(0,1)*I19c25*k1**2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I19c52*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I20c25*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I20c52*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I15c25*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I15c52*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I16c25*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I16c52*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I19c25*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I19c52*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I20c25*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I20c52*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_537 = Coupling(name = 'GC_537',
                  value = '-((I19c55*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (I20c55*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (2*I15c55*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (2*I16c55*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (I19c55*k2**2)/((k1 - k2)*(k1 + k2)*vev) - (I20c55*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_538 = Coupling(name = 'GC_538',
                  value = '-((complex(0,1)*I19c55*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I20c55*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I15c55*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I16c55*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I19c55*k2**2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I20c55*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_539 = Coupling(name = 'GC_539',
                  value = '-0.5*(I19c36*k1**2)/((k1 - k2)*(k1 + k2)*vev) - (I19c63*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (I20c36*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (I20c63*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (I15c36*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (I15c63*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (I16c36*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (I16c63*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (I19c36*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (I19c63*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (I20c36*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (I20c63*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_540 = Coupling(name = 'GC_540',
                  value = '-0.5*(complex(0,1)*I19c36*k1**2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I19c63*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I20c36*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I20c63*k1**2)/(2.*(k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I15c36*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I15c63*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I16c36*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I16c63*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I19c36*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I19c63*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I20c36*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I20c63*k2**2)/(2.*(k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_541 = Coupling(name = 'GC_541',
                  value = '-((I19c66*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (I20c66*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (2*I15c66*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (2*I16c66*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (I19c66*k2**2)/((k1 - k2)*(k1 + k2)*vev) - (I20c66*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_542 = Coupling(name = 'GC_542',
                  value = '-((complex(0,1)*I19c66*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I20c66*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I15c66*k1*k2)/((k1 - k2)*(k1 + k2)*vev) + (2*complex(0,1)*I16c66*k1*k2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I19c66*k2**2)/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I20c66*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_543 = Coupling(name = 'GC_543',
                  value = '(complex(0,1)*I21c11*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I21c11*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_544 = Coupling(name = 'GC_544',
                  value = '(complex(0,1)*I21c22*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I21c22*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_545 = Coupling(name = 'GC_545',
                  value = '(complex(0,1)*I21c33*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I21c33*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_546 = Coupling(name = 'GC_546',
                  value = '(complex(0,1)*I21c41*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I21c41*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_547 = Coupling(name = 'GC_547',
                  value = '(complex(0,1)*I21c52*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I21c52*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_548 = Coupling(name = 'GC_548',
                  value = '(complex(0,1)*I21c63*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I21c63*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_549 = Coupling(name = 'GC_549',
                  value = '-((complex(0,1)*I22c11*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I21c11*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I22c11*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_550 = Coupling(name = 'GC_550',
                  value = '-((complex(0,1)*I22c22*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I21c22*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I22c22*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_551 = Coupling(name = 'GC_551',
                  value = '-((complex(0,1)*I22c33*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I21c33*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I22c33*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_552 = Coupling(name = 'GC_552',
                  value = '-((complex(0,1)*I22c41*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I21c41*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I22c41*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_553 = Coupling(name = 'GC_553',
                  value = '-((complex(0,1)*I22c52*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I21c52*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I22c52*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_554 = Coupling(name = 'GC_554',
                  value = '-((complex(0,1)*I22c63*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I21c63*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I22c63*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_555 = Coupling(name = 'GC_555',
                  value = '(complex(0,1)*I23c11*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I24c11*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I23c11*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_556 = Coupling(name = 'GC_556',
                  value = '(complex(0,1)*I23c22*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I24c22*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I23c22*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_557 = Coupling(name = 'GC_557',
                  value = '(complex(0,1)*I23c33*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I24c33*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I23c33*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_558 = Coupling(name = 'GC_558',
                  value = '(complex(0,1)*I23c41*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I24c41*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I23c41*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_559 = Coupling(name = 'GC_559',
                  value = '(complex(0,1)*I23c52*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I24c52*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I23c52*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_560 = Coupling(name = 'GC_560',
                  value = '(complex(0,1)*I23c63*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I24c63*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I23c63*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_561 = Coupling(name = 'GC_561',
                  value = '-((complex(0,1)*I24c11*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I24c11*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_562 = Coupling(name = 'GC_562',
                  value = '-((complex(0,1)*I24c22*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I24c22*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_563 = Coupling(name = 'GC_563',
                  value = '-((complex(0,1)*I24c33*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I24c33*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_564 = Coupling(name = 'GC_564',
                  value = '-((complex(0,1)*I24c41*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I24c41*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_565 = Coupling(name = 'GC_565',
                  value = '-((complex(0,1)*I24c52*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I24c52*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_566 = Coupling(name = 'GC_566',
                  value = '-((complex(0,1)*I24c63*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I24c63*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_567 = Coupling(name = 'GC_567',
                  value = '-((complex(0,1)*I25c11*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I25c11*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_568 = Coupling(name = 'GC_568',
                  value = '-((complex(0,1)*I25c22*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I25c22*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_569 = Coupling(name = 'GC_569',
                  value = '-((complex(0,1)*I25c33*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I25c33*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_570 = Coupling(name = 'GC_570',
                  value = '-((complex(0,1)*I25c41*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I25c41*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_571 = Coupling(name = 'GC_571',
                  value = '-((complex(0,1)*I25c52*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I25c52*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_572 = Coupling(name = 'GC_572',
                  value = '-((complex(0,1)*I25c63*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*I25c63*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_573 = Coupling(name = 'GC_573',
                  value = '(complex(0,1)*I26c11*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I26c11*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_574 = Coupling(name = 'GC_574',
                  value = '(complex(0,1)*I26c22*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I26c22*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_575 = Coupling(name = 'GC_575',
                  value = '(complex(0,1)*I26c33*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I26c33*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_576 = Coupling(name = 'GC_576',
                  value = '(complex(0,1)*I26c41*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I26c41*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_577 = Coupling(name = 'GC_577',
                  value = '(complex(0,1)*I26c52*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I26c52*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_578 = Coupling(name = 'GC_578',
                  value = '(complex(0,1)*I26c63*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I26c63*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_579 = Coupling(name = 'GC_579',
                  value = '(complex(0,1)*I27c11*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I25c11*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I27c11*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_580 = Coupling(name = 'GC_580',
                  value = '(complex(0,1)*I27c22*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I25c22*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I27c22*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_581 = Coupling(name = 'GC_581',
                  value = '(complex(0,1)*I27c33*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I25c33*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I27c33*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_582 = Coupling(name = 'GC_582',
                  value = '(complex(0,1)*I27c41*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I25c41*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I27c41*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_583 = Coupling(name = 'GC_583',
                  value = '(complex(0,1)*I27c52*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I25c52*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I27c52*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_584 = Coupling(name = 'GC_584',
                  value = '(complex(0,1)*I27c63*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I25c63*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I27c63*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_585 = Coupling(name = 'GC_585',
                  value = '-((complex(0,1)*I28c11*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I26c11*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I28c11*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_586 = Coupling(name = 'GC_586',
                  value = '-((complex(0,1)*I28c22*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I26c22*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I28c22*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_587 = Coupling(name = 'GC_587',
                  value = '-((complex(0,1)*I28c33*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I26c33*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I28c33*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_588 = Coupling(name = 'GC_588',
                  value = '-((complex(0,1)*I28c41*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I26c41*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I28c41*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_589 = Coupling(name = 'GC_589',
                  value = '-((complex(0,1)*I28c52*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I26c52*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I28c52*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_590 = Coupling(name = 'GC_590',
                  value = '-((complex(0,1)*I28c63*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I26c63*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I28c63*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_591 = Coupling(name = 'GC_591',
                  value = '-((I29c11*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (I29c11*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_592 = Coupling(name = 'GC_592',
                  value = '-((complex(0,1)*I29c11*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I29c11*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_593 = Coupling(name = 'GC_593',
                  value = '-((I29c22*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (I29c22*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_594 = Coupling(name = 'GC_594',
                  value = '-((complex(0,1)*I29c22*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I29c22*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_595 = Coupling(name = 'GC_595',
                  value = '-((I29c33*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (I29c33*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_596 = Coupling(name = 'GC_596',
                  value = '-((complex(0,1)*I29c33*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I29c33*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_597 = Coupling(name = 'GC_597',
                  value = '(complex(0,1)*I2c11*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I2c11*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_598 = Coupling(name = 'GC_598',
                  value = '(complex(0,1)*I2c12*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I2c12*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_599 = Coupling(name = 'GC_599',
                  value = '(complex(0,1)*I2c13*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I2c13*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_600 = Coupling(name = 'GC_600',
                  value = '(complex(0,1)*I2c21*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I2c21*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_601 = Coupling(name = 'GC_601',
                  value = '(complex(0,1)*I2c22*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I2c22*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_602 = Coupling(name = 'GC_602',
                  value = '(complex(0,1)*I2c23*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I2c23*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_603 = Coupling(name = 'GC_603',
                  value = '(complex(0,1)*I2c31*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I2c31*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_604 = Coupling(name = 'GC_604',
                  value = '(complex(0,1)*I2c32*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I2c32*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_605 = Coupling(name = 'GC_605',
                  value = '(complex(0,1)*I2c33*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I2c33*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_606 = Coupling(name = 'GC_606',
                  value = '-((complex(0,1)*I30c11*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I30c11*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_607 = Coupling(name = 'GC_607',
                  value = '(I30c11*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (I30c11*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_608 = Coupling(name = 'GC_608',
                  value = '-((complex(0,1)*I30c22*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I30c22*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_609 = Coupling(name = 'GC_609',
                  value = '(I30c22*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (I30c22*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_610 = Coupling(name = 'GC_610',
                  value = '-((complex(0,1)*I30c33*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I30c33*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_611 = Coupling(name = 'GC_611',
                  value = '(I30c33*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (I30c33*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_612 = Coupling(name = 'GC_612',
                  value = '(complex(0,1)*I3c11*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I1c11*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I3c11*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_613 = Coupling(name = 'GC_613',
                  value = '(complex(0,1)*I3c12*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I1c12*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I3c12*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_614 = Coupling(name = 'GC_614',
                  value = '(complex(0,1)*I3c13*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I1c13*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I3c13*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_615 = Coupling(name = 'GC_615',
                  value = '(complex(0,1)*I3c21*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I1c21*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I3c21*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_616 = Coupling(name = 'GC_616',
                  value = '(complex(0,1)*I3c22*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I1c22*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I3c22*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_617 = Coupling(name = 'GC_617',
                  value = '(complex(0,1)*I3c23*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I1c23*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I3c23*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_618 = Coupling(name = 'GC_618',
                  value = '(complex(0,1)*I3c31*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I1c31*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I3c31*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_619 = Coupling(name = 'GC_619',
                  value = '(complex(0,1)*I3c32*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I1c32*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I3c32*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_620 = Coupling(name = 'GC_620',
                  value = '(complex(0,1)*I3c33*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (2*complex(0,1)*I1c33*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) + (complex(0,1)*I3c33*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_621 = Coupling(name = 'GC_621',
                  value = '-((complex(0,1)*I4c11*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I2c11*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I4c11*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_622 = Coupling(name = 'GC_622',
                  value = '-((complex(0,1)*I4c12*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I2c12*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I4c12*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_623 = Coupling(name = 'GC_623',
                  value = '-((complex(0,1)*I4c13*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I2c13*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I4c13*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_624 = Coupling(name = 'GC_624',
                  value = '-((complex(0,1)*I4c21*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I2c21*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I4c21*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_625 = Coupling(name = 'GC_625',
                  value = '-((complex(0,1)*I4c22*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I2c22*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I4c22*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_626 = Coupling(name = 'GC_626',
                  value = '-((complex(0,1)*I4c23*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I2c23*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I4c23*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_627 = Coupling(name = 'GC_627',
                  value = '-((complex(0,1)*I4c31*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I2c31*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I4c31*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_628 = Coupling(name = 'GC_628',
                  value = '-((complex(0,1)*I4c32*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I2c32*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I4c32*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_629 = Coupling(name = 'GC_629',
                  value = '-((complex(0,1)*I4c33*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)) + (2*complex(0,1)*I2c33*k1*k2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I4c33*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_630 = Coupling(name = 'GC_630',
                  value = '-((I5c11*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (I5c11*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_631 = Coupling(name = 'GC_631',
                  value = '-((complex(0,1)*I5c11*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I5c11*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_632 = Coupling(name = 'GC_632',
                  value = '-((I5c12*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (I5c12*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_633 = Coupling(name = 'GC_633',
                  value = '-((complex(0,1)*I5c12*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I5c12*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_634 = Coupling(name = 'GC_634',
                  value = '-((I5c13*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (I5c13*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_635 = Coupling(name = 'GC_635',
                  value = '-((complex(0,1)*I5c13*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I5c13*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_636 = Coupling(name = 'GC_636',
                  value = '-((I5c21*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (I5c21*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_637 = Coupling(name = 'GC_637',
                  value = '-((complex(0,1)*I5c21*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I5c21*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_638 = Coupling(name = 'GC_638',
                  value = '-((I5c22*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (I5c22*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_639 = Coupling(name = 'GC_639',
                  value = '-((complex(0,1)*I5c22*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I5c22*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_640 = Coupling(name = 'GC_640',
                  value = '-((I5c23*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (I5c23*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_641 = Coupling(name = 'GC_641',
                  value = '-((complex(0,1)*I5c23*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I5c23*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_642 = Coupling(name = 'GC_642',
                  value = '-((I5c31*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (I5c31*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_643 = Coupling(name = 'GC_643',
                  value = '-((complex(0,1)*I5c31*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I5c31*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_644 = Coupling(name = 'GC_644',
                  value = '-((I5c32*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (I5c32*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_645 = Coupling(name = 'GC_645',
                  value = '-((complex(0,1)*I5c32*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I5c32*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_646 = Coupling(name = 'GC_646',
                  value = '-((I5c33*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (I5c33*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_647 = Coupling(name = 'GC_647',
                  value = '-((complex(0,1)*I5c33*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I5c33*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_648 = Coupling(name = 'GC_648',
                  value = '-((complex(0,1)*I6c11*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I6c11*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_649 = Coupling(name = 'GC_649',
                  value = '(I6c11*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (I6c11*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_650 = Coupling(name = 'GC_650',
                  value = '-((complex(0,1)*I6c12*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I6c12*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_651 = Coupling(name = 'GC_651',
                  value = '(I6c12*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (I6c12*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_652 = Coupling(name = 'GC_652',
                  value = '-((complex(0,1)*I6c13*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I6c13*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_653 = Coupling(name = 'GC_653',
                  value = '(I6c13*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (I6c13*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_654 = Coupling(name = 'GC_654',
                  value = '-((complex(0,1)*I6c21*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I6c21*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_655 = Coupling(name = 'GC_655',
                  value = '(I6c21*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (I6c21*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_656 = Coupling(name = 'GC_656',
                  value = '-((complex(0,1)*I6c22*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I6c22*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_657 = Coupling(name = 'GC_657',
                  value = '(I6c22*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (I6c22*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_658 = Coupling(name = 'GC_658',
                  value = '-((complex(0,1)*I6c23*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I6c23*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_659 = Coupling(name = 'GC_659',
                  value = '(I6c23*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (I6c23*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_660 = Coupling(name = 'GC_660',
                  value = '-((complex(0,1)*I6c31*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I6c31*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_661 = Coupling(name = 'GC_661',
                  value = '(I6c31*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (I6c31*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_662 = Coupling(name = 'GC_662',
                  value = '-((complex(0,1)*I6c32*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I6c32*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_663 = Coupling(name = 'GC_663',
                  value = '(I6c32*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (I6c32*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_664 = Coupling(name = 'GC_664',
                  value = '-((complex(0,1)*I6c33*k1**2)/((k1 - k2)*(k1 + k2)*vev)) - (complex(0,1)*I6c33*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_665 = Coupling(name = 'GC_665',
                  value = '(I6c33*k1**2)/((k1 - k2)*(k1 + k2)*vev) + (I6c33*k2**2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_666 = Coupling(name = 'GC_666',
                  value = '(complex(0,1)*I9c11*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I9c11*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_667 = Coupling(name = 'GC_667',
                  value = '(complex(0,1)*I9c12*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I9c12*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_668 = Coupling(name = 'GC_668',
                  value = '(complex(0,1)*I9c13*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I9c13*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_669 = Coupling(name = 'GC_669',
                  value = '(complex(0,1)*I9c21*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I9c21*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_670 = Coupling(name = 'GC_670',
                  value = '(complex(0,1)*I9c22*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I9c22*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_671 = Coupling(name = 'GC_671',
                  value = '(complex(0,1)*I9c23*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I9c23*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_672 = Coupling(name = 'GC_672',
                  value = '(complex(0,1)*I9c31*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I9c31*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_673 = Coupling(name = 'GC_673',
                  value = '(complex(0,1)*I9c32*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I9c32*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_674 = Coupling(name = 'GC_674',
                  value = '(complex(0,1)*I9c33*k1**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev) - (complex(0,1)*I9c33*k2**2*cmath.sqrt(2))/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_675 = Coupling(name = 'GC_675',
                  value = '(complex(0,1)*I13c11*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I14c11*k1**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I13c11*k2**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I14c11*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_676 = Coupling(name = 'GC_676',
                  value = '-((I13c11*k1**2)/((-k1 + k2)*(k1 + k2)*vev)) - (I14c11*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (I13c11*k2**2)/((-k1 + k2)*(k1 + k2)*vev) + (I14c11*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_677 = Coupling(name = 'GC_677',
                  value = '(complex(0,1)*I13c22*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I14c22*k1**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I13c22*k2**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I14c22*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_678 = Coupling(name = 'GC_678',
                  value = '-((I13c22*k1**2)/((-k1 + k2)*(k1 + k2)*vev)) - (I14c22*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (I13c22*k2**2)/((-k1 + k2)*(k1 + k2)*vev) + (I14c22*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_679 = Coupling(name = 'GC_679',
                  value = '(complex(0,1)*I13c33*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I14c33*k1**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I13c33*k2**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I14c33*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_680 = Coupling(name = 'GC_680',
                  value = '-((I13c33*k1**2)/((-k1 + k2)*(k1 + k2)*vev)) - (I14c33*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (I13c33*k2**2)/((-k1 + k2)*(k1 + k2)*vev) + (I14c33*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_681 = Coupling(name = 'GC_681',
                  value = '(complex(0,1)*I13c14*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I13c41*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I14c14*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I14c41*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I13c14*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I13c41*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I14c14*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I14c41*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_682 = Coupling(name = 'GC_682',
                  value = '-0.5*(I13c14*k1**2)/((-k1 + k2)*(k1 + k2)*vev) - (I13c41*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (I14c14*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (I14c41*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (I13c14*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (I13c41*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (I14c14*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (I14c41*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_683 = Coupling(name = 'GC_683',
                  value = '(complex(0,1)*I13c44*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I14c44*k1**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I13c44*k2**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I14c44*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_684 = Coupling(name = 'GC_684',
                  value = '-((I13c44*k1**2)/((-k1 + k2)*(k1 + k2)*vev)) - (I14c44*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (I13c44*k2**2)/((-k1 + k2)*(k1 + k2)*vev) + (I14c44*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_685 = Coupling(name = 'GC_685',
                  value = '(complex(0,1)*I13c25*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I13c52*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I14c25*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I14c52*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I13c25*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I13c52*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I14c25*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I14c52*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_686 = Coupling(name = 'GC_686',
                  value = '-0.5*(I13c25*k1**2)/((-k1 + k2)*(k1 + k2)*vev) - (I13c52*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (I14c25*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (I14c52*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (I13c25*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (I13c52*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (I14c25*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (I14c52*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_687 = Coupling(name = 'GC_687',
                  value = '(complex(0,1)*I13c55*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I14c55*k1**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I13c55*k2**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I14c55*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_688 = Coupling(name = 'GC_688',
                  value = '-((I13c55*k1**2)/((-k1 + k2)*(k1 + k2)*vev)) - (I14c55*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (I13c55*k2**2)/((-k1 + k2)*(k1 + k2)*vev) + (I14c55*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_689 = Coupling(name = 'GC_689',
                  value = '(complex(0,1)*I13c36*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I13c63*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I14c36*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I14c63*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I13c36*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I13c63*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I14c36*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I14c63*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_690 = Coupling(name = 'GC_690',
                  value = '-0.5*(I13c36*k1**2)/((-k1 + k2)*(k1 + k2)*vev) - (I13c63*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (I14c36*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (I14c63*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (I13c36*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (I13c63*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (I14c36*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (I14c63*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_691 = Coupling(name = 'GC_691',
                  value = '(complex(0,1)*I13c66*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I14c66*k1**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I13c66*k2**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I14c66*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_692 = Coupling(name = 'GC_692',
                  value = '-((I13c66*k1**2)/((-k1 + k2)*(k1 + k2)*vev)) - (I14c66*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (I13c66*k2**2)/((-k1 + k2)*(k1 + k2)*vev) + (I14c66*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_693 = Coupling(name = 'GC_693',
                  value = '(I15c11*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (I16c11*k1**2)/((-k1 + k2)*(k1 + k2)*vev) - (I15c11*k2**2)/((-k1 + k2)*(k1 + k2)*vev) - (I16c11*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_694 = Coupling(name = 'GC_694',
                  value = '(complex(0,1)*I15c11*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I16c11*k1**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I15c11*k2**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I16c11*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_695 = Coupling(name = 'GC_695',
                  value = '(I15c22*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (I16c22*k1**2)/((-k1 + k2)*(k1 + k2)*vev) - (I15c22*k2**2)/((-k1 + k2)*(k1 + k2)*vev) - (I16c22*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_696 = Coupling(name = 'GC_696',
                  value = '(complex(0,1)*I15c22*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I16c22*k1**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I15c22*k2**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I16c22*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_697 = Coupling(name = 'GC_697',
                  value = '(I15c33*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (I16c33*k1**2)/((-k1 + k2)*(k1 + k2)*vev) - (I15c33*k2**2)/((-k1 + k2)*(k1 + k2)*vev) - (I16c33*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_698 = Coupling(name = 'GC_698',
                  value = '(complex(0,1)*I15c33*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I16c33*k1**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I15c33*k2**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I16c33*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_699 = Coupling(name = 'GC_699',
                  value = '(I15c14*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (I15c41*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (I16c14*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (I16c41*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (I15c14*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (I15c41*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (I16c14*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (I16c41*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_700 = Coupling(name = 'GC_700',
                  value = '(complex(0,1)*I15c14*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I15c41*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I16c14*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I16c41*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I15c14*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I15c41*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I16c14*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I16c41*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_701 = Coupling(name = 'GC_701',
                  value = '(I15c44*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (I16c44*k1**2)/((-k1 + k2)*(k1 + k2)*vev) - (I15c44*k2**2)/((-k1 + k2)*(k1 + k2)*vev) - (I16c44*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_702 = Coupling(name = 'GC_702',
                  value = '(complex(0,1)*I15c44*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I16c44*k1**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I15c44*k2**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I16c44*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_703 = Coupling(name = 'GC_703',
                  value = '(I15c25*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (I15c52*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (I16c25*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (I16c52*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (I15c25*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (I15c52*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (I16c25*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (I16c52*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_704 = Coupling(name = 'GC_704',
                  value = '(complex(0,1)*I15c25*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I15c52*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I16c25*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I16c52*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I15c25*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I15c52*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I16c25*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I16c52*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_705 = Coupling(name = 'GC_705',
                  value = '(I15c55*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (I16c55*k1**2)/((-k1 + k2)*(k1 + k2)*vev) - (I15c55*k2**2)/((-k1 + k2)*(k1 + k2)*vev) - (I16c55*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_706 = Coupling(name = 'GC_706',
                  value = '(complex(0,1)*I15c55*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I16c55*k1**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I15c55*k2**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I16c55*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_707 = Coupling(name = 'GC_707',
                  value = '(I15c36*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (I15c63*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (I16c36*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (I16c63*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (I15c36*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (I15c63*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (I16c36*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (I16c63*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_708 = Coupling(name = 'GC_708',
                  value = '(complex(0,1)*I15c36*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I15c63*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I16c36*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I16c63*k1**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I15c36*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I15c63*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I16c36*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I16c63*k2**2)/(2.*(-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_709 = Coupling(name = 'GC_709',
                  value = '(I15c66*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (I16c66*k1**2)/((-k1 + k2)*(k1 + k2)*vev) - (I15c66*k2**2)/((-k1 + k2)*(k1 + k2)*vev) - (I16c66*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_710 = Coupling(name = 'GC_710',
                  value = '(complex(0,1)*I15c66*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I16c66*k1**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I15c66*k2**2)/((-k1 + k2)*(k1 + k2)*vev) - (complex(0,1)*I16c66*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_711 = Coupling(name = 'GC_711',
                  value = '-((I7c11*k1**2)/((-k1 + k2)*(k1 + k2)*vev)) - (I7c11*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_712 = Coupling(name = 'GC_712',
                  value = '(complex(0,1)*I7c11*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I7c11*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_713 = Coupling(name = 'GC_713',
                  value = '-((I7c12*k1**2)/((-k1 + k2)*(k1 + k2)*vev)) - (I7c12*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_714 = Coupling(name = 'GC_714',
                  value = '(complex(0,1)*I7c12*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I7c12*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_715 = Coupling(name = 'GC_715',
                  value = '-((I7c13*k1**2)/((-k1 + k2)*(k1 + k2)*vev)) - (I7c13*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_716 = Coupling(name = 'GC_716',
                  value = '(complex(0,1)*I7c13*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I7c13*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_717 = Coupling(name = 'GC_717',
                  value = '-((I7c21*k1**2)/((-k1 + k2)*(k1 + k2)*vev)) - (I7c21*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_718 = Coupling(name = 'GC_718',
                  value = '(complex(0,1)*I7c21*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I7c21*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_719 = Coupling(name = 'GC_719',
                  value = '-((I7c22*k1**2)/((-k1 + k2)*(k1 + k2)*vev)) - (I7c22*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_720 = Coupling(name = 'GC_720',
                  value = '(complex(0,1)*I7c22*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I7c22*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_721 = Coupling(name = 'GC_721',
                  value = '-((I7c23*k1**2)/((-k1 + k2)*(k1 + k2)*vev)) - (I7c23*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_722 = Coupling(name = 'GC_722',
                  value = '(complex(0,1)*I7c23*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I7c23*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_723 = Coupling(name = 'GC_723',
                  value = '-((I7c31*k1**2)/((-k1 + k2)*(k1 + k2)*vev)) - (I7c31*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_724 = Coupling(name = 'GC_724',
                  value = '(complex(0,1)*I7c31*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I7c31*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_725 = Coupling(name = 'GC_725',
                  value = '-((I7c32*k1**2)/((-k1 + k2)*(k1 + k2)*vev)) - (I7c32*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_726 = Coupling(name = 'GC_726',
                  value = '(complex(0,1)*I7c32*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I7c32*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_727 = Coupling(name = 'GC_727',
                  value = '-((I7c33*k1**2)/((-k1 + k2)*(k1 + k2)*vev)) - (I7c33*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_728 = Coupling(name = 'GC_728',
                  value = '(complex(0,1)*I7c33*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I7c33*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_729 = Coupling(name = 'GC_729',
                  value = '(complex(0,1)*I8c11*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I8c11*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_730 = Coupling(name = 'GC_730',
                  value = '(I8c11*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (I8c11*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_731 = Coupling(name = 'GC_731',
                  value = '(complex(0,1)*I8c12*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I8c12*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_732 = Coupling(name = 'GC_732',
                  value = '(I8c12*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (I8c12*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_733 = Coupling(name = 'GC_733',
                  value = '(complex(0,1)*I8c13*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I8c13*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_734 = Coupling(name = 'GC_734',
                  value = '(I8c13*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (I8c13*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_735 = Coupling(name = 'GC_735',
                  value = '(complex(0,1)*I8c21*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I8c21*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_736 = Coupling(name = 'GC_736',
                  value = '(I8c21*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (I8c21*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_737 = Coupling(name = 'GC_737',
                  value = '(complex(0,1)*I8c22*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I8c22*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_738 = Coupling(name = 'GC_738',
                  value = '(I8c22*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (I8c22*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_739 = Coupling(name = 'GC_739',
                  value = '(complex(0,1)*I8c23*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I8c23*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_740 = Coupling(name = 'GC_740',
                  value = '(I8c23*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (I8c23*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_741 = Coupling(name = 'GC_741',
                  value = '(complex(0,1)*I8c31*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I8c31*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_742 = Coupling(name = 'GC_742',
                  value = '(I8c31*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (I8c31*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_743 = Coupling(name = 'GC_743',
                  value = '(complex(0,1)*I8c32*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I8c32*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_744 = Coupling(name = 'GC_744',
                  value = '(I8c32*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (I8c32*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_745 = Coupling(name = 'GC_745',
                  value = '(complex(0,1)*I8c33*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (complex(0,1)*I8c33*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_746 = Coupling(name = 'GC_746',
                  value = '(I8c33*k1**2)/((-k1 + k2)*(k1 + k2)*vev) + (I8c33*k2**2)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_747 = Coupling(name = 'GC_747',
                  value = '-0.5*(cw*cxi*complex(0,1)*gw**2*k1**2*sphi)/vev + (cw*cxi*complex(0,1)*gw**2*k2**2*sphi)/(2.*vev)',
                  order = {'QED':1})

GC_748 = Coupling(name = 'GC_748',
                  value = '-0.5*(cxi*complex(0,1)*gw**2*k1**2*sw)/vev + (cxi*complex(0,1)*gw**2*k2**2*sw)/(2.*vev)',
                  order = {'QED':1})

GC_749 = Coupling(name = 'GC_749',
                  value = '(cphi**2*complex(0,1)*gw**2*k1**2)/(2.*cw**2*vev) + (cphi**2*complex(0,1)*gw**2*k2**2)/(2.*cw**2*vev) + (cw**2*complex(0,1)*gw**2*k1**2*sphi**2)/(2.*vev) + (cw**2*complex(0,1)*gw**2*k2**2*sphi**2)/(2.*vev) - (cphi**2*complex(0,1)*gw**2*k1**2*sw**2)/(cw**2*vev) - (cphi**2*complex(0,1)*gw**2*k2**2*sw**2)/(cw**2*vev) + (complex(0,1)*gw**2*k1**2*sphi**2*sw**2)/vev + (complex(0,1)*gw**2*k2**2*sphi**2*sw**2)/vev + (complex(0,1)*gw**2*k1**2*sphi**2*sw**4)/(2.*cw**2*vev) + (complex(0,1)*gw**2*k2**2*sphi**2*sw**4)/(2.*cw**2*vev) - (cphi*complex(0,1)*gw**2*k1**2*sphi*cmath.sqrt(1 - 2*sw**2))/vev - (cphi*complex(0,1)*gw**2*k2**2*sphi*cmath.sqrt(1 - 2*sw**2))/vev - (cphi*complex(0,1)*gw**2*k1**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/(cw**2*vev) - (cphi*complex(0,1)*gw**2*k2**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/(cw**2*vev)',
                  order = {'QED':1})

GC_750 = Coupling(name = 'GC_750',
                  value = '(cphi**2*cw**2*complex(0,1)*gw**2*k1**2)/(2.*vev) + (cphi**2*cw**2*complex(0,1)*gw**2*k2**2)/(2.*vev) + (complex(0,1)*gw**2*k1**2*sphi**2)/(2.*cw**2*vev) + (complex(0,1)*gw**2*k2**2*sphi**2)/(2.*cw**2*vev) + (cphi**2*complex(0,1)*gw**2*k1**2*sw**2)/vev + (cphi**2*complex(0,1)*gw**2*k2**2*sw**2)/vev - (complex(0,1)*gw**2*k1**2*sphi**2*sw**2)/(cw**2*vev) - (complex(0,1)*gw**2*k2**2*sphi**2*sw**2)/(cw**2*vev) + (cphi**2*complex(0,1)*gw**2*k1**2*sw**4)/(2.*cw**2*vev) + (cphi**2*complex(0,1)*gw**2*k2**2*sw**4)/(2.*cw**2*vev) + (cphi*complex(0,1)*gw**2*k1**2*sphi*cmath.sqrt(1 - 2*sw**2))/vev + (cphi*complex(0,1)*gw**2*k2**2*sphi*cmath.sqrt(1 - 2*sw**2))/vev + (cphi*complex(0,1)*gw**2*k1**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/(cw**2*vev) + (cphi*complex(0,1)*gw**2*k2**2*sphi*sw**2*cmath.sqrt(1 - 2*sw**2))/(cw**2*vev)',
                  order = {'QED':1})

GC_751 = Coupling(name = 'GC_751',
                  value = '-0.5*(cphi*complex(0,1)*gw**2*k1**2*sphi)/(cw**2*vev) + (cphi*cw**2*complex(0,1)*gw**2*k1**2*sphi)/(2.*vev) - (cphi*complex(0,1)*gw**2*k2**2*sphi)/(2.*cw**2*vev) + (cphi*cw**2*complex(0,1)*gw**2*k2**2*sphi)/(2.*vev) + (cphi*complex(0,1)*gw**2*k1**2*sphi*sw**2)/vev + (cphi*complex(0,1)*gw**2*k1**2*sphi*sw**2)/(cw**2*vev) + (cphi*complex(0,1)*gw**2*k2**2*sphi*sw**2)/vev + (cphi*complex(0,1)*gw**2*k2**2*sphi*sw**2)/(cw**2*vev) + (cphi*complex(0,1)*gw**2*k1**2*sphi*sw**4)/(2.*cw**2*vev) + (cphi*complex(0,1)*gw**2*k2**2*sphi*sw**4)/(2.*cw**2*vev) - (cphi**2*complex(0,1)*gw**2*k1**2*cmath.sqrt(1 - 2*sw**2))/(2.*vev) - (cphi**2*complex(0,1)*gw**2*k2**2*cmath.sqrt(1 - 2*sw**2))/(2.*vev) + (complex(0,1)*gw**2*k1**2*sphi**2*cmath.sqrt(1 - 2*sw**2))/(2.*vev) + (complex(0,1)*gw**2*k2**2*sphi**2*cmath.sqrt(1 - 2*sw**2))/(2.*vev) - (cphi**2*complex(0,1)*gw**2*k1**2*sw**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw**2*vev) - (cphi**2*complex(0,1)*gw**2*k2**2*sw**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw**2*vev) + (complex(0,1)*gw**2*k1**2*sphi**2*sw**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw**2*vev) + (complex(0,1)*gw**2*k2**2*sphi**2*sw**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw**2*vev)',
                  order = {'QED':1})

GC_752 = Coupling(name = 'GC_752',
                  value = '(cphi*cxi*complex(0,1)*gw**2*k1**2*sw**2)/(2.*cw*vev) + (cphi*cxi*complex(0,1)*gw**2*k2**2*sw**2)/(2.*cw*vev) - (cphi*cw*complex(0,1)*gw**2*k1*k2*sxi)/vev + (cxi*complex(0,1)*gw**2*k1**2*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev) + (cxi*complex(0,1)*gw**2*k2**2*sphi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev)',
                  order = {'QED':1})

GC_753 = Coupling(name = 'GC_753',
                  value = '(cphi*cw*complex(0,1)*gw**2*k1**2*sxi)/(2.*vev) - (cphi*cw*complex(0,1)*gw**2*k2**2*sxi)/(2.*vev)',
                  order = {'QED':1})

GC_754 = Coupling(name = 'GC_754',
                  value = '(cxi*complex(0,1)*gw**2*k1**2*sxi)/vev - (cxi*complex(0,1)*gw**2*k2**2*sxi)/vev',
                  order = {'QED':1})

GC_755 = Coupling(name = 'GC_755',
                  value = '-((cxi*complex(0,1)*gw**2*k1**2*sxi)/vev) + (cxi*complex(0,1)*gw**2*k2**2*sxi)/vev',
                  order = {'QED':1})

GC_756 = Coupling(name = 'GC_756',
                  value = '(cxi*complex(0,1)*gw**2*k1**2*sphi*sw**2)/(2.*cw*vev) + (cxi*complex(0,1)*gw**2*k2**2*sphi*sw**2)/(2.*cw*vev) - (cw*complex(0,1)*gw**2*k1*k2*sphi*sxi)/vev - (cphi*cxi*complex(0,1)*gw**2*k1**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev) - (cphi*cxi*complex(0,1)*gw**2*k2**2*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev)',
                  order = {'QED':1})

GC_757 = Coupling(name = 'GC_757',
                  value = '(cw*complex(0,1)*gw**2*k1**2*sphi*sxi)/(2.*vev) - (cw*complex(0,1)*gw**2*k2**2*sphi*sxi)/(2.*vev)',
                  order = {'QED':1})

GC_758 = Coupling(name = 'GC_758',
                  value = '-0.5*(cxi*complex(0,1)*gw**2*k1**2*sw)/vev - (cxi*complex(0,1)*gw**2*k2**2*sw)/(2.*vev) - (complex(0,1)*gw**2*k1*k2*sw*sxi)/vev',
                  order = {'QED':1})

GC_759 = Coupling(name = 'GC_759',
                  value = '(cxi*complex(0,1)*gw**2*k1*k2*sw)/vev - (complex(0,1)*gw**2*k1**2*sw*sxi)/(2.*vev) - (complex(0,1)*gw**2*k2**2*sw*sxi)/(2.*vev)',
                  order = {'QED':1})

GC_760 = Coupling(name = 'GC_760',
                  value = '(complex(0,1)*gw**2*k1**2*sw*sxi)/(2.*vev) - (complex(0,1)*gw**2*k2**2*sw*sxi)/(2.*vev)',
                  order = {'QED':1})

GC_761 = Coupling(name = 'GC_761',
                  value = '(cw*cxi*complex(0,1)*gw**2*k1*k2*sphi)/vev + (complex(0,1)*gw**2*k1**2*sphi*sw**2*sxi)/(2.*cw*vev) + (complex(0,1)*gw**2*k2**2*sphi*sw**2*sxi)/(2.*cw*vev) - (cphi*complex(0,1)*gw**2*k1**2*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev) - (cphi*complex(0,1)*gw**2*k2**2*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev)',
                  order = {'QED':1})

GC_762 = Coupling(name = 'GC_762',
                  value = '(cphi*cw*cxi*complex(0,1)*gw**2*k1*k2)/vev + (cphi*complex(0,1)*gw**2*k1**2*sw**2*sxi)/(2.*cw*vev) + (cphi*complex(0,1)*gw**2*k2**2*sw**2*sxi)/(2.*cw*vev) + (complex(0,1)*gw**2*k1**2*sphi*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev) + (complex(0,1)*gw**2*k2**2*sphi*sxi*cmath.sqrt(1 - 2*sw**2))/(2.*cw*vev)',
                  order = {'QED':1})

GC_763 = Coupling(name = 'GC_763',
                  value = '-((cxi**2*gw**2*k1*k2)/vev) - (gw**2*k1*k2*sxi**2)/vev',
                  order = {'QED':1})

GC_764 = Coupling(name = 'GC_764',
                  value = '-((cxi**2*complex(0,1)*gw**2*k1*k2)/vev) + (complex(0,1)*gw**2*k1*k2*sxi**2)/vev',
                  order = {'QED':1})

GC_765 = Coupling(name = 'GC_765',
                  value = '(cxi**2*gw**2*k1*k2)/vev + (gw**2*k1*k2*sxi**2)/vev',
                  order = {'QED':1})

GC_766 = Coupling(name = 'GC_766',
                  value = '(cxi**2*gw**2*k1**2)/(2.*vev) - (cxi**2*gw**2*k2**2)/(2.*vev) + (gw**2*k1**2*sxi**2)/(2.*vev) - (gw**2*k2**2*sxi**2)/(2.*vev)',
                  order = {'QED':1})

GC_767 = Coupling(name = 'GC_767',
                  value = '-0.5*(cxi**2*complex(0,1)*gw**2*k1**2)/vev + (cxi**2*complex(0,1)*gw**2*k2**2)/(2.*vev) + (complex(0,1)*gw**2*k1**2*sxi**2)/(2.*vev) - (complex(0,1)*gw**2*k2**2*sxi**2)/(2.*vev)',
                  order = {'QED':1})

GC_768 = Coupling(name = 'GC_768',
                  value = '(cxi**2*complex(0,1)*gw**2*k1**2)/(2.*vev) + (cxi**2*complex(0,1)*gw**2*k2**2)/(2.*vev) - (2*cxi*complex(0,1)*gw**2*k1*k2*sxi)/vev + (complex(0,1)*gw**2*k1**2*sxi**2)/(2.*vev) + (complex(0,1)*gw**2*k2**2*sxi**2)/(2.*vev)',
                  order = {'QED':1})

GC_769 = Coupling(name = 'GC_769',
                  value = '(cxi**2*complex(0,1)*gw**2*k1**2)/(2.*vev) + (cxi**2*complex(0,1)*gw**2*k2**2)/(2.*vev) + (2*cxi*complex(0,1)*gw**2*k1*k2*sxi)/vev + (complex(0,1)*gw**2*k1**2*sxi**2)/(2.*vev) + (complex(0,1)*gw**2*k2**2*sxi**2)/(2.*vev)',
                  order = {'QED':1})

GC_770 = Coupling(name = 'GC_770',
                  value = '-0.5*(cxi**2*gw**2*k1**2)/vev + (cxi**2*gw**2*k2**2)/(2.*vev) - (gw**2*k1**2*sxi**2)/(2.*vev) + (gw**2*k2**2*sxi**2)/(2.*vev)',
                  order = {'QED':1})

GC_771 = Coupling(name = 'GC_771',
                  value = '-((alpha3*k1*k2)/vev**2)',
                  order = {'QED':2})

GC_772 = Coupling(name = 'GC_772',
                  value = '-((alpha3*complex(0,1)*k1*k2)/vev**2)',
                  order = {'QED':2})

GC_773 = Coupling(name = 'GC_773',
                  value = '(alpha3*complex(0,1)*k1*k2)/vev**2',
                  order = {'QED':2})

GC_774 = Coupling(name = 'GC_774',
                  value = '(alpha3*k1*k2)/vev**2',
                  order = {'QED':2})

GC_775 = Coupling(name = 'GC_775',
                  value = '-((alpha3*k1*k2)/(vev**2*cmath.sqrt(2)))',
                  order = {'QED':2})

GC_776 = Coupling(name = 'GC_776',
                  value = '-((alpha3*complex(0,1)*k1*k2)/(vev**2*cmath.sqrt(2)))',
                  order = {'QED':2})

GC_777 = Coupling(name = 'GC_777',
                  value = '(alpha3*complex(0,1)*k1*k2)/(vev**2*cmath.sqrt(2))',
                  order = {'QED':2})

GC_778 = Coupling(name = 'GC_778',
                  value = '(alpha3*k1*k2)/(vev**2*cmath.sqrt(2))',
                  order = {'QED':2})

GC_779 = Coupling(name = 'GC_779',
                  value = '(-4*cxi*complex(0,1)*gw**2*k1*k2*sxi)/vev**2',
                  order = {'QED':2})

GC_780 = Coupling(name = 'GC_780',
                  value = '(4*cxi*complex(0,1)*gw**2*k1*k2*sxi)/vev**2',
                  order = {'QED':2})

GC_781 = Coupling(name = 'GC_781',
                  value = '(alpha3*complex(0,1)*k1*k2)/vev',
                  order = {'QED':1})

GC_782 = Coupling(name = 'GC_782',
                  value = '-((alpha3*k1*k2)/(vev*cmath.sqrt(2)))',
                  order = {'QED':1})

GC_783 = Coupling(name = 'GC_783',
                  value = '-((alpha3*complex(0,1)*k1*k2)/(vev*cmath.sqrt(2)))',
                  order = {'QED':1})

GC_784 = Coupling(name = 'GC_784',
                  value = '(alpha3*k1*k2)/(vev*cmath.sqrt(2))',
                  order = {'QED':1})

GC_785 = Coupling(name = 'GC_785',
                  value = 'cxi**2*complex(0,1)*gw**2*vL',
                  order = {'QED':1})

GC_786 = Coupling(name = 'GC_786',
                  value = '-(cxi**2*complex(0,1)*gw**2*vL*cmath.sqrt(2))',
                  order = {'QED':1})

GC_787 = Coupling(name = 'GC_787',
                  value = '-2*complex(0,1)*rho1*vL',
                  order = {'QED':1})

GC_788 = Coupling(name = 'GC_788',
                  value = '-6*complex(0,1)*rho1*vL',
                  order = {'QED':1})

GC_789 = Coupling(name = 'GC_789',
                  value = '-2*complex(0,1)*rho2*vL*cmath.sqrt(2)',
                  order = {'QED':1})

GC_790 = Coupling(name = 'GC_790',
                  value = '-(complex(0,1)*rho3*vL)',
                  order = {'QED':1})

GC_791 = Coupling(name = 'GC_791',
                  value = '-2*rho4*vL',
                  order = {'QED':1})

GC_792 = Coupling(name = 'GC_792',
                  value = '-2*complex(0,1)*rho4*vL',
                  order = {'QED':1})

GC_793 = Coupling(name = 'GC_793',
                  value = '2*rho4*vL',
                  order = {'QED':1})

GC_794 = Coupling(name = 'GC_794',
                  value = '-2*complex(0,1)*rho4*vL*cmath.sqrt(2)',
                  order = {'QED':1})

GC_795 = Coupling(name = 'GC_795',
                  value = 'cxi*complex(0,1)*gw**2*sxi*vL',
                  order = {'QED':1})

GC_796 = Coupling(name = 'GC_796',
                  value = '-(cxi*complex(0,1)*gw**2*sxi*vL*cmath.sqrt(2))',
                  order = {'QED':1})

GC_797 = Coupling(name = 'GC_797',
                  value = 'complex(0,1)*gw**2*sxi**2*vL',
                  order = {'QED':1})

GC_798 = Coupling(name = 'GC_798',
                  value = '-(complex(0,1)*gw**2*sxi**2*vL*cmath.sqrt(2))',
                  order = {'QED':1})

GC_799 = Coupling(name = 'GC_799',
                  value = '-((alpha3*k1*k2*vL)/(vev**2*cmath.sqrt(2)))',
                  order = {'QED':1})

GC_800 = Coupling(name = 'GC_800',
                  value = '-((alpha3*complex(0,1)*k1*k2*vL)/(vev**2*cmath.sqrt(2)))',
                  order = {'QED':1})

GC_801 = Coupling(name = 'GC_801',
                  value = '(alpha3*complex(0,1)*k1*k2*vL)/(vev**2*cmath.sqrt(2))',
                  order = {'QED':1})

GC_802 = Coupling(name = 'GC_802',
                  value = '(alpha3*k1*k2*vL)/(vev**2*cmath.sqrt(2))',
                  order = {'QED':1})

GC_803 = Coupling(name = 'GC_803',
                  value = '-2*complex(0,1)*rho1*vL - 4*complex(0,1)*rho2*vL',
                  order = {'QED':1})

GC_804 = Coupling(name = 'GC_804',
                  value = '-((cxi*complex(0,1)*gw**2*sw*vL)/cmath.sqrt(2)) + cxi*complex(0,1)*g1*gw*vL*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2)',
                  order = {'QED':1})

GC_805 = Coupling(name = 'GC_805',
                  value = '2*complex(0,1)*g1**2*vL - 4*complex(0,1)*g1**2*sw**2*vL + 2*complex(0,1)*gw**2*sw**2*vL - 4*complex(0,1)*g1*gw*sw*vL*cmath.sqrt(1 - 2*sw**2)',
                  order = {'QED':1})

GC_806 = Coupling(name = 'GC_806',
                  value = '-((cphi*cw*cxi*complex(0,1)*gw**2*vL)/cmath.sqrt(2)) + (cxi*complex(0,1)*g1*gw*sphi*sw*vL*cmath.sqrt(2))/cw - (cphi*cxi*complex(0,1)*g1*gw*sw*vL*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_807 = Coupling(name = 'GC_807',
                  value = '-((cw*cxi*complex(0,1)*gw**2*sphi*vL)/cmath.sqrt(2)) - (cphi*cxi*complex(0,1)*g1*gw*sw*vL*cmath.sqrt(2))/cw - (cxi*complex(0,1)*g1*gw*sphi*sw*vL*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_808 = Coupling(name = 'GC_808',
                  value = '(-2*cphi*complex(0,1)*g1**2*sw*vL)/cw + 2*cphi*cw*complex(0,1)*gw**2*sw*vL - (2*complex(0,1)*g1*gw*sphi*sw**2*vL)/cw + (4*cphi*complex(0,1)*g1**2*sw**3*vL)/cw - 2*cphi*cw*complex(0,1)*g1*gw*vL*cmath.sqrt(1 - 2*sw**2) + (2*complex(0,1)*g1**2*sphi*sw*vL*cmath.sqrt(1 - 2*sw**2))/cw + (2*cphi*complex(0,1)*g1*gw*sw**2*vL*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_809 = Coupling(name = 'GC_809',
                  value = '2*cphi**2*cw**2*complex(0,1)*gw**2*vL - 4*cphi*complex(0,1)*g1*gw*sphi*sw*vL + (2*cphi**2*complex(0,1)*g1**2*sw**2*vL)/cw**2 + (2*complex(0,1)*g1**2*sphi**2*sw**2*vL)/cw**2 - (4*cphi**2*complex(0,1)*g1**2*sw**4*vL)/cw**2 + 4*cphi**2*complex(0,1)*g1*gw*sw*vL*cmath.sqrt(1 - 2*sw**2) - (4*cphi*complex(0,1)*g1**2*sphi*sw**2*vL*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':1})

GC_810 = Coupling(name = 'GC_810',
                  value = '2*cw**2*complex(0,1)*gw**2*sphi**2*vL + 4*cphi*complex(0,1)*g1*gw*sphi*sw*vL + (2*cphi**2*complex(0,1)*g1**2*sw**2*vL)/cw**2 + (2*complex(0,1)*g1**2*sphi**2*sw**2*vL)/cw**2 - (4*complex(0,1)*g1**2*sphi**2*sw**4*vL)/cw**2 + 4*complex(0,1)*g1*gw*sphi**2*sw*vL*cmath.sqrt(1 - 2*sw**2) + (4*cphi*complex(0,1)*g1**2*sphi*sw**2*vL*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':1})

GC_811 = Coupling(name = 'GC_811',
                  value = '(-2*complex(0,1)*g1**2*sphi*sw*vL)/cw + 2*cw*complex(0,1)*gw**2*sphi*sw*vL + (2*cphi*complex(0,1)*g1*gw*sw**2*vL)/cw + (4*complex(0,1)*g1**2*sphi*sw**3*vL)/cw - 2*cw*complex(0,1)*g1*gw*sphi*vL*cmath.sqrt(1 - 2*sw**2) - (2*cphi*complex(0,1)*g1**2*sw*vL*cmath.sqrt(1 - 2*sw**2))/cw + (2*complex(0,1)*g1*gw*sphi*sw**2*vL*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_812 = Coupling(name = 'GC_812',
                  value = '2*cphi*cw**2*complex(0,1)*gw**2*sphi*vL + 2*cphi**2*complex(0,1)*g1*gw*sw*vL - 2*complex(0,1)*g1*gw*sphi**2*sw*vL - (4*cphi*complex(0,1)*g1**2*sphi*sw**4*vL)/cw**2 + 4*cphi*complex(0,1)*g1*gw*sphi*sw*vL*cmath.sqrt(1 - 2*sw**2) + (2*cphi**2*complex(0,1)*g1**2*sw**2*vL*cmath.sqrt(1 - 2*sw**2))/cw**2 - (2*complex(0,1)*g1**2*sphi**2*sw**2*vL*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':1})

GC_813 = Coupling(name = 'GC_813',
                  value = '-((complex(0,1)*gw**2*sw*sxi*vL)/cmath.sqrt(2)) + complex(0,1)*g1*gw*sxi*vL*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2)',
                  order = {'QED':1})

GC_814 = Coupling(name = 'GC_814',
                  value = '-((cphi*cw*complex(0,1)*gw**2*sxi*vL)/cmath.sqrt(2)) + (complex(0,1)*g1*gw*sphi*sw*sxi*vL*cmath.sqrt(2))/cw - (cphi*complex(0,1)*g1*gw*sw*sxi*vL*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_815 = Coupling(name = 'GC_815',
                  value = '-((cw*complex(0,1)*gw**2*sphi*sxi*vL)/cmath.sqrt(2)) - (cphi*complex(0,1)*g1*gw*sw*sxi*vL*cmath.sqrt(2))/cw - (complex(0,1)*g1*gw*sphi*sw*sxi*vL*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_816 = Coupling(name = 'GC_816',
                  value = '-((alpha1*complex(0,1)*k1**2*vL)/vev**2) - (alpha3*complex(0,1)*k1**2*vL)/vev**2 - (4*alpha2*complex(0,1)*k1*k2*vL)/vev**2 - (alpha1*complex(0,1)*k2**2*vL)/vev**2',
                  order = {'QED':1})

GC_817 = Coupling(name = 'GC_817',
                  value = '-((alpha1*complex(0,1)*k1**2*vL)/vev**2) - (alpha3*complex(0,1)*k1**2*vL)/vev**2 + (4*alpha2*complex(0,1)*k1*k2*vL)/vev**2 - (alpha1*complex(0,1)*k2**2*vL)/vev**2',
                  order = {'QED':1})

GC_818 = Coupling(name = 'GC_818',
                  value = '(2*alpha2*complex(0,1)*k1**2*vL)/vev**2 - (alpha3*complex(0,1)*k1*k2*vL)/vev**2 - (2*alpha2*complex(0,1)*k2**2*vL)/vev**2',
                  order = {'QED':1})

GC_819 = Coupling(name = 'GC_819',
                  value = '(-2*alpha2*complex(0,1)*k1**2*vL)/vev**2 - (alpha3*complex(0,1)*k1*k2*vL)/vev**2 + (2*alpha2*complex(0,1)*k2**2*vL)/vev**2',
                  order = {'QED':1})

GC_820 = Coupling(name = 'GC_820',
                  value = '-((alpha1*complex(0,1)*k1**2*vL)/vev**2) - (4*alpha2*complex(0,1)*k1*k2*vL)/vev**2 - (alpha1*complex(0,1)*k2**2*vL)/vev**2 - (alpha3*complex(0,1)*k2**2*vL)/vev**2',
                  order = {'QED':1})

GC_821 = Coupling(name = 'GC_821',
                  value = '-((alpha1*complex(0,1)*k1**2*vL)/vev**2) + (4*alpha2*complex(0,1)*k1*k2*vL)/vev**2 - (alpha1*complex(0,1)*k2**2*vL)/vev**2 - (alpha3*complex(0,1)*k2**2*vL)/vev**2',
                  order = {'QED':1})

GC_822 = Coupling(name = 'GC_822',
                  value = '(alpha3*k1**2*vL)/(2.*vev**2*cmath.sqrt(2)) - (alpha3*k2**2*vL)/(2.*vev**2*cmath.sqrt(2))',
                  order = {'QED':1})

GC_823 = Coupling(name = 'GC_823',
                  value = '-0.5*(alpha3*complex(0,1)*k1**2*vL)/(vev**2*cmath.sqrt(2)) + (alpha3*complex(0,1)*k2**2*vL)/(2.*vev**2*cmath.sqrt(2))',
                  order = {'QED':1})

GC_824 = Coupling(name = 'GC_824',
                  value = '-0.5*(alpha3*k1**2*vL)/(vev**2*cmath.sqrt(2)) + (alpha3*k2**2*vL)/(2.*vev**2*cmath.sqrt(2))',
                  order = {'QED':1})

GC_825 = Coupling(name = 'GC_825',
                  value = '-0.5*I31c11/vR - I32c11/(2.*vR)',
                  order = {'QED':1})

GC_826 = Coupling(name = 'GC_826',
                  value = '-0.5*(complex(0,1)*I31c11)/vR - (complex(0,1)*I32c11)/(2.*vR)',
                  order = {'QED':1})

GC_827 = Coupling(name = 'GC_827',
                  value = '-0.5*I31c22/vR - I32c22/(2.*vR)',
                  order = {'QED':1})

GC_828 = Coupling(name = 'GC_828',
                  value = '-0.5*(complex(0,1)*I31c22)/vR - (complex(0,1)*I32c22)/(2.*vR)',
                  order = {'QED':1})

GC_829 = Coupling(name = 'GC_829',
                  value = '-0.5*I31c33/vR - I32c33/(2.*vR)',
                  order = {'QED':1})

GC_830 = Coupling(name = 'GC_830',
                  value = '-0.5*(complex(0,1)*I31c33)/vR - (complex(0,1)*I32c33)/(2.*vR)',
                  order = {'QED':1})

GC_831 = Coupling(name = 'GC_831',
                  value = '-0.25*I31c14/vR - I31c41/(4.*vR) - I32c14/(4.*vR) - I32c41/(4.*vR)',
                  order = {'QED':1})

GC_832 = Coupling(name = 'GC_832',
                  value = '-0.25*(complex(0,1)*I31c14)/vR - (complex(0,1)*I31c41)/(4.*vR) - (complex(0,1)*I32c14)/(4.*vR) - (complex(0,1)*I32c41)/(4.*vR)',
                  order = {'QED':1})

GC_833 = Coupling(name = 'GC_833',
                  value = '-0.5*I31c44/vR - I32c44/(2.*vR)',
                  order = {'QED':1})

GC_834 = Coupling(name = 'GC_834',
                  value = '-0.5*(complex(0,1)*I31c44)/vR - (complex(0,1)*I32c44)/(2.*vR)',
                  order = {'QED':1})

GC_835 = Coupling(name = 'GC_835',
                  value = '-0.25*I31c25/vR - I31c52/(4.*vR) - I32c25/(4.*vR) - I32c52/(4.*vR)',
                  order = {'QED':1})

GC_836 = Coupling(name = 'GC_836',
                  value = '-0.25*(complex(0,1)*I31c25)/vR - (complex(0,1)*I31c52)/(4.*vR) - (complex(0,1)*I32c25)/(4.*vR) - (complex(0,1)*I32c52)/(4.*vR)',
                  order = {'QED':1})

GC_837 = Coupling(name = 'GC_837',
                  value = '-0.5*I31c55/vR - I32c55/(2.*vR)',
                  order = {'QED':1})

GC_838 = Coupling(name = 'GC_838',
                  value = '-0.5*(complex(0,1)*I31c55)/vR - (complex(0,1)*I32c55)/(2.*vR)',
                  order = {'QED':1})

GC_839 = Coupling(name = 'GC_839',
                  value = '-0.25*I31c36/vR - I31c63/(4.*vR) - I32c36/(4.*vR) - I32c63/(4.*vR)',
                  order = {'QED':1})

GC_840 = Coupling(name = 'GC_840',
                  value = '-0.25*(complex(0,1)*I31c36)/vR - (complex(0,1)*I31c63)/(4.*vR) - (complex(0,1)*I32c36)/(4.*vR) - (complex(0,1)*I32c63)/(4.*vR)',
                  order = {'QED':1})

GC_841 = Coupling(name = 'GC_841',
                  value = '-0.5*I31c66/vR - I32c66/(2.*vR)',
                  order = {'QED':1})

GC_842 = Coupling(name = 'GC_842',
                  value = '-0.5*(complex(0,1)*I31c66)/vR - (complex(0,1)*I32c66)/(2.*vR)',
                  order = {'QED':1})

GC_843 = Coupling(name = 'GC_843',
                  value = '-0.5*(complex(0,1)*I33c11)/vR - (complex(0,1)*I34c11)/(2.*vR)',
                  order = {'QED':1})

GC_844 = Coupling(name = 'GC_844',
                  value = 'I33c11/(2.*vR) + I34c11/(2.*vR)',
                  order = {'QED':1})

GC_845 = Coupling(name = 'GC_845',
                  value = '-0.5*(complex(0,1)*I33c22)/vR - (complex(0,1)*I34c22)/(2.*vR)',
                  order = {'QED':1})

GC_846 = Coupling(name = 'GC_846',
                  value = 'I33c22/(2.*vR) + I34c22/(2.*vR)',
                  order = {'QED':1})

GC_847 = Coupling(name = 'GC_847',
                  value = '-0.5*(complex(0,1)*I33c33)/vR - (complex(0,1)*I34c33)/(2.*vR)',
                  order = {'QED':1})

GC_848 = Coupling(name = 'GC_848',
                  value = 'I33c33/(2.*vR) + I34c33/(2.*vR)',
                  order = {'QED':1})

GC_849 = Coupling(name = 'GC_849',
                  value = '-0.25*(complex(0,1)*I33c14)/vR - (complex(0,1)*I33c41)/(4.*vR) - (complex(0,1)*I34c14)/(4.*vR) - (complex(0,1)*I34c41)/(4.*vR)',
                  order = {'QED':1})

GC_850 = Coupling(name = 'GC_850',
                  value = 'I33c14/(4.*vR) + I33c41/(4.*vR) + I34c14/(4.*vR) + I34c41/(4.*vR)',
                  order = {'QED':1})

GC_851 = Coupling(name = 'GC_851',
                  value = '-0.5*(complex(0,1)*I33c44)/vR - (complex(0,1)*I34c44)/(2.*vR)',
                  order = {'QED':1})

GC_852 = Coupling(name = 'GC_852',
                  value = 'I33c44/(2.*vR) + I34c44/(2.*vR)',
                  order = {'QED':1})

GC_853 = Coupling(name = 'GC_853',
                  value = '-0.25*(complex(0,1)*I33c25)/vR - (complex(0,1)*I33c52)/(4.*vR) - (complex(0,1)*I34c25)/(4.*vR) - (complex(0,1)*I34c52)/(4.*vR)',
                  order = {'QED':1})

GC_854 = Coupling(name = 'GC_854',
                  value = 'I33c25/(4.*vR) + I33c52/(4.*vR) + I34c25/(4.*vR) + I34c52/(4.*vR)',
                  order = {'QED':1})

GC_855 = Coupling(name = 'GC_855',
                  value = '-0.5*(complex(0,1)*I33c55)/vR - (complex(0,1)*I34c55)/(2.*vR)',
                  order = {'QED':1})

GC_856 = Coupling(name = 'GC_856',
                  value = 'I33c55/(2.*vR) + I34c55/(2.*vR)',
                  order = {'QED':1})

GC_857 = Coupling(name = 'GC_857',
                  value = '-0.25*(complex(0,1)*I33c36)/vR - (complex(0,1)*I33c63)/(4.*vR) - (complex(0,1)*I34c36)/(4.*vR) - (complex(0,1)*I34c63)/(4.*vR)',
                  order = {'QED':1})

GC_858 = Coupling(name = 'GC_858',
                  value = 'I33c36/(4.*vR) + I33c63/(4.*vR) + I34c36/(4.*vR) + I34c63/(4.*vR)',
                  order = {'QED':1})

GC_859 = Coupling(name = 'GC_859',
                  value = '-0.5*(complex(0,1)*I33c66)/vR - (complex(0,1)*I34c66)/(2.*vR)',
                  order = {'QED':1})

GC_860 = Coupling(name = 'GC_860',
                  value = 'I33c66/(2.*vR) + I34c66/(2.*vR)',
                  order = {'QED':1})

GC_861 = Coupling(name = 'GC_861',
                  value = '(complex(0,1)*I35c11)/(2.*vR) + (complex(0,1)*I36c11)/(2.*vR)',
                  order = {'QED':1})

GC_862 = Coupling(name = 'GC_862',
                  value = '(complex(0,1)*I35c22)/(2.*vR) + (complex(0,1)*I36c22)/(2.*vR)',
                  order = {'QED':1})

GC_863 = Coupling(name = 'GC_863',
                  value = '(complex(0,1)*I35c33)/(2.*vR) + (complex(0,1)*I36c33)/(2.*vR)',
                  order = {'QED':1})

GC_864 = Coupling(name = 'GC_864',
                  value = '(complex(0,1)*I35c41)/(2.*vR) + (complex(0,1)*I36c41)/(2.*vR)',
                  order = {'QED':1})

GC_865 = Coupling(name = 'GC_865',
                  value = '(complex(0,1)*I35c52)/(2.*vR) + (complex(0,1)*I36c52)/(2.*vR)',
                  order = {'QED':1})

GC_866 = Coupling(name = 'GC_866',
                  value = '(complex(0,1)*I35c63)/(2.*vR) + (complex(0,1)*I36c63)/(2.*vR)',
                  order = {'QED':1})

GC_867 = Coupling(name = 'GC_867',
                  value = '(complex(0,1)*I37c11)/(vR*cmath.sqrt(2)) + (complex(0,1)*I38c11)/(vR*cmath.sqrt(2))',
                  order = {'QED':1})

GC_868 = Coupling(name = 'GC_868',
                  value = '(complex(0,1)*I37c22)/(vR*cmath.sqrt(2)) + (complex(0,1)*I38c22)/(vR*cmath.sqrt(2))',
                  order = {'QED':1})

GC_869 = Coupling(name = 'GC_869',
                  value = '(complex(0,1)*I37c33)/(vR*cmath.sqrt(2)) + (complex(0,1)*I38c33)/(vR*cmath.sqrt(2))',
                  order = {'QED':1})

GC_870 = Coupling(name = 'GC_870',
                  value = '-0.5*I39c11/vR - I40c11/(2.*vR)',
                  order = {'QED':1})

GC_871 = Coupling(name = 'GC_871',
                  value = '-0.5*(complex(0,1)*I39c11)/vR - (complex(0,1)*I40c11)/(2.*vR)',
                  order = {'QED':1})

GC_872 = Coupling(name = 'GC_872',
                  value = '-0.5*I39c22/vR - I40c22/(2.*vR)',
                  order = {'QED':1})

GC_873 = Coupling(name = 'GC_873',
                  value = '-0.5*(complex(0,1)*I39c22)/vR - (complex(0,1)*I40c22)/(2.*vR)',
                  order = {'QED':1})

GC_874 = Coupling(name = 'GC_874',
                  value = '-0.5*I39c33/vR - I40c33/(2.*vR)',
                  order = {'QED':1})

GC_875 = Coupling(name = 'GC_875',
                  value = '-0.5*(complex(0,1)*I39c33)/vR - (complex(0,1)*I40c33)/(2.*vR)',
                  order = {'QED':1})

GC_876 = Coupling(name = 'GC_876',
                  value = '-0.25*I39c14/vR - I39c41/(4.*vR) - I40c14/(4.*vR) - I40c41/(4.*vR)',
                  order = {'QED':1})

GC_877 = Coupling(name = 'GC_877',
                  value = '-0.25*(complex(0,1)*I39c14)/vR - (complex(0,1)*I39c41)/(4.*vR) - (complex(0,1)*I40c14)/(4.*vR) - (complex(0,1)*I40c41)/(4.*vR)',
                  order = {'QED':1})

GC_878 = Coupling(name = 'GC_878',
                  value = '-0.5*I39c44/vR - I40c44/(2.*vR)',
                  order = {'QED':1})

GC_879 = Coupling(name = 'GC_879',
                  value = '-0.5*(complex(0,1)*I39c44)/vR - (complex(0,1)*I40c44)/(2.*vR)',
                  order = {'QED':1})

GC_880 = Coupling(name = 'GC_880',
                  value = '-0.25*I39c25/vR - I39c52/(4.*vR) - I40c25/(4.*vR) - I40c52/(4.*vR)',
                  order = {'QED':1})

GC_881 = Coupling(name = 'GC_881',
                  value = '-0.25*(complex(0,1)*I39c25)/vR - (complex(0,1)*I39c52)/(4.*vR) - (complex(0,1)*I40c25)/(4.*vR) - (complex(0,1)*I40c52)/(4.*vR)',
                  order = {'QED':1})

GC_882 = Coupling(name = 'GC_882',
                  value = '-0.5*I39c55/vR - I40c55/(2.*vR)',
                  order = {'QED':1})

GC_883 = Coupling(name = 'GC_883',
                  value = '-0.5*(complex(0,1)*I39c55)/vR - (complex(0,1)*I40c55)/(2.*vR)',
                  order = {'QED':1})

GC_884 = Coupling(name = 'GC_884',
                  value = '-0.25*I39c36/vR - I39c63/(4.*vR) - I40c36/(4.*vR) - I40c63/(4.*vR)',
                  order = {'QED':1})

GC_885 = Coupling(name = 'GC_885',
                  value = '-0.25*(complex(0,1)*I39c36)/vR - (complex(0,1)*I39c63)/(4.*vR) - (complex(0,1)*I40c36)/(4.*vR) - (complex(0,1)*I40c63)/(4.*vR)',
                  order = {'QED':1})

GC_886 = Coupling(name = 'GC_886',
                  value = '-0.5*I39c66/vR - I40c66/(2.*vR)',
                  order = {'QED':1})

GC_887 = Coupling(name = 'GC_887',
                  value = '-0.5*(complex(0,1)*I39c66)/vR - (complex(0,1)*I40c66)/(2.*vR)',
                  order = {'QED':1})

GC_888 = Coupling(name = 'GC_888',
                  value = '-0.5*(complex(0,1)*I41c11)/vR - (complex(0,1)*I42c11)/(2.*vR)',
                  order = {'QED':1})

GC_889 = Coupling(name = 'GC_889',
                  value = 'I41c11/(2.*vR) + I42c11/(2.*vR)',
                  order = {'QED':1})

GC_890 = Coupling(name = 'GC_890',
                  value = '-0.5*(complex(0,1)*I41c22)/vR - (complex(0,1)*I42c22)/(2.*vR)',
                  order = {'QED':1})

GC_891 = Coupling(name = 'GC_891',
                  value = 'I41c22/(2.*vR) + I42c22/(2.*vR)',
                  order = {'QED':1})

GC_892 = Coupling(name = 'GC_892',
                  value = '-0.5*(complex(0,1)*I41c33)/vR - (complex(0,1)*I42c33)/(2.*vR)',
                  order = {'QED':1})

GC_893 = Coupling(name = 'GC_893',
                  value = 'I41c33/(2.*vR) + I42c33/(2.*vR)',
                  order = {'QED':1})

GC_894 = Coupling(name = 'GC_894',
                  value = '-0.25*(complex(0,1)*I41c14)/vR - (complex(0,1)*I41c41)/(4.*vR) - (complex(0,1)*I42c14)/(4.*vR) - (complex(0,1)*I42c41)/(4.*vR)',
                  order = {'QED':1})

GC_895 = Coupling(name = 'GC_895',
                  value = 'I41c14/(4.*vR) + I41c41/(4.*vR) + I42c14/(4.*vR) + I42c41/(4.*vR)',
                  order = {'QED':1})

GC_896 = Coupling(name = 'GC_896',
                  value = '-0.5*(complex(0,1)*I41c44)/vR - (complex(0,1)*I42c44)/(2.*vR)',
                  order = {'QED':1})

GC_897 = Coupling(name = 'GC_897',
                  value = 'I41c44/(2.*vR) + I42c44/(2.*vR)',
                  order = {'QED':1})

GC_898 = Coupling(name = 'GC_898',
                  value = '-0.25*(complex(0,1)*I41c25)/vR - (complex(0,1)*I41c52)/(4.*vR) - (complex(0,1)*I42c25)/(4.*vR) - (complex(0,1)*I42c52)/(4.*vR)',
                  order = {'QED':1})

GC_899 = Coupling(name = 'GC_899',
                  value = 'I41c25/(4.*vR) + I41c52/(4.*vR) + I42c25/(4.*vR) + I42c52/(4.*vR)',
                  order = {'QED':1})

GC_900 = Coupling(name = 'GC_900',
                  value = '-0.5*(complex(0,1)*I41c55)/vR - (complex(0,1)*I42c55)/(2.*vR)',
                  order = {'QED':1})

GC_901 = Coupling(name = 'GC_901',
                  value = 'I41c55/(2.*vR) + I42c55/(2.*vR)',
                  order = {'QED':1})

GC_902 = Coupling(name = 'GC_902',
                  value = '-0.25*(complex(0,1)*I41c36)/vR - (complex(0,1)*I41c63)/(4.*vR) - (complex(0,1)*I42c36)/(4.*vR) - (complex(0,1)*I42c63)/(4.*vR)',
                  order = {'QED':1})

GC_903 = Coupling(name = 'GC_903',
                  value = 'I41c36/(4.*vR) + I41c63/(4.*vR) + I42c36/(4.*vR) + I42c63/(4.*vR)',
                  order = {'QED':1})

GC_904 = Coupling(name = 'GC_904',
                  value = '-0.5*(complex(0,1)*I41c66)/vR - (complex(0,1)*I42c66)/(2.*vR)',
                  order = {'QED':1})

GC_905 = Coupling(name = 'GC_905',
                  value = 'I41c66/(2.*vR) + I42c66/(2.*vR)',
                  order = {'QED':1})

GC_906 = Coupling(name = 'GC_906',
                  value = '(complex(0,1)*I43c11)/(2.*vR) + (complex(0,1)*I44c11)/(2.*vR)',
                  order = {'QED':1})

GC_907 = Coupling(name = 'GC_907',
                  value = '(complex(0,1)*I43c22)/(2.*vR) + (complex(0,1)*I44c22)/(2.*vR)',
                  order = {'QED':1})

GC_908 = Coupling(name = 'GC_908',
                  value = '(complex(0,1)*I43c33)/(2.*vR) + (complex(0,1)*I44c33)/(2.*vR)',
                  order = {'QED':1})

GC_909 = Coupling(name = 'GC_909',
                  value = '(complex(0,1)*I43c41)/(2.*vR) + (complex(0,1)*I44c41)/(2.*vR)',
                  order = {'QED':1})

GC_910 = Coupling(name = 'GC_910',
                  value = '(complex(0,1)*I43c52)/(2.*vR) + (complex(0,1)*I44c52)/(2.*vR)',
                  order = {'QED':1})

GC_911 = Coupling(name = 'GC_911',
                  value = '(complex(0,1)*I43c63)/(2.*vR) + (complex(0,1)*I44c63)/(2.*vR)',
                  order = {'QED':1})

GC_912 = Coupling(name = 'GC_912',
                  value = '(complex(0,1)*I45c11)/(vR*cmath.sqrt(2)) + (complex(0,1)*I46c11)/(vR*cmath.sqrt(2))',
                  order = {'QED':1})

GC_913 = Coupling(name = 'GC_913',
                  value = '(complex(0,1)*I45c22)/(vR*cmath.sqrt(2)) + (complex(0,1)*I46c22)/(vR*cmath.sqrt(2))',
                  order = {'QED':1})

GC_914 = Coupling(name = 'GC_914',
                  value = '(complex(0,1)*I45c33)/(vR*cmath.sqrt(2)) + (complex(0,1)*I46c33)/(vR*cmath.sqrt(2))',
                  order = {'QED':1})

GC_915 = Coupling(name = 'GC_915',
                  value = '(complex(0,1)*I47c11)/(2.*vR) + (complex(0,1)*I48c11)/(2.*vR)',
                  order = {'QED':1})

GC_916 = Coupling(name = 'GC_916',
                  value = '(complex(0,1)*I47c22)/(2.*vR) + (complex(0,1)*I48c22)/(2.*vR)',
                  order = {'QED':1})

GC_917 = Coupling(name = 'GC_917',
                  value = '(complex(0,1)*I47c33)/(2.*vR) + (complex(0,1)*I48c33)/(2.*vR)',
                  order = {'QED':1})

GC_918 = Coupling(name = 'GC_918',
                  value = '(complex(0,1)*I47c41)/(2.*vR) + (complex(0,1)*I48c41)/(2.*vR)',
                  order = {'QED':1})

GC_919 = Coupling(name = 'GC_919',
                  value = '(complex(0,1)*I47c52)/(2.*vR) + (complex(0,1)*I48c52)/(2.*vR)',
                  order = {'QED':1})

GC_920 = Coupling(name = 'GC_920',
                  value = '(complex(0,1)*I47c63)/(2.*vR) + (complex(0,1)*I48c63)/(2.*vR)',
                  order = {'QED':1})

GC_921 = Coupling(name = 'GC_921',
                  value = '(complex(0,1)*I49c11)/(vR*cmath.sqrt(2)) + (complex(0,1)*I50c11)/(vR*cmath.sqrt(2))',
                  order = {'QED':1})

GC_922 = Coupling(name = 'GC_922',
                  value = '(complex(0,1)*I49c22)/(vR*cmath.sqrt(2)) + (complex(0,1)*I50c22)/(vR*cmath.sqrt(2))',
                  order = {'QED':1})

GC_923 = Coupling(name = 'GC_923',
                  value = '(complex(0,1)*I49c33)/(vR*cmath.sqrt(2)) + (complex(0,1)*I50c33)/(vR*cmath.sqrt(2))',
                  order = {'QED':1})

GC_924 = Coupling(name = 'GC_924',
                  value = '(complex(0,1)*I51c11)/(2.*vR) + (complex(0,1)*I52c11)/(2.*vR)',
                  order = {'QED':1})

GC_925 = Coupling(name = 'GC_925',
                  value = '(complex(0,1)*I51c22)/(2.*vR) + (complex(0,1)*I52c22)/(2.*vR)',
                  order = {'QED':1})

GC_926 = Coupling(name = 'GC_926',
                  value = '(complex(0,1)*I51c33)/(2.*vR) + (complex(0,1)*I52c33)/(2.*vR)',
                  order = {'QED':1})

GC_927 = Coupling(name = 'GC_927',
                  value = '(complex(0,1)*I51c41)/(2.*vR) + (complex(0,1)*I52c41)/(2.*vR)',
                  order = {'QED':1})

GC_928 = Coupling(name = 'GC_928',
                  value = '(complex(0,1)*I51c52)/(2.*vR) + (complex(0,1)*I52c52)/(2.*vR)',
                  order = {'QED':1})

GC_929 = Coupling(name = 'GC_929',
                  value = '(complex(0,1)*I51c63)/(2.*vR) + (complex(0,1)*I52c63)/(2.*vR)',
                  order = {'QED':1})

GC_930 = Coupling(name = 'GC_930',
                  value = '(complex(0,1)*I53c11)/(vR*cmath.sqrt(2)) + (complex(0,1)*I54c11)/(vR*cmath.sqrt(2))',
                  order = {'QED':1})

GC_931 = Coupling(name = 'GC_931',
                  value = '(complex(0,1)*I53c22)/(vR*cmath.sqrt(2)) + (complex(0,1)*I54c22)/(vR*cmath.sqrt(2))',
                  order = {'QED':1})

GC_932 = Coupling(name = 'GC_932',
                  value = '(complex(0,1)*I53c33)/(vR*cmath.sqrt(2)) + (complex(0,1)*I54c33)/(vR*cmath.sqrt(2))',
                  order = {'QED':1})

GC_933 = Coupling(name = 'GC_933',
                  value = 'cxi**2*complex(0,1)*gw**2*vR',
                  order = {'QED':1})

GC_934 = Coupling(name = 'GC_934',
                  value = '-(cxi**2*complex(0,1)*gw**2*vR*cmath.sqrt(2))',
                  order = {'QED':1})

GC_935 = Coupling(name = 'GC_935',
                  value = '-2*complex(0,1)*rho1*vR',
                  order = {'QED':1})

GC_936 = Coupling(name = 'GC_936',
                  value = '-6*complex(0,1)*rho1*vR',
                  order = {'QED':1})

GC_937 = Coupling(name = 'GC_937',
                  value = '-2*complex(0,1)*rho2*vR*cmath.sqrt(2)',
                  order = {'QED':1})

GC_938 = Coupling(name = 'GC_938',
                  value = '-(complex(0,1)*rho3*vR)',
                  order = {'QED':1})

GC_939 = Coupling(name = 'GC_939',
                  value = '-2*rho4*vR',
                  order = {'QED':1})

GC_940 = Coupling(name = 'GC_940',
                  value = '-2*complex(0,1)*rho4*vR',
                  order = {'QED':1})

GC_941 = Coupling(name = 'GC_941',
                  value = '2*rho4*vR',
                  order = {'QED':1})

GC_942 = Coupling(name = 'GC_942',
                  value = '-2*complex(0,1)*rho4*vR*cmath.sqrt(2)',
                  order = {'QED':1})

GC_943 = Coupling(name = 'GC_943',
                  value = '-(cxi*complex(0,1)*gw**2*sxi*vR)',
                  order = {'QED':1})

GC_944 = Coupling(name = 'GC_944',
                  value = 'cxi*complex(0,1)*gw**2*sxi*vR*cmath.sqrt(2)',
                  order = {'QED':1})

GC_945 = Coupling(name = 'GC_945',
                  value = 'complex(0,1)*gw**2*sxi**2*vR',
                  order = {'QED':1})

GC_946 = Coupling(name = 'GC_946',
                  value = '-(complex(0,1)*gw**2*sxi**2*vR*cmath.sqrt(2))',
                  order = {'QED':1})

GC_947 = Coupling(name = 'GC_947',
                  value = '-((alpha3*k1*k2*vR)/(vev**2*cmath.sqrt(2)))',
                  order = {'QED':1})

GC_948 = Coupling(name = 'GC_948',
                  value = '-((alpha3*complex(0,1)*k1*k2*vR)/(vev**2*cmath.sqrt(2)))',
                  order = {'QED':1})

GC_949 = Coupling(name = 'GC_949',
                  value = '(alpha3*complex(0,1)*k1*k2*vR)/(vev**2*cmath.sqrt(2))',
                  order = {'QED':1})

GC_950 = Coupling(name = 'GC_950',
                  value = '(alpha3*k1*k2*vR)/(vev**2*cmath.sqrt(2))',
                  order = {'QED':1})

GC_951 = Coupling(name = 'GC_951',
                  value = '-2*complex(0,1)*rho1*vR - 4*complex(0,1)*rho2*vR',
                  order = {'QED':1})

GC_952 = Coupling(name = 'GC_952',
                  value = '-((cxi*complex(0,1)*gw**2*sw*vR)/cmath.sqrt(2)) + cxi*complex(0,1)*g1*gw*vR*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2)',
                  order = {'QED':1})

GC_953 = Coupling(name = 'GC_953',
                  value = '2*complex(0,1)*g1**2*vR - 4*complex(0,1)*g1**2*sw**2*vR + 2*complex(0,1)*gw**2*sw**2*vR - 4*complex(0,1)*g1*gw*sw*vR*cmath.sqrt(1 - 2*sw**2)',
                  order = {'QED':1})

GC_954 = Coupling(name = 'GC_954',
                  value = '(cphi*cxi*complex(0,1)*gw**2*sw**2*vR)/(cw*cmath.sqrt(2)) + (cxi*complex(0,1)*g1*gw*sphi*sw*vR*cmath.sqrt(2))/cw + (cxi*complex(0,1)*gw**2*sphi*vR*cmath.sqrt(1 - 2*sw**2))/(cw*cmath.sqrt(2)) - (cphi*cxi*complex(0,1)*g1*gw*sw*vR*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_955 = Coupling(name = 'GC_955',
                  value = '(cxi*complex(0,1)*gw**2*sphi*sw**2*vR)/(cw*cmath.sqrt(2)) - (cphi*cxi*complex(0,1)*g1*gw*sw*vR*cmath.sqrt(2))/cw - (cphi*cxi*complex(0,1)*gw**2*vR*cmath.sqrt(1 - 2*sw**2))/(cw*cmath.sqrt(2)) - (cxi*complex(0,1)*g1*gw*sphi*sw*vR*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_956 = Coupling(name = 'GC_956',
                  value = '(2*complex(0,1)*g1*gw*sphi*vR)/cw - (2*cphi*complex(0,1)*g1**2*sw*vR)/cw - (6*complex(0,1)*g1*gw*sphi*sw**2*vR)/cw + (4*cphi*complex(0,1)*g1**2*sw**3*vR)/cw - (2*cphi*complex(0,1)*gw**2*sw**3*vR)/cw + (2*complex(0,1)*g1**2*sphi*sw*vR*cmath.sqrt(1 - 2*sw**2))/cw - (2*complex(0,1)*gw**2*sphi*sw*vR*cmath.sqrt(1 - 2*sw**2))/cw + (4*cphi*complex(0,1)*g1*gw*sw**2*vR*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_957 = Coupling(name = 'GC_957',
                  value = '(-2*cphi*complex(0,1)*g1*gw*vR)/cw - (2*complex(0,1)*g1**2*sphi*sw*vR)/cw + (6*cphi*complex(0,1)*g1*gw*sw**2*vR)/cw + (4*complex(0,1)*g1**2*sphi*sw**3*vR)/cw - (2*complex(0,1)*gw**2*sphi*sw**3*vR)/cw - (2*cphi*complex(0,1)*g1**2*sw*vR*cmath.sqrt(1 - 2*sw**2))/cw + (2*cphi*complex(0,1)*gw**2*sw*vR*cmath.sqrt(1 - 2*sw**2))/cw + (4*complex(0,1)*g1*gw*sphi*sw**2*vR*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_958 = Coupling(name = 'GC_958',
                  value = '(2*complex(0,1)*gw**2*sphi**2*vR)/cw**2 - (4*cphi*complex(0,1)*g1*gw*sphi*sw*vR)/cw**2 + (2*cphi**2*complex(0,1)*g1**2*sw**2*vR)/cw**2 + (2*complex(0,1)*g1**2*sphi**2*sw**2*vR)/cw**2 - (4*complex(0,1)*gw**2*sphi**2*sw**2*vR)/cw**2 + (12*cphi*complex(0,1)*g1*gw*sphi*sw**3*vR)/cw**2 - (4*cphi**2*complex(0,1)*g1**2*sw**4*vR)/cw**2 + (2*cphi**2*complex(0,1)*gw**2*sw**4*vR)/cw**2 + (4*complex(0,1)*g1*gw*sphi**2*sw*vR*cmath.sqrt(1 - 2*sw**2))/cw**2 - (4*cphi*complex(0,1)*g1**2*sphi*sw**2*vR*cmath.sqrt(1 - 2*sw**2))/cw**2 + (4*cphi*complex(0,1)*gw**2*sphi*sw**2*vR*cmath.sqrt(1 - 2*sw**2))/cw**2 - (4*cphi**2*complex(0,1)*g1*gw*sw**3*vR*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':1})

GC_959 = Coupling(name = 'GC_959',
                  value = '(-2*cphi*complex(0,1)*gw**2*sphi*vR)/cw**2 + (2*cphi**2*complex(0,1)*g1*gw*sw*vR)/cw**2 - (2*complex(0,1)*g1*gw*sphi**2*sw*vR)/cw**2 + (4*cphi*complex(0,1)*gw**2*sphi*sw**2*vR)/cw**2 - (6*cphi**2*complex(0,1)*g1*gw*sw**3*vR)/cw**2 + (6*complex(0,1)*g1*gw*sphi**2*sw**3*vR)/cw**2 - (4*cphi*complex(0,1)*g1**2*sphi*sw**4*vR)/cw**2 + (2*cphi*complex(0,1)*gw**2*sphi*sw**4*vR)/cw**2 - (4*cphi*complex(0,1)*g1*gw*sphi*sw*vR*cmath.sqrt(1 - 2*sw**2))/cw**2 + (2*cphi**2*complex(0,1)*g1**2*sw**2*vR*cmath.sqrt(1 - 2*sw**2))/cw**2 - (2*cphi**2*complex(0,1)*gw**2*sw**2*vR*cmath.sqrt(1 - 2*sw**2))/cw**2 - (2*complex(0,1)*g1**2*sphi**2*sw**2*vR*cmath.sqrt(1 - 2*sw**2))/cw**2 + (2*complex(0,1)*gw**2*sphi**2*sw**2*vR*cmath.sqrt(1 - 2*sw**2))/cw**2 - (4*cphi*complex(0,1)*g1*gw*sphi*sw**3*vR*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':1})

GC_960 = Coupling(name = 'GC_960',
                  value = '(2*cphi**2*complex(0,1)*gw**2*vR)/cw**2 + (4*cphi*complex(0,1)*g1*gw*sphi*sw*vR)/cw**2 + (2*cphi**2*complex(0,1)*g1**2*sw**2*vR)/cw**2 - (4*cphi**2*complex(0,1)*gw**2*sw**2*vR)/cw**2 + (2*complex(0,1)*g1**2*sphi**2*sw**2*vR)/cw**2 - (12*cphi*complex(0,1)*g1*gw*sphi*sw**3*vR)/cw**2 - (4*complex(0,1)*g1**2*sphi**2*sw**4*vR)/cw**2 + (2*complex(0,1)*gw**2*sphi**2*sw**4*vR)/cw**2 + (4*cphi**2*complex(0,1)*g1*gw*sw*vR*cmath.sqrt(1 - 2*sw**2))/cw**2 + (4*cphi*complex(0,1)*g1**2*sphi*sw**2*vR*cmath.sqrt(1 - 2*sw**2))/cw**2 - (4*cphi*complex(0,1)*gw**2*sphi*sw**2*vR*cmath.sqrt(1 - 2*sw**2))/cw**2 - (4*complex(0,1)*g1*gw*sphi**2*sw**3*vR*cmath.sqrt(1 - 2*sw**2))/cw**2',
                  order = {'QED':1})

GC_961 = Coupling(name = 'GC_961',
                  value = '(complex(0,1)*gw**2*sw*sxi*vR)/cmath.sqrt(2) - complex(0,1)*g1*gw*sxi*vR*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2)',
                  order = {'QED':1})

GC_962 = Coupling(name = 'GC_962',
                  value = '-((cphi*complex(0,1)*gw**2*sw**2*sxi*vR)/(cw*cmath.sqrt(2))) - (complex(0,1)*g1*gw*sphi*sw*sxi*vR*cmath.sqrt(2))/cw - (complex(0,1)*gw**2*sphi*sxi*vR*cmath.sqrt(1 - 2*sw**2))/(cw*cmath.sqrt(2)) + (cphi*complex(0,1)*g1*gw*sw*sxi*vR*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_963 = Coupling(name = 'GC_963',
                  value = '-((complex(0,1)*gw**2*sphi*sw**2*sxi*vR)/(cw*cmath.sqrt(2))) + (cphi*complex(0,1)*g1*gw*sw*sxi*vR*cmath.sqrt(2))/cw + (cphi*complex(0,1)*gw**2*sxi*vR*cmath.sqrt(1 - 2*sw**2))/(cw*cmath.sqrt(2)) + (complex(0,1)*g1*gw*sphi*sw*sxi*vR*cmath.sqrt(2)*cmath.sqrt(1 - 2*sw**2))/cw',
                  order = {'QED':1})

GC_964 = Coupling(name = 'GC_964',
                  value = '-((alpha1*complex(0,1)*k1**2*vR)/vev**2) - (alpha3*complex(0,1)*k1**2*vR)/vev**2 - (4*alpha2*complex(0,1)*k1*k2*vR)/vev**2 - (alpha1*complex(0,1)*k2**2*vR)/vev**2',
                  order = {'QED':1})

GC_965 = Coupling(name = 'GC_965',
                  value = '-((alpha1*complex(0,1)*k1**2*vR)/vev**2) - (alpha3*complex(0,1)*k1**2*vR)/vev**2 + (4*alpha2*complex(0,1)*k1*k2*vR)/vev**2 - (alpha1*complex(0,1)*k2**2*vR)/vev**2',
                  order = {'QED':1})

GC_966 = Coupling(name = 'GC_966',
                  value = '(2*alpha2*complex(0,1)*k1**2*vR)/vev**2 - (alpha3*complex(0,1)*k1*k2*vR)/vev**2 - (2*alpha2*complex(0,1)*k2**2*vR)/vev**2',
                  order = {'QED':1})

GC_967 = Coupling(name = 'GC_967',
                  value = '(-2*alpha2*complex(0,1)*k1**2*vR)/vev**2 - (alpha3*complex(0,1)*k1*k2*vR)/vev**2 + (2*alpha2*complex(0,1)*k2**2*vR)/vev**2',
                  order = {'QED':1})

GC_968 = Coupling(name = 'GC_968',
                  value = '-((alpha1*complex(0,1)*k1**2*vR)/vev**2) - (4*alpha2*complex(0,1)*k1*k2*vR)/vev**2 - (alpha1*complex(0,1)*k2**2*vR)/vev**2 - (alpha3*complex(0,1)*k2**2*vR)/vev**2',
                  order = {'QED':1})

GC_969 = Coupling(name = 'GC_969',
                  value = '-((alpha1*complex(0,1)*k1**2*vR)/vev**2) + (4*alpha2*complex(0,1)*k1*k2*vR)/vev**2 - (alpha1*complex(0,1)*k2**2*vR)/vev**2 - (alpha3*complex(0,1)*k2**2*vR)/vev**2',
                  order = {'QED':1})

GC_970 = Coupling(name = 'GC_970',
                  value = '(alpha3*k1**2*vR)/(2.*vev**2*cmath.sqrt(2)) - (alpha3*k2**2*vR)/(2.*vev**2*cmath.sqrt(2))',
                  order = {'QED':1})

GC_971 = Coupling(name = 'GC_971',
                  value = '-0.5*(alpha3*complex(0,1)*k1**2*vR)/(vev**2*cmath.sqrt(2)) + (alpha3*complex(0,1)*k2**2*vR)/(2.*vev**2*cmath.sqrt(2))',
                  order = {'QED':1})

GC_972 = Coupling(name = 'GC_972',
                  value = '-0.5*(alpha3*k1**2*vR)/(vev**2*cmath.sqrt(2)) + (alpha3*k2**2*vR)/(2.*vev**2*cmath.sqrt(2))',
                  order = {'QED':1})

GC_973 = Coupling(name = 'GC_973',
                  value = '(2*complex(0,1)*k1*k2*yDO1x1)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_974 = Coupling(name = 'GC_974',
                  value = '(2*k1*k2*yDO1x1)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_975 = Coupling(name = 'GC_975',
                  value = '-((complex(0,1)*k1**2*yDO1x1)/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*k2**2*yDO1x1)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_976 = Coupling(name = 'GC_976',
                  value = '-((k1**2*yDO1x1)/((k1 - k2)*(k1 + k2)*vev)) + (k2**2*yDO1x1)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_977 = Coupling(name = 'GC_977',
                  value = '(2*complex(0,1)*k1*k2*yDO2x2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_978 = Coupling(name = 'GC_978',
                  value = '(2*k1*k2*yDO2x2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_979 = Coupling(name = 'GC_979',
                  value = '-((complex(0,1)*k1**2*yDO2x2)/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*k2**2*yDO2x2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_980 = Coupling(name = 'GC_980',
                  value = '-((k1**2*yDO2x2)/((k1 - k2)*(k1 + k2)*vev)) + (k2**2*yDO2x2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_981 = Coupling(name = 'GC_981',
                  value = '(2*complex(0,1)*k1*k2*yDO3x3)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_982 = Coupling(name = 'GC_982',
                  value = '(2*k1*k2*yDO3x3)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_983 = Coupling(name = 'GC_983',
                  value = '-((complex(0,1)*k1**2*yDO3x3)/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*k2**2*yDO3x3)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_984 = Coupling(name = 'GC_984',
                  value = '-((k1**2*yDO3x3)/((k1 - k2)*(k1 + k2)*vev)) + (k2**2*yDO3x3)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_985 = Coupling(name = 'GC_985',
                  value = '(2*complex(0,1)*k1*k2*yML1x1)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_986 = Coupling(name = 'GC_986',
                  value = '(2*k1*k2*yML1x1)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_987 = Coupling(name = 'GC_987',
                  value = '-((complex(0,1)*k1**2*yML1x1)/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*k2**2*yML1x1)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_988 = Coupling(name = 'GC_988',
                  value = '-((k1**2*yML1x1)/((k1 - k2)*(k1 + k2)*vev)) + (k2**2*yML1x1)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_989 = Coupling(name = 'GC_989',
                  value = '(2*complex(0,1)*k1*k2*yML2x2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_990 = Coupling(name = 'GC_990',
                  value = '(2*k1*k2*yML2x2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_991 = Coupling(name = 'GC_991',
                  value = '-((complex(0,1)*k1**2*yML2x2)/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*k2**2*yML2x2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_992 = Coupling(name = 'GC_992',
                  value = '-((k1**2*yML2x2)/((k1 - k2)*(k1 + k2)*vev)) + (k2**2*yML2x2)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_993 = Coupling(name = 'GC_993',
                  value = '(2*complex(0,1)*k1*k2*yML3x3)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_994 = Coupling(name = 'GC_994',
                  value = '(2*k1*k2*yML3x3)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_995 = Coupling(name = 'GC_995',
                  value = '-((complex(0,1)*k1**2*yML3x3)/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*k2**2*yML3x3)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_996 = Coupling(name = 'GC_996',
                  value = '-((k1**2*yML3x3)/((k1 - k2)*(k1 + k2)*vev)) + (k2**2*yML3x3)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_997 = Coupling(name = 'GC_997',
                  value = '(-2*complex(0,1)*k1*k2*yMU1x1)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_998 = Coupling(name = 'GC_998',
                  value = '(2*k1*k2*yMU1x1)/((-k1 + k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_999 = Coupling(name = 'GC_999',
                  value = '(k1**2*yMU1x1)/((k1 - k2)*(k1 + k2)*vev) - (k2**2*yMU1x1)/((k1 - k2)*(k1 + k2)*vev)',
                  order = {'QED':1})

GC_1000 = Coupling(name = 'GC_1000',
                   value = '-((complex(0,1)*k1**2*yMU1x1)/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*k2**2*yMU1x1)/((k1 - k2)*(k1 + k2)*vev)',
                   order = {'QED':1})

GC_1001 = Coupling(name = 'GC_1001',
                   value = '(-2*complex(0,1)*k1*k2*yMU2x2)/((-k1 + k2)*(k1 + k2)*vev)',
                   order = {'QED':1})

GC_1002 = Coupling(name = 'GC_1002',
                   value = '(2*k1*k2*yMU2x2)/((-k1 + k2)*(k1 + k2)*vev)',
                   order = {'QED':1})

GC_1003 = Coupling(name = 'GC_1003',
                   value = '(k1**2*yMU2x2)/((k1 - k2)*(k1 + k2)*vev) - (k2**2*yMU2x2)/((k1 - k2)*(k1 + k2)*vev)',
                   order = {'QED':1})

GC_1004 = Coupling(name = 'GC_1004',
                   value = '-((complex(0,1)*k1**2*yMU2x2)/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*k2**2*yMU2x2)/((k1 - k2)*(k1 + k2)*vev)',
                   order = {'QED':1})

GC_1005 = Coupling(name = 'GC_1005',
                   value = '(-2*complex(0,1)*k1*k2*yMU3x3)/((-k1 + k2)*(k1 + k2)*vev)',
                   order = {'QED':1})

GC_1006 = Coupling(name = 'GC_1006',
                   value = '(2*k1*k2*yMU3x3)/((-k1 + k2)*(k1 + k2)*vev)',
                   order = {'QED':1})

GC_1007 = Coupling(name = 'GC_1007',
                   value = '(k1**2*yMU3x3)/((k1 - k2)*(k1 + k2)*vev) - (k2**2*yMU3x3)/((k1 - k2)*(k1 + k2)*vev)',
                   order = {'QED':1})

GC_1008 = Coupling(name = 'GC_1008',
                   value = '-((complex(0,1)*k1**2*yMU3x3)/((k1 - k2)*(k1 + k2)*vev)) + (complex(0,1)*k2**2*yMU3x3)/((k1 - k2)*(k1 + k2)*vev)',
                   order = {'QED':1})

GC_1009 = Coupling(name = 'GC_1009',
                   value = '(cxi*complex(0,1)*gw*complexconjugate(CKML1x1))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1010 = Coupling(name = 'GC_1010',
                   value = '(complex(0,1)*gw*sxi*complexconjugate(CKML1x1))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1011 = Coupling(name = 'GC_1011',
                   value = '(cxi*complex(0,1)*gw*complexconjugate(CKML1x2))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1012 = Coupling(name = 'GC_1012',
                   value = '(complex(0,1)*gw*sxi*complexconjugate(CKML1x2))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1013 = Coupling(name = 'GC_1013',
                   value = '(cxi*complex(0,1)*gw*complexconjugate(CKML1x3))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1014 = Coupling(name = 'GC_1014',
                   value = '(complex(0,1)*gw*sxi*complexconjugate(CKML1x3))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1015 = Coupling(name = 'GC_1015',
                   value = '(cxi*complex(0,1)*gw*complexconjugate(CKML2x1))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1016 = Coupling(name = 'GC_1016',
                   value = '(complex(0,1)*gw*sxi*complexconjugate(CKML2x1))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1017 = Coupling(name = 'GC_1017',
                   value = '(cxi*complex(0,1)*gw*complexconjugate(CKML2x2))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1018 = Coupling(name = 'GC_1018',
                   value = '(complex(0,1)*gw*sxi*complexconjugate(CKML2x2))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1019 = Coupling(name = 'GC_1019',
                   value = '(cxi*complex(0,1)*gw*complexconjugate(CKML2x3))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1020 = Coupling(name = 'GC_1020',
                   value = '(complex(0,1)*gw*sxi*complexconjugate(CKML2x3))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1021 = Coupling(name = 'GC_1021',
                   value = '(cxi*complex(0,1)*gw*complexconjugate(CKML3x1))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1022 = Coupling(name = 'GC_1022',
                   value = '(complex(0,1)*gw*sxi*complexconjugate(CKML3x1))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1023 = Coupling(name = 'GC_1023',
                   value = '(cxi*complex(0,1)*gw*complexconjugate(CKML3x2))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1024 = Coupling(name = 'GC_1024',
                   value = '(complex(0,1)*gw*sxi*complexconjugate(CKML3x2))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1025 = Coupling(name = 'GC_1025',
                   value = '(cxi*complex(0,1)*gw*complexconjugate(CKML3x3))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1026 = Coupling(name = 'GC_1026',
                   value = '(complex(0,1)*gw*sxi*complexconjugate(CKML3x3))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1027 = Coupling(name = 'GC_1027',
                   value = '(cxi*complex(0,1)*gw*complexconjugate(CKMR1x1))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1028 = Coupling(name = 'GC_1028',
                   value = '-((complex(0,1)*gw*sxi*complexconjugate(CKMR1x1))/cmath.sqrt(2))',
                   order = {'QED':1})

GC_1029 = Coupling(name = 'GC_1029',
                   value = '(cxi*complex(0,1)*gw*complexconjugate(CKMR1x2))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1030 = Coupling(name = 'GC_1030',
                   value = '-((complex(0,1)*gw*sxi*complexconjugate(CKMR1x2))/cmath.sqrt(2))',
                   order = {'QED':1})

GC_1031 = Coupling(name = 'GC_1031',
                   value = '(cxi*complex(0,1)*gw*complexconjugate(CKMR1x3))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1032 = Coupling(name = 'GC_1032',
                   value = '-((complex(0,1)*gw*sxi*complexconjugate(CKMR1x3))/cmath.sqrt(2))',
                   order = {'QED':1})

GC_1033 = Coupling(name = 'GC_1033',
                   value = '(cxi*complex(0,1)*gw*complexconjugate(CKMR2x1))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1034 = Coupling(name = 'GC_1034',
                   value = '-((complex(0,1)*gw*sxi*complexconjugate(CKMR2x1))/cmath.sqrt(2))',
                   order = {'QED':1})

GC_1035 = Coupling(name = 'GC_1035',
                   value = '(cxi*complex(0,1)*gw*complexconjugate(CKMR2x2))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1036 = Coupling(name = 'GC_1036',
                   value = '-((complex(0,1)*gw*sxi*complexconjugate(CKMR2x2))/cmath.sqrt(2))',
                   order = {'QED':1})

GC_1037 = Coupling(name = 'GC_1037',
                   value = '(cxi*complex(0,1)*gw*complexconjugate(CKMR2x3))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1038 = Coupling(name = 'GC_1038',
                   value = '-((complex(0,1)*gw*sxi*complexconjugate(CKMR2x3))/cmath.sqrt(2))',
                   order = {'QED':1})

GC_1039 = Coupling(name = 'GC_1039',
                   value = '(cxi*complex(0,1)*gw*complexconjugate(CKMR3x1))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1040 = Coupling(name = 'GC_1040',
                   value = '-((complex(0,1)*gw*sxi*complexconjugate(CKMR3x1))/cmath.sqrt(2))',
                   order = {'QED':1})

GC_1041 = Coupling(name = 'GC_1041',
                   value = '(cxi*complex(0,1)*gw*complexconjugate(CKMR3x2))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1042 = Coupling(name = 'GC_1042',
                   value = '-((complex(0,1)*gw*sxi*complexconjugate(CKMR3x2))/cmath.sqrt(2))',
                   order = {'QED':1})

GC_1043 = Coupling(name = 'GC_1043',
                   value = '(cxi*complex(0,1)*gw*complexconjugate(CKMR3x3))/cmath.sqrt(2)',
                   order = {'QED':1})

GC_1044 = Coupling(name = 'GC_1044',
                   value = '-((complex(0,1)*gw*sxi*complexconjugate(CKMR3x3))/cmath.sqrt(2))',
                   order = {'QED':1})

