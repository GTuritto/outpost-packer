#!/bin/sh -x

# Install PHP and dependencies
apt-get -y install php5 php5-mysql php5-xdebug php5-cli php5-curl php5-gd libapache2-mod-php5

# copy php.ini
cp -f /mnt/floppy/php.ini /etc/php5/apache2/php.ini