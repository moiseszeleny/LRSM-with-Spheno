# ---------------------------------------------------------------------- 
# This model file was automatically created by SARAH version4.15.3
# SARAH References: arXiv:0806.0538, arXiv:0909.2863, arXiv:1002.0840   
# (c) Florian Staub, Mark Goodsell, Werner Porod and Martin Gabelmann 2023 
# ---------------------------------------------------------------------- 
# File created at 21:16 on 4.9.2024  
# ---------------------------------------------------------------------- 


from __future__ import division
from object_library import all_particles,Particle
import parameters as Param


d1 = Particle(pdg_code =1,
    name = 'd1' ,
    antiname = 'd1bar' ,
    spin = 2 ,
    color = 3 ,
    mass = Param.Md1 ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = -1/3 ,
    texname = '{d}_1' ,
    antitexname = '{\\bar{d}}_1' )

d1bar = d1.anti()


d2 = Particle(pdg_code =3,
    name = 'd2' ,
    antiname = 'd2bar' ,
    spin = 2 ,
    color = 3 ,
    mass = Param.Md2 ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = -1/3 ,
    texname = '{d}_2' ,
    antitexname = '{\\bar{d}}_2' )

d2bar = d2.anti()


d3 = Particle(pdg_code =5,
    name = 'd3' ,
    antiname = 'd3bar' ,
    spin = 2 ,
    color = 3 ,
    mass = Param.Md3 ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = -1/3 ,
    texname = '{d}_3' ,
    antitexname = '{\\bar{d}}_3' )

d3bar = d3.anti()


u1 = Particle(pdg_code =2,
    name = 'u1' ,
    antiname = 'u1bar' ,
    spin = 2 ,
    color = 3 ,
    mass = Param.Mu1 ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = 2/3 ,
    texname = '{u}_1' ,
    antitexname = '{\\bar{u}}_1' )

u1bar = u1.anti()


u2 = Particle(pdg_code =4,
    name = 'u2' ,
    antiname = 'u2bar' ,
    spin = 2 ,
    color = 3 ,
    mass = Param.Mu2 ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = 2/3 ,
    texname = '{u}_2' ,
    antitexname = '{\\bar{u}}_2' )

u2bar = u2.anti()


u3 = Particle(pdg_code =6,
    name = 'u3' ,
    antiname = 'u3bar' ,
    spin = 2 ,
    color = 3 ,
    mass = Param.Mu3 ,
    width = Param.Wu3 ,
    line = 'swavy' ,
    charge = 2/3 ,
    texname = '{u}_3' ,
    antitexname = '{\\bar{u}}_3' )

u3bar = u3.anti()


e1 = Particle(pdg_code =11,
    name = 'e1' ,
    antiname = 'e1bar' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.Me1 ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = -1 ,
    texname = '{e}_1' ,
    antitexname = '{\\bar{e}}_1' )

e1bar = e1.anti()


e2 = Particle(pdg_code =13,
    name = 'e2' ,
    antiname = 'e2bar' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.Me2 ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = -1 ,
    texname = '{e}_2' ,
    antitexname = '{\\bar{e}}_2' )

e2bar = e2.anti()


e3 = Particle(pdg_code =15,
    name = 'e3' ,
    antiname = 'e3bar' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.Me3 ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = -1 ,
    texname = '{e}_3' ,
    antitexname = '{\\bar{e}}_3' )

e3bar = e3.anti()


nu1 = Particle(pdg_code =12,
    name = 'nu1' ,
    antiname = 'nu1' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.Mnu1 ,
    width = Param.Wnu1 ,
    line = 'swavy' ,
    charge = 0 ,
    texname = '{\\nu}_1' ,
    antitexname = '{\\nu}_1' )

nu2 = Particle(pdg_code =14,
    name = 'nu2' ,
    antiname = 'nu2' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.Mnu2 ,
    width = Param.Wnu2 ,
    line = 'swavy' ,
    charge = 0 ,
    texname = '{\\nu}_2' ,
    antitexname = '{\\nu}_2' )

nu3 = Particle(pdg_code =16,
    name = 'nu3' ,
    antiname = 'nu3' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.Mnu3 ,
    width = Param.Wnu3 ,
    line = 'swavy' ,
    charge = 0 ,
    texname = '{\\nu}_3' ,
    antitexname = '{\\nu}_3' )

nu4 = Particle(pdg_code =6000012,
    name = 'nu4' ,
    antiname = 'nu4' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.Mnu4 ,
    width = Param.Wnu4 ,
    line = 'swavy' ,
    charge = 0 ,
    texname = '{\\nu}_4' ,
    antitexname = '{\\nu}_4' )

nu5 = Particle(pdg_code =6000014,
    name = 'nu5' ,
    antiname = 'nu5' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.Mnu5 ,
    width = Param.Wnu5 ,
    line = 'swavy' ,
    charge = 0 ,
    texname = '{\\nu}_5' ,
    antitexname = '{\\nu}_5' )

nu6 = Particle(pdg_code =6000016,
    name = 'nu6' ,
    antiname = 'nu6' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.Mnu6 ,
    width = Param.Wnu6 ,
    line = 'swavy' ,
    charge = 0 ,
    texname = '{\\nu}_6' ,
    antitexname = '{\\nu}_6' )

hh1 = Particle(pdg_code =25,
    name = 'hh1' ,
    antiname = 'hh1' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.Mhh1 ,
    width = Param.Whh1 ,
    line = 'dashed' ,
    charge = 0 ,
    texname = '{h}_1' ,
    antitexname = '{h}_1' )

hh2 = Particle(pdg_code =35,
    name = 'hh2' ,
    antiname = 'hh2' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.Mhh2 ,
    width = Param.Whh2 ,
    line = 'dashed' ,
    charge = 0 ,
    texname = '{h}_2' ,
    antitexname = '{h}_2' )

hh3 = Particle(pdg_code =335,
    name = 'hh3' ,
    antiname = 'hh3' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.Mhh3 ,
    width = Param.Whh3 ,
    line = 'dashed' ,
    charge = 0 ,
    texname = '{h}_3' ,
    antitexname = '{h}_3' )

hh4 = Particle(pdg_code =445,
    name = 'hh4' ,
    antiname = 'hh4' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.Mhh4 ,
    width = Param.Whh4 ,
    line = 'dashed' ,
    charge = 0 ,
    texname = '{h}_4' ,
    antitexname = '{h}_4' )

Ah1 = Particle(pdg_code =999900,
    name = 'Ah1' ,
    antiname = 'Ah1' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.MAh1 ,
    width = Param.ZERO,
    goldstone = True ,
    line = 'dashed' ,
    charge = 0 ,
    texname = '{A^0}_1' ,
    antitexname = '{A^0}_1' )

Ah2 = Particle(pdg_code =999901,
    name = 'Ah2' ,
    antiname = 'Ah2' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.MAh2 ,
    width = Param.ZERO,
    goldstone = True ,
    line = 'dashed' ,
    charge = 0 ,
    texname = '{A^0}_2' ,
    antitexname = '{A^0}_2' )

Ah3 = Particle(pdg_code =36,
    name = 'Ah3' ,
    antiname = 'Ah3' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.MAh3 ,
    width = Param.WAh3 ,
    line = 'dashed' ,
    charge = 0 ,
    texname = '{A^0}_3' ,
    antitexname = '{A^0}_3' )

Ah4 = Particle(pdg_code =46,
    name = 'Ah4' ,
    antiname = 'Ah4' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.MAh4 ,
    width = Param.WAh4 ,
    line = 'dashed' ,
    charge = 0 ,
    texname = '{A^0}_4' ,
    antitexname = '{A^0}_4' )

Hm1 = Particle(pdg_code =999902,
    name = 'Hm1' ,
    antiname = 'Hm1c' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.MHm1 ,
    width = Param.ZERO,
    goldstone = True ,
    line = 'dashed' ,
    charge = -1 ,
    texname = '{H^-}_1' ,
    antitexname = '{H^+}_1' )

Hm1c = Hm1.anti()


Hm2 = Particle(pdg_code =999903,
    name = 'Hm2' ,
    antiname = 'Hm2c' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.MHm2 ,
    width = Param.ZERO,
    goldstone = True ,
    line = 'dashed' ,
    charge = -1 ,
    texname = '{H^-}_2' ,
    antitexname = '{H^+}_2' )

Hm2c = Hm2.anti()


Hm3 = Particle(pdg_code =-37,
    name = 'Hm3' ,
    antiname = 'Hm3c' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.MHm3 ,
    width = Param.WHm3 ,
    line = 'dashed' ,
    charge = -1 ,
    texname = '{H^-}_3' ,
    antitexname = '{H^+}_3' )

Hm3c = Hm3.anti()


Hm4 = Particle(pdg_code =-47,
    name = 'Hm4' ,
    antiname = 'Hm4c' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.MHm4 ,
    width = Param.WHm4 ,
    line = 'dashed' ,
    charge = -1 ,
    texname = '{H^-}_4' ,
    antitexname = '{H^+}_4' )

Hm4c = Hm4.anti()


Hmm1 = Particle(pdg_code =-9000055,
    name = 'Hmm1' ,
    antiname = 'Hmm1c' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.MHmm1 ,
    width = Param.WHmm1 ,
    line = 'dashed' ,
    charge = -2 ,
    texname = '{\\delta^{c--}}_1' ,
    antitexname = '{\\delta^{c++}}_1' )

Hmm1c = Hmm1.anti()


Hmm2 = Particle(pdg_code =-9000065,
    name = 'Hmm2' ,
    antiname = 'Hmm2c' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.MHmm2 ,
    width = Param.WHmm2 ,
    line = 'dashed' ,
    charge = -2 ,
    texname = '{\\delta^{c--}}_2' ,
    antitexname = '{\\delta^{c++}}_2' )

Hmm2c = Hmm2.anti()


g = Particle(pdg_code =21,
    name = 'g' ,
    antiname = 'g' ,
    spin = 3 ,
    color = 8 ,
    mass = Param.ZERO ,
    width = Param.ZERO ,
    line = 'wavy' ,
    charge = 0 ,
    texname = 'g' ,
    antitexname = 'g' )

A = Particle(pdg_code =22,
    name = 'A' ,
    antiname = 'A' ,
    spin = 3 ,
    color = 1 ,
    mass = Param.ZERO ,
    width = Param.ZERO ,
    line = 'wavy' ,
    charge = 0 ,
    texname = '\\gamma' ,
    antitexname = '\\gamma' )

Z = Particle(pdg_code =23,
    name = 'Z' ,
    antiname = 'Z' ,
    spin = 3 ,
    color = 1 ,
    mass = Param.MZ ,
    width = Param.WZ ,
    line = 'wavy' ,
    charge = 0 ,
    texname = 'Z' ,
    antitexname = 'Z' )

Zp = Particle(pdg_code =32,
    name = 'Zp' ,
    antiname = 'Zp' ,
    spin = 3 ,
    color = 1 ,
    mass = Param.MZp ,
    width = Param.WZp ,
    line = 'wavy' ,
    charge = 0 ,
    texname = '{Z^{\\prime}}' ,
    antitexname = '{Z^{\\prime}}' )

WLm = Particle(pdg_code =-24,
    name = 'WLm' ,
    antiname = 'WLmc' ,
    spin = 3 ,
    color = 1 ,
    mass = Param.MWLm ,
    width = Param.WWLm ,
    line = 'wavy' ,
    charge = -1 ,
    texname = 'W^-' ,
    antitexname = 'W^+' )

WLmc = WLm.anti()


WRm = Particle(pdg_code =34,
    name = 'WRm' ,
    antiname = 'WRmc' ,
    spin = 3 ,
    color = 1 ,
    mass = Param.MWRm ,
    width = Param.WWRm ,
    line = 'wavy' ,
    charge = -1 ,
    texname = 'W_R^-' ,
    antitexname = 'W_R^+' )

WRmc = WRm.anti()


gG = Particle(pdg_code =999904,
    name = 'gG' ,
    antiname = 'gGc' ,
    spin = -1 ,
    color = 8 ,
    mass = Param.ZERO ,
    width = Param.ZERO ,
    propagating = False,
    line = 'dotted' ,
    charge = 0 ,
    texname = '\\eta^G' ,
    antitexname = '\\bar{\\eta^G}' )

gGc = gG.anti()


gP = Particle(pdg_code =999905,
    name = 'gP' ,
    antiname = 'gPc' ,
    spin = -1 ,
    color = 1 ,
    mass = Param.ZERO ,
    width = Param.ZERO ,
    propagating = False,
    line = 'dotted' ,
    charge = 0 ,
    texname = '\\eta^P' ,
    antitexname = '\\bar{\\eta^P}' )

gPc = gP.anti()


gZ = Particle(pdg_code =999906,
    name = 'gZ' ,
    antiname = 'gZc' ,
    spin = -1 ,
    color = 1 ,
    mass = Param.MgZ ,
    width = Param.WZ ,
    propagating = False,
    line = 'dotted' ,
    charge = 0 ,
    texname = '\\eta^Z' ,
    antitexname = '\\bar{\\eta^Z}' )

gZc = gZ.anti()


gZp = Particle(pdg_code =999907,
    name = 'gZp' ,
    antiname = 'gZpc' ,
    spin = -1 ,
    color = 1 ,
    mass = Param.MgZp ,
    width = Param.WZp ,
    propagating = False,
    line = 'dotted' ,
    charge = 0 ,
    texname = '\\eta^{Z^{\\prime}}' ,
    antitexname = '\\bar{\\eta^{Z^{\\prime}}}' )

gZpc = gZp.anti()


gWLm = Particle(pdg_code =999908,
    name = 'gWLm' ,
    antiname = 'gWLmc' ,
    spin = -1 ,
    color = 1 ,
    mass = Param.MgWLm ,
    width = Param.WWLm ,
    propagating = False,
    line = 'dotted' ,
    charge = -1 ,
    texname = '\\eta_L^-' ,
    antitexname = '\\bar{\\eta_L^-}' )

gWLmc = gWLm.anti()


gWLp = Particle(pdg_code =999909,
    name = 'gWLp' ,
    antiname = 'gWLpc' ,
    spin = -1 ,
    color = 1 ,
    mass = Param.MgWLp ,
    width = Param.WWLm ,
    propagating = False,
    line = 'dotted' ,
    charge = 1 ,
    texname = '\\eta_L^+' ,
    antitexname = '\\bar{\\eta_L^+}' )

gWLpc = gWLp.anti()


gWRm = Particle(pdg_code =999910,
    name = 'gWRm' ,
    antiname = 'gWRmc' ,
    spin = -1 ,
    color = 1 ,
    mass = Param.MgWRm ,
    width = Param.WWRm ,
    propagating = False,
    line = 'dotted' ,
    charge = -1 ,
    texname = '\\eta_R^-' ,
    antitexname = '\\bar{\\eta_R^-}' )

gWRmc = gWRm.anti()


gWRp = Particle(pdg_code =999911,
    name = 'gWRp' ,
    antiname = 'gWRpc' ,
    spin = -1 ,
    color = 1 ,
    mass = Param.MgWRp ,
    width = Param.WWRm ,
    propagating = False,
    line = 'dotted' ,
    charge = 1 ,
    texname = '\\eta_R^+' ,
    antitexname = '\\bar{\\eta_R^+}' )

gWRpc = gWRp.anti()


