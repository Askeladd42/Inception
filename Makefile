# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: plam <plam@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/29 13:19:42 by plam              #+#    #+#              #
#    Updated: 2021/06/03 19:52:07 by plam             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC				=	srcs

up:
					docker-compose -f $(SRC)/docker_compose.yml up --build -d

down:
					docker-compose -f $(SRC)/docker_compose.yml down -d
DOCKER_NET:
					docker network create my-net \
					docker create --name my-nginx \
					--network my-net \
					--publish 8080:80 \

all:			$(DOCKER_COMPOSE) \
				$(DOCKER_NET) \
				service nginx start \
				service mysql start \
				service php7.3-fpm start \

clean:
				docker-compose rm

.PHONY:	 up down clean