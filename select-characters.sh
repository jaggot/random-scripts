CHARACTER="$(cat ~/scripts/characters.txt | dmenu -w $(xdotool getwindowfocus) -p  "Select emoji: " -l 15)"
if [ "$CHARACTER" != "" ]; then
	echo "$CHARACTER" | awk '{print $1}' | trim --end -1 --no-newlines | xclip -selection clipboard
	notify-send "character copied to clipboard.
'$CHARACTER'" -t 3000
fi
