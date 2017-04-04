#!/bin/bash

source $(dirname "$0")/utils.sh
enable_command_print

echo_headline "Ruby setup started"

echo_headline "Installing apps via umake..."
expect -c 'spawn umake ide rubymine; expect "Choose installation path:" { send "\r" }; set timeout 900; expect "Installation done"'

echo_headline "Setting up RubyMine..."
rubymine_version=$(get_rubymine_version_from_executable ~/.local/share/umake/ide/rubymine/bin/rubymine.sh)
mkdir -p ~/.$rubymine_version/config
unzip /vagrant/settings/ruybmine-default.jar -d ~/.RubyMine*/config

echo_headline "Installing RVM..."
gpg --quiet --no-verbose --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby --quiet-curl

fix_rvm_availability

echo_headline "Installing bundler..."
gem install bundler --no-document --silent
