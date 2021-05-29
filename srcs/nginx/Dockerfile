#DDL base image Debian Buster

FROM debian:buster
LABEL maintainer="plam plam@student.42.fr"

# update the software repository
RUN apt-get update && apt-get -y upgrade

# install nginx
RUN apt-get install -y nginx wget

# nginx config
COPY srcs/nginx.conf /tmp