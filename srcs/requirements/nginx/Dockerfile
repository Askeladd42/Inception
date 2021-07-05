#DDL base image Debian Buster

FROM debian:buster
LABEL maintainer="plam <plam@student.42.fr>"

# update the software repository
RUN apt-get update && apt-get -y upgrade

# install nginx
RUN apt-get install -y nginx wget

# nginx config
COPY ./conf/nginx.conf /tmp

# SSL creation

COPY ssl/inception.key /etc/ssl/private/nginx-cert.key
COPY ssl/inception.crt /etc/ssl/certs/nginx-cert.crt

# start nginx
CMD [ "nginx", "-g", "daemon off;" ]

# Ports

EXPOSE 443