#!/usr/bin/env bash
# Réduit le poids des grosses photos PNG de uploads/images en les convertissant en JPEG.
# À lancer sur le serveur, depuis le dossier du projet (là où se trouve docker-compose.yml) :
#   ./scripts/compress-images.sh --dry-run   # montre ce qui serait fait, ne change rien
#   ./scripts/compress-images.sh             # crée les .jpg à côté des .png + les fichiers SQL
#   ./scripts/compress-images.sh --clean     # plus tard : supprime les .png convertis
# Les .png d'origine sont conservés : le site continue de fonctionner tant que le SQL n'est pas lancé,
# et le SQL de retour en arrière remet les anciens chemins.
set -euo pipefail

cd "$(dirname "$0")/.."
MODE="convert"
case "${1:-}" in
  --dry-run) MODE="dry" ;;
  --clean)   MODE="clean" ;;
  "")        ;;
  *) echo "Usage : $0 [--dry-run | --clean]" >&2; exit 1 ;;
esac

IMG_DIR="uploads/images"
OUT_DIR="backups"
if [ ! -d "$IMG_DIR" ]; then
  echo "ERREUR : le dossier $IMG_DIR est introuvable (lancez le script depuis le dossier du projet)." >&2
  exit 1
fi
mkdir -p "$OUT_DIR"

# Python et Pillow tournent dans un conteneur jetable : rien à installer sur le serveur.
# Les fichiers créés appartiennent à votre utilisateur (--user), pas à root.
docker run --rm \
  --user "$(id -u):$(id -g)" \
  -e HOME=/tmp \
  -v "$PWD/$IMG_DIR:/data" \
  -v "$PWD/$OUT_DIR:/out" \
  -v "$PWD/scripts/compress_images.py:/compress_images.py:ro" \
  python:3.12-alpine \
  sh -c 'pip install --quiet --no-cache-dir --user pillow && python /compress_images.py "$0"' "$MODE"

case "$MODE" in
  convert)
    cat <<MSG

Étapes suivantes :
 1. Sauvegarde :            ./scripts/backup.sh
 2. Mettre à jour la base : docker exec -i french-db sh -c 'mysql -u root -p"\$MYSQL_ROOT_PASSWORD" "\$MYSQL_DATABASE"' < $OUT_DIR/images-to-jpg.sql
 3. Vérifier le site (leçons, vocabulaire, quiz avec images).
 En cas de problème : même commande avec $OUT_DIR/images-to-jpg-rollback.sql
 Une semaine plus tard, si tout va bien : ./scripts/compress-images.sh --clean
MSG
    ;;
  dry)
    echo "(simulation : rien n'a été modifié)"
    ;;
esac
