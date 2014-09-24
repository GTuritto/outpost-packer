#!/bin/bash
# Reduce the size of the image as much as possible.
# Run `packer build outpost-vbox-compressed.json` to call this script after provisioning.
# The Vagrant box that packer produces will be much smaller, but it can take a while.

# Remove APT cache
apt-get clean -y
apt-get autoclean -y

# Zero free space to aid VM compression
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Remove bash history
unset HISTFILE
rm -f /root/.bash_history
rm -f /home/vagrant/.bash_history

# Cleanup log files
find /var/log -type f | while read f; do echo -ne '' > $f; done;

# Whiteout root
count=`df --sync -kP / | tail -n1  | awk -F ' ' '{print $4}'`;
let count--
count=`expr $count - 1`
dd if=/dev/zero of=/tmp/whitespace bs=1024 count=$count;
rm /tmp/whitespace;

# Whiteout /boot
count=`df --sync -kP /boot | tail -n1 | awk -F ' ' '{print $4}'`;
let count--
count=`expr $count - 1`
dd if=/dev/zero of=/boot/whitespace bs=1024 count=$count;
rm /boot/whitespace;

# Whiteout swap
swappart=`cat /proc/swaps | tail -n1 | awk -F ' ' '{print $1}'`
swapoff $swappart;
dd if=/dev/zero of=$swappart;
mkswap $swappart;
swapon $swappart;