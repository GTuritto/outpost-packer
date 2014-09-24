#!/bin/sh -x
echo "mysql-server-5.5 mysql-server/root_password password mysql" | debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password_again password mysql" | debconf-set-selections
apt-get -y install mysql-server-5.5 mysql-client-5.5

# Create the 'wordpress' database with 'outpost' user, 'outpost' password, and all MySQL privileges 
#mysql -u base_user -pbase_user_pass -e "create database new_db; GRANT ALL PRIVILEGES ON new_db.* TO new_db_user@localhost IDENTIFIED BY 'new_db_user_pass'"
mysql -u root -pmysql -e "create database wordpress; GRANT ALL PRIVILEGES ON wordpress.* TO outpost@localhost IDENTIFIED BY 'outpost'"

# copy my.cnf
cp -f /mnt/floppy/my.cnf /etc/mysql/my.cnf


