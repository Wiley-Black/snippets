#!/bin/bash
echo "login-script.sh running..."
date > login-script.log 
echo "login-script.sh ran." >> login-script.log
sleep 5

# Use 'background.png' if it was copied in via the Dockerfile (if it existed).  Otherwise pick a provided one.
if [ -f "/usr/share/xfce4/backdrops/background.png" ]; then
	xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorrdp0/workspace0/last-image --set /usr/share/xfce4/backdrops/background.png
else 
	xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorrdp0/workspace0/last-image --set /usr/share/xfce4/backdrops/xubuntu-development.png
fi

echo "login-script.sh complete."