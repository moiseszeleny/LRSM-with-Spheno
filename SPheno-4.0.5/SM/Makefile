modname = SM  # as an example  
PreDef = -DGENERATIONMIXING -DONLYDOUBLE
# setting various paths  
InDir = ../include
Mdir = ${InDir}
VPATH = 3-Body-Decays:LoopDecays:TwoLoopMasses:Observables:SM 
name = ../lib/libSPhenoSM.a
 
# check if SARAH module and SPheno are compatibel  
minV=330.00 
cVersion =$(shell expr $(version) \>= $(minV))
#  
# options for various compilers  
#  
# Default Compiler  
F90=gfortran
comp= -c -O -module ${Mdir} -I${InDir}  
LFlagsB= -O  
# Intels ifort,debug modus  
ifeq (${F90},ifortg)  
F90=ifort  
comp= -c -g -module ${Mdir} -I${InDir}  
LFlagsB= -g  
endif  
# gfortran  
ifeq (${F90},gfortran)  
comp= -c -g -ffree-line-length-none -J${Mdir} -I${InDir}  
LFlagsB= -g  
endif  
# g95  
ifeq (${F90},g95)  
comp= -c -O -fmod=${Mdir} -I${InDir}  
LFlagsB= -O  
endif  
# Lahey F95 compiler  
ifeq (${F90},lf95)  
comp=-c -O -M ${Mdir} -I${InDir}  
LFlagsB=-O  
endif  
# NAG f95/2003  
ifeq (${F90},nagfor)  
comp= -c -O -mdir ${Mdir} -I${InDir}  
LFlagsB= -O -DONLYDOUBLE -mdir ${MDir} -I${InDir}  
endif   
.SUFFIXES : .o .ps .f90 .F90 .a 
bin/SPhenoSM:
ifeq (${cVersion},1)
	 cd ../src ; ${MAKE} F90=${F90} 
	 ${MAKE} F90=${F90} ${name} 
	 ${MAKE} F90=${F90} SPhenoSM.o 
	 ${F90} -o SPhenoSM ${LFlagsB} SPhenoSM.o ../lib/libSPhenoSM.a ../lib/libSPheno.a
	 mv SPhenoSM ../bin
	 rm SPhenoSM.o  
${name}:  ${name}(Settings.o) ${name}(Model_Data_SM.o)  \
 ${name}(RGEs_SM.o)   \
 ${name}(Couplings_SM.o) ${name}(TreeLevelMasses_SM.o) ${name}(TadpoleEquations_SM.o) \
 ${name}(LoopCouplings_SM.o) ${name}(CouplingsForDecays_SM.o) \
 ${name}(TreeLevel_Decays_SM.o) \
 ${name}(Fu.o)  ${name}(Fe.o)  ${name}(Fd.o)  \
${name}(AddLoopFunctions.o) ${name}(Kinematics.o) \
 ${name}(2LPoleFunctions.o) ${name}(2LPole_SM.o) \
 ${name}(LoopMasses_SM.o) \
 ${name}(RGEs_SM_HC.o) ${name}(Couplings_SM_HC.o) ${name}(TreeLevelMasses_SM_HC.o) ${name}(LoopMasses_SM_HC.o)   \
${name}(CouplingsCT_SM.o) \
${name}(Bremsstrahlung.o) ${name}(DecayFFS.o) ${name}(DecayFFV.o) ${name}(DecaySSS.o) ${name}(DecaySSV.o) ${name}(DecaySFF.o) ${name}(DecaySVV.o) \
 ${name}(LoopDecayFu_SM.o)  ${name}(LoopDecayFe_SM.o)  ${name}(LoopDecayFd_SM.o)  ${name}(LoopDecayhh_SM.o) \
 ${name}(Wrapper_LoopDecay_Fu_SM.o)  ${name}(Wrapper_LoopDecay_Fe_SM.o)  ${name}(Wrapper_LoopDecay_Fd_SM.o)  ${name}(Wrapper_LoopDecay_hh_SM.o) ${name}(OneLoopDecays_SM.o) \
 ${name}(BranchingRatios_SM.o) ${name}(HiggsCS_SM.o) ${name}(RunSM_SM.o) \
 ${name}(Unitarity_SM.o) \
${name}(FlavorKit_LFV_SM.o) ${name}(FlavorKit_QFV_SM.o) ${name}(FlavorKit_Observables_SM.o)\
 ${name}(LowEnergy_SM.o) \
 ${name}(Boundaries_SM.o)  ${name}(InputOutput_SM.o) 
else 
	 @echo -------------------------------------------------------------------  
	 @echo ERROR:  
	 @echo The installed SPheno is version not compatibel with this module 
	 @echo Please, upgrade at least to SPheno version 3.3.0.  
	 @echo The current SPheno version can be downloaded from 
	 @echo http://www.hepforge.org/downloads/spheno 
	 @echo ------------------------------------------------------------------- 
endif 
clean: 
	 rm -f *.o *~ */*.o */*~
cleanall: 
	 rm -f bin/SPheno3 lib/*.a *~ */*.o */*~ include/*
#
# Suffix rules
#
.f90.a:
	 ${F90} ${comp} $< 
	 ar -ruc -U $@ $*.o
	 rm -f $*.o
.F90.a:
	 ${F90} ${comp} ${PreDef} $< 
	 ar -ruc -U $@ $*.o
	 rm -f $*.o
.f90.o:
	 ${F90} ${comp} $<
.f90.ps:
	 a2ps -o $*.ps $<
.h.ps:
	 a2ps -o $*.ps $<
