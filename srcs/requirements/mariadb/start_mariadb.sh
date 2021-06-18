#!/bin/sh

service mysql start \

mysql -e "CREATE DATABASE 'Inception'" \
mysql -e "CREATE USER 'corrector'@'Inception' IDENTIFIED BY 'oof'" \
mysql -e "GRANT ALL PRIVILEGES ON 'Inception' TO 'corrector'@'Inception' IDENTIFIED BY 'oof'" \
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'boss'@'Inception' IDENTIFIED BY 'bruh'" \
mysql -e "FLUSH PRIVILEGES" \
#mysql -u root -p ${MYSQL_ROOT_PASSWORD} ${MYSQL_DATABASE} < /database.sql \

exec mysqld -u root --datadir="/var/lib/mysql/mysql"
