#!bin/bash
 
mysql -u root -e "CREATE DATABASE wordpress_database" \
mysql -u root -e "CREATE USER 'plam'@'Inception' IDENTIFIED BY 'oof'" \
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress_database.* TO 'plam'@'Inception' IDENTIFIED BY 'oof'" \
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'plam'@'Inception' IDENTIFIED BY 'oof'" \
mysql -u root -e "FLUSH PRIVILEGES"