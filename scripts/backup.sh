#!/bin/sh

. ../.env

CONTAINER_ID_OR_NAME=planit-back_db_1
BACKUP_FILE="backup_$(date '+%Y%m%d_%H%M%S').sql"

mkdir -p ~/planit/backup
docker exec -it $CONTAINER_ID_OR_NAME pg_dump -U $DB_USER -w -F t $DB_NAME > ~/planit/backup/$BACKUP_FILE

gzip ~/planit/backup/$BACKUP_FILE

echo "Backup file created: ~/planit/backup/$BACKUP_FILE.gz"

