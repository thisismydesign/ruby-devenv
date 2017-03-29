#!/bin/bash

echo_headline "Ruby setup started"

source $(dirname "$0")/utils.sh

echo_headline "Installing apps via umake..."
expect -f $(dirname "$0")/ruby-setup-expect.sh

echo_headline "Installing RVM..."
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --quiet-curl

source /etc/profile.d/rvm.sh

echo_headline "Installing latest Ruby..."
rvm install ruby --latest
bash --login
rvm use ruby --latest

echo_headline "Installing bundler..."
gem install bundler
