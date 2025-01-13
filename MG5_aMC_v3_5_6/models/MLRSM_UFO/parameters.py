# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 14.0.0 for Microsoft Windows (64-bit) (December 13, 2023)
# Date: Sat 11 Jan 2025 17:32:46



from object_library import all_parameters, Parameter


from function_library import complexconjugate, re, im, csc, sec, acsc, asec, cot

# This is a default parameter object representing 0.
ZERO = Parameter(name = 'ZERO',
                 nature = 'internal',
                 type = 'real',
                 value = '0.0',
                 texname = '0')

# User-defined parameters.
s12 = Parameter(name = 's12',
                nature = 'external',
                type = 'real',
                value = 0.221,
                texname = 's_{12}',
                lhablock = 'CKMBLOCK',
                lhacode = [ 1 ])

s23 = Parameter(name = 's23',
                nature = 'external',
                type = 'real',
                value = 0.041,
                texname = 's_{23}',
                lhablock = 'CKMBLOCK',
                lhacode = [ 2 ])

s13 = Parameter(name = 's13',
                nature = 'external',
                type = 'real',
                value = 0.0035,
                texname = 's_{13}',
                lhablock = 'CKMBLOCK',
                lhacode = [ 3 ])

lambda1 = Parameter(name = 'lambda1',
                    nature = 'external',
                    type = 'real',
                    value = 0.118,
                    texname = '\\lambda _1',
                    lhablock = 'HIGGSBLOCK',
                    lhacode = [ 1 ])

lambda2 = Parameter(name = 'lambda2',
                    nature = 'external',
                    type = 'real',
                    value = 0.2,
                    texname = '\\lambda _2',
                    lhablock = 'HIGGSBLOCK',
                    lhacode = [ 2 ])

lambda3 = Parameter(name = 'lambda3',
                    nature = 'external',
                    type = 'real',
                    value = -0.234,
                    texname = '\\lambda _3',
                    lhablock = 'HIGGSBLOCK',
                    lhacode = [ 3 ])

lambda4 = Parameter(name = 'lambda4',
                    nature = 'external',
                    type = 'real',
                    value = 0,
                    texname = '\\lambda _4',
                    lhablock = 'HIGGSBLOCK',
                    lhacode = [ 4 ])

rho1 = Parameter(name = 'rho1',
                 nature = 'external',
                 type = 'real',
                 value = 0.5,
                 texname = '\\rho _1',
                 lhablock = 'HIGGSBLOCK',
                 lhacode = [ 5 ])

rho2 = Parameter(name = 'rho2',
                 nature = 'external',
                 type = 'real',
                 value = 0.05,
                 texname = '\\rho _2',
                 lhablock = 'HIGGSBLOCK',
                 lhacode = [ 6 ])

rho3 = Parameter(name = 'rho3',
                 nature = 'external',
                 type = 'real',
                 value = 1.25,
                 texname = '\\rho _3',
                 lhablock = 'HIGGSBLOCK',
                 lhacode = [ 7 ])

rho4 = Parameter(name = 'rho4',
                 nature = 'external',
                 type = 'real',
                 value = 0.125,
                 texname = '\\rho _4',
                 lhablock = 'HIGGSBLOCK',
                 lhacode = [ 8 ])

alpha1 = Parameter(name = 'alpha1',
                   nature = 'external',
                   type = 'real',
                   value = 0.5,
                   texname = '\\alpha _1',
                   lhablock = 'HIGGSBLOCK',
                   lhacode = [ 9 ])

alpha2 = Parameter(name = 'alpha2',
                   nature = 'external',
                   type = 'real',
                   value = 0.5,
                   texname = '\\alpha _2',
                   lhablock = 'HIGGSBLOCK',
                   lhacode = [ 10 ])

alpha3 = Parameter(name = 'alpha3',
                   nature = 'external',
                   type = 'real',
                   value = 0.5,
                   texname = '\\alpha _3',
                   lhablock = 'HIGGSBLOCK',
                   lhacode = [ 11 ])

VKe = Parameter(name = 'VKe',
                nature = 'external',
                type = 'real',
                value = 0.0031622776601683794,
                texname = '\\text{KLRmix}_e',
                lhablock = 'KLRBLOCK',
                lhacode = [ 1 ])

VKmu = Parameter(name = 'VKmu',
                 nature = 'external',
                 type = 'real',
                 value = 0.0031622776601683794,
                 texname = '\\text{KLRmix}_{\\mu }',
                 lhablock = 'KLRBLOCK',
                 lhacode = [ 2 ])

VKta = Parameter(name = 'VKta',
                 nature = 'external',
                 type = 'real',
                 value = 0.0031622776601683794,
                 texname = '\\text{KLRmix}_{\\text{ta}}',
                 lhablock = 'KLRBLOCK',
                 lhacode = [ 3 ])

Wl11 = Parameter(name = 'Wl11',
                 nature = 'external',
                 type = 'real',
                 value = 1,
                 texname = '\\text{Wl}_{11}',
                 lhablock = 'MIXINGBLOCK',
                 lhacode = [ 1 ])

Wl22 = Parameter(name = 'Wl22',
                 nature = 'external',
                 type = 'real',
                 value = 1,
                 texname = '\\text{Wl}_{22}',
                 lhablock = 'MIXINGBLOCK',
                 lhacode = [ 2 ])

Wl33 = Parameter(name = 'Wl33',
                 nature = 'external',
                 type = 'real',
                 value = 1,
                 texname = '\\text{Wl}_{33}',
                 lhablock = 'MIXINGBLOCK',
                 lhacode = [ 3 ])

WU11 = Parameter(name = 'WU11',
                 nature = 'external',
                 type = 'real',
                 value = 1,
                 texname = '\\text{WU}_{11}',
                 lhablock = 'MIXINGBLOCK',
                 lhacode = [ 4 ])

WU22 = Parameter(name = 'WU22',
                 nature = 'external',
                 type = 'real',
                 value = 1,
                 texname = '\\text{WU}_{22}',
                 lhablock = 'MIXINGBLOCK',
                 lhacode = [ 5 ])

WU33 = Parameter(name = 'WU33',
                 nature = 'external',
                 type = 'real',
                 value = -1,
                 texname = '\\text{WU}_{33}',
                 lhablock = 'MIXINGBLOCK',
                 lhacode = [ 6 ])

WD11 = Parameter(name = 'WD11',
                 nature = 'external',
                 type = 'real',
                 value = 1,
                 texname = '\\text{WD}_{11}',
                 lhablock = 'MIXINGBLOCK',
                 lhacode = [ 7 ])

WD22 = Parameter(name = 'WD22',
                 nature = 'external',
                 type = 'real',
                 value = 1,
                 texname = '\\text{WD}_{22}',
                 lhablock = 'MIXINGBLOCK',
                 lhacode = [ 8 ])

WD33 = Parameter(name = 'WD33',
                 nature = 'external',
                 type = 'real',
                 value = 1,
                 texname = '\\text{WD}_{33}',
                 lhablock = 'MIXINGBLOCK',
                 lhacode = [ 9 ])

aEWM1 = Parameter(name = 'aEWM1',
                  nature = 'external',
                  type = 'real',
                  value = 127.9,
                  texname = '\\text{aEWM1}',
                  lhablock = 'SMINPUTS',
                  lhacode = [ 1 ])

Gf = Parameter(name = 'Gf',
               nature = 'external',
               type = 'real',
               value = 0.0000116637,
               texname = 'G_f',
               lhablock = 'SMINPUTS',
               lhacode = [ 2 ])

aS = Parameter(name = 'aS',
               nature = 'external',
               type = 'real',
               value = 0.1184,
               texname = '\\alpha _s',
               lhablock = 'SMINPUTS',
               lhacode = [ 3 ])

k1 = Parameter(name = 'k1',
               nature = 'external',
               type = 'real',
               value = 227.91,
               texname = '\\text{k1}',
               lhablock = 'VEVS',
               lhacode = [ 1 ])

vR = Parameter(name = 'vR',
               nature = 'external',
               type = 'real',
               value = 2543.2,
               texname = '\\text{vR}',
               lhablock = 'VEVS',
               lhacode = [ 2 ])

vL = Parameter(name = 'vL',
               nature = 'external',
               type = 'real',
               value = 0,
               texname = '\\text{vL}',
               lhablock = 'VEVS',
               lhacode = [ 3 ])

MZ = Parameter(name = 'MZ',
               nature = 'external',
               type = 'real',
               value = 91.1876,
               texname = '\\text{MZ}',
               lhablock = 'MASS',
               lhacode = [ 23 ])

MW = Parameter(name = 'MW',
               nature = 'external',
               type = 'real',
               value = 80.399,
               texname = '\\text{MW}',
               lhablock = 'MASS',
               lhacode = [ 24 ])

Me = Parameter(name = 'Me',
               nature = 'external',
               type = 'real',
               value = 0.000511,
               texname = '\\text{Me}',
               lhablock = 'MASS',
               lhacode = [ 11 ])

Mmu = Parameter(name = 'Mmu',
                nature = 'external',
                type = 'real',
                value = 0.10566,
                texname = '\\text{Mmu}',
                lhablock = 'MASS',
                lhacode = [ 13 ])

Mta = Parameter(name = 'Mta',
                nature = 'external',
                type = 'real',
                value = 1.777,
                texname = '\\text{Mta}',
                lhablock = 'MASS',
                lhacode = [ 15 ])

MU = Parameter(name = 'MU',
               nature = 'external',
               type = 'real',
               value = 0.00255,
               texname = 'M',
               lhablock = 'MASS',
               lhacode = [ 2 ])

MC = Parameter(name = 'MC',
               nature = 'external',
               type = 'real',
               value = 1.27,
               texname = '\\text{MC}',
               lhablock = 'MASS',
               lhacode = [ 4 ])

MT = Parameter(name = 'MT',
               nature = 'external',
               type = 'real',
               value = 172,
               texname = '\\text{MT}',
               lhablock = 'MASS',
               lhacode = [ 6 ])

MD = Parameter(name = 'MD',
               nature = 'external',
               type = 'real',
               value = 0.00504,
               texname = '\\text{MD}',
               lhablock = 'MASS',
               lhacode = [ 1 ])

MS = Parameter(name = 'MS',
               nature = 'external',
               type = 'real',
               value = 0.101,
               texname = '\\text{MS}',
               lhablock = 'MASS',
               lhacode = [ 3 ])

MB = Parameter(name = 'MB',
               nature = 'external',
               type = 'real',
               value = 4.7,
               texname = '\\text{MB}',
               lhablock = 'MASS',
               lhacode = [ 5 ])

MN1 = Parameter(name = 'MN1',
                nature = 'external',
                type = 'real',
                value = 1.e-8,
                texname = '\\text{MN1}',
                lhablock = 'MASS',
                lhacode = [ 12 ])

MN2 = Parameter(name = 'MN2',
                nature = 'external',
                type = 'real',
                value = 1.e-8,
                texname = '\\text{MN2}',
                lhablock = 'MASS',
                lhacode = [ 14 ])

MN3 = Parameter(name = 'MN3',
                nature = 'external',
                type = 'real',
                value = 1.e-8,
                texname = '\\text{MN3}',
                lhablock = 'MASS',
                lhacode = [ 16 ])

MN4 = Parameter(name = 'MN4',
                nature = 'external',
                type = 'real',
                value = 100,
                texname = '\\text{MN4}',
                lhablock = 'MASS',
                lhacode = [ 9900012 ])

MN5 = Parameter(name = 'MN5',
                nature = 'external',
                type = 'real',
                value = 100,
                texname = '\\text{MN5}',
                lhablock = 'MASS',
                lhacode = [ 9900014 ])

MN6 = Parameter(name = 'MN6',
                nature = 'external',
                type = 'real',
                value = 100,
                texname = '\\text{MN6}',
                lhablock = 'MASS',
                lhacode = [ 9900016 ])

WZ = Parameter(name = 'WZ',
               nature = 'external',
               type = 'real',
               value = 2.4952,
               texname = '\\text{WZ}',
               lhablock = 'DECAY',
               lhacode = [ 23 ])

WW = Parameter(name = 'WW',
               nature = 'external',
               type = 'real',
               value = 2.08,
               texname = '\\text{WW}',
               lhablock = 'DECAY',
               lhacode = [ 24 ])

WW2 = Parameter(name = 'WW2',
                nature = 'external',
                type = 'real',
                value = 69,
                texname = '\\text{WW2}',
                lhablock = 'DECAY',
                lhacode = [ 34 ])

WZ2 = Parameter(name = 'WZ2',
                nature = 'external',
                type = 'real',
                value = 80,
                texname = '\\text{WZ2}',
                lhablock = 'DECAY',
                lhacode = [ 32 ])

WT = Parameter(name = 'WT',
               nature = 'external',
               type = 'real',
               value = 1.50833649,
               texname = '\\text{WT}',
               lhablock = 'DECAY',
               lhacode = [ 6 ])

WN4 = Parameter(name = 'WN4',
                nature = 'external',
                type = 'real',
                value = 1.5,
                texname = '\\text{WN4}',
                lhablock = 'DECAY',
                lhacode = [ 9900012 ])

WN5 = Parameter(name = 'WN5',
                nature = 'external',
                type = 'real',
                value = 1.5,
                texname = '\\text{WN5}',
                lhablock = 'DECAY',
                lhacode = [ 9900014 ])

WN6 = Parameter(name = 'WN6',
                nature = 'external',
                type = 'real',
                value = 1.5,
                texname = '\\text{WN6}',
                lhablock = 'DECAY',
                lhacode = [ 9900016 ])

WH = Parameter(name = 'WH',
               nature = 'external',
               type = 'real',
               value = 0.0057,
               texname = '\\text{WH}',
               lhablock = 'DECAY',
               lhacode = [ 25 ])

WH01 = Parameter(name = 'WH01',
                 nature = 'external',
                 type = 'real',
                 value = 0.00575308848,
                 texname = '\\text{WH01}',
                 lhablock = 'DECAY',
                 lhacode = [ 35 ])

WH02 = Parameter(name = 'WH02',
                 nature = 'external',
                 type = 'real',
                 value = 0.00575308848,
                 texname = '\\text{WH02}',
                 lhablock = 'DECAY',
                 lhacode = [ 43 ])

WH03 = Parameter(name = 'WH03',
                 nature = 'external',
                 type = 'real',
                 value = 0.00575308848,
                 texname = '\\text{WH03}',
                 lhablock = 'DECAY',
                 lhacode = [ 44 ])

WHP1 = Parameter(name = 'WHP1',
                 nature = 'external',
                 type = 'real',
                 value = 0.006,
                 texname = '\\text{WHP1}',
                 lhablock = 'DECAY',
                 lhacode = [ 37 ])

WHP2 = Parameter(name = 'WHP2',
                 nature = 'external',
                 type = 'real',
                 value = 0.006,
                 texname = '\\text{WHP2}',
                 lhablock = 'DECAY',
                 lhacode = [ 38 ])

WHPPL = Parameter(name = 'WHPPL',
                  nature = 'external',
                  type = 'real',
                  value = 0.007,
                  texname = '\\text{WHPPL}',
                  lhablock = 'DECAY',
                  lhacode = [ 61 ])

WHPPR = Parameter(name = 'WHPPR',
                  nature = 'external',
                  type = 'real',
                  value = 0.007,
                  texname = '\\text{WHPPR}',
                  lhablock = 'DECAY',
                  lhacode = [ 62 ])

WA01 = Parameter(name = 'WA01',
                 nature = 'external',
                 type = 'real',
                 value = 0.006,
                 texname = '\\text{WA01}',
                 lhablock = 'DECAY',
                 lhacode = [ 36 ])

WA02 = Parameter(name = 'WA02',
                 nature = 'external',
                 type = 'real',
                 value = 0.006,
                 texname = '\\text{WA02}',
                 lhablock = 'DECAY',
                 lhacode = [ 45 ])

aEW = Parameter(name = 'aEW',
                nature = 'internal',
                type = 'real',
                value = '1/aEWM1',
                texname = '\\alpha _{\\text{EW}}')

sw2 = Parameter(name = 'sw2',
                nature = 'internal',
                type = 'real',
                value = '1 - MW**2/MZ**2',
                texname = '\\text{sw2}')

cw = Parameter(name = 'cw',
               nature = 'internal',
               type = 'real',
               value = 'MW/MZ',
               texname = 'c_w')

gs = Parameter(name = 'gs',
               nature = 'internal',
               type = 'real',
               value = '2*cmath.sqrt(aS)*cmath.sqrt(cmath.pi)',
               texname = 'g_s')

vev = Parameter(name = 'vev',
                nature = 'internal',
                type = 'real',
                value = '1/(2**0.25*cmath.sqrt(Gf))',
                texname = '\\text{Vev}')

MH02 = Parameter(name = 'MH02',
                 nature = 'internal',
                 type = 'real',
                 value = 'cmath.sqrt(2)*cmath.sqrt(rho1*vR**2)',
                 texname = 'M_{\\text{H02}}')

MH03 = Parameter(name = 'MH03',
                 nature = 'internal',
                 type = 'real',
                 value = 'cmath.sqrt((-2*rho1 + rho3)*vR**2)/cmath.sqrt(2)',
                 texname = 'M_{\\text{H03}}')

MA02 = Parameter(name = 'MA02',
                 nature = 'internal',
                 type = 'real',
                 value = 'cmath.sqrt((-2*rho1 + rho3)*vR**2)/cmath.sqrt(2)',
                 texname = 'M_{\\text{A02}}')

yML1x1 = Parameter(name = 'yML1x1',
                   nature = 'internal',
                   type = 'real',
                   value = 'Me',
                   texname = '\\text{yML1x1}')

yML2x2 = Parameter(name = 'yML2x2',
                   nature = 'internal',
                   type = 'real',
                   value = 'Mmu',
                   texname = '\\text{yML2x2}')

yML3x3 = Parameter(name = 'yML3x3',
                   nature = 'internal',
                   type = 'real',
                   value = 'Mta',
                   texname = '\\text{yML3x3}')

yNL1x1 = Parameter(name = 'yNL1x1',
                   nature = 'internal',
                   type = 'real',
                   value = 'MN1',
                   texname = '\\text{yNL1x1}')

yNL2x2 = Parameter(name = 'yNL2x2',
                   nature = 'internal',
                   type = 'real',
                   value = 'MN2',
                   texname = '\\text{yNL2x2}')

yNL3x3 = Parameter(name = 'yNL3x3',
                   nature = 'internal',
                   type = 'real',
                   value = 'MN3',
                   texname = '\\text{yNL3x3}')

yNL4x4 = Parameter(name = 'yNL4x4',
                   nature = 'internal',
                   type = 'real',
                   value = 'MN4',
                   texname = '\\text{yNL4x4}')

yNL5x5 = Parameter(name = 'yNL5x5',
                   nature = 'internal',
                   type = 'real',
                   value = 'MN5',
                   texname = '\\text{yNL5x5}')

yNL6x6 = Parameter(name = 'yNL6x6',
                   nature = 'internal',
                   type = 'real',
                   value = 'MN6',
                   texname = '\\text{yNL6x6}')

yMU1x1 = Parameter(name = 'yMU1x1',
                   nature = 'internal',
                   type = 'real',
                   value = 'MU',
                   texname = '\\text{yMU1x1}')

yMU2x2 = Parameter(name = 'yMU2x2',
                   nature = 'internal',
                   type = 'real',
                   value = 'MC',
                   texname = '\\text{yMU2x2}')

yMU3x3 = Parameter(name = 'yMU3x3',
                   nature = 'internal',
                   type = 'real',
                   value = 'MT',
                   texname = '\\text{yMU3x3}')

yDO1x1 = Parameter(name = 'yDO1x1',
                   nature = 'internal',
                   type = 'real',
                   value = 'MD',
                   texname = '\\text{yDO1x1}')

yDO2x2 = Parameter(name = 'yDO2x2',
                   nature = 'internal',
                   type = 'real',
                   value = 'MS',
                   texname = '\\text{yDO2x2}')

yDO3x3 = Parameter(name = 'yDO3x3',
                   nature = 'internal',
                   type = 'real',
                   value = 'MB',
                   texname = '\\text{yDO3x3}')

CKML1x1 = Parameter(name = 'CKML1x1',
                    nature = 'internal',
                    type = 'complex',
                    value = 'cmath.sqrt(1 - s12**2)*cmath.sqrt(1 - s13**2)',
                    texname = '\\text{CKML1x1}')

CKML1x2 = Parameter(name = 'CKML1x2',
                    nature = 'internal',
                    type = 'complex',
                    value = 's12*cmath.sqrt(1 - s13**2)',
                    texname = '\\text{CKML1x2}')

CKML1x3 = Parameter(name = 'CKML1x3',
                    nature = 'internal',
                    type = 'complex',
                    value = 's13',
                    texname = '\\text{CKML1x3}')

CKML2x1 = Parameter(name = 'CKML2x1',
                    nature = 'internal',
                    type = 'complex',
                    value = '-(s13*s23*cmath.sqrt(1 - s12**2)) - s12*cmath.sqrt(1 - s23**2)',
                    texname = '\\text{CKML2x1}')

CKML2x2 = Parameter(name = 'CKML2x2',
                    nature = 'internal',
                    type = 'complex',
                    value = '-(s12*s13*s23) + cmath.sqrt(1 - s12**2)*cmath.sqrt(1 - s23**2)',
                    texname = '\\text{CKML2x2}')

CKML2x3 = Parameter(name = 'CKML2x3',
                    nature = 'internal',
                    type = 'complex',
                    value = 's23*cmath.sqrt(1 - s13**2)',
                    texname = '\\text{CKML2x3}')

CKML3x1 = Parameter(name = 'CKML3x1',
                    nature = 'internal',
                    type = 'complex',
                    value = 's12*s23 - s13*cmath.sqrt(1 - s12**2)*cmath.sqrt(1 - s23**2)',
                    texname = '\\text{CKML3x1}')

CKML3x2 = Parameter(name = 'CKML3x2',
                    nature = 'internal',
                    type = 'complex',
                    value = '-(s23*cmath.sqrt(1 - s12**2)) - s12*s13*cmath.sqrt(1 - s23**2)',
                    texname = '\\text{CKML3x2}')

CKML3x3 = Parameter(name = 'CKML3x3',
                    nature = 'internal',
                    type = 'complex',
                    value = 'cmath.sqrt(1 - s13**2)*cmath.sqrt(1 - s23**2)',
                    texname = '\\text{CKML3x3}')

Wl1x1 = Parameter(name = 'Wl1x1',
                  nature = 'internal',
                  type = 'real',
                  value = 'Wl11',
                  texname = '\\text{Wl1x1}')

Wl2x2 = Parameter(name = 'Wl2x2',
                  nature = 'internal',
                  type = 'real',
                  value = 'Wl22',
                  texname = '\\text{Wl2x2}')

Wl3x3 = Parameter(name = 'Wl3x3',
                  nature = 'internal',
                  type = 'real',
                  value = 'Wl33',
                  texname = '\\text{Wl3x3}')

WU1x1 = Parameter(name = 'WU1x1',
                  nature = 'internal',
                  type = 'real',
                  value = 'WU11',
                  texname = '\\text{WU1x1}')

WU2x2 = Parameter(name = 'WU2x2',
                  nature = 'internal',
                  type = 'real',
                  value = 'WU22',
                  texname = '\\text{WU2x2}')

WU3x3 = Parameter(name = 'WU3x3',
                  nature = 'internal',
                  type = 'real',
                  value = 'WU33',
                  texname = '\\text{WU3x3}')

WD1x1 = Parameter(name = 'WD1x1',
                  nature = 'internal',
                  type = 'real',
                  value = 'WD11',
                  texname = '\\text{WD1x1}')

WD2x2 = Parameter(name = 'WD2x2',
                  nature = 'internal',
                  type = 'real',
                  value = 'WD22',
                  texname = '\\text{WD2x2}')

WD3x3 = Parameter(name = 'WD3x3',
                  nature = 'internal',
                  type = 'real',
                  value = 'WD33',
                  texname = '\\text{WD3x3}')

KL1x1 = Parameter(name = 'KL1x1',
                  nature = 'internal',
                  type = 'real',
                  value = '1',
                  texname = '\\text{KL1x1}')

KL2x2 = Parameter(name = 'KL2x2',
                  nature = 'internal',
                  type = 'real',
                  value = '1',
                  texname = '\\text{KL2x2}')

KL3x3 = Parameter(name = 'KL3x3',
                  nature = 'internal',
                  type = 'real',
                  value = '1',
                  texname = '\\text{KL3x3}')

KL4x1 = Parameter(name = 'KL4x1',
                  nature = 'internal',
                  type = 'real',
                  value = 'VKe',
                  texname = '\\text{KL4x1}')

KL5x2 = Parameter(name = 'KL5x2',
                  nature = 'internal',
                  type = 'real',
                  value = 'VKmu',
                  texname = '\\text{KL5x2}')

KL6x3 = Parameter(name = 'KL6x3',
                  nature = 'internal',
                  type = 'real',
                  value = 'VKta',
                  texname = '\\text{KL6x3}')

KR1x1 = Parameter(name = 'KR1x1',
                  nature = 'internal',
                  type = 'real',
                  value = '-VKe',
                  texname = '\\text{KR1x1}')

KR2x2 = Parameter(name = 'KR2x2',
                  nature = 'internal',
                  type = 'real',
                  value = '-VKmu',
                  texname = '\\text{KR2x2}')

KR3x3 = Parameter(name = 'KR3x3',
                  nature = 'internal',
                  type = 'real',
                  value = '-VKta',
                  texname = '\\text{KR3x3}')

KR4x1 = Parameter(name = 'KR4x1',
                  nature = 'internal',
                  type = 'real',
                  value = '1',
                  texname = '\\text{KR4x1}')

KR5x2 = Parameter(name = 'KR5x2',
                  nature = 'internal',
                  type = 'real',
                  value = '1',
                  texname = '\\text{KR5x2}')

KR6x3 = Parameter(name = 'KR6x3',
                  nature = 'internal',
                  type = 'real',
                  value = '1',
                  texname = '\\text{KR6x3}')

CKMR1x1 = Parameter(name = 'CKMR1x1',
                    nature = 'internal',
                    type = 'complex',
                    value = 'CKML1x1*WD1x1*WU1x1',
                    texname = '\\text{CKMR1x1}')

CKMR1x2 = Parameter(name = 'CKMR1x2',
                    nature = 'internal',
                    type = 'complex',
                    value = 'CKML1x2*WD2x2*WU1x1',
                    texname = '\\text{CKMR1x2}')

CKMR1x3 = Parameter(name = 'CKMR1x3',
                    nature = 'internal',
                    type = 'complex',
                    value = 'CKML1x3*WD3x3*WU1x1',
                    texname = '\\text{CKMR1x3}')

CKMR2x1 = Parameter(name = 'CKMR2x1',
                    nature = 'internal',
                    type = 'complex',
                    value = 'CKML2x1*WD1x1*WU2x2',
                    texname = '\\text{CKMR2x1}')

CKMR2x2 = Parameter(name = 'CKMR2x2',
                    nature = 'internal',
                    type = 'complex',
                    value = 'CKML2x2*WD2x2*WU2x2',
                    texname = '\\text{CKMR2x2}')

CKMR2x3 = Parameter(name = 'CKMR2x3',
                    nature = 'internal',
                    type = 'complex',
                    value = 'CKML2x3*WD3x3*WU2x2',
                    texname = '\\text{CKMR2x3}')

CKMR3x1 = Parameter(name = 'CKMR3x1',
                    nature = 'internal',
                    type = 'complex',
                    value = 'CKML3x1*WD1x1*WU3x3',
                    texname = '\\text{CKMR3x1}')

CKMR3x2 = Parameter(name = 'CKMR3x2',
                    nature = 'internal',
                    type = 'complex',
                    value = 'CKML3x2*WD2x2*WU3x3',
                    texname = '\\text{CKMR3x2}')

CKMR3x3 = Parameter(name = 'CKMR3x3',
                    nature = 'internal',
                    type = 'complex',
                    value = 'CKML3x3*WD3x3*WU3x3',
                    texname = '\\text{CKMR3x3}')

sw = Parameter(name = 'sw',
               nature = 'internal',
               type = 'real',
               value = 'cmath.sqrt(sw2)',
               texname = 's_w')

ee = Parameter(name = 'ee',
               nature = 'internal',
               type = 'real',
               value = '2*cmath.sqrt(aEW)*cmath.sqrt(cmath.pi)',
               texname = 'e')

k2 = Parameter(name = 'k2',
               nature = 'internal',
               type = 'real',
               value = 'cmath.sqrt(-k1**2 + vev**2)',
               texname = '\\text{k2}')

eps = Parameter(name = 'eps',
                nature = 'internal',
                type = 'real',
                value = '(2*k1*k2)/vev**2',
                texname = '\\text{eps}')

sphi = Parameter(name = 'sphi',
                 nature = 'internal',
                 type = 'real',
                 value = '-0.25*((1 - 2*sw**2)**1.5*vev**2)/(cw**4*vR**2)',
                 texname = 's_{\\phi }')

sxi = Parameter(name = 'sxi',
                nature = 'internal',
                type = 'real',
                value = '-((k1*k2)/vR**2)',
                texname = 's_{\\theta }')

g1 = Parameter(name = 'g1',
               nature = 'internal',
               type = 'real',
               value = 'ee/cmath.sqrt(1 - 2*sw**2)',
               texname = 'g_1')

gw = Parameter(name = 'gw',
               nature = 'internal',
               type = 'real',
               value = 'ee/sw',
               texname = 'g_w')

cphi = Parameter(name = 'cphi',
                 nature = 'internal',
                 type = 'real',
                 value = 'cmath.sqrt(1 - sphi**2)',
                 texname = 'c_{\\phi }')

cxi = Parameter(name = 'cxi',
                nature = 'internal',
                type = 'real',
                value = 'cmath.sqrt(1 - sxi**2)',
                texname = 'c_{\\theta }')

MA01 = Parameter(name = 'MA01',
                 nature = 'internal',
                 type = 'real',
                 value = 'cmath.sqrt(-2*(2*lambda2 - lambda3)*vev**2 + (alpha3*vR**2)/(2.*cmath.sqrt(1 - eps**2)))',
                 texname = 'M_{\\text{A01}}')

MH = Parameter(name = 'MH',
               nature = 'internal',
               type = 'real',
               value = 'cmath.sqrt(2)*cmath.sqrt((lambda1 + eps**2*(2*lambda1 + lambda3) + 2*eps*lambda4)*vev**2)',
               texname = 'M_H')

MH01 = Parameter(name = 'MH01',
                 nature = 'internal',
                 type = 'real',
                 value = 'cmath.sqrt((alpha3*vR**2)/cmath.sqrt(1 - eps**2))/cmath.sqrt(2)',
                 texname = 'M_{\\text{H01}}')

MHP1 = Parameter(name = 'MHP1',
                 nature = 'internal',
                 type = 'real',
                 value = 'cmath.sqrt(((-2*rho1 + rho3)*vR**2)/2. + (alpha3*vev**2*cmath.sqrt(1 - eps**2))/4.)',
                 texname = 'M_{\\text{HP1}}')

MHP2 = Parameter(name = 'MHP2',
                 nature = 'internal',
                 type = 'real',
                 value = 'cmath.sqrt(alpha3*(vR**2/cmath.sqrt(1 - eps**2) + (vev**2*cmath.sqrt(1 - eps**2))/2.))/cmath.sqrt(2)',
                 texname = 'M_{\\text{HP2}}')

MHPPL = Parameter(name = 'MHPPL',
                  nature = 'internal',
                  type = 'real',
                  value = 'cmath.sqrt((-2*rho1 + rho3)*vR**2 + alpha3*vev**2*cmath.sqrt(1 - eps**2))/cmath.sqrt(2)',
                  texname = 'M_{\\text{HPPL}}')

MHPPR = Parameter(name = 'MHPPR',
                  nature = 'internal',
                  type = 'real',
                  value = 'cmath.sqrt(2*rho2*vR**2 + (alpha3*vev**2*cmath.sqrt(1 - eps**2))/2.)',
                  texname = 'M_{\\text{HPPR}}')

MW2 = Parameter(name = 'MW2',
                nature = 'internal',
                type = 'real',
                value = '(gw*vR)/cmath.sqrt(2)',
                texname = 'M_{\\text{W2}}')

MZ2 = Parameter(name = 'MZ2',
                nature = 'internal',
                type = 'real',
                value = '(MW*MW2*cmath.sqrt(2))/(MZ*cmath.sqrt(1 - 2*sw**2))',
                texname = 'M_{\\text{Z2}}')

I1c11 = Parameter(name = 'I1c11',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML1x1*yMU1x1',
                  texname = '\\text{I1c11}')

I1c12 = Parameter(name = 'I1c12',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML1x2*yMU1x1',
                  texname = '\\text{I1c12}')

I1c13 = Parameter(name = 'I1c13',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML1x3*yMU1x1',
                  texname = '\\text{I1c13}')

I1c21 = Parameter(name = 'I1c21',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML2x1*yMU2x2',
                  texname = '\\text{I1c21}')

I1c22 = Parameter(name = 'I1c22',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML2x2*yMU2x2',
                  texname = '\\text{I1c22}')

I1c23 = Parameter(name = 'I1c23',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML2x3*yMU2x2',
                  texname = '\\text{I1c23}')

I1c31 = Parameter(name = 'I1c31',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML3x1*yMU3x3',
                  texname = '\\text{I1c31}')

I1c32 = Parameter(name = 'I1c32',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML3x2*yMU3x3',
                  texname = '\\text{I1c32}')

I1c33 = Parameter(name = 'I1c33',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML3x3*yMU3x3',
                  texname = '\\text{I1c33}')

I10c11 = Parameter(name = 'I10c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yMU1x1*complexconjugate(CKMR1x1)',
                   texname = '\\text{I10c11}')

I10c12 = Parameter(name = 'I10c12',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yMU2x2*complexconjugate(CKMR2x1)',
                   texname = '\\text{I10c12}')

I10c13 = Parameter(name = 'I10c13',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yMU3x3*complexconjugate(CKMR3x1)',
                   texname = '\\text{I10c13}')

I10c21 = Parameter(name = 'I10c21',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yMU1x1*complexconjugate(CKMR1x2)',
                   texname = '\\text{I10c21}')

I10c22 = Parameter(name = 'I10c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yMU2x2*complexconjugate(CKMR2x2)',
                   texname = '\\text{I10c22}')

I10c23 = Parameter(name = 'I10c23',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yMU3x3*complexconjugate(CKMR3x2)',
                   texname = '\\text{I10c23}')

I10c31 = Parameter(name = 'I10c31',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yMU1x1*complexconjugate(CKMR1x3)',
                   texname = '\\text{I10c31}')

I10c32 = Parameter(name = 'I10c32',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yMU2x2*complexconjugate(CKMR2x3)',
                   texname = '\\text{I10c32}')

I10c33 = Parameter(name = 'I10c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yMU3x3*complexconjugate(CKMR3x3)',
                   texname = '\\text{I10c33}')

I11c11 = Parameter(name = 'I11c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yDO1x1*complexconjugate(CKMR1x1)',
                   texname = '\\text{I11c11}')

I11c12 = Parameter(name = 'I11c12',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yDO1x1*complexconjugate(CKMR2x1)',
                   texname = '\\text{I11c12}')

I11c13 = Parameter(name = 'I11c13',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yDO1x1*complexconjugate(CKMR3x1)',
                   texname = '\\text{I11c13}')

I11c21 = Parameter(name = 'I11c21',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yDO2x2*complexconjugate(CKMR1x2)',
                   texname = '\\text{I11c21}')

I11c22 = Parameter(name = 'I11c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yDO2x2*complexconjugate(CKMR2x2)',
                   texname = '\\text{I11c22}')

I11c23 = Parameter(name = 'I11c23',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yDO2x2*complexconjugate(CKMR3x2)',
                   texname = '\\text{I11c23}')

I11c31 = Parameter(name = 'I11c31',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yDO3x3*complexconjugate(CKMR1x3)',
                   texname = '\\text{I11c31}')

I11c32 = Parameter(name = 'I11c32',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yDO3x3*complexconjugate(CKMR2x3)',
                   texname = '\\text{I11c32}')

I11c33 = Parameter(name = 'I11c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yDO3x3*complexconjugate(CKMR3x3)',
                   texname = '\\text{I11c33}')

I12c11 = Parameter(name = 'I12c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yMU1x1*complexconjugate(CKML1x1)',
                   texname = '\\text{I12c11}')

I12c12 = Parameter(name = 'I12c12',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yMU2x2*complexconjugate(CKML2x1)',
                   texname = '\\text{I12c12}')

I12c13 = Parameter(name = 'I12c13',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yMU3x3*complexconjugate(CKML3x1)',
                   texname = '\\text{I12c13}')

I12c21 = Parameter(name = 'I12c21',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yMU1x1*complexconjugate(CKML1x2)',
                   texname = '\\text{I12c21}')

I12c22 = Parameter(name = 'I12c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yMU2x2*complexconjugate(CKML2x2)',
                   texname = '\\text{I12c22}')

I12c23 = Parameter(name = 'I12c23',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yMU3x3*complexconjugate(CKML3x2)',
                   texname = '\\text{I12c23}')

I12c31 = Parameter(name = 'I12c31',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yMU1x1*complexconjugate(CKML1x3)',
                   texname = '\\text{I12c31}')

I12c32 = Parameter(name = 'I12c32',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yMU2x2*complexconjugate(CKML2x3)',
                   texname = '\\text{I12c32}')

I12c33 = Parameter(name = 'I12c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'yMU3x3*complexconjugate(CKML3x3)',
                   texname = '\\text{I12c33}')

I13c11 = Parameter(name = 'I13c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1**2*KR1x1**2*yNL1x1 + KL1x1*KL4x1*KR1x1*KR4x1*yNL4x4',
                   texname = '\\text{I13c11}')

I13c14 = Parameter(name = 'I13c14',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KL4x1*KR1x1**2*yNL1x1 + KL4x1**2*KR1x1*KR4x1*yNL4x4',
                   texname = '\\text{I13c14}')

I13c22 = Parameter(name = 'I13c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2**2*KR2x2**2*yNL2x2 + KL2x2*KL5x2*KR2x2*KR5x2*yNL5x5',
                   texname = '\\text{I13c22}')

I13c25 = Parameter(name = 'I13c25',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KL5x2*KR2x2**2*yNL2x2 + KL5x2**2*KR2x2*KR5x2*yNL5x5',
                   texname = '\\text{I13c25}')

I13c33 = Parameter(name = 'I13c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3**2*KR3x3**2*yNL3x3 + KL3x3*KL6x3*KR3x3*KR6x3*yNL6x6',
                   texname = '\\text{I13c33}')

I13c36 = Parameter(name = 'I13c36',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KL6x3*KR3x3**2*yNL3x3 + KL6x3**2*KR3x3*KR6x3*yNL6x6',
                   texname = '\\text{I13c36}')

I13c41 = Parameter(name = 'I13c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1**2*KR1x1*KR4x1*yNL1x1 + KL1x1*KL4x1*KR4x1**2*yNL4x4',
                   texname = '\\text{I13c41}')

I13c44 = Parameter(name = 'I13c44',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KL4x1*KR1x1*KR4x1*yNL1x1 + KL4x1**2*KR4x1**2*yNL4x4',
                   texname = '\\text{I13c44}')

I13c52 = Parameter(name = 'I13c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2**2*KR2x2*KR5x2*yNL2x2 + KL2x2*KL5x2*KR5x2**2*yNL5x5',
                   texname = '\\text{I13c52}')

I13c55 = Parameter(name = 'I13c55',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KL5x2*KR2x2*KR5x2*yNL2x2 + KL5x2**2*KR5x2**2*yNL5x5',
                   texname = '\\text{I13c55}')

I13c63 = Parameter(name = 'I13c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3**2*KR3x3*KR6x3*yNL3x3 + KL3x3*KL6x3*KR6x3**2*yNL6x6',
                   texname = '\\text{I13c63}')

I13c66 = Parameter(name = 'I13c66',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KL6x3*KR3x3*KR6x3*yNL3x3 + KL6x3**2*KR6x3**2*yNL6x6',
                   texname = '\\text{I13c66}')

I14c11 = Parameter(name = 'I14c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1**2*KR1x1**2*yNL1x1 + KL1x1*KL4x1*KR1x1*KR4x1*yNL4x4',
                   texname = '\\text{I14c11}')

I14c14 = Parameter(name = 'I14c14',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1**2*KR1x1*KR4x1*yNL1x1 + KL1x1*KL4x1*KR4x1**2*yNL4x4',
                   texname = '\\text{I14c14}')

I14c22 = Parameter(name = 'I14c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2**2*KR2x2**2*yNL2x2 + KL2x2*KL5x2*KR2x2*KR5x2*yNL5x5',
                   texname = '\\text{I14c22}')

I14c25 = Parameter(name = 'I14c25',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2**2*KR2x2*KR5x2*yNL2x2 + KL2x2*KL5x2*KR5x2**2*yNL5x5',
                   texname = '\\text{I14c25}')

I14c33 = Parameter(name = 'I14c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3**2*KR3x3**2*yNL3x3 + KL3x3*KL6x3*KR3x3*KR6x3*yNL6x6',
                   texname = '\\text{I14c33}')

I14c36 = Parameter(name = 'I14c36',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3**2*KR3x3*KR6x3*yNL3x3 + KL3x3*KL6x3*KR6x3**2*yNL6x6',
                   texname = '\\text{I14c36}')

I14c41 = Parameter(name = 'I14c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KL4x1*KR1x1**2*yNL1x1 + KL4x1**2*KR1x1*KR4x1*yNL4x4',
                   texname = '\\text{I14c41}')

I14c44 = Parameter(name = 'I14c44',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KL4x1*KR1x1*KR4x1*yNL1x1 + KL4x1**2*KR4x1**2*yNL4x4',
                   texname = '\\text{I14c44}')

I14c52 = Parameter(name = 'I14c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KL5x2*KR2x2**2*yNL2x2 + KL5x2**2*KR2x2*KR5x2*yNL5x5',
                   texname = '\\text{I14c52}')

I14c55 = Parameter(name = 'I14c55',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KL5x2*KR2x2*KR5x2*yNL2x2 + KL5x2**2*KR5x2**2*yNL5x5',
                   texname = '\\text{I14c55}')

I14c63 = Parameter(name = 'I14c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KL6x3*KR3x3**2*yNL3x3 + KL6x3**2*KR3x3*KR6x3*yNL6x6',
                   texname = '\\text{I14c63}')

I14c66 = Parameter(name = 'I14c66',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KL6x3*KR3x3*KR6x3*yNL3x3 + KL6x3**2*KR6x3**2*yNL6x6',
                   texname = '\\text{I14c66}')

I15c11 = Parameter(name = 'I15c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1**2*KR1x1**2*yNL1x1 + KL1x1*KL4x1*KR1x1*KR4x1*yNL4x4',
                   texname = '\\text{I15c11}')

I15c14 = Parameter(name = 'I15c14',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1**2*KR1x1*KR4x1*yNL1x1 + KL1x1*KL4x1*KR4x1**2*yNL4x4',
                   texname = '\\text{I15c14}')

I15c22 = Parameter(name = 'I15c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2**2*KR2x2**2*yNL2x2 + KL2x2*KL5x2*KR2x2*KR5x2*yNL5x5',
                   texname = '\\text{I15c22}')

I15c25 = Parameter(name = 'I15c25',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2**2*KR2x2*KR5x2*yNL2x2 + KL2x2*KL5x2*KR5x2**2*yNL5x5',
                   texname = '\\text{I15c25}')

I15c33 = Parameter(name = 'I15c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3**2*KR3x3**2*yNL3x3 + KL3x3*KL6x3*KR3x3*KR6x3*yNL6x6',
                   texname = '\\text{I15c33}')

I15c36 = Parameter(name = 'I15c36',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3**2*KR3x3*KR6x3*yNL3x3 + KL3x3*KL6x3*KR6x3**2*yNL6x6',
                   texname = '\\text{I15c36}')

I15c41 = Parameter(name = 'I15c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KL4x1*KR1x1**2*yNL1x1 + KL4x1**2*KR1x1*KR4x1*yNL4x4',
                   texname = '\\text{I15c41}')

I15c44 = Parameter(name = 'I15c44',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KL4x1*KR1x1*KR4x1*yNL1x1 + KL4x1**2*KR4x1**2*yNL4x4',
                   texname = '\\text{I15c44}')

I15c52 = Parameter(name = 'I15c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KL5x2*KR2x2**2*yNL2x2 + KL5x2**2*KR2x2*KR5x2*yNL5x5',
                   texname = '\\text{I15c52}')

I15c55 = Parameter(name = 'I15c55',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KL5x2*KR2x2*KR5x2*yNL2x2 + KL5x2**2*KR5x2**2*yNL5x5',
                   texname = '\\text{I15c55}')

I15c63 = Parameter(name = 'I15c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KL6x3*KR3x3**2*yNL3x3 + KL6x3**2*KR3x3*KR6x3*yNL6x6',
                   texname = '\\text{I15c63}')

I15c66 = Parameter(name = 'I15c66',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KL6x3*KR3x3*KR6x3*yNL3x3 + KL6x3**2*KR6x3**2*yNL6x6',
                   texname = '\\text{I15c66}')

I16c11 = Parameter(name = 'I16c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1**2*KR1x1**2*yNL1x1 + KL1x1*KL4x1*KR1x1*KR4x1*yNL4x4',
                   texname = '\\text{I16c11}')

I16c14 = Parameter(name = 'I16c14',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KL4x1*KR1x1**2*yNL1x1 + KL4x1**2*KR1x1*KR4x1*yNL4x4',
                   texname = '\\text{I16c14}')

I16c22 = Parameter(name = 'I16c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2**2*KR2x2**2*yNL2x2 + KL2x2*KL5x2*KR2x2*KR5x2*yNL5x5',
                   texname = '\\text{I16c22}')

I16c25 = Parameter(name = 'I16c25',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KL5x2*KR2x2**2*yNL2x2 + KL5x2**2*KR2x2*KR5x2*yNL5x5',
                   texname = '\\text{I16c25}')

I16c33 = Parameter(name = 'I16c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3**2*KR3x3**2*yNL3x3 + KL3x3*KL6x3*KR3x3*KR6x3*yNL6x6',
                   texname = '\\text{I16c33}')

I16c36 = Parameter(name = 'I16c36',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KL6x3*KR3x3**2*yNL3x3 + KL6x3**2*KR3x3*KR6x3*yNL6x6',
                   texname = '\\text{I16c36}')

I16c41 = Parameter(name = 'I16c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1**2*KR1x1*KR4x1*yNL1x1 + KL1x1*KL4x1*KR4x1**2*yNL4x4',
                   texname = '\\text{I16c41}')

I16c44 = Parameter(name = 'I16c44',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KL4x1*KR1x1*KR4x1*yNL1x1 + KL4x1**2*KR4x1**2*yNL4x4',
                   texname = '\\text{I16c44}')

I16c52 = Parameter(name = 'I16c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2**2*KR2x2*KR5x2*yNL2x2 + KL2x2*KL5x2*KR5x2**2*yNL5x5',
                   texname = '\\text{I16c52}')

I16c55 = Parameter(name = 'I16c55',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KL5x2*KR2x2*KR5x2*yNL2x2 + KL5x2**2*KR5x2**2*yNL5x5',
                   texname = '\\text{I16c55}')

I16c63 = Parameter(name = 'I16c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3**2*KR3x3*KR6x3*yNL3x3 + KL3x3*KL6x3*KR6x3**2*yNL6x6',
                   texname = '\\text{I16c63}')

I16c66 = Parameter(name = 'I16c66',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KL6x3*KR3x3*KR6x3*yNL3x3 + KL6x3**2*KR6x3**2*yNL6x6',
                   texname = '\\text{I16c66}')

I17c11 = Parameter(name = 'I17c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KR1x1*yML1x1',
                   texname = '\\text{I17c11}')

I17c14 = Parameter(name = 'I17c14',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL4x1*KR1x1*yML1x1',
                   texname = '\\text{I17c14}')

I17c22 = Parameter(name = 'I17c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KR2x2*yML2x2',
                   texname = '\\text{I17c22}')

I17c25 = Parameter(name = 'I17c25',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL5x2*KR2x2*yML2x2',
                   texname = '\\text{I17c25}')

I17c33 = Parameter(name = 'I17c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KR3x3*yML3x3',
                   texname = '\\text{I17c33}')

I17c36 = Parameter(name = 'I17c36',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL6x3*KR3x3*yML3x3',
                   texname = '\\text{I17c36}')

I17c41 = Parameter(name = 'I17c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KR4x1*yML1x1',
                   texname = '\\text{I17c41}')

I17c44 = Parameter(name = 'I17c44',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL4x1*KR4x1*yML1x1',
                   texname = '\\text{I17c44}')

I17c52 = Parameter(name = 'I17c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KR5x2*yML2x2',
                   texname = '\\text{I17c52}')

I17c55 = Parameter(name = 'I17c55',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL5x2*KR5x2*yML2x2',
                   texname = '\\text{I17c55}')

I17c63 = Parameter(name = 'I17c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KR6x3*yML3x3',
                   texname = '\\text{I17c63}')

I17c66 = Parameter(name = 'I17c66',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL6x3*KR6x3*yML3x3',
                   texname = '\\text{I17c66}')

I18c11 = Parameter(name = 'I18c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KR1x1*yML1x1',
                   texname = '\\text{I18c11}')

I18c14 = Parameter(name = 'I18c14',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KR4x1*yML1x1',
                   texname = '\\text{I18c14}')

I18c22 = Parameter(name = 'I18c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KR2x2*yML2x2',
                   texname = '\\text{I18c22}')

I18c25 = Parameter(name = 'I18c25',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KR5x2*yML2x2',
                   texname = '\\text{I18c25}')

I18c33 = Parameter(name = 'I18c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KR3x3*yML3x3',
                   texname = '\\text{I18c33}')

I18c36 = Parameter(name = 'I18c36',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KR6x3*yML3x3',
                   texname = '\\text{I18c36}')

I18c41 = Parameter(name = 'I18c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL4x1*KR1x1*yML1x1',
                   texname = '\\text{I18c41}')

I18c44 = Parameter(name = 'I18c44',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL4x1*KR4x1*yML1x1',
                   texname = '\\text{I18c44}')

I18c52 = Parameter(name = 'I18c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL5x2*KR2x2*yML2x2',
                   texname = '\\text{I18c52}')

I18c55 = Parameter(name = 'I18c55',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL5x2*KR5x2*yML2x2',
                   texname = '\\text{I18c55}')

I18c63 = Parameter(name = 'I18c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL6x3*KR3x3*yML3x3',
                   texname = '\\text{I18c63}')

I18c66 = Parameter(name = 'I18c66',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL6x3*KR6x3*yML3x3',
                   texname = '\\text{I18c66}')

I19c11 = Parameter(name = 'I19c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KR1x1*yML1x1',
                   texname = '\\text{I19c11}')

I19c14 = Parameter(name = 'I19c14',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KR4x1*yML1x1',
                   texname = '\\text{I19c14}')

I19c22 = Parameter(name = 'I19c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KR2x2*yML2x2',
                   texname = '\\text{I19c22}')

I19c25 = Parameter(name = 'I19c25',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KR5x2*yML2x2',
                   texname = '\\text{I19c25}')

I19c33 = Parameter(name = 'I19c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KR3x3*yML3x3',
                   texname = '\\text{I19c33}')

I19c36 = Parameter(name = 'I19c36',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KR6x3*yML3x3',
                   texname = '\\text{I19c36}')

I19c41 = Parameter(name = 'I19c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL4x1*KR1x1*yML1x1',
                   texname = '\\text{I19c41}')

I19c44 = Parameter(name = 'I19c44',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL4x1*KR4x1*yML1x1',
                   texname = '\\text{I19c44}')

I19c52 = Parameter(name = 'I19c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL5x2*KR2x2*yML2x2',
                   texname = '\\text{I19c52}')

I19c55 = Parameter(name = 'I19c55',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL5x2*KR5x2*yML2x2',
                   texname = '\\text{I19c55}')

I19c63 = Parameter(name = 'I19c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL6x3*KR3x3*yML3x3',
                   texname = '\\text{I19c63}')

I19c66 = Parameter(name = 'I19c66',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL6x3*KR6x3*yML3x3',
                   texname = '\\text{I19c66}')

I2c11 = Parameter(name = 'I2c11',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML1x1*yDO1x1',
                  texname = '\\text{I2c11}')

I2c12 = Parameter(name = 'I2c12',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML1x2*yDO2x2',
                  texname = '\\text{I2c12}')

I2c13 = Parameter(name = 'I2c13',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML1x3*yDO3x3',
                  texname = '\\text{I2c13}')

I2c21 = Parameter(name = 'I2c21',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML2x1*yDO1x1',
                  texname = '\\text{I2c21}')

I2c22 = Parameter(name = 'I2c22',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML2x2*yDO2x2',
                  texname = '\\text{I2c22}')

I2c23 = Parameter(name = 'I2c23',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML2x3*yDO3x3',
                  texname = '\\text{I2c23}')

I2c31 = Parameter(name = 'I2c31',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML3x1*yDO1x1',
                  texname = '\\text{I2c31}')

I2c32 = Parameter(name = 'I2c32',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML3x2*yDO2x2',
                  texname = '\\text{I2c32}')

I2c33 = Parameter(name = 'I2c33',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML3x3*yDO3x3',
                  texname = '\\text{I2c33}')

I20c11 = Parameter(name = 'I20c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KR1x1*yML1x1',
                   texname = '\\text{I20c11}')

I20c14 = Parameter(name = 'I20c14',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL4x1*KR1x1*yML1x1',
                   texname = '\\text{I20c14}')

I20c22 = Parameter(name = 'I20c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KR2x2*yML2x2',
                   texname = '\\text{I20c22}')

I20c25 = Parameter(name = 'I20c25',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL5x2*KR2x2*yML2x2',
                   texname = '\\text{I20c25}')

I20c33 = Parameter(name = 'I20c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KR3x3*yML3x3',
                   texname = '\\text{I20c33}')

I20c36 = Parameter(name = 'I20c36',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL6x3*KR3x3*yML3x3',
                   texname = '\\text{I20c36}')

I20c41 = Parameter(name = 'I20c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KR4x1*yML1x1',
                   texname = '\\text{I20c41}')

I20c44 = Parameter(name = 'I20c44',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL4x1*KR4x1*yML1x1',
                   texname = '\\text{I20c44}')

I20c52 = Parameter(name = 'I20c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KR5x2*yML2x2',
                   texname = '\\text{I20c52}')

I20c55 = Parameter(name = 'I20c55',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL5x2*KR5x2*yML2x2',
                   texname = '\\text{I20c55}')

I20c63 = Parameter(name = 'I20c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KR6x3*yML3x3',
                   texname = '\\text{I20c63}')

I20c66 = Parameter(name = 'I20c66',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL6x3*KR6x3*yML3x3',
                   texname = '\\text{I20c66}')

I21c11 = Parameter(name = 'I21c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*yML1x1',
                   texname = '\\text{I21c11}')

I21c22 = Parameter(name = 'I21c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*yML2x2',
                   texname = '\\text{I21c22}')

I21c33 = Parameter(name = 'I21c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*yML3x3',
                   texname = '\\text{I21c33}')

I21c41 = Parameter(name = 'I21c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL4x1*yML1x1',
                   texname = '\\text{I21c41}')

I21c52 = Parameter(name = 'I21c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL5x2*yML2x2',
                   texname = '\\text{I21c52}')

I21c63 = Parameter(name = 'I21c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL6x3*yML3x3',
                   texname = '\\text{I21c63}')

I22c11 = Parameter(name = 'I22c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1**2*KR1x1*yNL1x1 + KL1x1*KL4x1*KR4x1*yNL4x4',
                   texname = '\\text{I22c11}')

I22c22 = Parameter(name = 'I22c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2**2*KR2x2*yNL2x2 + KL2x2*KL5x2*KR5x2*yNL5x5',
                   texname = '\\text{I22c22}')

I22c33 = Parameter(name = 'I22c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3**2*KR3x3*yNL3x3 + KL3x3*KL6x3*KR6x3*yNL6x6',
                   texname = '\\text{I22c33}')

I22c41 = Parameter(name = 'I22c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KL4x1*KR1x1*yNL1x1 + KL4x1**2*KR4x1*yNL4x4',
                   texname = '\\text{I22c41}')

I22c52 = Parameter(name = 'I22c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KL5x2*KR2x2*yNL2x2 + KL5x2**2*KR5x2*yNL5x5',
                   texname = '\\text{I22c52}')

I22c63 = Parameter(name = 'I22c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KL6x3*KR3x3*yNL3x3 + KL6x3**2*KR6x3*yNL6x6',
                   texname = '\\text{I22c63}')

I23c11 = Parameter(name = 'I23c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1*yML1x1',
                   texname = '\\text{I23c11}')

I23c22 = Parameter(name = 'I23c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2*yML2x2',
                   texname = '\\text{I23c22}')

I23c33 = Parameter(name = 'I23c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3*yML3x3',
                   texname = '\\text{I23c33}')

I23c41 = Parameter(name = 'I23c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR4x1*yML1x1',
                   texname = '\\text{I23c41}')

I23c52 = Parameter(name = 'I23c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR5x2*yML2x2',
                   texname = '\\text{I23c52}')

I23c63 = Parameter(name = 'I23c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR6x3*yML3x3',
                   texname = '\\text{I23c63}')

I24c11 = Parameter(name = 'I24c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KR1x1**2*yNL1x1 + KL4x1*KR1x1*KR4x1*yNL4x4',
                   texname = '\\text{I24c11}')

I24c22 = Parameter(name = 'I24c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KR2x2**2*yNL2x2 + KL5x2*KR2x2*KR5x2*yNL5x5',
                   texname = '\\text{I24c22}')

I24c33 = Parameter(name = 'I24c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KR3x3**2*yNL3x3 + KL6x3*KR3x3*KR6x3*yNL6x6',
                   texname = '\\text{I24c33}')

I24c41 = Parameter(name = 'I24c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KR1x1*KR4x1*yNL1x1 + KL4x1*KR4x1**2*yNL4x4',
                   texname = '\\text{I24c41}')

I24c52 = Parameter(name = 'I24c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KR2x2*KR5x2*yNL2x2 + KL5x2*KR5x2**2*yNL5x5',
                   texname = '\\text{I24c52}')

I24c63 = Parameter(name = 'I24c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KR3x3*KR6x3*yNL3x3 + KL6x3*KR6x3**2*yNL6x6',
                   texname = '\\text{I24c63}')

I25c11 = Parameter(name = 'I25c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KR1x1**2*yNL1x1 + KL4x1*KR1x1*KR4x1*yNL4x4',
                   texname = '\\text{I25c11}')

I25c22 = Parameter(name = 'I25c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KR2x2**2*yNL2x2 + KL5x2*KR2x2*KR5x2*yNL5x5',
                   texname = '\\text{I25c22}')

I25c33 = Parameter(name = 'I25c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KR3x3**2*yNL3x3 + KL6x3*KR3x3*KR6x3*yNL6x6',
                   texname = '\\text{I25c33}')

I25c41 = Parameter(name = 'I25c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KR1x1*KR4x1*yNL1x1 + KL4x1*KR4x1**2*yNL4x4',
                   texname = '\\text{I25c41}')

I25c52 = Parameter(name = 'I25c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KR2x2*KR5x2*yNL2x2 + KL5x2*KR5x2**2*yNL5x5',
                   texname = '\\text{I25c52}')

I25c63 = Parameter(name = 'I25c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KR3x3*KR6x3*yNL3x3 + KL6x3*KR6x3**2*yNL6x6',
                   texname = '\\text{I25c63}')

I26c11 = Parameter(name = 'I26c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*yML1x1',
                   texname = '\\text{I26c11}')

I26c22 = Parameter(name = 'I26c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*yML2x2',
                   texname = '\\text{I26c22}')

I26c33 = Parameter(name = 'I26c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*yML3x3',
                   texname = '\\text{I26c33}')

I26c41 = Parameter(name = 'I26c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL4x1*yML1x1',
                   texname = '\\text{I26c41}')

I26c52 = Parameter(name = 'I26c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL5x2*yML2x2',
                   texname = '\\text{I26c52}')

I26c63 = Parameter(name = 'I26c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL6x3*yML3x3',
                   texname = '\\text{I26c63}')

I27c11 = Parameter(name = 'I27c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1*yML1x1',
                   texname = '\\text{I27c11}')

I27c22 = Parameter(name = 'I27c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2*yML2x2',
                   texname = '\\text{I27c22}')

I27c33 = Parameter(name = 'I27c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3*yML3x3',
                   texname = '\\text{I27c33}')

I27c41 = Parameter(name = 'I27c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR4x1*yML1x1',
                   texname = '\\text{I27c41}')

I27c52 = Parameter(name = 'I27c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR5x2*yML2x2',
                   texname = '\\text{I27c52}')

I27c63 = Parameter(name = 'I27c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR6x3*yML3x3',
                   texname = '\\text{I27c63}')

I28c11 = Parameter(name = 'I28c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1**2*KR1x1*yNL1x1 + KL1x1*KL4x1*KR4x1*yNL4x4',
                   texname = '\\text{I28c11}')

I28c22 = Parameter(name = 'I28c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2**2*KR2x2*yNL2x2 + KL2x2*KL5x2*KR5x2*yNL5x5',
                   texname = '\\text{I28c22}')

I28c33 = Parameter(name = 'I28c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3**2*KR3x3*yNL3x3 + KL3x3*KL6x3*KR6x3*yNL6x6',
                   texname = '\\text{I28c33}')

I28c41 = Parameter(name = 'I28c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KL4x1*KR1x1*yNL1x1 + KL4x1**2*KR4x1*yNL4x4',
                   texname = '\\text{I28c41}')

I28c52 = Parameter(name = 'I28c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KL5x2*KR2x2*yNL2x2 + KL5x2**2*KR5x2*yNL5x5',
                   texname = '\\text{I28c52}')

I28c63 = Parameter(name = 'I28c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KL6x3*KR3x3*yNL3x3 + KL6x3**2*KR6x3*yNL6x6',
                   texname = '\\text{I28c63}')

I29c11 = Parameter(name = 'I29c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KR1x1*yNL1x1 + KL4x1*KR4x1*yNL4x4',
                   texname = '\\text{I29c11}')

I29c22 = Parameter(name = 'I29c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KR2x2*yNL2x2 + KL5x2*KR5x2*yNL5x5',
                   texname = '\\text{I29c22}')

I29c33 = Parameter(name = 'I29c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KR3x3*yNL3x3 + KL6x3*KR6x3*yNL6x6',
                   texname = '\\text{I29c33}')

I3c11 = Parameter(name = 'I3c11',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR1x1*yDO1x1',
                  texname = '\\text{I3c11}')

I3c12 = Parameter(name = 'I3c12',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR1x2*yDO2x2',
                  texname = '\\text{I3c12}')

I3c13 = Parameter(name = 'I3c13',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR1x3*yDO3x3',
                  texname = '\\text{I3c13}')

I3c21 = Parameter(name = 'I3c21',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR2x1*yDO1x1',
                  texname = '\\text{I3c21}')

I3c22 = Parameter(name = 'I3c22',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR2x2*yDO2x2',
                  texname = '\\text{I3c22}')

I3c23 = Parameter(name = 'I3c23',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR2x3*yDO3x3',
                  texname = '\\text{I3c23}')

I3c31 = Parameter(name = 'I3c31',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR3x1*yDO1x1',
                  texname = '\\text{I3c31}')

I3c32 = Parameter(name = 'I3c32',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR3x2*yDO2x2',
                  texname = '\\text{I3c32}')

I3c33 = Parameter(name = 'I3c33',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR3x3*yDO3x3',
                  texname = '\\text{I3c33}')

I30c11 = Parameter(name = 'I30c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KR1x1*yNL1x1 + KL4x1*KR4x1*yNL4x4',
                   texname = '\\text{I30c11}')

I30c22 = Parameter(name = 'I30c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KR2x2*yNL2x2 + KL5x2*KR5x2*yNL5x5',
                   texname = '\\text{I30c22}')

I30c33 = Parameter(name = 'I30c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KR3x3*yNL3x3 + KL6x3*KR6x3*yNL6x6',
                   texname = '\\text{I30c33}')

I31c11 = Parameter(name = 'I31c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**4*yNL1x1 + KR1x1**2*KR4x1**2*yNL4x4',
                   texname = '\\text{I31c11}')

I31c14 = Parameter(name = 'I31c14',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**3*KR4x1*yNL1x1 + KR1x1*KR4x1**3*yNL4x4',
                   texname = '\\text{I31c14}')

I31c22 = Parameter(name = 'I31c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**4*yNL2x2 + KR2x2**2*KR5x2**2*yNL5x5',
                   texname = '\\text{I31c22}')

I31c25 = Parameter(name = 'I31c25',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**3*KR5x2*yNL2x2 + KR2x2*KR5x2**3*yNL5x5',
                   texname = '\\text{I31c25}')

I31c33 = Parameter(name = 'I31c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**4*yNL3x3 + KR3x3**2*KR6x3**2*yNL6x6',
                   texname = '\\text{I31c33}')

I31c36 = Parameter(name = 'I31c36',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**3*KR6x3*yNL3x3 + KR3x3*KR6x3**3*yNL6x6',
                   texname = '\\text{I31c36}')

I31c41 = Parameter(name = 'I31c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**3*KR4x1*yNL1x1 + KR1x1*KR4x1**3*yNL4x4',
                   texname = '\\text{I31c41}')

I31c44 = Parameter(name = 'I31c44',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**2*KR4x1**2*yNL1x1 + KR4x1**4*yNL4x4',
                   texname = '\\text{I31c44}')

I31c52 = Parameter(name = 'I31c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**3*KR5x2*yNL2x2 + KR2x2*KR5x2**3*yNL5x5',
                   texname = '\\text{I31c52}')

I31c55 = Parameter(name = 'I31c55',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**2*KR5x2**2*yNL2x2 + KR5x2**4*yNL5x5',
                   texname = '\\text{I31c55}')

I31c63 = Parameter(name = 'I31c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**3*KR6x3*yNL3x3 + KR3x3*KR6x3**3*yNL6x6',
                   texname = '\\text{I31c63}')

I31c66 = Parameter(name = 'I31c66',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**2*KR6x3**2*yNL3x3 + KR6x3**4*yNL6x6',
                   texname = '\\text{I31c66}')

I32c11 = Parameter(name = 'I32c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**4*yNL1x1 + KR1x1**2*KR4x1**2*yNL4x4',
                   texname = '\\text{I32c11}')

I32c14 = Parameter(name = 'I32c14',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**3*KR4x1*yNL1x1 + KR1x1*KR4x1**3*yNL4x4',
                   texname = '\\text{I32c14}')

I32c22 = Parameter(name = 'I32c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**4*yNL2x2 + KR2x2**2*KR5x2**2*yNL5x5',
                   texname = '\\text{I32c22}')

I32c25 = Parameter(name = 'I32c25',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**3*KR5x2*yNL2x2 + KR2x2*KR5x2**3*yNL5x5',
                   texname = '\\text{I32c25}')

I32c33 = Parameter(name = 'I32c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**4*yNL3x3 + KR3x3**2*KR6x3**2*yNL6x6',
                   texname = '\\text{I32c33}')

I32c36 = Parameter(name = 'I32c36',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**3*KR6x3*yNL3x3 + KR3x3*KR6x3**3*yNL6x6',
                   texname = '\\text{I32c36}')

I32c41 = Parameter(name = 'I32c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**3*KR4x1*yNL1x1 + KR1x1*KR4x1**3*yNL4x4',
                   texname = '\\text{I32c41}')

I32c44 = Parameter(name = 'I32c44',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**2*KR4x1**2*yNL1x1 + KR4x1**4*yNL4x4',
                   texname = '\\text{I32c44}')

I32c52 = Parameter(name = 'I32c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**3*KR5x2*yNL2x2 + KR2x2*KR5x2**3*yNL5x5',
                   texname = '\\text{I32c52}')

I32c55 = Parameter(name = 'I32c55',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**2*KR5x2**2*yNL2x2 + KR5x2**4*yNL5x5',
                   texname = '\\text{I32c55}')

I32c63 = Parameter(name = 'I32c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**3*KR6x3*yNL3x3 + KR3x3*KR6x3**3*yNL6x6',
                   texname = '\\text{I32c63}')

I32c66 = Parameter(name = 'I32c66',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**2*KR6x3**2*yNL3x3 + KR6x3**4*yNL6x6',
                   texname = '\\text{I32c66}')

I33c11 = Parameter(name = 'I33c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**4*yNL1x1 + KR1x1**2*KR4x1**2*yNL4x4',
                   texname = '\\text{I33c11}')

I33c14 = Parameter(name = 'I33c14',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**3*KR4x1*yNL1x1 + KR1x1*KR4x1**3*yNL4x4',
                   texname = '\\text{I33c14}')

I33c22 = Parameter(name = 'I33c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**4*yNL2x2 + KR2x2**2*KR5x2**2*yNL5x5',
                   texname = '\\text{I33c22}')

I33c25 = Parameter(name = 'I33c25',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**3*KR5x2*yNL2x2 + KR2x2*KR5x2**3*yNL5x5',
                   texname = '\\text{I33c25}')

I33c33 = Parameter(name = 'I33c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**4*yNL3x3 + KR3x3**2*KR6x3**2*yNL6x6',
                   texname = '\\text{I33c33}')

I33c36 = Parameter(name = 'I33c36',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**3*KR6x3*yNL3x3 + KR3x3*KR6x3**3*yNL6x6',
                   texname = '\\text{I33c36}')

I33c41 = Parameter(name = 'I33c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**3*KR4x1*yNL1x1 + KR1x1*KR4x1**3*yNL4x4',
                   texname = '\\text{I33c41}')

I33c44 = Parameter(name = 'I33c44',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**2*KR4x1**2*yNL1x1 + KR4x1**4*yNL4x4',
                   texname = '\\text{I33c44}')

I33c52 = Parameter(name = 'I33c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**3*KR5x2*yNL2x2 + KR2x2*KR5x2**3*yNL5x5',
                   texname = '\\text{I33c52}')

I33c55 = Parameter(name = 'I33c55',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**2*KR5x2**2*yNL2x2 + KR5x2**4*yNL5x5',
                   texname = '\\text{I33c55}')

I33c63 = Parameter(name = 'I33c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**3*KR6x3*yNL3x3 + KR3x3*KR6x3**3*yNL6x6',
                   texname = '\\text{I33c63}')

I33c66 = Parameter(name = 'I33c66',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**2*KR6x3**2*yNL3x3 + KR6x3**4*yNL6x6',
                   texname = '\\text{I33c66}')

I34c11 = Parameter(name = 'I34c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**4*yNL1x1 + KR1x1**2*KR4x1**2*yNL4x4',
                   texname = '\\text{I34c11}')

I34c14 = Parameter(name = 'I34c14',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**3*KR4x1*yNL1x1 + KR1x1*KR4x1**3*yNL4x4',
                   texname = '\\text{I34c14}')

I34c22 = Parameter(name = 'I34c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**4*yNL2x2 + KR2x2**2*KR5x2**2*yNL5x5',
                   texname = '\\text{I34c22}')

I34c25 = Parameter(name = 'I34c25',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**3*KR5x2*yNL2x2 + KR2x2*KR5x2**3*yNL5x5',
                   texname = '\\text{I34c25}')

I34c33 = Parameter(name = 'I34c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**4*yNL3x3 + KR3x3**2*KR6x3**2*yNL6x6',
                   texname = '\\text{I34c33}')

I34c36 = Parameter(name = 'I34c36',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**3*KR6x3*yNL3x3 + KR3x3*KR6x3**3*yNL6x6',
                   texname = '\\text{I34c36}')

I34c41 = Parameter(name = 'I34c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**3*KR4x1*yNL1x1 + KR1x1*KR4x1**3*yNL4x4',
                   texname = '\\text{I34c41}')

I34c44 = Parameter(name = 'I34c44',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**2*KR4x1**2*yNL1x1 + KR4x1**4*yNL4x4',
                   texname = '\\text{I34c44}')

I34c52 = Parameter(name = 'I34c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**3*KR5x2*yNL2x2 + KR2x2*KR5x2**3*yNL5x5',
                   texname = '\\text{I34c52}')

I34c55 = Parameter(name = 'I34c55',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**2*KR5x2**2*yNL2x2 + KR5x2**4*yNL5x5',
                   texname = '\\text{I34c55}')

I34c63 = Parameter(name = 'I34c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**3*KR6x3*yNL3x3 + KR3x3*KR6x3**3*yNL6x6',
                   texname = '\\text{I34c63}')

I34c66 = Parameter(name = 'I34c66',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**2*KR6x3**2*yNL3x3 + KR6x3**4*yNL6x6',
                   texname = '\\text{I34c66}')

I35c11 = Parameter(name = 'I35c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**3*yNL1x1 + KR1x1*KR4x1**2*yNL4x4',
                   texname = '\\text{I35c11}')

I35c22 = Parameter(name = 'I35c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**3*yNL2x2 + KR2x2*KR5x2**2*yNL5x5',
                   texname = '\\text{I35c22}')

I35c33 = Parameter(name = 'I35c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**3*yNL3x3 + KR3x3*KR6x3**2*yNL6x6',
                   texname = '\\text{I35c33}')

I35c41 = Parameter(name = 'I35c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**2*KR4x1*yNL1x1 + KR4x1**3*yNL4x4',
                   texname = '\\text{I35c41}')

I35c52 = Parameter(name = 'I35c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**2*KR5x2*yNL2x2 + KR5x2**3*yNL5x5',
                   texname = '\\text{I35c52}')

I35c63 = Parameter(name = 'I35c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**2*KR6x3*yNL3x3 + KR6x3**3*yNL6x6',
                   texname = '\\text{I35c63}')

I36c11 = Parameter(name = 'I36c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**3*yNL1x1 + KR1x1*KR4x1**2*yNL4x4',
                   texname = '\\text{I36c11}')

I36c22 = Parameter(name = 'I36c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**3*yNL2x2 + KR2x2*KR5x2**2*yNL5x5',
                   texname = '\\text{I36c22}')

I36c33 = Parameter(name = 'I36c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**3*yNL3x3 + KR3x3*KR6x3**2*yNL6x6',
                   texname = '\\text{I36c33}')

I36c41 = Parameter(name = 'I36c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**2*KR4x1*yNL1x1 + KR4x1**3*yNL4x4',
                   texname = '\\text{I36c41}')

I36c52 = Parameter(name = 'I36c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**2*KR5x2*yNL2x2 + KR5x2**3*yNL5x5',
                   texname = '\\text{I36c52}')

I36c63 = Parameter(name = 'I36c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**2*KR6x3*yNL3x3 + KR6x3**3*yNL6x6',
                   texname = '\\text{I36c63}')

I37c11 = Parameter(name = 'I37c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**2*yNL1x1 + KR4x1**2*yNL4x4',
                   texname = '\\text{I37c11}')

I37c22 = Parameter(name = 'I37c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**2*yNL2x2 + KR5x2**2*yNL5x5',
                   texname = '\\text{I37c22}')

I37c33 = Parameter(name = 'I37c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**2*yNL3x3 + KR6x3**2*yNL6x6',
                   texname = '\\text{I37c33}')

I38c11 = Parameter(name = 'I38c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**2*yNL1x1 + KR4x1**2*yNL4x4',
                   texname = '\\text{I38c11}')

I38c22 = Parameter(name = 'I38c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**2*yNL2x2 + KR5x2**2*yNL5x5',
                   texname = '\\text{I38c22}')

I38c33 = Parameter(name = 'I38c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**2*yNL3x3 + KR6x3**2*yNL6x6',
                   texname = '\\text{I38c33}')

I39c11 = Parameter(name = 'I39c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1**2*KR1x1**2*Wl1x1**2*yNL1x1 + KL1x1**2*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I39c11}')

I39c14 = Parameter(name = 'I39c14',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KL4x1*KR1x1**2*Wl1x1**2*yNL1x1 + KL1x1*KL4x1*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I39c14}')

I39c22 = Parameter(name = 'I39c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2**2*KR2x2**2*Wl2x2**2*yNL2x2 + KL2x2**2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I39c22}')

I39c25 = Parameter(name = 'I39c25',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KL5x2*KR2x2**2*Wl2x2**2*yNL2x2 + KL2x2*KL5x2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I39c25}')

I39c33 = Parameter(name = 'I39c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3**2*KR3x3**2*Wl3x3**2*yNL3x3 + KL3x3**2*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I39c33}')

I39c36 = Parameter(name = 'I39c36',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KL6x3*KR3x3**2*Wl3x3**2*yNL3x3 + KL3x3*KL6x3*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I39c36}')

I39c41 = Parameter(name = 'I39c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KL4x1*KR1x1**2*Wl1x1**2*yNL1x1 + KL1x1*KL4x1*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I39c41}')

I39c44 = Parameter(name = 'I39c44',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL4x1**2*KR1x1**2*Wl1x1**2*yNL1x1 + KL4x1**2*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I39c44}')

I39c52 = Parameter(name = 'I39c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KL5x2*KR2x2**2*Wl2x2**2*yNL2x2 + KL2x2*KL5x2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I39c52}')

I39c55 = Parameter(name = 'I39c55',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL5x2**2*KR2x2**2*Wl2x2**2*yNL2x2 + KL5x2**2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I39c55}')

I39c63 = Parameter(name = 'I39c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KL6x3*KR3x3**2*Wl3x3**2*yNL3x3 + KL3x3*KL6x3*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I39c63}')

I39c66 = Parameter(name = 'I39c66',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL6x3**2*KR3x3**2*Wl3x3**2*yNL3x3 + KL6x3**2*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I39c66}')

I4c11 = Parameter(name = 'I4c11',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR1x1*yMU1x1',
                  texname = '\\text{I4c11}')

I4c12 = Parameter(name = 'I4c12',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR1x2*yMU1x1',
                  texname = '\\text{I4c12}')

I4c13 = Parameter(name = 'I4c13',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR1x3*yMU1x1',
                  texname = '\\text{I4c13}')

I4c21 = Parameter(name = 'I4c21',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR2x1*yMU2x2',
                  texname = '\\text{I4c21}')

I4c22 = Parameter(name = 'I4c22',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR2x2*yMU2x2',
                  texname = '\\text{I4c22}')

I4c23 = Parameter(name = 'I4c23',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR2x3*yMU2x2',
                  texname = '\\text{I4c23}')

I4c31 = Parameter(name = 'I4c31',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR3x1*yMU3x3',
                  texname = '\\text{I4c31}')

I4c32 = Parameter(name = 'I4c32',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR3x2*yMU3x3',
                  texname = '\\text{I4c32}')

I4c33 = Parameter(name = 'I4c33',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR3x3*yMU3x3',
                  texname = '\\text{I4c33}')

I40c11 = Parameter(name = 'I40c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1**2*KR1x1**2*Wl1x1**2*yNL1x1 + KL1x1**2*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I40c11}')

I40c14 = Parameter(name = 'I40c14',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KL4x1*KR1x1**2*Wl1x1**2*yNL1x1 + KL1x1*KL4x1*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I40c14}')

I40c22 = Parameter(name = 'I40c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2**2*KR2x2**2*Wl2x2**2*yNL2x2 + KL2x2**2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I40c22}')

I40c25 = Parameter(name = 'I40c25',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KL5x2*KR2x2**2*Wl2x2**2*yNL2x2 + KL2x2*KL5x2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I40c25}')

I40c33 = Parameter(name = 'I40c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3**2*KR3x3**2*Wl3x3**2*yNL3x3 + KL3x3**2*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I40c33}')

I40c36 = Parameter(name = 'I40c36',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KL6x3*KR3x3**2*Wl3x3**2*yNL3x3 + KL3x3*KL6x3*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I40c36}')

I40c41 = Parameter(name = 'I40c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KL4x1*KR1x1**2*Wl1x1**2*yNL1x1 + KL1x1*KL4x1*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I40c41}')

I40c44 = Parameter(name = 'I40c44',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL4x1**2*KR1x1**2*Wl1x1**2*yNL1x1 + KL4x1**2*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I40c44}')

I40c52 = Parameter(name = 'I40c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KL5x2*KR2x2**2*Wl2x2**2*yNL2x2 + KL2x2*KL5x2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I40c52}')

I40c55 = Parameter(name = 'I40c55',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL5x2**2*KR2x2**2*Wl2x2**2*yNL2x2 + KL5x2**2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I40c55}')

I40c63 = Parameter(name = 'I40c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KL6x3*KR3x3**2*Wl3x3**2*yNL3x3 + KL3x3*KL6x3*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I40c63}')

I40c66 = Parameter(name = 'I40c66',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL6x3**2*KR3x3**2*Wl3x3**2*yNL3x3 + KL6x3**2*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I40c66}')

I41c11 = Parameter(name = 'I41c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1**2*KR1x1**2*Wl1x1**2*yNL1x1 + KL1x1**2*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I41c11}')

I41c14 = Parameter(name = 'I41c14',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KL4x1*KR1x1**2*Wl1x1**2*yNL1x1 + KL1x1*KL4x1*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I41c14}')

I41c22 = Parameter(name = 'I41c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2**2*KR2x2**2*Wl2x2**2*yNL2x2 + KL2x2**2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I41c22}')

I41c25 = Parameter(name = 'I41c25',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KL5x2*KR2x2**2*Wl2x2**2*yNL2x2 + KL2x2*KL5x2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I41c25}')

I41c33 = Parameter(name = 'I41c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3**2*KR3x3**2*Wl3x3**2*yNL3x3 + KL3x3**2*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I41c33}')

I41c36 = Parameter(name = 'I41c36',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KL6x3*KR3x3**2*Wl3x3**2*yNL3x3 + KL3x3*KL6x3*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I41c36}')

I41c41 = Parameter(name = 'I41c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KL4x1*KR1x1**2*Wl1x1**2*yNL1x1 + KL1x1*KL4x1*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I41c41}')

I41c44 = Parameter(name = 'I41c44',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL4x1**2*KR1x1**2*Wl1x1**2*yNL1x1 + KL4x1**2*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I41c44}')

I41c52 = Parameter(name = 'I41c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KL5x2*KR2x2**2*Wl2x2**2*yNL2x2 + KL2x2*KL5x2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I41c52}')

I41c55 = Parameter(name = 'I41c55',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL5x2**2*KR2x2**2*Wl2x2**2*yNL2x2 + KL5x2**2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I41c55}')

I41c63 = Parameter(name = 'I41c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KL6x3*KR3x3**2*Wl3x3**2*yNL3x3 + KL3x3*KL6x3*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I41c63}')

I41c66 = Parameter(name = 'I41c66',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL6x3**2*KR3x3**2*Wl3x3**2*yNL3x3 + KL6x3**2*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I41c66}')

I42c11 = Parameter(name = 'I42c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1**2*KR1x1**2*Wl1x1**2*yNL1x1 + KL1x1**2*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I42c11}')

I42c14 = Parameter(name = 'I42c14',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KL4x1*KR1x1**2*Wl1x1**2*yNL1x1 + KL1x1*KL4x1*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I42c14}')

I42c22 = Parameter(name = 'I42c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2**2*KR2x2**2*Wl2x2**2*yNL2x2 + KL2x2**2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I42c22}')

I42c25 = Parameter(name = 'I42c25',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KL5x2*KR2x2**2*Wl2x2**2*yNL2x2 + KL2x2*KL5x2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I42c25}')

I42c33 = Parameter(name = 'I42c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3**2*KR3x3**2*Wl3x3**2*yNL3x3 + KL3x3**2*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I42c33}')

I42c36 = Parameter(name = 'I42c36',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KL6x3*KR3x3**2*Wl3x3**2*yNL3x3 + KL3x3*KL6x3*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I42c36}')

I42c41 = Parameter(name = 'I42c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KL4x1*KR1x1**2*Wl1x1**2*yNL1x1 + KL1x1*KL4x1*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I42c41}')

I42c44 = Parameter(name = 'I42c44',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL4x1**2*KR1x1**2*Wl1x1**2*yNL1x1 + KL4x1**2*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I42c44}')

I42c52 = Parameter(name = 'I42c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KL5x2*KR2x2**2*Wl2x2**2*yNL2x2 + KL2x2*KL5x2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I42c52}')

I42c55 = Parameter(name = 'I42c55',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL5x2**2*KR2x2**2*Wl2x2**2*yNL2x2 + KL5x2**2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I42c55}')

I42c63 = Parameter(name = 'I42c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KL6x3*KR3x3**2*Wl3x3**2*yNL3x3 + KL3x3*KL6x3*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I42c63}')

I42c66 = Parameter(name = 'I42c66',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL6x3**2*KR3x3**2*Wl3x3**2*yNL3x3 + KL6x3**2*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I42c66}')

I43c11 = Parameter(name = 'I43c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KR1x1**2*Wl1x1**2*yNL1x1 + KL1x1*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I43c11}')

I43c22 = Parameter(name = 'I43c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KR2x2**2*Wl2x2**2*yNL2x2 + KL2x2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I43c22}')

I43c33 = Parameter(name = 'I43c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KR3x3**2*Wl3x3**2*yNL3x3 + KL3x3*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I43c33}')

I43c41 = Parameter(name = 'I43c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL4x1*KR1x1**2*Wl1x1**2*yNL1x1 + KL4x1*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I43c41}')

I43c52 = Parameter(name = 'I43c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL5x2*KR2x2**2*Wl2x2**2*yNL2x2 + KL5x2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I43c52}')

I43c63 = Parameter(name = 'I43c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL6x3*KR3x3**2*Wl3x3**2*yNL3x3 + KL6x3*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I43c63}')

I44c11 = Parameter(name = 'I44c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KR1x1**2*Wl1x1**2*yNL1x1 + KL1x1*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I44c11}')

I44c22 = Parameter(name = 'I44c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KR2x2**2*Wl2x2**2*yNL2x2 + KL2x2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I44c22}')

I44c33 = Parameter(name = 'I44c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KR3x3**2*Wl3x3**2*yNL3x3 + KL3x3*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I44c33}')

I44c41 = Parameter(name = 'I44c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL4x1*KR1x1**2*Wl1x1**2*yNL1x1 + KL4x1*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I44c41}')

I44c52 = Parameter(name = 'I44c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL5x2*KR2x2**2*Wl2x2**2*yNL2x2 + KL5x2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I44c52}')

I44c63 = Parameter(name = 'I44c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL6x3*KR3x3**2*Wl3x3**2*yNL3x3 + KL6x3*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I44c63}')

I45c11 = Parameter(name = 'I45c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**2*Wl1x1**2*yNL1x1 + KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I45c11}')

I45c22 = Parameter(name = 'I45c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**2*Wl2x2**2*yNL2x2 + KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I45c22}')

I45c33 = Parameter(name = 'I45c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**2*Wl3x3**2*yNL3x3 + KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I45c33}')

I46c11 = Parameter(name = 'I46c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**2*Wl1x1**2*yNL1x1 + KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I46c11}')

I46c22 = Parameter(name = 'I46c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**2*Wl2x2**2*yNL2x2 + KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I46c22}')

I46c33 = Parameter(name = 'I46c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**2*Wl3x3**2*yNL3x3 + KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I46c33}')

I47c11 = Parameter(name = 'I47c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**3*yNL1x1 + KR1x1*KR4x1**2*yNL4x4',
                   texname = '\\text{I47c11}')

I47c22 = Parameter(name = 'I47c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**3*yNL2x2 + KR2x2*KR5x2**2*yNL5x5',
                   texname = '\\text{I47c22}')

I47c33 = Parameter(name = 'I47c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**3*yNL3x3 + KR3x3*KR6x3**2*yNL6x6',
                   texname = '\\text{I47c33}')

I47c41 = Parameter(name = 'I47c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**2*KR4x1*yNL1x1 + KR4x1**3*yNL4x4',
                   texname = '\\text{I47c41}')

I47c52 = Parameter(name = 'I47c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**2*KR5x2*yNL2x2 + KR5x2**3*yNL5x5',
                   texname = '\\text{I47c52}')

I47c63 = Parameter(name = 'I47c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**2*KR6x3*yNL3x3 + KR6x3**3*yNL6x6',
                   texname = '\\text{I47c63}')

I48c11 = Parameter(name = 'I48c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**3*yNL1x1 + KR1x1*KR4x1**2*yNL4x4',
                   texname = '\\text{I48c11}')

I48c22 = Parameter(name = 'I48c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**3*yNL2x2 + KR2x2*KR5x2**2*yNL5x5',
                   texname = '\\text{I48c22}')

I48c33 = Parameter(name = 'I48c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**3*yNL3x3 + KR3x3*KR6x3**2*yNL6x6',
                   texname = '\\text{I48c33}')

I48c41 = Parameter(name = 'I48c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**2*KR4x1*yNL1x1 + KR4x1**3*yNL4x4',
                   texname = '\\text{I48c41}')

I48c52 = Parameter(name = 'I48c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**2*KR5x2*yNL2x2 + KR5x2**3*yNL5x5',
                   texname = '\\text{I48c52}')

I48c63 = Parameter(name = 'I48c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**2*KR6x3*yNL3x3 + KR6x3**3*yNL6x6',
                   texname = '\\text{I48c63}')

I49c11 = Parameter(name = 'I49c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**2*yNL1x1 + KR4x1**2*yNL4x4',
                   texname = '\\text{I49c11}')

I49c22 = Parameter(name = 'I49c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**2*yNL2x2 + KR5x2**2*yNL5x5',
                   texname = '\\text{I49c22}')

I49c33 = Parameter(name = 'I49c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**2*yNL3x3 + KR6x3**2*yNL6x6',
                   texname = '\\text{I49c33}')

I5c11 = Parameter(name = 'I5c11',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML1x1*yMU1x1*complexconjugate(CKMR1x1) + CKML2x1*yMU2x2*complexconjugate(CKMR2x1) + CKML3x1*yMU3x3*complexconjugate(CKMR3x1)',
                  texname = '\\text{I5c11}')

I5c12 = Parameter(name = 'I5c12',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML1x2*yMU1x1*complexconjugate(CKMR1x1) + CKML2x2*yMU2x2*complexconjugate(CKMR2x1) + CKML3x2*yMU3x3*complexconjugate(CKMR3x1)',
                  texname = '\\text{I5c12}')

I5c13 = Parameter(name = 'I5c13',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML1x3*yMU1x1*complexconjugate(CKMR1x1) + CKML2x3*yMU2x2*complexconjugate(CKMR2x1) + CKML3x3*yMU3x3*complexconjugate(CKMR3x1)',
                  texname = '\\text{I5c13}')

I5c21 = Parameter(name = 'I5c21',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML1x1*yMU1x1*complexconjugate(CKMR1x2) + CKML2x1*yMU2x2*complexconjugate(CKMR2x2) + CKML3x1*yMU3x3*complexconjugate(CKMR3x2)',
                  texname = '\\text{I5c21}')

I5c22 = Parameter(name = 'I5c22',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML1x2*yMU1x1*complexconjugate(CKMR1x2) + CKML2x2*yMU2x2*complexconjugate(CKMR2x2) + CKML3x2*yMU3x3*complexconjugate(CKMR3x2)',
                  texname = '\\text{I5c22}')

I5c23 = Parameter(name = 'I5c23',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML1x3*yMU1x1*complexconjugate(CKMR1x2) + CKML2x3*yMU2x2*complexconjugate(CKMR2x2) + CKML3x3*yMU3x3*complexconjugate(CKMR3x2)',
                  texname = '\\text{I5c23}')

I5c31 = Parameter(name = 'I5c31',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML1x1*yMU1x1*complexconjugate(CKMR1x3) + CKML2x1*yMU2x2*complexconjugate(CKMR2x3) + CKML3x1*yMU3x3*complexconjugate(CKMR3x3)',
                  texname = '\\text{I5c31}')

I5c32 = Parameter(name = 'I5c32',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML1x2*yMU1x1*complexconjugate(CKMR1x3) + CKML2x2*yMU2x2*complexconjugate(CKMR2x3) + CKML3x2*yMU3x3*complexconjugate(CKMR3x3)',
                  texname = '\\text{I5c32}')

I5c33 = Parameter(name = 'I5c33',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML1x3*yMU1x1*complexconjugate(CKMR1x3) + CKML2x3*yMU2x2*complexconjugate(CKMR2x3) + CKML3x3*yMU3x3*complexconjugate(CKMR3x3)',
                  texname = '\\text{I5c33}')

I50c11 = Parameter(name = 'I50c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**2*yNL1x1 + KR4x1**2*yNL4x4',
                   texname = '\\text{I50c11}')

I50c22 = Parameter(name = 'I50c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**2*yNL2x2 + KR5x2**2*yNL5x5',
                   texname = '\\text{I50c22}')

I50c33 = Parameter(name = 'I50c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**2*yNL3x3 + KR6x3**2*yNL6x6',
                   texname = '\\text{I50c33}')

I51c11 = Parameter(name = 'I51c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KR1x1**2*Wl1x1**2*yNL1x1 + KL1x1*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I51c11}')

I51c22 = Parameter(name = 'I51c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KR2x2**2*Wl2x2**2*yNL2x2 + KL2x2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I51c22}')

I51c33 = Parameter(name = 'I51c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KR3x3**2*Wl3x3**2*yNL3x3 + KL3x3*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I51c33}')

I51c41 = Parameter(name = 'I51c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL4x1*KR1x1**2*Wl1x1**2*yNL1x1 + KL4x1*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I51c41}')

I51c52 = Parameter(name = 'I51c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL5x2*KR2x2**2*Wl2x2**2*yNL2x2 + KL5x2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I51c52}')

I51c63 = Parameter(name = 'I51c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL6x3*KR3x3**2*Wl3x3**2*yNL3x3 + KL6x3*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I51c63}')

I52c11 = Parameter(name = 'I52c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KR1x1**2*Wl1x1**2*yNL1x1 + KL1x1*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I52c11}')

I52c22 = Parameter(name = 'I52c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KR2x2**2*Wl2x2**2*yNL2x2 + KL2x2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I52c22}')

I52c33 = Parameter(name = 'I52c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KR3x3**2*Wl3x3**2*yNL3x3 + KL3x3*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I52c33}')

I52c41 = Parameter(name = 'I52c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL4x1*KR1x1**2*Wl1x1**2*yNL1x1 + KL4x1*KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I52c41}')

I52c52 = Parameter(name = 'I52c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL5x2*KR2x2**2*Wl2x2**2*yNL2x2 + KL5x2*KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I52c52}')

I52c63 = Parameter(name = 'I52c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL6x3*KR3x3**2*Wl3x3**2*yNL3x3 + KL6x3*KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I52c63}')

I53c11 = Parameter(name = 'I53c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**2*Wl1x1**2*yNL1x1 + KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I53c11}')

I53c22 = Parameter(name = 'I53c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**2*Wl2x2**2*yNL2x2 + KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I53c22}')

I53c33 = Parameter(name = 'I53c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**2*Wl3x3**2*yNL3x3 + KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I53c33}')

I54c11 = Parameter(name = 'I54c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**2*Wl1x1**2*yNL1x1 + KR4x1**2*Wl1x1**2*yNL4x4',
                   texname = '\\text{I54c11}')

I54c22 = Parameter(name = 'I54c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**2*Wl2x2**2*yNL2x2 + KR5x2**2*Wl2x2**2*yNL5x5',
                   texname = '\\text{I54c22}')

I54c33 = Parameter(name = 'I54c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**2*Wl3x3**2*yNL3x3 + KR6x3**2*Wl3x3**2*yNL6x6',
                   texname = '\\text{I54c33}')

I55c11 = Parameter(name = 'I55c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1**2',
                   texname = '\\text{I55c11}')

I55c14 = Parameter(name = 'I55c14',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KL4x1',
                   texname = '\\text{I55c14}')

I55c22 = Parameter(name = 'I55c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2**2',
                   texname = '\\text{I55c22}')

I55c25 = Parameter(name = 'I55c25',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KL5x2',
                   texname = '\\text{I55c25}')

I55c33 = Parameter(name = 'I55c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3**2',
                   texname = '\\text{I55c33}')

I55c36 = Parameter(name = 'I55c36',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KL6x3',
                   texname = '\\text{I55c36}')

I55c41 = Parameter(name = 'I55c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KL4x1',
                   texname = '\\text{I55c41}')

I55c44 = Parameter(name = 'I55c44',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL4x1**2',
                   texname = '\\text{I55c44}')

I55c52 = Parameter(name = 'I55c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KL5x2',
                   texname = '\\text{I55c52}')

I55c55 = Parameter(name = 'I55c55',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL5x2**2',
                   texname = '\\text{I55c55}')

I55c63 = Parameter(name = 'I55c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KL6x3',
                   texname = '\\text{I55c63}')

I55c66 = Parameter(name = 'I55c66',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL6x3**2',
                   texname = '\\text{I55c66}')

I56c11 = Parameter(name = 'I56c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**2',
                   texname = '\\text{I56c11}')

I56c14 = Parameter(name = 'I56c14',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1*KR4x1',
                   texname = '\\text{I56c14}')

I56c22 = Parameter(name = 'I56c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**2',
                   texname = '\\text{I56c22}')

I56c25 = Parameter(name = 'I56c25',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2*KR5x2',
                   texname = '\\text{I56c25}')

I56c33 = Parameter(name = 'I56c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**2',
                   texname = '\\text{I56c33}')

I56c36 = Parameter(name = 'I56c36',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3*KR6x3',
                   texname = '\\text{I56c36}')

I56c41 = Parameter(name = 'I56c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1*KR4x1',
                   texname = '\\text{I56c41}')

I56c44 = Parameter(name = 'I56c44',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR4x1**2',
                   texname = '\\text{I56c44}')

I56c52 = Parameter(name = 'I56c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2*KR5x2',
                   texname = '\\text{I56c52}')

I56c55 = Parameter(name = 'I56c55',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR5x2**2',
                   texname = '\\text{I56c55}')

I56c63 = Parameter(name = 'I56c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3*KR6x3',
                   texname = '\\text{I56c63}')

I56c66 = Parameter(name = 'I56c66',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR6x3**2',
                   texname = '\\text{I56c66}')

I57c11 = Parameter(name = 'I57c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1**2',
                   texname = '\\text{I57c11}')

I57c14 = Parameter(name = 'I57c14',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KL4x1',
                   texname = '\\text{I57c14}')

I57c22 = Parameter(name = 'I57c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2**2',
                   texname = '\\text{I57c22}')

I57c25 = Parameter(name = 'I57c25',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KL5x2',
                   texname = '\\text{I57c25}')

I57c33 = Parameter(name = 'I57c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3**2',
                   texname = '\\text{I57c33}')

I57c36 = Parameter(name = 'I57c36',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KL6x3',
                   texname = '\\text{I57c36}')

I57c41 = Parameter(name = 'I57c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL1x1*KL4x1',
                   texname = '\\text{I57c41}')

I57c44 = Parameter(name = 'I57c44',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL4x1**2',
                   texname = '\\text{I57c44}')

I57c52 = Parameter(name = 'I57c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL2x2*KL5x2',
                   texname = '\\text{I57c52}')

I57c55 = Parameter(name = 'I57c55',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL5x2**2',
                   texname = '\\text{I57c55}')

I57c63 = Parameter(name = 'I57c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL3x3*KL6x3',
                   texname = '\\text{I57c63}')

I57c66 = Parameter(name = 'I57c66',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KL6x3**2',
                   texname = '\\text{I57c66}')

I58c11 = Parameter(name = 'I58c11',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1**2',
                   texname = '\\text{I58c11}')

I58c14 = Parameter(name = 'I58c14',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1*KR4x1',
                   texname = '\\text{I58c14}')

I58c22 = Parameter(name = 'I58c22',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2**2',
                   texname = '\\text{I58c22}')

I58c25 = Parameter(name = 'I58c25',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2*KR5x2',
                   texname = '\\text{I58c25}')

I58c33 = Parameter(name = 'I58c33',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3**2',
                   texname = '\\text{I58c33}')

I58c36 = Parameter(name = 'I58c36',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3*KR6x3',
                   texname = '\\text{I58c36}')

I58c41 = Parameter(name = 'I58c41',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR1x1*KR4x1',
                   texname = '\\text{I58c41}')

I58c44 = Parameter(name = 'I58c44',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR4x1**2',
                   texname = '\\text{I58c44}')

I58c52 = Parameter(name = 'I58c52',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR2x2*KR5x2',
                   texname = '\\text{I58c52}')

I58c55 = Parameter(name = 'I58c55',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR5x2**2',
                   texname = '\\text{I58c55}')

I58c63 = Parameter(name = 'I58c63',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR3x3*KR6x3',
                   texname = '\\text{I58c63}')

I58c66 = Parameter(name = 'I58c66',
                   nature = 'internal',
                   type = 'complex',
                   value = 'KR6x3**2',
                   texname = '\\text{I58c66}')

I6c11 = Parameter(name = 'I6c11',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR1x1*yMU1x1*complexconjugate(CKML1x1) + CKMR2x1*yMU2x2*complexconjugate(CKML2x1) + CKMR3x1*yMU3x3*complexconjugate(CKML3x1)',
                  texname = '\\text{I6c11}')

I6c12 = Parameter(name = 'I6c12',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR1x2*yMU1x1*complexconjugate(CKML1x1) + CKMR2x2*yMU2x2*complexconjugate(CKML2x1) + CKMR3x2*yMU3x3*complexconjugate(CKML3x1)',
                  texname = '\\text{I6c12}')

I6c13 = Parameter(name = 'I6c13',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR1x3*yMU1x1*complexconjugate(CKML1x1) + CKMR2x3*yMU2x2*complexconjugate(CKML2x1) + CKMR3x3*yMU3x3*complexconjugate(CKML3x1)',
                  texname = '\\text{I6c13}')

I6c21 = Parameter(name = 'I6c21',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR1x1*yMU1x1*complexconjugate(CKML1x2) + CKMR2x1*yMU2x2*complexconjugate(CKML2x2) + CKMR3x1*yMU3x3*complexconjugate(CKML3x2)',
                  texname = '\\text{I6c21}')

I6c22 = Parameter(name = 'I6c22',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR1x2*yMU1x1*complexconjugate(CKML1x2) + CKMR2x2*yMU2x2*complexconjugate(CKML2x2) + CKMR3x2*yMU3x3*complexconjugate(CKML3x2)',
                  texname = '\\text{I6c22}')

I6c23 = Parameter(name = 'I6c23',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR1x3*yMU1x1*complexconjugate(CKML1x2) + CKMR2x3*yMU2x2*complexconjugate(CKML2x2) + CKMR3x3*yMU3x3*complexconjugate(CKML3x2)',
                  texname = '\\text{I6c23}')

I6c31 = Parameter(name = 'I6c31',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR1x1*yMU1x1*complexconjugate(CKML1x3) + CKMR2x1*yMU2x2*complexconjugate(CKML2x3) + CKMR3x1*yMU3x3*complexconjugate(CKML3x3)',
                  texname = '\\text{I6c31}')

I6c32 = Parameter(name = 'I6c32',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR1x2*yMU1x1*complexconjugate(CKML1x3) + CKMR2x2*yMU2x2*complexconjugate(CKML2x3) + CKMR3x2*yMU3x3*complexconjugate(CKML3x3)',
                  texname = '\\text{I6c32}')

I6c33 = Parameter(name = 'I6c33',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR1x3*yMU1x1*complexconjugate(CKML1x3) + CKMR2x3*yMU2x2*complexconjugate(CKML2x3) + CKMR3x3*yMU3x3*complexconjugate(CKML3x3)',
                  texname = '\\text{I6c33}')

I7c11 = Parameter(name = 'I7c11',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR1x1*yDO1x1*complexconjugate(CKML1x1) + CKMR1x2*yDO2x2*complexconjugate(CKML1x2) + CKMR1x3*yDO3x3*complexconjugate(CKML1x3)',
                  texname = '\\text{I7c11}')

I7c12 = Parameter(name = 'I7c12',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR1x1*yDO1x1*complexconjugate(CKML2x1) + CKMR1x2*yDO2x2*complexconjugate(CKML2x2) + CKMR1x3*yDO3x3*complexconjugate(CKML2x3)',
                  texname = '\\text{I7c12}')

I7c13 = Parameter(name = 'I7c13',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR1x1*yDO1x1*complexconjugate(CKML3x1) + CKMR1x2*yDO2x2*complexconjugate(CKML3x2) + CKMR1x3*yDO3x3*complexconjugate(CKML3x3)',
                  texname = '\\text{I7c13}')

I7c21 = Parameter(name = 'I7c21',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR2x1*yDO1x1*complexconjugate(CKML1x1) + CKMR2x2*yDO2x2*complexconjugate(CKML1x2) + CKMR2x3*yDO3x3*complexconjugate(CKML1x3)',
                  texname = '\\text{I7c21}')

I7c22 = Parameter(name = 'I7c22',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR2x1*yDO1x1*complexconjugate(CKML2x1) + CKMR2x2*yDO2x2*complexconjugate(CKML2x2) + CKMR2x3*yDO3x3*complexconjugate(CKML2x3)',
                  texname = '\\text{I7c22}')

I7c23 = Parameter(name = 'I7c23',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR2x1*yDO1x1*complexconjugate(CKML3x1) + CKMR2x2*yDO2x2*complexconjugate(CKML3x2) + CKMR2x3*yDO3x3*complexconjugate(CKML3x3)',
                  texname = '\\text{I7c23}')

I7c31 = Parameter(name = 'I7c31',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR3x1*yDO1x1*complexconjugate(CKML1x1) + CKMR3x2*yDO2x2*complexconjugate(CKML1x2) + CKMR3x3*yDO3x3*complexconjugate(CKML1x3)',
                  texname = '\\text{I7c31}')

I7c32 = Parameter(name = 'I7c32',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR3x1*yDO1x1*complexconjugate(CKML2x1) + CKMR3x2*yDO2x2*complexconjugate(CKML2x2) + CKMR3x3*yDO3x3*complexconjugate(CKML2x3)',
                  texname = '\\text{I7c32}')

I7c33 = Parameter(name = 'I7c33',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKMR3x1*yDO1x1*complexconjugate(CKML3x1) + CKMR3x2*yDO2x2*complexconjugate(CKML3x2) + CKMR3x3*yDO3x3*complexconjugate(CKML3x3)',
                  texname = '\\text{I7c33}')

I8c11 = Parameter(name = 'I8c11',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML1x1*yDO1x1*complexconjugate(CKMR1x1) + CKML1x2*yDO2x2*complexconjugate(CKMR1x2) + CKML1x3*yDO3x3*complexconjugate(CKMR1x3)',
                  texname = '\\text{I8c11}')

I8c12 = Parameter(name = 'I8c12',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML1x1*yDO1x1*complexconjugate(CKMR2x1) + CKML1x2*yDO2x2*complexconjugate(CKMR2x2) + CKML1x3*yDO3x3*complexconjugate(CKMR2x3)',
                  texname = '\\text{I8c12}')

I8c13 = Parameter(name = 'I8c13',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML1x1*yDO1x1*complexconjugate(CKMR3x1) + CKML1x2*yDO2x2*complexconjugate(CKMR3x2) + CKML1x3*yDO3x3*complexconjugate(CKMR3x3)',
                  texname = '\\text{I8c13}')

I8c21 = Parameter(name = 'I8c21',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML2x1*yDO1x1*complexconjugate(CKMR1x1) + CKML2x2*yDO2x2*complexconjugate(CKMR1x2) + CKML2x3*yDO3x3*complexconjugate(CKMR1x3)',
                  texname = '\\text{I8c21}')

I8c22 = Parameter(name = 'I8c22',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML2x1*yDO1x1*complexconjugate(CKMR2x1) + CKML2x2*yDO2x2*complexconjugate(CKMR2x2) + CKML2x3*yDO3x3*complexconjugate(CKMR2x3)',
                  texname = '\\text{I8c22}')

I8c23 = Parameter(name = 'I8c23',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML2x1*yDO1x1*complexconjugate(CKMR3x1) + CKML2x2*yDO2x2*complexconjugate(CKMR3x2) + CKML2x3*yDO3x3*complexconjugate(CKMR3x3)',
                  texname = '\\text{I8c23}')

I8c31 = Parameter(name = 'I8c31',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML3x1*yDO1x1*complexconjugate(CKMR1x1) + CKML3x2*yDO2x2*complexconjugate(CKMR1x2) + CKML3x3*yDO3x3*complexconjugate(CKMR1x3)',
                  texname = '\\text{I8c31}')

I8c32 = Parameter(name = 'I8c32',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML3x1*yDO1x1*complexconjugate(CKMR2x1) + CKML3x2*yDO2x2*complexconjugate(CKMR2x2) + CKML3x3*yDO3x3*complexconjugate(CKMR2x3)',
                  texname = '\\text{I8c32}')

I8c33 = Parameter(name = 'I8c33',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKML3x1*yDO1x1*complexconjugate(CKMR3x1) + CKML3x2*yDO2x2*complexconjugate(CKMR3x2) + CKML3x3*yDO3x3*complexconjugate(CKMR3x3)',
                  texname = '\\text{I8c33}')

I9c11 = Parameter(name = 'I9c11',
                  nature = 'internal',
                  type = 'complex',
                  value = 'yDO1x1*complexconjugate(CKML1x1)',
                  texname = '\\text{I9c11}')

I9c12 = Parameter(name = 'I9c12',
                  nature = 'internal',
                  type = 'complex',
                  value = 'yDO1x1*complexconjugate(CKML2x1)',
                  texname = '\\text{I9c12}')

I9c13 = Parameter(name = 'I9c13',
                  nature = 'internal',
                  type = 'complex',
                  value = 'yDO1x1*complexconjugate(CKML3x1)',
                  texname = '\\text{I9c13}')

I9c21 = Parameter(name = 'I9c21',
                  nature = 'internal',
                  type = 'complex',
                  value = 'yDO2x2*complexconjugate(CKML1x2)',
                  texname = '\\text{I9c21}')

I9c22 = Parameter(name = 'I9c22',
                  nature = 'internal',
                  type = 'complex',
                  value = 'yDO2x2*complexconjugate(CKML2x2)',
                  texname = '\\text{I9c22}')

I9c23 = Parameter(name = 'I9c23',
                  nature = 'internal',
                  type = 'complex',
                  value = 'yDO2x2*complexconjugate(CKML3x2)',
                  texname = '\\text{I9c23}')

I9c31 = Parameter(name = 'I9c31',
                  nature = 'internal',
                  type = 'complex',
                  value = 'yDO3x3*complexconjugate(CKML1x3)',
                  texname = '\\text{I9c31}')

I9c32 = Parameter(name = 'I9c32',
                  nature = 'internal',
                  type = 'complex',
                  value = 'yDO3x3*complexconjugate(CKML2x3)',
                  texname = '\\text{I9c32}')

I9c33 = Parameter(name = 'I9c33',
                  nature = 'internal',
                  type = 'complex',
                  value = 'yDO3x3*complexconjugate(CKML3x3)',
                  texname = '\\text{I9c33}')

