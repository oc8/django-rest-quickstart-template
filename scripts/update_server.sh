#!/bin/bash
docker-compose run backend python manage.py makemigrations backend &&
docker-compose run backend python manage.py migrate backend
