#!/bin/bash

source $(dirname "$0")/utils.sh

add-apt-repository ppa:ubuntu-desktop/ubuntu-make
apt-get update

apt-get install -y ubuntu-desktop
apt-get install -y build-essential linux-headers-$(uname -r) virtualbox-guest-x11

service lightdm start

if [[ $(is_unity_3d_supported) ]]; then
  echo "Unity 3D supported (Guest Additions installed correctly)"
else
  echo_err "Unity 3D NOT supported (Guest Additions not installed correctly). Unless fixed it will cause performance issues."
fi

apt-get install -y tree git ubuntu-make expect

expect -f $(dirname "$0")/general-setup-expect.sh
