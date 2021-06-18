# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: plam <plam@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/29 13:19:42 by plam              #+#    #+#              #
#    Updated: 2021/06/17 19:02:09 by plam             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC				=	srcs

CONTAINERS		=	${shell docker container list -aq}

IMAGES			=	${shell docker image list -aq}

up:
					docker-compose -f $(SRC)/docker-compose.yml up --build -d

down:
					docker-compose -f $(SRC)/docker-compose.yml down
					
clean:
					docker rmi -f ${IMAGES}
					docker image rm -f ${IMAGES}

debug:
	@echo ${CONTAINERS}
	@echo ${IMAGES}

.PHONY:	 up down clean