#!/bin/bash

# determine if the key is already enrolled
mokutil --list-enrolled | grep ublue > /dev/null

if [ $? -ne 0 ]; then
    # prompt the user to enroll the key
    read -p "Enroll secureboot? " confirm
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
        sudo mokutil --timeout -1
        sudo mokutil --import /etc/pki/akmods/certs/akmods-ublue.der
        if [ $? -eq 0 ]; then
            sudo reboot
        fi
    fi
fi