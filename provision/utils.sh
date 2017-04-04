#!/bin/bash

is_unity_3d_supported() { /usr/lib/nux/unity_support_test -p | grep "Unity 3D supported:" | grep "yes"; }

echo_err() { cat <<< "$@" 1>&2; }

echo_headline() { printf "\n################\n"; printf "$@"; printf "\n################\n\n"; }

fix_rvm_availability() { source ~/.rvm/scripts/rvm; bash --login; }

seconds_to_hh_mm_ss() { printf '%02dh:%02dm:%02ds\n' $(($@/3600)) $(($@%3600/60)) $(($@%60)); }

get_rubymine_version_from_executable() { cat $@ | grep -E -o -h -m 1 'RubyMine[[:digit:]]{4}\.[[:digit:]]{1}'; }

enable_command_print() { set -x; }
