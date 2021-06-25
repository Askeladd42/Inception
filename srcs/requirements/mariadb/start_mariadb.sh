#!/bin/sh
#not sure if '%' is necessary here for boss user

#mysql_install_db --no-defaults --user=root --basedir=/var/lib/mysql

service mysql start

mysql -e "CREATE DATABASE Inception"
mysql -e "CREATE USER 'boss'@'Inception' IDENTIFIED BY 'bruh'"
mysql -e "CREATE USER 'corrector'@'Inception' IDENTIFIED BY 'oof'"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'boss'@'%' IDENTIFIED BY 'bruh'"
mysql -e "GRANT ALL PRIVILEGES ON Inception.* TO 'corrector'@'Inception'"
mysql -e "FLUSH PRIVILEGES"
mysql Inception < /database.sql

exec mysqld -u root --datadir="/var/lib/mysql"

# problem from the my.cnf that screw up all the tables definition
