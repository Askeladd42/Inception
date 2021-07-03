#!/bin/sh

service mysql status

service mysql start			#mysql fail to start, not creating the .sock for the db to work but only in the dockerfile execution
sleep 100
mysql -e "CREATE DATABASE Inception"
mysql -e "CREATE USER 'boss'@'Inception' IDENTIFIED BY 'bruh'"
mysql -e "CREATE USER 'corrector'@'Inception' IDENTIFIED BY 'oof'"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'boss'@'%' IDENTIFIED BY 'bruh'"
mysql -e "GRANT ALL PRIVILEGES ON Inception.* TO 'corrector'@'Inception'"
mysql -e "FLUSH PRIVILEGES"

mysql Inception < /database.sql

service mysql stop

exec mysqld -u root --datadir="/var/lib/mysql"