# Cache et compression Nginx

Ce que cela apporte :
- les images, l'audio, les styles et les scripts sont gardés par Nginx : l'application Java n'est plus sollicitée à chaque fichier ;
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

## Sauvegarder et restaurer la configuration Nginx

Le dépôt garde une copie des trois fichiers de configuration :
`french-cache-zone.conf`, `french-cache-locations.conf` et `french-app.conf`.
Le certificat HTTPS n'est **pas** dans le dépôt : il reste dans `/etc/letsencrypt`.

**Attention : ne jamais écrire `rm -rf /etc/nginx/...`.** Le cache à vider est
`/var/cache/nginx/french`, la configuration est dans `/etc/nginx` : ce sont deux dossiers différents.

Vider le cache (commande complète, à recopier telle quelle) :

```
sudo rm -rf /var/cache/nginx/french/*
```

Sauvegarder la configuration actuelle (avant toute modification) :

```
sudo tar czf ~/nginx-config-$(date +%F).tgz -C /etc nginx/conf.d nginx/snippets
```

Restaurer sur un serveur dont `/etc/nginx` a été perdu :

```
sudo dnf reinstall -y nginx-core nginx-filesystem
cd ~/french-for-beginners
sudo mkdir -p /etc/nginx/conf.d /etc/nginx/snippets
sudo cp deploy/nginx/french-cache-zone.conf /etc/nginx/conf.d/french-cache-zone.conf
sudo cp deploy/nginx/french-cache-locations.conf /etc/nginx/snippets/french-cache-locations.conf
sudo cp deploy/nginx/french-app.conf /etc/nginx/conf.d/french-app.conf
sudo mkdir -p /var/cache/nginx/french
sudo chown nginx:nginx /var/cache/nginx/french
sudo restorecon -R /etc/nginx /var/cache/nginx
sudo nginx -t && sudo systemctl restart nginx
```

Le certificat doit exister dans `/etc/letsencrypt/live/frenchforbeginners.duckdns.org/`.
Si ce n'est pas le cas : `sudo certbot --nginx`.

## Limitation du débit (par adresse IP)

Deux zones sont définies dans `french-ratelimit.conf` :
- `french_all` : 100 requêtes par seconde par IP, avec une réserve de 400 (une page charge une trentaine de fichiers) ;
- `french_login` : 1 requête par seconde pour `/login`, avec une réserve de 20.

Au-delà, Nginx répond **429** (trop de requêtes). Les valeurs sont larges pour ne pas bloquer une classe entière derrière la même connexion Wi-Fi.

Installation sur le serveur :

```
cd ~/french-for-beginners
sudo cp deploy/nginx/french-ratelimit.conf /etc/nginx/conf.d/french-ratelimit.conf
sudo cp deploy/nginx/french-app.conf /etc/nginx/conf.d/french-app.conf
sudo nginx -t && sudo systemctl reload nginx
```

Test (PowerShell, sans risque : ce sont de simples visites de la page de connexion). Au bout d'une vingtaine de requêtes rapides, des `429` doivent apparaître :

```
1..60 | ForEach-Object { curl.exe -s -o NUL -w "%{http_code} " https://frenchforbeginners.duckdns.org/login }
```

Annuler : retirer les lignes `limit_req` de `french-app.conf` et supprimer `french-ratelimit.conf`, puis `sudo nginx -t && sudo systemctl reload nginx`.
