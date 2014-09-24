#!/bin/bash
# Dump the contents of the WordPress database if it isn't empty. This script runs as a cron job every five minutes.
mysqldump --no-create-db -u outpost -poutpost wordpress > /vagrant/wp/wp-data/outpost.sql