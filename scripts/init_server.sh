#!/bin/bash
# docker-compose run backend django-admin startproject backend . &&
docker-compose build &&
docker-compose run backend python manage.py makemigrations backend &&
docker-compose run backend python manage.py migrate backend &&
docker-compose run backend python ./manage.py createsuperuser
