#!/bin/sh

service mysql start
sleep 10
mysql -e "CREATE DATABASE ${MYSQL_DATABASE}"
mysql -e "CREATE USER ${WP_ADMIN}@${MYSQL_DATABASE} IDENTIFIED BY ${WP_ADMIN_PASSWORD}"
mysql -e "CREATE USER ${WP_USER}@${MYSQL_DATABASE} IDENTIFIED BY ${WP_USER_PASSWORD}"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO ${WP_ADMIN}@'%' IDENTIFIED BY ${WP_ADMIN_PASSWORD}"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO ${WP_USER}@'${MYSQL_DATABASE}'"
mysql -e "FLUSH PRIVILEGES"

#mysql ${MYSQL_DATABASE} < /database.sql

service mysql stop

exec mysqld -u root --datadir="/var/lib/mysql"