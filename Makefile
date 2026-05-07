DOCKER=docker
DOCKER_COMPOSE=docker compose -f srcs/docker-compose.yml

all: up

up:
	$(DOCKER_COMPOSE) up -d --build

down:
	$(DOCKER_COMPOSE) down --remove-orphans

restart:
	$(DOCKER_COMPOSE) restart

logs:
	$(DOCKER_COMPOSE) logs -f

build:
	$(DOCKER_COMPOSE) build --no-cache

ps:
	$(DOCKER) ps -a

clean:
	$(DOCKER) system prune -a

remove:
	sudo rm -rf /home/bnafiai/data/wordpress/*
	sudo rm -rf /home/bnafiai/data/mariadb/*

fclean:
	$(DOCKER_COMPOSE) down --rmi all -v --remove-orphans

re: fclean all

.PHONY: all up down restart logs build ps fclean re

