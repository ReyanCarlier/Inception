all: up

up :
	cd srcs \
	&& sudo service docker restart \
	&& sudo docker-compose -f docker-compose.yml build \
	&& sudo docker-compose -f docker-compose.yml up -d

down :
	cd srcs \
	&& sudo docker-compose -f docker-compose.yml down

clean :
	cd srcs \
	&& sudo docker-compose -f docker-compose.yml down \
	&& sudo docker system prune --force

clean-all :
	cd srcs \
	&& sudo docker-compose -f docker-compose.yml down \
	&& sudo docker system prune -a --force \
	&& sudo rm -rf /home/recarlie/data/*

re :	clean up

config :
	cd srcs \
	&& sudo docker-compose config

delete :
	cd srcs \
	&& sudo docker-compose down --remove-orphans \
	&& sudo docker system prune --force

.PHONY: up down clean clean-all re config delete
