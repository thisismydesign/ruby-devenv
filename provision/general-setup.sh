#!/bin/bash

source $(dirname "$0")/utils.sh

echo_headline "General setup started"

echo_headline "Adding and updating repositories..."
add-apt-repository ppa:ubuntu-desktop/ubuntu-make
apt-get update

echo_headline "Installing Unity and guest additions..."
apt-get install -y ubuntu-desktop
apt-get install -y build-essential linux-headers-$(uname -r) virtualbox-guest-x11

echo_headline "Starting Unity..."
service lightdm start

if [[ $(is_unity_3d_supported) ]]; then
  echo "Unity 3D supported (Guest Additions installed correctly)"
else
  echo_err "Unity 3D NOT supported (Guest Additions not installed correctly). Unless fixed it will cause performance issues."
fi

echo_headline "Installing apps via apt..."
apt-get install -y tree git ubuntu-make expect

echo_headline "Installing apps via umake..."
expect -f $(dirname "$0")/general-setup-expect.sh
