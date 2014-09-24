#!/bin/sh
# Install VMWare Tools and HGFS kernel module
# to allow directory sharing with Vagrant.

# VMWare Tools for VMWare 6.0.2 is broken
# See https://communities.vmware.com/message/2315060
# Workaround is to download and install tools for 6.0.1

# Install make, gcc, and friends
apt-get install build-essential -y
apt-get install unzip -y

# Download and unzip VMWare Tools 6.0.1
cd /tmp
mkdir vmt
cd vmt
wget https://softwareupdate.vmware.com/cds/vmw-desktop/fusion/6.0.1/1331545/packages/com.vmware.fusion.tools.linux.zip.tar
tar xvf com.vmware.fusion.tools.linux.zip.tar
unzip com.vmware.fusion.tools.linux.zip

mkdir /mnt/cdrom
mount /tmp/vmt/payload/linux.iso /mnt/cdrom
tar xzvf `find /mnt/cdrom -maxdepth 1 -name "*.tar.gz"` -C /tmp/vmt


# Run the VMWare Tools install
/tmp/vmt/vmware-tools-distrib/vmware-install.pl -default

# Tidy up
umount /tmp/vmt/payload/linux.iso
rm -rf /mnt/cdrom
rm -rf /tmp/vmt
rm -rf /home/vagrant/linux.iso