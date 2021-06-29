#!/bin/sh
#not sure if '%' is necessary here for boss user

#mysql_install_db --basedir=/var/lib/mysql #conflict in the install, should check what happened that mess up the container

service mysql start

mysql -e "CREATE DATABASE Inception"
mysql -e "CREATE USER 'boss'@'Inception' IDENTIFIED BY 'bruh'"
mysql -e "CREATE USER 'corrector'@'Inception' IDENTIFIED BY 'oof'"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'boss'@'%' IDENTIFIED BY 'bruh'"
mysql -e "GRANT ALL PRIVILEGES ON Inception.* TO 'corrector'@'Inception'"
mysql -e "FLUSH PRIVILEGES"
mysql Inception < /database.sql

exec mysqld -u root --datadir="/var/lib/mysql"

# socket issues again, maybe because of a start failure ?
