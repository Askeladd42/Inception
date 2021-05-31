#DDL base image Debian Buster

FROM debian:buster
LABEL maintainer="plam plam@student.42.fr"

# update the software repository
RUN apt-get update && apt-get -y upgrade

# install maria-db (database)
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y mariadb-server