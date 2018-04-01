#!/bin/bash

COMPILER=f2py
FFLAGS='-O3'
#FFLAGS='-O1 -fcheck=all'  #For debug

#This script compiles the fortran modules required to run the python experiments.

echo "Compiling Observation operator"
cd data_assimilation
ln -sf ../common/netlib.f90        .
ln -sf ../common/SFMT.f90          .
ln -sf ../common/common_tools.f90  .
ln -sf ../common/common_mtx.f90    .

$COMPILER -c --opt='$FFLAGS' netlib.f90 SFMT.f90 common_tools.f90 common_obs_lorenzN.f90 -m obsope > compile.out 2>&1

rm netlib.f90 SFMT.f90 common_tools.f90 common_mtx.f90

cd ../

echo "Compiling DA routines"
cd data_assimilation
ln -sf ../common/netlib.f90        .
ln -sf ../common/SFMT.f90          .
ln -sf ../common/common_tools.f90  .
ln -sf ../common/common_mtx.f90    .

$COMPILER -c --opt='$FFLAGS' netlib.f90 SFMT.f90 common_tools.f90 common_mtx.f90 common_letkf.f90 common_da_tools_1d.f90 -m da > compile.out 2>&1

rm netlib.f90 SFMT.f90 common_tools.f90 common_mtx.f90

#rm *.o
#rm *.mod

cd ../

echo "Compiling model routines"
cd model
ln -sf ../common/SFMT.f90          .
ln -sf ../common/common_tools.f90  .
#Single scale model with stochastic parametrization
$COMPILER -c --opt='$FFLAGS' SFMT.f90 common_tools.f90 lorenzN.f90 -m model #> compile.out 2>&1 


#rm SFMT.f90 common_tools.f90 

#rm *.o
#rm *.mod

cd ../

echo "Normal end"

#ISSUES>

#If you have installed Anaconda from scratch and you experience issues with the compilation of the fortran code, try
#conda update anaconda 
#Before running the compilation script again.


#1)
#If you experience problems importing the compiled fortran modules from python (undefined reference related errors).
#Then replace libgfortran by libgcc in anaconda:

#conda remove libgfortran
#conda install libgcc --force

#This may introduce an error while loading other packages like matplotlib in that case install anaconda again with -u option (this will update the pacakges affected by the gcc installation)

#2)
#In some versions of Anaconda the name of the compiler is f2py not f2py3.

#3) 
#If you have installed Anaconda from scratch try 
#conda update anaconda 
#Before running the compilation script.


