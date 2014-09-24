#!/bin/sh -x

# Symlink the wp-content folder to the /vagrant/wp/wp-content folder
ln -s /vagrant/wp/wp-content/ /var/www/html/wp-content

# Download WordPress
cd /var/www/html
wp core download --allow-root

# Set up wp-config.php
wp core config --allow-root --dbname=wordpress --dbuser=outpost --dbpass=outpost --extra-php <<PHP
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
define( 'WP_DEBUG_DISPLAY', false ); // just log silently to /wp-content/debug.log
define( 'SAVEQUERIES', true );
define( 'WP_HOME', 'http://my.outpost.rocks' );
define( 'WP_SITEURL', 'http://my.outpost.rocks' );
xdebug_disable(); // disable visual stack traces; use xdebug for interactive debugging sessions only
PHP

# Install WordPress
wp core install --url=http://wp.outpost.cc --title=Outpost --admin_name=outpost --admin_password=outpost --admin_email=null@example.com --allow-root
wp rewrite structure "/%postname%/" --allow-root

# Remove the default Apache index.html file and set file permissions
rm index.html
sudo chown -R vagrant:www-data .
sudo chmod -R g+w .