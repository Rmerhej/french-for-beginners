# Cache et compression Nginx

Ce que cela apporte :
- les images, l'audio, les styles et les scripts sont gardés par Nginx : l'application Java (818 Mo de mémoire seulement) n'est plus sollicitée à chaque fichier ;
- les pages et les fichiers texte sont compressés : moins de données envoyées, pages plus rapides sur téléphone ;
- pendant un redémarrage de l'application (déploiement), les fichiers statiques continuent d'être servis.

Les **pages HTML ne sont pas mises en cache** (elles contiennent le jeton de sécurité des formulaires et le nom de la personne connectée).

## Installation (sur le serveur, dans le dossier du projet)

1. Créer le dossier du cache :

```
sudo mkdir -p /var/cache/nginx/french
sudo chown nginx:nginx /var/cache/nginx/french
sudo restorecon -R /var/cache/nginx 2>/dev/null || true
```

2. Copier les deux fichiers de configuration :

```
sudo cp deploy/nginx/french-cache-zone.conf /etc/nginx/conf.d/
sudo mkdir -p /etc/nginx/snippets
sudo cp deploy/nginx/french-cache-locations.conf /etc/nginx/snippets/
```

3. Ouvrir le fichier du site :

```
sudo nano /etc/nginx/conf.d/french-app.conf
```

Dans le bloc `server` qui contient `listen 443` (HTTPS), ajouter cette ligne **juste avant** `location / {` :

```
    include /etc/nginx/snippets/french-cache-locations.conf;
```

Ne pas l'ajouter dans le bloc du port 80 (qui ne fait que rediriger vers HTTPS).

4. Tester puis recharger (si le test affiche une erreur, ne pas recharger : corriger ou annuler) :

```
sudo nginx -t && sudo systemctl reload nginx
```

## Vérifier que cela marche

Cache : la deuxième réponse doit afficher `HIT` (la première affiche `MISS`).

```
curl -sI https://VOTRE-DOMAINE/js/score-sender.js | grep -i x-cache-status
curl -sI https://VOTRE-DOMAINE/js/score-sender.js | grep -i x-cache-status
```

Compression : la réponse doit contenir `content-encoding: gzip`.

```
curl -sI -H 'Accept-Encoding: gzip' https://VOTRE-DOMAINE/ | grep -i content-encoding
```

Le site doit toujours fonctionner normalement : connexion, quiz, audio.

## Après un déploiement

Les scripts et styles sont gardés au plus 10 minutes. Pour qu'une nouvelle version soit visible tout de suite, vider le cache :

```
sudo rm -rf /var/cache/nginx/french/*
```

Même chose si une image ou un audio est remplacé par un fichier du même nom (sinon, au plus 1 jour d'attente).

## Annuler

Retirer la ligne `include ...french-cache-locations.conf;` du fichier du site, puis :

```
sudo nginx -t && sudo systemctl reload nginx
```
