# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: plam <plam@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/29 13:19:42 by plam              #+#    #+#              #
#    Updated: 2021/05/29 18:39:32 by plam             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC				=	docker-compose.yml

DOCKER_COMPOSE:
					docker-compose $(SRC)

all:			$(DOCKER_COMPOSE)
				service nginx start
				service mysql start
				service php7.3-fpm start

.PHONY:	 all clean fclean re