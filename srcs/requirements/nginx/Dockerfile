#DDL base image Debian Buster

FROM debian:buster
LABEL maintainer="plam <plam@student.42.fr>"

# update the software repository
RUN apt-get update && apt-get -y upgrade

# install nginx
RUN apt-get install -y nginx wget

# nginx config
COPY conf/nginx.conf /tmp/default.conf
RUN cp /tmp/default.conf /etc/nginx/conf.d/
#ENV test_nginx=ok

# SSL creation

#RUN 	openssl req -x509 -nodes -days 1 -newkey rsa:2048 		\
#		-subj "/C=FR/ST=FRANCE/L=PARIS/O=INCEPTION/CN=127.0.0.1" \
#		-keyout etc/ssl/private/inception.key					\
#		-out etc/ssl/certs/inception.crt 						 

#COPY ssl/inception.key /etc/ssl/private/nginx-cert.key
#COPY ssl/inception.crt /etc/ssl/certs/nginx-cert.crt

# start nginx
CMD [ "nginx", "-g", "daemon off;" ]

# Ports

EXPOSE 443 80