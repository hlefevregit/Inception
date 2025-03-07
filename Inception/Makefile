COMPOSE_FILE = docker-compose.yml
PROJECT_NAME = Inception

.PHONY: build up down restart logs prune clean rebuild

build:
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) build

up:
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) up -d

down:
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) down

restart:
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) down
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) up -d

logs:
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) logs -f

prune:
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) down -v --remove-orphans --rmi all
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) rm -f
	docker volume prune -f

clean:
	docker stop $$(docker ps -aq)
	docker rm $$(docker ps -a -q)
	docker rmi -f $$(docker images -q)
	docker volume rm $$(docker volume ls -q)
	docker network prune -f 

rebuild:
	@echo "Arret de tous les services"
	-docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) down
	@echo "Nettoyage des images et des volumes"
	docker system prune -af
	docker volume prune -f
	@echo "Construction des images sans cache"
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) build --no-cache
	@echo "Démarrage des services"
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) up -d
	@echo "Done :)""