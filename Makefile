-include .env


build:
	docker-compose build
	docker-compose run backend python manage.py migrate
	docker-compose run backend python ./manage.py createsuperuser --noinput --username $(DJ_USER) --email test@gmail.fr &> /dev/null || true

run: build
	docker-compose up -d

test:
	docker-compose run backend python ./manage.py test

shell:
	docker-compose run backend python ./manage.py shell

logs:
	docker-compose logs -f --tail 5

db:
	docker-compose exec db psql -U $(DB_USER) -d $(DB_NAME)

db_update:
	docker-compose run backend python manage.py makemigrations
	docker-compose run backend python manage.py migrate
	docker-compose run backend python manage.py makemigrations backend
	docker-compose run backend python manage.py migrate backend

clean:
	docker-compose down

fclean: clean
	docker stop $$(docker-compose ps -qa)
	docker rm $$(docker-compose ps -qa)

.PHONY: build run test shell logs db clean fclean
.SILENT: build run test shell logs db clean fclean
.DEFAULT_GOAL := run
