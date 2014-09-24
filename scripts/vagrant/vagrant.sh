#!/bin/sh -x

# Enable box to be used by Vagrant

# Add vagrant to sudoers and enable passwordless sudo
#groupadd admin
#usermod -G admin vagrant
echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
usermod -a -G sudo vagrant

#cp /etc/sudoers /etc/sudoers.orig
#sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=admin' /etc/sudoers
#sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers

# Copy the public key needed for vagrant to SSH into the box
mkdir /home/vagrant/.ssh
wget https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub -O /home/vagrant/.ssh/authorized_keys
chmod go-w /home/vagrant /home/vagrant/.ssh
chmod 600 /home/vagrant/.ssh/authorized_keys
chown vagrant /home/vagrant/.ssh/authorized_keys