#!/bin/sh

service mysql start
sleep 10
mysql -e "CREATE DATABASE ${MYSQL_DATABASE}"
mysql -e "CREATE USER 'boss'@${MYSQL_DATABASE} IDENTIFIED BY 'bruh'"
mysql -e "CREATE USER 'corrector'@'Inception' IDENTIFIED BY 'oof'"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'boss'@'%' IDENTIFIED BY 'bruh'"
mysql -e "GRANT ALL PRIVILEGES ON Inception.* TO 'corrector'@'Inception'"
mysql -e "FLUSH PRIVILEGES"

mysql ${MYSQL_DATABASE} < /database.sql

service mysql stop

exec mysqld -u root --datadir="/var/lib/mysql"