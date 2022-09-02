EMOJI="$(cat ~/scripts/emojis.txt | dmenu -w $(xdotool getwindowfocus) -p  "Select emoji: " -l 15)"
if [ "$EMOJI" != "" ]; then
	echo "$EMOJI" | awk '{print $1}' | trim --end -1 --no-newlines | xclip -selection clipboard
	notify-send "Emoji copied to clipboard.
'$EMOJI'" -t 3000
fi
