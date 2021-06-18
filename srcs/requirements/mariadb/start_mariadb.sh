#!/bin/sh

service mysql start \

mysql -f "CREATE DATABASE 'Inception'" \
mysql -f "CREATE USER 'corrector'@'Inception' IDENTIFIED BY 'oof'" \
mysql -f "GRANT ALL PRIVILEGES ON 'Inception' TO 'corrector'@'Inception' IDENTIFIED BY 'oof'" \
mysql -f "GRANT ALL PRIVILEGES ON *.* TO 'boss'@'Inception' IDENTIFIED BY 'bruh'" \
mysql -f "FLUSH PRIVILEGES" \
#mysql -u root -p ${MYSQL_ROOT_PASSWORD} ${MYSQL_DATABASE} < /database.sql \

exec mysqld -u root --datadir="/var/lib/mysql/mysql"
