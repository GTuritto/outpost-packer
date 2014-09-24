#!/bin/sh -x

# Stop cron and disable at startup
service cron stop
update-rc.d -f cron remove
mv /etc/init/cron.conf /etc/init/cron.conf.disabled
# re-enable with update-rc.d cron defaults

# copy mysqldump shell script
cp -f /mnt/floppy/mysqldump.sh /etc/mysql/mysqldump.sh

# Set up a cron task to run the mysqldump every 3 minutes
echo '*/3 * * * * root /etc/mysql/mysqldump.sh' >> /etc/crontab

# Outpost looks for 'outpost.sql' upon `vagrant up` and uses it to rebuild the database to restore the previous data state.
# This lets developers destroy the virtual machine to save disk space without losing development data.
# If they *do* want to destroy data, they can just delete /wp-data/outpost.sql before running `vagrant up`
# and they'll get a clean WordPress install with whatever files they have in /wp-content.