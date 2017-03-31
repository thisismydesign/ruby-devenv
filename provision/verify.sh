#!/bin/bash

source $(dirname "$0")/utils.sh

if [[ $(is_unity_3d_supported) ]]; then
  echo "Unity 3D supported (Guest Additions installed correctly)"
else
  echo_err "Unity 3D NOT supported (Guest Additions not installed correctly). Unless fixed it will cause performance issues."
fi
