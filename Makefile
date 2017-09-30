up-dev:
	docker-compose -f docker-compose.yml -p placeholder-dev up -d

build-dev:
	docker network create infra_default || true
	docker network create placeholder_network || true
	docker-compose -f docker-compose.yml -p placeholder-dev build

stop-dev:
	docker-compose -f docker-compose.yml -p placeholder-dev stop

down-dev:
	docker-compose -f docker-compose.yml placeholder-dev down

reload-dev:
	docker exec -ti placeholderdev_app_1 deploy/sh_scripts/reload_gunicorn.sh

logs-dev:
	docker logs --tail=200 placeholderdev_app_1

restart-dev:
	docker restart placeholderdev_app_1

shell-dev:
	docker exec -ti placeholderdev_app_1 ./manage.py shell_plus

tests-dev:
	docker exec -ti placeholderdev_app_1 ./manage.py test

restart-prod:
	docker restart placeholderprod_app_1

logs-prod:
	docker logs --tail=200 placeholderprod_app_1

build-prod:
	docker network create infra_default || true
	docker network create placeholder_network || true
	docker-compose -f docker-compose.yml -f docker-compose.prod.yml -p placeholder-prod build

shell-prod:
	docker exec -ti placeholderprod_app_1 ./manage.py shell_plus

tests-prod:
	docker exec -ti placeholderprod_app_1 ./manage.py test
