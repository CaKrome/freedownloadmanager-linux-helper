# freedownloadmanager-linux-helper

This is a script that helps you to install/remove [Free Download Manager](https://www.freedownloadmanager.org/) on various GNU/Linux distributions. This script will install Free Download Manager in ```$HOME/freedownloadmanager```, so no elevated privilege is required. It also featured XDG desktop integration, so you can find Free Download Manager in the menu after installation.

# Motivation

Free Download Manager is a proprietary download manager which supports GNU/Linux. However they only distribute a deb package and only officialy support Ubuntu. This makes it difficult to install on other GNU/Linux distributions. This script extracts the required file from the deb package and install it in a distro-agnostic way so all other GNU/Linux distros can use it as well.

# Usage
Execute ```freedownloadmanager.sh```  

Full usage is available in the script.

## Dependencies
```openssl```, ```xdg-utils```, ```ffmpeg``` and ```libtorrent```.  

Fedora/RHEL/Alma, openSUSE/SLE users also need ```libxkbcommon-x11``` to be present on the system.

# License

Free Download Manager itself is proprietary however this script is licensed under GNU General Public License Version 3.
