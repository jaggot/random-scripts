#!/bin/sh
olddevices="$(ls /dev/input/event*)"
devices="$(ls /dev/input/event*)"
while [ 1 ]; do
	if [ "$devices" != "$olddevices" ]; then
		setxkbmap -option caps:swapescape
		olddevices="$devices"
	fi
	devices="$(ls /dev/input/event*)"
	sleep 1
done
