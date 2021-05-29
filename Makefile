# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: plam <plam@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/29 13:19:42 by plam              #+#    #+#              #
#    Updated: 2021/05/29 19:57:41 by plam             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC				=	docker-compose.yml

DOCKER_COMPOSE:
					docker-compose $(SRC)
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

.PHONY:	 all clean fclean re