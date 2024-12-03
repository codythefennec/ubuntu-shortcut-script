#!/bin/bash

echo "Making makeshortcut.sh executable.."

chmod +x makeshortcut.sh

if [ -d "~/Scripts/" ]; then
	echo "Scripts folder exists.."
else
	echo "Scripts folder does not exist.."

	echo "Making scripts folder.."

	mkdir ~/Scripts
fi

echo "Moving shortcut script.."

mv makeshortcut.sh ~/Scripts

echo "Connecting script to .bashrc.."

echo "source ~/Scripts/makeshortcut.sh" >> ~/.bashrc

echo "Installation complete!"
