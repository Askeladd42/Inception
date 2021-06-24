#!/bin/sh
#not sure if '%' is necessary here for boss user
service mysql start

mysql -e "CREATE DATABASE Inception"
mysql -e "CREATE USER 'boss'@'Inception' IDENTIFIED BY 'bruh'"
mysql -e "CREATE USER 'corrector'@'Inception' IDENTIFIED BY 'oof'"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'boss'@'%' IDENTIFIED BY 'bruh'"
mysql -e "GRANT ALL PRIVILEGES ON Inception.* TO 'corrector'@'Inception'"
mysql -e "FLUSH PRIVILEGES"
mysql -u ${MYSQL_ROOT_USER} -p ${MYSQL_ROOT_PASSWORD} 
mysql -u root ${MYSQL_DATABASE} < /database.sql

exec mysqld -u root --datadir="/var/lib/mysql/mysql"

# problem from the my.cnf that screw up all the tables definition
