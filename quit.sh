RESPONSE=$(echo -e "No\nYes\nLogout\nReboot" | dmenu -i -p "Are you sure you want to exit?")
if [ "$RESPONSE" = "Yes" ]; then
	shutdown now
elif [ "$RESPONSE" = "Logout" ]; then
	i3-msg exit
elif [ "$RESPONSE" = "Reboot" ]; then
	systemctl reboot
fi
