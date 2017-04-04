#!/bin/bash

source $(dirname "$0")/utils.sh
enable_command_print

echo_headline "Project setup started"

fix_rvm_availability

echo_headline "Installing project dependencies..."
(cd /workspace && bundle install --quiet)
