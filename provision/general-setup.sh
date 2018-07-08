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
sudo apt-get install -y tree git ubuntu-make expect nautilus-open-terminal snapd

echo_headline "Installing apps via snap..."
sudo snap install heroku --classic

echo_headline "Setting up git to use LF line endings..."
# For more info see https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration#_formatting_and_whitespace
git config --global core.autocrlf input

echo_headline "Generating key..."
ssh-keygen -N "" -f ~/.ssh/id_rsa

echo_headline "Installing apps via umake..."
expect -c 'spawn umake ide visual-studio-code; expect "Choose installation path:" { send "\r" }; expect "[I Accept (a)" { send "a\r" }; set timeout 900; expect "Installation done"'
expect -c 'spawn umake ide sublime-text; expect "Choose installation path:" { send "\r" }; set timeout 900; expect "Installation done"'
