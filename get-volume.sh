#!/bin/sh
[ "$button" = "1" ] && st -T FLOATING -g 80x9+700+600 -e pulsemixer # ~/scripts/launch-pulsemixer.sh
[ "$button" = "2" ] && pavucontrol
[ "$button" = "3" ] && ~/scripts/set-volume.sh 0%
[ "$button" = "4" ] && ~/scripts/set-volume.sh +5%
[ "$button" = "5" ] && ~/scripts/set-volume.sh -5%
pactl list sinks | grep "Volume: front" | awk '{print $5}'
