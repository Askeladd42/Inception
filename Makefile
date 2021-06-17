# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: plam <plam@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/29 13:19:42 by plam              #+#    #+#              #
#    Updated: 2021/06/15 15:05:56 by plam             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC				=	srcs

DELETE 			= ${shell docker container list -aq}

up:
					docker-compose -f $(SRC)/docker-compose.yml up --build -d

down:
					docker-compose -f $(SRC)/docker-compose.yml down
					
clean:
					docker rm -f ${DELETE}

debug:
	@echo ${DELETE}

.PHONY:	 up down clean