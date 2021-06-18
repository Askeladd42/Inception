#!/bin/sh

service mysql start \
#mysql -u root -e "CREATE DATABASE 'Inception'" \
#mysql -u root -e "CREATE USER 'corrector'@'Inception' IDENTIFIED BY 'oof'" \
#mysql -u root -e "GRANT ALL PRIVILEGES ON 'Inception' TO 'corrector'@'Inception' IDENTIFIED BY 'oof'" \
#mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'boss'@'Inception' IDENTIFIED BY 'bruh'" \
#mysql -u root -e "FLUSH PRIVILEGES" \
#mysql -u root -p ${MYSQL_ROOT_PASSWORD} ${MYSQL_DATABASE} < /database.sql \

exec mysqld_safe --datadir="var/lib/mysql/mysql" \

sleep infinity
