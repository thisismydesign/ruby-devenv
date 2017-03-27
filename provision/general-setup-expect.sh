#!/usr/bin/expect

spawn umake ide sublime-text
expect "Choose installation path:" { send "\r" }
interact
