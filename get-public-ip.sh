curl ipecho.net | grep "Your IP is" | sed 's/.*is //' | sed 's/<.*//'
