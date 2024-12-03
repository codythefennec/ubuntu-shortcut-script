# A Simple Shell Script to Send Executables to Your Desktop!
This shell script can help you create executable files and put them on your desktop to save a lot of time.

# How to Use
First install the repo with:

``git clone https://github.com/codythefennec/ubuntu-shortcut-script.git``

Enter that directory and execute the installscript:

``./installscripts.sh``

This will:
 - Create Scripts folder in home dir
 - Move the shortcut script to the new scripts folder
 - Add a link to the script in your .bashrc file

# Usage
First find the executable you want to create a desktop link for.
Next check if its an executable by launching it with:

``./{executable name}``

If something launches then it's suitable for the script
Then, you can execute the command:

``makeshortcut {executable file} {optional iconpath}``

This will create the executable and send it to the desktop!
