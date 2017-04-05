#!/bin/bash

source $(dirname "$0")/utils.sh

echo_headline "General setup started"

echo_headline "Adding and updating repositories..."
sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make
sudo apt-get update

echo_headline "Installing Unity and guest additions..."
sudo apt-get install -y ubuntu-desktop
sudo apt-get install -y build-essential linux-headers-$(uname -r) virtualbox-guest-x11

echo_headline "Starting Unity..."
sudo service lightdm start

echo_headline "Installing apps via apt..."
sudo apt-get install -y tree git ubuntu-make expect nautilus-open-terminal

echo_headline "Installing apps via umake..."
expect -c 'spawn umake ide sublime-text; expect "Choose installation path:" { send "\r" }; set timeout 900; expect "Installation done"'
