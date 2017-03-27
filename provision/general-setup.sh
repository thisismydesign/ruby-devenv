#!/bin/bash

add-apt-repository ppa:ubuntu-desktop/ubuntu-make
add-apt-repository ppa:webupd8team/sublime-text-3
apt-get update

apt-get install -y ubuntu-desktop
apt-get install -y build-essential linux-headers-$(uname -r) virtualbox-guest-x11

service lightdm start

is_unity_3d_supported() { /usr/lib/nux/unity_support_test -p | grep "Unity 3D supported:" | grep "yes"; }
echoerr() { cat <<< "$@" 1>&2; }

if [[ $(is_unity_3d_supported) ]]; then
  echo "Unity 3D supported (Guest Additions installed correctly)"
else
  echoerr "Unity 3D NOT supported (Guest Additions not installed correctly). Unless fixed it will cause performance issues."
fi

apt-get install -y tree git ubuntu-make sublime-text-installer
