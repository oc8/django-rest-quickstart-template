FROM python:3

# Installer PostgreSQL
RUN apt-get update && apt-get install -y postgresql-client

# Créer un répertoire pour notre projet
RUN mkdir /app

# Définir /app comme répertoire de travail
WORKDIR /app

# Copier le fichier requirements.txt dans le répertoire de travail
COPY requirements.txt .

# Installer les dépendances
RUN pip install -r requirements.txt

# Copier le reste du code source dans le répertoire de travail
COPY . .
