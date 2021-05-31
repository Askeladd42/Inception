# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: plam <plam@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/29 13:19:42 by plam              #+#    #+#              #
#    Updated: 2021/05/31 18:00:16 by plam             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC				=	srcs

DOCKER_COMPOSE:
					docker-compose $(SRC)/docker_compose.yml --env-file
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