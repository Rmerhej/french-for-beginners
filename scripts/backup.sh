#!/usr/bin/env bash
# Sauvegarde de la base MySQL et du dossier uploads.
# À lancer depuis le dossier du projet (là où se trouve docker-compose.yml) :  ./scripts/backup.sh
# Aucun mot de passe n'apparaît ici : il est lu DANS le conteneur MySQL (variable MYSQL_ROOT_PASSWORD).
set -euo pipefail

cd "$(dirname "$0")/.."

# Réglages facultatifs, lus dans l'environnement ou, à défaut, dans le fichier .env (jamais affichés) :
#   HEALTHCHECK_URL  adresse « ping » d'un service d'alerte (Healthchecks.io) : signal de réussite ou d'échec ;
#   OFFSITE_REMOTE   copie hors serveur, de la forme <nom du remote rclone>:<bucket> (voir OPERATIONS.md).
env_value() {
  local name="$1" value="${!1:-}"
  if [ -z "$value" ] && [ -f .env ]; then
    value="$(grep -E "^${name}=" .env | head -n 1 | cut -d= -f2- | tr -d '"' | tr -d "'" || true)"
  fi
  printf '%s' "$value"
}
HEALTHCHECK_URL="$(env_value HEALTHCHECK_URL)"
OFFSITE="$(env_value OFFSITE_REMOTE)"

# Alerte : si le signal n'arrive pas à l'heure prévue, le service vous envoie un e-mail.
ping_health() {
  [ -n "${HEALTHCHECK_URL:-}" ] || return 0
  curl -fsS -m 10 --retry 3 -o /dev/null "${HEALTHCHECK_URL}${1:-}" || echo "   (l'alerte n'a pas pu être envoyée)" >&2
}
trap 'ping_health /fail' ERR
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
  ping_health /fail
  exit 1
fi
# (grep -c lit tout le flux : avec « grep -q » + pipefail, zcat est coupé en cours de route et le test échoue à tort)
NB_TABLES="$(zcat "$SQL_FILE" | grep -c "CREATE TABLE" || true)"
if [ "$NB_TABLES" -lt 1 ]; then
  echo "ERREUR : aucune table dans la sauvegarde." >&2
  rm -f "$SQL_FILE"
  ping_health /fail
  exit 1
fi
echo "   $NB_TABLES tables sauvegardées."

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

# Copie hors serveur (facultative) : « copy » n'efface jamais rien côté distant, sauf les vieilles bases (> OFFSITE_KEEP_DAYS jours)
if [ -n "$OFFSITE" ]; then
  if ! command -v rclone >/dev/null 2>&1; then
    echo "ERREUR : OFFSITE_REMOTE est défini mais rclone n'est pas installé." >&2
    ping_health /fail
  exit 1
  fi
  echo "→ Copie hors serveur vers $OFFSITE"
  rclone copy "$DEST" "$OFFSITE/db" --include "frenchdb-*.sql.gz" --transfers 2 -q
  rclone delete "$OFFSITE/db" --include "frenchdb-*.sql.gz" --min-age "$(env_value OFFSITE_KEEP_DAYS | grep -E '^[0-9]+$' || echo 60)d" -q
  if [ -d uploads ]; then
    rclone copy uploads "$OFFSITE/uploads" --transfers 4 -q
  fi
  echo "   copie hors serveur terminée."
fi

echo "✔ Terminé. Contenu de $DEST :"
ls -lh "$DEST"
ping_health
