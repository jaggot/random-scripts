#!/bin/sh
#pactl set-sink-volume 0 $1
if [ "$1" != "0%" ]; then
	if (( "$(pactl get-sink-volume "$(pactl list sinks | grep "Sink #" | sed 's/.*#//' | tail -n 1)" | head -n 1 | awk '{print $5}' | trim --end -2)$(echo $1 | trim --end -2)" > 130 )) && [ "$(echo "$1" | trim --end 1)" = "+" ]; then
		exit
	fi
fi
$(pactl list sinks | grep "Sink #" | sed 's/.*#//' | tail -n 1| awk '{print "pactl set-sink-volume "$1" '$1'"}')
pkill -SIGRTMIN+10 i3blocks
