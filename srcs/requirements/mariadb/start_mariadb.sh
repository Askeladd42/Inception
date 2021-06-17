#!/bin/sh

service mysql start \
#mysql -u root -e "CREATE DATABASE ${MYSQL_DATABASE}" \
#mysql -u root -e "CREATE USER ${MYSQL_USER}@'Inception' IDENTIFIED BY ${MYSQL_PASSWORD}" \
#mysql -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE} TO ${MYSQL_USER}@'Inception' IDENTIFIED BY ${MYSQL_PASSWORD}" \
#mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO ${MYSQL_ROOT_USER}@'Inception' IDENTIFIED BY ${MYSQL_ROOT_PASSWORD}" \
#mysql -u root -e "FLUSH PRIVILEGES" \
#mysql -u root -p ${MYSQL_ROOT_PASSWORD} ${MYSQL_DATABASE} < /database.sql

exec mysqld_safe --datadir="var/lib/mysql"