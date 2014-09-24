#!/bin/sh
# Install VMWare Tools and HGFS kernel module
# to allow directory sharing with Vagrant.

# Mount and decompress the VMWare Tools iso
mkdir /mnt/cdrom
mount /home/vagrant/linux.iso /mnt/cdrom
tar xzvf `find /mnt/cdrom -maxdepth 1 -name "*.tar.gz"` -C /tmp/

# Install make, gcc, and friends
apt-get install build-essential -y

# Run the VMWare Tools install
/tmp/vmware-tools-distrib/vmware-install.pl -default

# Install required modules, such as the HGFS kernel module
#/tmp/vmware-tools-distrib/bin/vmware-config-tools.pl -default

# Tidy up
umount /home/vagrant/linux.iso
rm -rf /mnt/cdrom
rm -rf /tmp/vmware-tools-distrib/
rm -rf /home/vagrant/linux.iso