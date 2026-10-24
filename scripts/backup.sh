#!/usr/bin/env bash
# Sauvegarde de la base MySQL et du dossier uploads.
# À lancer depuis le dossier du projet (là où se trouve docker-compose.yml) :  ./scripts/backup.sh
# Aucun mot de passe n'apparaît ici : il est lu DANS le conteneur MySQL (variable MYSQL_ROOT_PASSWORD).
set -euo pipefail

cd "$(dirname "$0")/.."
DB_CONTAINER="${DB_CONTAINER:-french-db}"
DEST="${BACKUP_DIR:-backups}"
KEEP="${BACKUP_KEEP:-14}"          # nombre de sauvegardes conservées de chaque sorte
STAMP="$(date +%Y%m%d-%H%M)"

umask 077                           # fichiers lisibles par vous seul
mkdir -p "$DEST"

SQL_FILE="$DEST/frenchdb-$STAMP.sql.gz"
echo "→ Export de la base vers $SQL_FILE"
docker exec "$DB_CONTAINER" sh -c \
  'mysqldump -u root -p"$MYSQL_ROOT_PASSWORD" --single-transaction --routines --default-character-set=utf8mb4 "$MYSQL_DATABASE"' \
  | gzip > "$SQL_FILE"

# Contrôles : archive lisible et contenu plausible (une base vide fait moins de 1 Ko)
gzip -t "$SQL_FILE"
if [ "$(stat -c %s "$SQL_FILE")" -lt 1000 ]; then
  echo "ERREUR : la sauvegarde est anormalement petite, elle est supprimée." >&2
  rm -f "$SQL_FILE"
  exit 1
fi
zcat "$SQL_FILE" | grep -q "CREATE TABLE" || { echo "ERREUR : aucune table dans la sauvegarde." >&2; rm -f "$SQL_FILE"; exit 1; }

if [ -d uploads ]; then
  UP_FILE="$DEST/uploads-$STAMP.tar.gz"
  echo "→ Archive des fichiers vers $UP_FILE"
  tar -czf "$UP_FILE" uploads
fi

ln -sf "$(basename "$SQL_FILE")" "$DEST/derniere-base.sql.gz"

# Suppression des plus anciennes (on garde les $KEEP dernières)
for prefix in frenchdb uploads; do
  ls -1t "$DEST"/"$prefix"-*.gz 2>/dev/null | tail -n +"$((KEEP + 1))" | xargs -r rm -f --
done

echo "✔ Terminé. Contenu de $DEST :"
ls -lh "$DEST"
