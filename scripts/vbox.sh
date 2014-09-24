# Install Virtual Box guest additions

# Install necessary packages
sudo apt-get -y install dkms gcc
#sudo apt-get -y install linux-headers-$(uname -r)

# Mount Guest Additions and run installer
# (VirtualBox will automatically download the correct version of VBoxGuestAdditions for you when you run `packer build outpost-vbox.json`.)
mount -o loop /root/VBoxGuestAdditions.iso /mnt
yes|sh /mnt/VBoxLinuxAdditions.run
umount /mnt

# Clean up
rm /root/VBoxGuestAdditions.iso