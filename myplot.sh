#! /bin/sh
# File: myplot.sh
#	plot test of "case"

# Set messages on
##set -x

# Define variable
signaltonoise=10

# Create seismic data. By default. suplane generates
# 32 traces with signals from three reflections
suplane | suaddnoise sn=$signaltonoise > myplot.su
# Send file myplot.su to user-selected image program
# or make Postscript file.
read -p "your command: " para
case $para in

	wiggle)
	  suxwigb < myplot.su title="Wiggle plot"
	;;
	image)
          suximage < myplot.su title="Image plot"
        ;;
	 pswiggle)
          supswigp < myplot.su > myplot1.eps title="pswiggle"
	  echo ""
	  echo " Wiggle file myplot1.eps has been created."
	  echo ""
        ;;
	 psimage)
          supsimage < myplot.su > myplot2.eps title="bitmap"
 	  echo ""
          echo " Wiggle file myplot2.eps has been created."
          echo ""
        ;;
	 *)
          echo ""
          echo " Use: myplot.sh [wiggle,image,pswiggle,psimage]"
          echo ""
esac

# Exit politely from shell
exit
      

