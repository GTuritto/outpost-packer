#!/bin/sh

# Unattended install of PHPMyAdmin
# Adapted from http://stackoverflow.com/a/23948528/88487

echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-user string root" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password mysql" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password mysql" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password mysql" | sudo debconf-set-selections

sudo apt-get -y install phpmyadmin

sudo php5enmod mcrypt # Needs to be activated manually (that's an issue for Ubuntu 14.04)

sudo service apache2 reload