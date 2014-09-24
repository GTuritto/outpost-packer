# Outpost Packer

A [packer.io](http://packer.io) template to create a Vagrant box for the [Outpost](https://github.com/nickcernis/outpost) WordPress development environment.

**Licence**: MIT
| **Author**: Nick Cernis [@nickcernis](http://twitter.com/nickcernis)
| **Version**: 0.1.0

This packer template provisions an Ubuntu box with the following software for VMware and Vagrant:

- Ubuntu 14.0.4 LTS
- Apache 2.4.7
- PHP 5.5 (php5 php5-mysql php5-xdebug php5-cli php5-curl php5-gd libapache2-mod-php5)
- MySQL 5.5
- VMWare Tools (version 6.0.1)
- WP-CLI

The goal is to minimise the amount of provisioning that vagrant has to do so that `vagrant up` times for WordPress developers become bearable.

WordPress itself is not added – it's installed by [Outpost](https://github.com/nickcernis/outpost) after `vagrant up`.

## Building the VMware box

1. Download [Packer](http://www.packer.io/downloads.html) for your system.
2. Follow the [Packer installation instructions](http://www.packer.io/docs/installation.html).
3. Install VMWare Fusion (Mac), or VMWare Workstation (Windows, Linux).
4. Download or clone this repository from https://github.com/nickcernis/outpost-packer
5. Run `packer build outpost-vmware.json` to build the VMWare image. Put the kettle on. Initial build times can be 10 minutes or more.

## Adding the box with Vagrant

1. Check for existing images with `vagrant box list`
2. If you're replacing the existing vagrant outpost box, remove the old one with `vagrant box remove outpost`
3. Add the new vagrant box with `vagrant box add outpost outpost-vmware.box`

## Official version
The latest official public build of this box is hosted at [Vagrant Cloud](https://vagrantcloud.com/nickcernis/boxes/outpost/).