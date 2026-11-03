#!/usr/bin/env bash
# Met l'application à jour sur le serveur, avec sauvegarde avant et retour arrière si ça ne démarre pas.
# Utilisation (depuis le dossier du projet) :  ./scripts/deploy.sh v1.15.5
# Lancé automatiquement par GitHub Actions (voir CD.md) ; utilisable aussi à la main.
set -euo pipefail

cd "$(dirname "$0")/.."

IMAGE="${IMAGE:-rolandmerhej1/french-app}"
APP_CONTAINER="${APP_CONTAINER:-french-app}"
URL="${HEALTH_URL:-http://127.0.0.1:8080/}"
WAIT_SECONDS="${WAIT_SECONDS:-180}"

TAG="${1:-}"
if ! [[ "$TAG" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Utilisation : ./scripts/deploy.sh v1.2.3" >&2
  exit 2
fi

[ -f .env ] || { echo "ERREUR : fichier .env introuvable dans $(pwd)." >&2; exit 1; }

# 1) Dépôt à jour (compose, scripts…). Si le dossier a des changements locaux, on continue avec ce qu'il y a.
if ! git pull --ff-only; then
  echo "Attention : « git pull » impossible (changements locaux ?). On continue avec les fichiers actuels." >&2
fi

grep -q 'APP_TAG' docker-compose.yml || {
  echo "ERREUR : docker-compose.yml ne contient pas APP_TAG. Mettez le projet à jour (git pull) puis recommencez." >&2
  exit 1
}

# Écrit (ou remplace) APP_TAG dans .env
set_tag() {
  if grep -q '^APP_TAG=' .env; then
    sed -i "s|^APP_TAG=.*|APP_TAG=$1|" .env
  else
    printf '\nAPP_TAG=%s\n' "$1" >> .env
  fi
}

# Version actuellement en marche (pour revenir en arrière)
PREVIOUS="$(docker inspect --format '{{.Config.Image}}' "$APP_CONTAINER" 2>/dev/null | sed 's/.*://' || true)"
echo "Version actuelle : ${PREVIOUS:-inconnue}  →  nouvelle version : $TAG"

# 2) Télécharger la nouvelle image AVANT d'arrêter quoi que ce soit
echo "→ Téléchargement de $IMAGE:$TAG"
APP_TAG="$TAG" docker compose pull app

# 3) Sauvegarde (base + uploads). Si elle échoue, on n'y touche pas.
echo "→ Sauvegarde"
bash ./scripts/backup.sh

# 4) Démarrer la nouvelle version
set_tag "$TAG"
echo "→ Démarrage"
docker compose up -d

# 5) Attendre que le site réponde
echo "→ Contrôle (jusqu'à ${WAIT_SECONDS} s)"
ok=0
for ((i = 0; i < WAIT_SECONDS; i += 5)); do
  sleep 5
  code="$(curl -s -o /dev/null -w '%{http_code}' --max-time 5 "$URL" || true)"
  if [ "$code" = "200" ]; then ok=1; break; fi
  echo "   pas encore prêt (code ${code:-aucun})"
done

if [ "$ok" -ne 1 ]; then
  echo "ERREUR : la version $TAG ne répond pas. Journal de l'application :" >&2
  docker logs --tail 40 "$APP_CONTAINER" >&2 || true
  if [ -n "$PREVIOUS" ] && [ "$PREVIOUS" != "$TAG" ]; then
    echo "→ Retour à la version $PREVIOUS" >&2
    set_tag "$PREVIOUS"
    docker compose up -d
    echo "Retour arrière fait. Vérifiez le site." >&2
  fi
  exit 1
fi

docker image prune -f > /dev/null
echo "✔ Version $TAG en ligne."
