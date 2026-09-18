#!/bin/bash
echo "login-script.sh running..."
date > login-script.log 
echo "login-script.sh started." >> login-script.log
sleep 5

# Use 'background.png' if it was copied in via the Dockerfile (if it existed).  Otherwise pick a provided one.
if [ -f "/usr/share/xfce4/backdrops/background.png" ]; then
	xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorrdp0/workspace0/last-image --set /usr/share/xfce4/backdrops/background.png
else 
	xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorrdp0/workspace0/last-image --set /usr/share/xfce4/backdrops/xubuntu-development.png
fi

# Execute login-script-more.sh if there is one.  This file isn't part of the git repo so that you can customize it.
if [ -f "./login-script-more.sh" ]; then
	./login-script-more.sh
fi

echo "login-script.sh complete."