#!/bin/bash
BLUETOOTH=$(mpv --audio-device=help | grep Purity)
FILENAME="$1"
SUBTITLE_CHECK_FILENAME="${FILENAME%.*}.srt"
if [ ${#BLUETOOTH} = 0 ]; then # if no bluetooth device with Purity in the name found
	if [ -e "$SUBTITLE_CHECK_FILENAME" ]; then
		mpv "$1" --sub-file="$SUBTITLE_CHECK_FILENAME"
	else
		mpv "$1"
	fi
else
	BLUETOOTH=$(printf "$BLUETOOTH" | awk '{print $1}' | sed "s/'//g")
	echo Trying bluetooth device $BLUETOOTH
	if [ -e "$SUBTITLE_CHECK_FILENAME" ]; then
		mpv "$1" --audio-device="$BLUETOOTH" --sub-file="$SUBTITLE_CHECK_FILENAME"
	else
		mpv "$1" --audio-device="$BLUETOOTH"
	fi
fi
