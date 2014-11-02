#!/bin/sh -x
apt-get -y install apache2

# copy httpd.conf, sites-available default, and .htaccess files
cp -f /mnt/floppy/default /etc/apache2/sites-available/000-default.conf
#cp -f /mnt/floppy/outpost /etc/apache2/conf.d/outpost.conf
cp -f /mnt/floppy/htaccess /var/www/html/.htaccess

# Enable mod_rewrite
a2enmod rewrite