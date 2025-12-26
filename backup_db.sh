#!/bin/bash

# --- Configurações ---
BACKUP_DIR="/home/appuser/go-notes/backups"
DB_NAME="app_db"
DB_USER="db_user"
DB_PASSWORD="admin123"
DATE=$(date +"%Y-%m-%d_%H-%M")

# Criar diretoria de backups, se não existir
mkdir -p "$BACKUP_DIR"

# Fazer backup usando TCP localhost e password
export PGPASSWORD="$DB_PASSWORD"
pg_dump -h localhost -U "$DB_USER" -d "$DB_NAME" -F c > "$BACKUP_DIR/app_db_$DATE.dump"
unset PGPASSWORD

# Apagar backups com mais de 7 dias
find "$BACKUP_DIR" -type f -name "*.dump" -mtime +7 -exec rm {} \;

# Mensagem opcional para log
echo "Backup de $DB_NAME realizado em $DATE"
