#!/bin/sh

#mysqld_install_db --no-defaults --basedir=/var/lib/mysql #conflict in the install, should check what happened that mess up the container

service mysql start			#mysql fail to start, not creating the .sock for the db to work

mysql -u root -e "CREATE DATABASE Inception"
mysql -u root -e "CREATE USER 'boss'@'Inception' IDENTIFIED BY 'bruh'"
mysql -u root -e "CREATE USER 'corrector'@'Inception' IDENTIFIED BY 'oof'"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'boss'@'%' IDENTIFIED BY 'bruh'"
mysql -u root -e "GRANT ALL PRIVILEGES ON Inception.* TO 'corrector'@'Inception'"
mysql -u root -e "FLUSH PRIVILEGES"
mysql -u root Inception < /database.sql

exec mysqld -u root --datadir="/var/lib/mysql"