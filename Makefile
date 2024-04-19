all:
	sudo mkdir -p /home/mengo/data/mariadb
	sudo mkdir -p /home/mengo/data/wordpress
	# @docker compose -f ./test/docker-compose.yml up --build
	@docker compose -f ./test/docker-compose.yml up -d --build

start:
	@docker compose -f ./test/docker-compose.yml start

stop:
	@docker compose -f ./test/docker-compose.yml stop

restart: stop start

down:
	@docker compose -f ./test/docker-compose.yml down

clean: down
	# @docker stop $$(docker ps -qa)
	# @docker rm $$(docker ps -aq)
	# @docker network rm $$(docker network ls -q) 2>/dev/null
	-@docker rmi -f $$(docker images -qa);
	-@docker volume rm $$(docker volume ls -q)
	-@docker system prune -af
	-@sudo rm -rf /home/mengo/data/mariadb
	-@sudo rm -rf /home/mengo/data/wordpress

.PHONY: all start stop restart down clean
