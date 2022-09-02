#!/bin/bash
if [ "$button" = "1" ]; then
	st -T FLOATING -g 25x9+1100+600 -e ~/scripts/get-calendar.sh
fi
date "+%A %m-%d-%Y"
