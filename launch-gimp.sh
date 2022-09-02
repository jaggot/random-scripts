if [ $(ps ax | grep gimp | wc -l) -lt 5 ]; then
	i3-msg workspace GIMP
	gimp
else
	i3-msg workspace GIMP
fi
