#DDL base image Debian Buster

FROM debian:buster
LABEL maintainer="plam plam@student.42.fr"

# update the software repository
RUN apt-get update && apt-get -y upgrade

# install php 7.3

RUN apt-get install -y php-fpm php-gd php-mysql php-cli \
php-common php-curl php-opcache php-json php-imap php-mbstring php-xml

#install wordpress
RUN cd /tmp \
	&& wget https://wordpress.org/latest.tar.gz \
	&& tar -zxvf latest.tar.gz \
	&& mv wordpress/ /var/www/html/wordpress \
	&& chown -R www-data:www-data /var/www/html/wordpress \
	&& chmod 755 -R /var/www/html/wordpress/
