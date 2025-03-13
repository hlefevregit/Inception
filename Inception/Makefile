COMPOSE_FILE = ./src/docker-compose.yml
PROJECT_NAME = inception
PORT ?=8443

.PHONY: build up down restart logs prune clean rebuild

# Makefile - Gestion Docker Inception


up:
	@echo "🔼 Démarrage des services sur le port $(PORT)..."
	# @sed "s/REPLACE_PORT/$(PORT)/g" $(COMPOSE_FILE) > $(COMPOSE_FILE)
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) up -d --build

down:
	@echo "🧹 Arrêt des services"
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) down || true
	docker network rm inception_inception_network || true

prune:
	@echo "🧼 Nettoyage complet"
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) down -v --remove-orphans
	docker volume prune -f
	docker container prune -f

logs:
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) logs -f

restart: down up



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
	@echo "Done :)"