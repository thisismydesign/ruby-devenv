#!/bin/bash

echo_headline "Project setup started"

echo_headline "Installing project dependencies..."
(cd /workspace && bundle install)
