#!/bin/bash

source $(dirname "$0")/utils.sh

echo_headline "Ruby setup started"

echo_headline "Installing apps via umake..."
expect -c 'spawn umake ide rubymine; expect "Choose installation path:" { send "\r" }; set timeout 900; expect "Installation done"'

echo_headline "Installing RVM..."
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --quiet-curl

fix_rvm_availability

echo_headline "Installing latest Ruby..."
rvm install ruby --latest
rvm use ruby --latest

echo_headline "Installing bundler..."
gem install bundler
