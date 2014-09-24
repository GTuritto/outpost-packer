# /srv/salt/mysql/init.sls

include:
  - cron

mysql-pkgs:
  pkg.installed:
    - pkgs:
      - mysql-server
      - mysql-client

python-mysqldb:
  pkg.installed:
    - require:
      - pkg: mysql-pkgs
      - service.dead: cron

# Create the 'wordpress' database with 'outpost' user, 'outpost' password, and all MySQL privileges
wordpress-db:
  mysql_database.present:
    - name: wordpress
    - require:
      - pkg: python-mysqldb
  mysql_user.present:
    - name: outpost
    - host: localhost
    - password: outpost
    - require:
      - pkg: python-mysqldb
  mysql_grants.present:
    - grant: all privileges
    - database: '*.*'
    - user: outpost
    - host: localhost
    - require:
      - pkg: python-mysqldb

# Store the my.cnf in our salt directory to make configuration from the host system before `vagrant up` easier
/etc/mysql/my.cnf:
  file.managed:
    - source: salt://mysql/my.cnf
