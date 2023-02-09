#!/bin/bash

# This script is intended at installing Docker on Raspberry Pi running Raspbian

# Source
# https://docs.docker.com/engine/install/debian/#install-using-the-convenience-script

# INSTALLATION

# Remove any OLD installation of Docker
sudo apt-get remove docker docker-engine docker.io containerd runc
# Purge any PREVIOUS installation of docker
sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras

# Official doc recommends Convenience script install method for Raspbian
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh

# POST-INSTALL SETUP

# Check if any docker group exist
cat /etc/group | grep -i docker

if [ $? -eq 1 ]
then
    # Create a docker group
    sudo groupadd docker
    # Add the pi user to docker group
    sudo usermod -aG docker pi
fi

# Change ownership to pi user's docker setting if any
if [ -e /home/pi/.docker ]
then
    sudo chown pi:pi /home/pi/.docker -R
    # According to https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user
    sudo chmod g+rwx /home/pi/.docker -R
fi

sudo shutdown -r 1 "We need to reboot to complete Docker setup."

