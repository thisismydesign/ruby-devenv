#!/bin/bash

add-apt-repository ppa:ubuntu-desktop/ubuntu-make
add-apt-repository ppa:webupd8team/sublime-text-3
apt-get update

apt-get install -y tree git ubuntu-make sublime-text-installer
