#DDL base image Debian Buster

FROM debian:buster
LABEL maintainer="plam <plam@student.42.fr>"

# update the software repository
RUN apt-get update && apt-get -y upgrade

# install php 7.3

RUN apt-get install -y php-fpm php-gd php-mysql \
php-common php-curl php-opcache php-json php-imap php-mbstring php-xml \
curl dumb-init tar

#install wordpress

ADD 	https://wordpress.org/latest.tar.gz /tmp/latest.tar.gz
RUN 	cd /tmp \
		&& tar -zxvf latest.tar.gz \
		&& rm latest.tar.gz \
		&& mkdir /var/www \
		&& mv -f wordpress /var/www/ \
		&& chmod 755 -R /var/www/wordpress
		
COPY	./wp-config.php /var/www/wordpress
RUN 	rm -rf /var/www/wordpress/wp-config-sample.php
COPY 	./tools/wp_start.sh /wp_start.sh
RUN 	chmod +x /wp_start.sh
RUN		echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN 	mkdir -p /run/php/

# start wordpress + php

ENTRYPOINT ["/wp_start.sh"]

# Ports

EXPOSE 9000

CMD ["bash", "/wp_start.sh"]