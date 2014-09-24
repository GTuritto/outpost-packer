#!/bin/sh -x
apt-get -y update
apt-get -y upgrade
apt-get -y install curl git sendmail
apt-get clean

# Suppress 'stdin: is not a tty' messages during vagrant up
# From https://github.com/mitchellh/vagrant/issues/1673#issuecomment-26650102
# Replaces 'msg n' with 'tty -s && mesg n' in /root/.profile
sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile

# Mount the Packer floppy containing our config files
mkdir -p /mnt/floppy
modprobe floppy
mount -t vfat /dev/fd0 /mnt/floppy