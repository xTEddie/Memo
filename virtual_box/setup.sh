#!/usr/bin/env bash

username=$(whoami)

# Get shared folder access permission
sudo adduser ${username} vboxsf

# Update & Upgrade packages
sudo apt-get update
sudo apt-get upgrade -y

# Install packages
sudo apt-get install vim -y
sudo apt-get install git -y
sudo apt-get install terminator -y
sudo apt-get install tmux -y
sudo apt-get install zsh -y
sudo apt-get install postgresql postgresql-contrib -y
sudo apt-get install apache2 -y 
sudo apt-get install php -y

# Install XUbuntu
sudo apt-get install xubuntu-desktop -y

# Reboot VM
sudo reboot
