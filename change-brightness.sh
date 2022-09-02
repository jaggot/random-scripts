#!/bin/sh
let "NewBrt = $(cat /sys/class/backlight/intel_backlight/brightness) $1"
if [ "$NewBrt" = "-50" ]; then
	echo "Brightness will be too low, exiting..."
	exit
fi
if [ "$NewBrt" = "4250" ]; then
	echo "Brightness will be too high, exiting..."
	exit
fi
if (( NewBrt < 50 )); then
	let "NewBrt = 50"
fi
if (( NewBrt > 4200 )); then
	let "NewBrt = 4200"
fi
sudo -u abdulwahab printf "$NewBrt" > /sys/class/backlight/intel_backlight/brightness
