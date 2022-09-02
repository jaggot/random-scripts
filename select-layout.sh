#!/bin/sh
i3-msg layout $(echo -e "tabbed\ntoggle split\nstacked" | dmenu -p "Select your layout")
