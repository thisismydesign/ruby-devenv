#!/usr/bin/expect

spawn umake ide rubymine
expect "Choose installation path:" { send "\r" }
interact
