#DDL base image Debian Buster

FROM debian:buster
LABEL maintainer="plam <plam@student.42.fr>"

# update the software repository
RUN 		apt-get update && apt-get -y upgrade

# install maria-db (database)
RUN 		apt-get install -y mariadb-server

# Copy confile files
COPY		start_mariadb.sh /start_mariadb.sh
COPY		database.sql /database.sql
RUN			chmod +x /start_mariadb.sh
COPY		./conf/my.cnf /etc/mysql/my.cnf
RUN			mkdir /var/run/mysqld
RUN			chown -R mysql:mysql /var/lib/mysql
RUN			chown -R 755 /var/run/mysqld

# Start server
ENTRYPOINT	["/start_mariadb.sh"]

# Ports

EXPOSE 3306