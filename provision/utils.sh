#!/bin/bash

is_unity_3d_supported() { /usr/lib/nux/unity_support_test -p | grep "Unity 3D supported:" | grep "yes"; }

echo_err() { cat <<< "$@" 1>&2; }

echo_headline() { printf "\n################\n"; printf "$@"; printf "\n################\n\n"; }

fix_rvm_availability() {source /etc/profile.d/rvm.sh; bash --login; }
