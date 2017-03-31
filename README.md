# ruby-devenv

### Virtual development environment for any Ruby project with 1 click

### Features

- automatic installation and setup
  - RVM, Ruby and Bundler
  - IDEs
  - project dependencies
  - popular tools
- easy integration, doesn't disturb base project
- any host and any Ubuntu / Debian guest system*

/* tested on Ubuntu 14.04 LTS, slight alterations may be needed for other systems

### Requirements

### Usage

### Technical details

#### Boxes

ubuntu/xenial64 is broken:

https://bugs.launchpad.net/cloud-images/+bug/1569237

boxcutter/ubuntu1604-desktop is broken on VirtualBox:

https://github.com/boxcutter/ubuntu/issues/101

Furthermore there're several issues that slow the startup (e.g. 90 second timeout looking for swap device) so in the end it's faster to install Unity on an official ubuntu-server box one time than to have a slow startup every time.

### Currently using ubuntu/trusty64

### Want to use ubuntu/xenial64-desktop


### TODO

https://github.com/rdsubhas/vagrant-faster

https://stefanwrobel.com/how-to-make-vagrant-performance-not-suck#toc_1

https://www.simonholywell.com/post/2016/02/intelligent-vagrant-and-ansible-files/

https://github.com/rvm/rvm1-ansible

### ISSUES

expect timeout doesn't return error

---------------

During umake install:

dconf-WARNING **: failed to commit changes to dconf: Cannot autolaunch D-Bus without X11 $DISPLAY

Possibly related to shortcuts not created
