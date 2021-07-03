# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: plam <plam@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/29 13:19:42 by plam              #+#    #+#              #
#    Updated: 2021/07/03 11:46:57 by plam             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC				=	srcs

VOL_DIR			=	/home/plam/data

CONTAINERS		=	${shell docker container list -aq}

IMAGES			=	${shell docker image list -aq}

volumes:
					sudo mkdir -p $(VOL_DIR)/database && sudo chown -R mysql:mysql $(VOL_DIR)/database
					sudo mkdir -p $(VOL_DIR)/wordpress && sudo chown -R www-data:www-data $(VOL_DIR)/wordpress

up:					volumes
					docker-compose -f $(SRC)/docker-compose.yml up --build -d

down:
					docker-compose -f $(SRC)/docker-compose.yml down
					
clean:				down

fclean:				clean
					sudo rm -rf $(VOL_DIR)/database
					sudo rm -rf $(VOL_DIR)/wordpress
					docker rmi -f ${IMAGES}
debug:
	@echo ${CONTAINERS}
	@echo ${IMAGES}

.PHONY:	 up down clean fclean