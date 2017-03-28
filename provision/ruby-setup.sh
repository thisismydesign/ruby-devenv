#!/bin/bash

expect -f $(dirname "$0")/ruby-setup-expect.sh

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --quiet-curl

source /etc/profile.d/rvm.sh

rvm install ruby --latest
bash --login
rvm use ruby --latest

gem install bundler
