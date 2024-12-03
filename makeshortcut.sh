#!/bin/bash
#remove to make it a shell script
#function makeshortcut {
	#get the file to make it for
	newShortcut="${1%%.*}"
	#append .desktop to make it valid
	newShortcut+=".desktop"
	
	# using code from online
	# https://askubuntu.com/questions/64222/how-can-i-create-launchers-on-my-desktop
	# add the info to the new file

	#create the new file	
	echo "#!/usr/bin/env xdg-open" > "${newShortcut}"	
	#append the rest
	echo "" >> "${newShortcut}"
	echo "[Desktop Entry]" >> "${newShortcut}"
	echo "Version=1.0" >> "${newShortcut}"
	echo "Type=Application" >> "${newShortcut}"
	echo "Terminal=false" >> "${newShortcut}"
	
	# insert execution code
	# fetch the executable from the submitted file
	
	execCode="."
	execCode+="$(readlink -f "$1")"

	echo "Exec=$execCode" >> "${newShortcut}"
	name="${1%%.*}"
	name="${name^}"
	echo "Name=$name" >> "${newShortcut}"
	echo "Comment=Comment Here" >> "${newShortcut}"

	# fetching the icon from submit
	icon="$(readlink -f "$2")"
	
	echo "Icon=$icon" >> "${newShortcut}"

	chmod +x "${newShortcut}"

	# completed
	# moving to desktop..
#}
