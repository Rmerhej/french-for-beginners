#!/usr/bin/env bash
# Restaure une sauvegarde de la base.  Usage :  ./scripts/restore.sh backups/frenchdb-AAAAMMJJ-HHMM.sql.gz
# ATTENTION : le contenu actuel de la base est remplacé. À tester d'abord sur votre PC.
set -euo pipefail

cd "$(dirname "$0")/.."
DB_CONTAINER="${DB_CONTAINER:-french-db}"
FILE="${1:-}"

if [ -z "$FILE" ] || [ ! -f "$FILE" ]; then
  echo "Usage : $0 <fichier.sql.gz>" >&2
  exit 1
fi
gzip -t "$FILE"

echo "Cette opération REMPLACE la base du conteneur « $DB_CONTAINER » par le contenu de :"
echo "  $FILE"
read -r -p "Tapez OUI pour continuer : " answer
[ "$answer" = "OUI" ] || { echo "Annulé."; exit 1; }

zcat "$FILE" | docker exec -i "$DB_CONTAINER" sh -c \
  'mysql -u root -p"$MYSQL_ROOT_PASSWORD" --default-character-set=utf8mb4 "$MYSQL_DATABASE"'

echo "✔ Restauration terminée. Redémarrez l'application : docker compose restart app"
