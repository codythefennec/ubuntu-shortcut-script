#!/bin/bash
#remove to make it a shell script
function makeshortcut {
	# fetch init dir
	initDir="$(pwd)"

	# fetch the executable from the submitted file
	execCode="$(sudo readlink -f "$1")"
	
	echo "Executable: $execCode"

	# fetching the icon from submit
	icon="$(sudo readlink -f "$2")"
	
	echo "Icon: $icon"

	#get the file to make it for
	newShortcut="${1%%.*}"
	#append .desktop to make it valid
	newShortcut+=".desktop"

	# using code from online
	# https://askubuntu.com/questions/64222/how-can-i-create-launchers-on-my-desktop
	# add the info to the new file

	#change dir
	echo "Moving to ~/Scripts"

	user=$(whoami)
	cd //home/$user/Scripts	

	#create the new file	
	echo "#!/usr/bin/env xdg-open" >> "${newShortcut}"

	#append the rest
	echo "" >> "${newShortcut}"
	echo "[Desktop Entry]" >> "${newShortcut}"
	echo "Version=1.0" >> "${newShortcut}"
	echo "Type=Application" >> "${newShortcut}"
	echo "Terminal=false" >> "${newShortcut}"
	
	# insert execution code

	echo "Exec=$execCode" >> "${newShortcut}"
	name="${1%%.*}"
	name="${name^}"
	echo "Name=$name" >> "${newShortcut}"
	echo "Comment=Comment Here" >> "${newShortcut}"

	echo "Icon=$icon" >> "${newShortcut}"

	chmod +x "${newShortcut}"

	# completed
	# moving to desktop..

	echo "Moving shortcut to desktop!"

	mv "${newShortcut}" ~/Desktop/

	echo "Moving back to where you were"
	
	cd "$initDir"
}
