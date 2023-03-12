#!/bin/bash
clear


echo -e "\n 1. Yes, Install Graphical VNC"
echo -e "\n 2. No, I changed my Mood Exit Script"
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
	1)
		echo -e "============================================================================================================================="
		echo -e "                             Installing GRAPHICAL VNC (tightvncserver) "
  		echo -e "============================================================================================================================="
		break
		;;

	2)
  echo -e "============================================================================================================================="
  echo -e " Okay your Wish VNC not installed."
  echo -e " Its sad to see you you going."
  echo -e "============================================================================================================================="
break
;;
 esac
done
