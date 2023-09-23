#!/bin/sh

. ../.env

BACKUP_FILE="backup_$(date '+%Y%m%d_%H%M%S').json"

mkdir -p ~/$PROJECT_NAME/backup

# Exécutez la commande dumpdataa l'ntérieur du conteneur Docke
docker-compose -f ../docker-compose.prod.yml exec -T backend python manage.py dumpdata --output=/tmp/$BACKUP_FILE --natural-primary --natural-foreign

# Copiez le fichier de sauvegarde du conteneur Docker vers l'hôte
docker cp "$(docker-compose ps -q $SERVICE_NAME):/tmp/$BACKUP_FILE" ~/$PROJECT_NAME/backup/

gzip ~/$PROJECT_NAME/backup/$BACKUP_FILE

echo "Backup file created: ~/$PROJECT_NAME/backup/$BACKUP_FILE.gz"
