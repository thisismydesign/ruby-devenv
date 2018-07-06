# ruby-devenv

### Virtual development environment for any Ruby project with 1 command

### Features

- automatic installation and setup (for details see [Installed tools](https://github.com/thisismydesign/ruby-devenv#installed-tools))
  - RVM, Ruby and Bundler
  - IDEs
  - project dependencies
  - popular tools
- easy integration, doesn't interfere with base project
- smart resource allocation based on the host system's available resources*
- any host and any Ubuntu / Debian guest system**
- base project is synchronized and available on both host and guest systems

\* all virtual CPU cores, 1/4th of memory (via [vagrant-faster](https://github.com/rdsubhas/vagrant-faster))

\** tested on Ubuntu 14.04 LTS, slight alterations may be needed for other systems

### Requirements

[Vagrant](https://www.vagrantup.com/) (tested on 1.9.3)

[VirtualBox](https://www.virtualbox.org/) (tested on 5.1.18)

Some vagrant plugins:
```bash
vagrant plugin install vagrant-proxyconf vagrant-vbguest vagrant-faster
```

### Setup

Checkout this project to a Ruby project's root in it's own subdirectory (e.g. `<project_root>/ruby-devenv`) and keep it up to date. Using `git` this can easily be achieved via submodules:

```bash
git submodule add https://github.com/thisismydesign/ruby-devenv
git submodule update --remote ruby-devenv
```

More info on git submodules [here](https://git-scm.com/book/en/v2/Git-Tools-Submodules). An example of `ruby-denenv` used as a submodule can be found [here](https://github.com/thisismydesign/json-streamer).

### Usage

Inside `ruby-devenv`'s directory execute

`vagrant up`

Wait for the setup to finish (indicated by `Provision executed in %hh-%mm-%ss`). If you encounter issues during the first setup (e.g. with UI) try to restart the VM.

Manage the box via [vagrant CLI](https://www.vagrantup.com/docs/cli/) or VirtualBox.

### Performance

Highly depends on the host system. Test system: `i5-6500 CPU | 16 GB RAM | 500 Mbps Network | SSD`

- Initial host setup ~ 3 minutes (1 time)

- Initial guest setup ~ 10-15 minutes (1 time / VM)

  - ~3-5 minutes of that is installing ubuntu-desktop which could be bypassed with an ideal Vagrant Box (more in the [Boxes section](https://github.com/thisismydesign/ruby-devenv#boxes)).

- Guest boot ~ 30 seconds (every time)

### Technical details

#### Boxes

Currently using official [ubuntu/trusty64](https://atlas.hashicorp.com/ubuntu/boxes/trusty64) box.

Many Vagrant boxes are available in [Atlas](https://atlas.hashicorp.com/boxes/search). Ideally we'd use ubuntu/xenial64-desktop however there're several issues:
- Ubuntu doesn't ship desktop boxes
- [ubuntu/xenial64](https://atlas.hashicorp.com/ubuntu/boxes/xenial64) is broken (non-compliant): https://bugs.launchpad.net/cloud-images/+bug/1569237
- [boxcutter/ubuntu1604-desktop](https://atlas.hashicorp.com/boxcutter/boxes/ubuntu1604-desktop) (a popular 3rd party box) is broken on VirtualBox: https://github.com/boxcutter/ubuntu/issues/101. Furthermore there're several issues that slow the startup (e.g. 90 second timeout looking for swap device) so in the end it's faster to install Unity on an official ubuntu-server box one time than to have a slow startup every time.
- 3rd party boxes in general are
  - less reliable 
  - updated less frequently

#### Installed tools

All tool are installed with latest stable version available unless indicated otherwise

- RVM, Ruby, Bundler

- RubyMine, Sublime Text

- Git, tree, umake, expect, nautilus-open-terminal

- VirtualBox Guest Additions

- Base project's gem dependencies (assuming directory structure defined in [Setup](https://github.com/thisismydesign/ruby-devenv#setup))

#### TODO

https://stefanwrobel.com/how-to-make-vagrant-performance-not-suck#toc_1

VM setup with ansible instead of bash:

https://www.simonholywell.com/post/2016/02/intelligent-vagrant-and-ansible-files/

https://github.com/rvm/rvm1-ansible

#### Known issues

- expect timeout doesn't return error
- During umake install:
  - dconf-WARNING **: failed to commit changes to dconf: Cannot autolaunch D-Bus without X11 $DISPLAY
  - Possibly related to shortcuts not created
- install of `build-essential linux-headers-$(uname -r) virtualbox-guest-x11` needed, otherwise [Unity issue](http://askubuntu.com/questions/17381/unity-doesnt-load-no-launcher-no-dash-appears) presents
- bunch of unnecessary output (no quiet mode for RVM, umake, etc)
