# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: plam <plam@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/29 13:19:42 by plam              #+#    #+#              #
#    Updated: 2021/07/30 19:07:02 by plam             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC				=	srcs

VOL_DIR			=	/home/plam/data

CONTAINERS		=	${shell docker container list -aq}

IMAGES			=	${shell docker image list -aq}

VOLUMES			=	${shell docker volume list}

NETWORKS		=	${shell docker network list -q}

dom_add:
					sudo sed -i "1i\127.0.0.1\tplam.42.fr" /etc/hosts

dom_del:
					sudo sed -i "/127.0.0.1\tplam.42.fr/d" /etc/hosts

del_images:
					docker rmi -f ${IMAGES}

volumes:
					sudo userdel www-data && sudo useradd -u 82 www-data
					sudo mkdir -p $(VOL_DIR)/database && sudo chown -R mysql:mysql $(VOL_DIR)/database
					sudo mkdir -p $(VOL_DIR)/wp && sudo chown -R www-data:www-data $(VOL_DIR)/wp

up:					volumes dom_add
					docker-compose -f $(SRC)/docker-compose.yml up --build -d

down:
					docker-compose -f $(SRC)/docker-compose.yml down
					
clean:
					docker-compose -f $(SRC)/docker-compose.yml down --rmi all

fclean:				clean dom_del
					docker volume rm -f ${VOLUMES}
					docker network rm ${NETWORKS}
					sudo rm -rf $(VOL_DIR)/database
					sudo rm -rf $(VOL_DIR)/wp
					sudo rm -rf $(VOL_DIR)

debug:
	@echo ${CONTAINERS}
	@echo ${IMAGES}

.PHONY:	 up down clean fclean