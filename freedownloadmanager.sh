#!/bin/bash

if [ "$1" == "install" ]
then
    if [[ ! -f freedownloadmanager.deb ]]
    then
        # Download the deb package
        
        wget https://dn3.freedownloadmanager.org/6/latest/freedownloadmanager.deb
    fi

    # Extract the deb package

    ar xv freedownloadmanager.deb
    tar -xvf data.tar.xz
    cd usr/share/applications
    sed '/Exec/c Exec=/bin/sh -c "$HOME/freedownloadmanager/fdm"' -i freedownloadmanager.desktop
    sed '/Icon/c Icon=fdm' -i freedownloadmanager.desktop
    if [[ ! -d ~/.local/share/applications ]]
    then
        mkdir ~/.local/share/applications
    fi
    mv freedownloadmanager.desktop ~/.local/share/applications/
    cd ../../../opt/freedownloadmanager
    if [[ ! -d ~/.local/share/icons ]]
    then
        mkdir ~/.local/share/icons
    fi
    cp icon.png ~/.local/share/icons/
    mv ~/.local/share/icons/icon.png ~/.local/share/icons/fdm.png
    cd ..
    mv freedownloadmanager/ ~
    cd ..
    rm control.tar.xz data.tar.xz debian-binary freedownloadmanager.deb
    rm -rf opt usr

    echo "FreeDownloadManager is successfully installed into ~/freedownloadmanager"

elif [ "$1" == "remove" ]
then
    rm -f ~/.local/share/applications/freedownloadmanager.desktop
    rm -f ~/.local/share/applications/freedownloadmanager_fdm_up.desktop

    if [[ -d ~/.local/share/applications ]]
    then
        if [ -z "$(ls -A ~/.local/share/applications/)" ]
        then
            rmdir ~/.local/share/applications/
        fi
    fi

    rm -f ~/.config/autostart/FDM.desktop

    if [[ -d ~/.config/autostart/ ]]
    then
        if [ -z "$(ls -A ~/.config/autostart/)" ]
        then
            rmdir ~/.config/autostart/
        fi
    fi

    rm -f ~/.config/google-chrome/NativeMessagingHosts/org.freedownloadmanager.fdm5.cnh.json

    if [[ -d ~/.config/google-chrome/NativeMessagingHosts/ ]]
    then
        if [ -z "$(ls -A ~/.config/google-chrome/NativeMessagingHosts/)" ]
        then
            rmdir ~/.config/google-chrome/NativeMessagingHosts/
        fi
    fi

    if [[ -d ~/.config/google-chrome/ ]]
    then
        if [ -z "$(ls -A ~/.config/google-chrome/)" ]
        then
            rmdir ~/.config/google-chrome/
        fi
    fi

    rm -f ~/.local/share/icons/fdm.png

    if [[ -d ~/.local/share/icons ]]
    then
        if [ -z "$(ls -A ~/.local/share/icons/)" ]
        then
            rmdir ~/.local/share/icons/
        fi
    fi

    rm -rf ~/freedownloadmanager/
    rm -rf ~/.cache/Softdeluxe/
    rm -rf ~/.local/share/Softdeluxe/

    echo "FreeDownloadManager is successfully removed from your system"

elif [ "$1" != "install" ] && [ "$1" != "remove" ] 
then
    echo "Usage: install  Install FreeDownloadManager"
    echo "       remove   Remove FreeDownloadManager"

fi