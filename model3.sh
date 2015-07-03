#! /bin/sh


# Set messages on
##set -x

# Experiment Number
num=3

# Name output binary model file
modfile=model$num.dat

#name output encapsulated postscript omage file
psfile=model$num.eps

# Remove previous .eps file
rm -f $psfile

trimodel xmin=-1 xmax=5 zmin=0 zmax=2 \
1 xedge=-1,5 \
  zedge=0,0 \
  sedge=0,0 \
2 xedge=-1,1,3,5 \
  zedge=0.3,0.5,0.2,0.3 \
  sedge=0,0,0,0 \
3 xedge=2,2.1,2.2 \
  zedge=0.7,0.66,0.7 \
  sedge=0,0,0 \
4 xedge=2,2.1,2.2 \
  zedge=0.7,0.74,0.70 \
  sedge=0,0,0 \
5 xedge=-1,1,3,5 \
  zedge=1.3,1.3,1.6,1.2 \
  sedge=0,0,0,0 \
6 xedge=-1,5 \
  zedge=2,2 \
  sedge=0,0 \
 kedge=1,2,3,4,5,6 \
 sfill=1,0.1,0,0,0.44,0,0 \
 sfill=1,0.6,0,0,0.40,0,0 \
 sfill=2.1,0.7,0,0,0.30,0,0 \
 sfill=1,1.5,0,0,0.20,0,0 > $modfile
##     x z        sloth

# Create a Postscript  file of the model
spsplot < $modfile > $psfile \
	  gedge=0.5 gtri=2.0 gmin=0 gmax=1 \
           title="Earth Model - Diffractor [Model$num]"\
	   labelz="Depth (km)" labelx="Distance (km)"\
	   dxnum=1.0 dznum=0.5 wbox=6 hbox=2

# Exit politely from shell
exit  
