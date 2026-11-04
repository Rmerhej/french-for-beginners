# Changer de serveur - French For Beginners

Guide pour déplacer le site vers une autre machine (exemple : de la petite instance x86 vers une instance ARM Oracle A1 de 6 Go).
Le site garde son adresse ; la coupure dure une dizaine de minutes ; l'ancienne machine reste intacte jusqu'à la fin des vérifications.

Dans les commandes : `<ANCIENNE_IP>`, `<NOUVELLE_IP>` et `<cle>` (le fichier de votre clé SSH) sont à remplacer par vos valeurs. Les copies passent par votre PC.

## Avant de commencer

* Une application ne tourne que sur le type de processeur pour lequel son image est construite. Le `Dockerfile` et le déploiement automatique produisent une image **amd64 et arm64** : vérifier avec `docker manifest inspect rolandmerhej1/french-app:<version> | grep architecture` (doit afficher `amd64` et `arm64`).
* Garder la même famille de système (Oracle Linux 9) pour réutiliser [DEPLOYMENT.md](DEPLOYMENT.md).
* Ne publier **aucune** étiquette de version pendant le déménagement (le déploiement automatique vise encore l'ancien serveur).

## 1. Créer la nouvelle instance (console Oracle)

1. *Compute* → *Instances* → *Create instance*.
2. Choisir d'abord le **shape** : *Ampere* → `VM.Standard.A1.Flex` (1 OCPU, 6 Go). Puis l'image : Oracle Linux 9. La console ne propose la version ARM qu'après le choix du shape.
3. Même réseau et même sous-réseau public que l'ancienne instance ; adresse IPv4 publique.
4. Clé SSH : coller la clé **publique** (`ssh-keygen -y -f ~/.ssh/<cle>` l'affiche sur une seule ligne). Volume de démarrage : 50 Go.
5. « Out of capacity » : réessayer plus tard.
6. Test : `ssh -i ~/.ssh/<cle> opc@<NOUVELLE_IP>`, puis `uname -m` (doit afficher `aarch64`).

## 2. Ouvrir les ports

* Chez Oracle : la *Security List* du sous-réseau doit autoriser les ports 22, 80 et 443 (déjà le cas si le sous-réseau est partagé).
* Sur la machine : `sudo firewall-cmd --permanent --add-service=http --add-service=https && sudo firewall-cmd --reload`.

## 3. Installer le nécessaire

Voir [DEPLOYMENT.md](DEPLOYMENT.md), sections 4 (Docker, Git, Nginx) et 16 (Certbot et `certbot-renew.timer`). Se déconnecter et se reconnecter après `usermod -aG docker`.

## 4. Copier le projet, le `.env` et Nginx

```bash
# sur la nouvelle machine
git clone https://github.com/Rmerhej/French-for-beginners.git french-for-beginners
```

Depuis votre PC (le `.env` contient des mots de passe : le supprimer du PC après) :

```bash
scp -i ~/.ssh/<cle> opc@<ANCIENNE_IP>:french-for-beginners/.env .env-ancien
scp -i ~/.ssh/<cle> .env-ancien opc@<NOUVELLE_IP>:french-for-beginners/.env
```

Garder les mêmes mots de passe MySQL et la même `REMEMBER_ME_KEY` (les cookies « se souvenir de moi » restent valables). Sur un serveur de 6 Go, ajouter `JAVA_OPTS=-Xms256m -Xmx1024m` et `MYSQL_BUFFER_POOL=512M`.

Nginx et certificat (le certificat est copié, car Let's Encrypt ne peut pas en créer un tant que le domaine pointe vers l'ancien serveur). Sur l'ancienne machine :

```bash
sudo grep -rn limit_req /etc/nginx      # si une ligne vient de nginx.conf, la recopier à la main
sudo tar czf /tmp/nginx-ancien.tgz -C /etc nginx/conf.d nginx/snippets letsencrypt
sudo chown opc /tmp/nginx-ancien.tgz
```

Copier l'archive comme le `.env`, puis sur la nouvelle machine :

```bash
sudo tar xzf /tmp/nginx-ancien.tgz -C /etc
sudo mkdir -p /var/cache/nginx/french && sudo chown nginx:nginx /var/cache/nginx/french
sudo restorecon -R /var/cache/nginx /etc/nginx /etc/letsencrypt
sudo nginx -t && sudo systemctl restart nginx
```

L'archive contient la **clé privée** du certificat : la supprimer partout à la fin.

## 5. Lancer l'application

```bash
cd ~/french-for-beginners
docker compose pull && docker compose up -d
docker exec french-app uname -m        # aarch64 sur ARM
```

Dans le `.env`, `APP_TAG` doit être une version publiée avec l'image multi-architecture.
Secours : `docker build -t rolandmerhej1/french-app:<version> .` sur la machine elle-même.

## 6. Répétition avec les vraies données (sans toucher au site)

Sur l'ancienne machine : `bash scripts/backup.sh`, puis `cp "$(ls -t backups/uploads-*.tar.gz | head -1)" backups/derniers-uploads.tar.gz`.
Copier `backups/derniere-base.sql.gz` et `backups/derniers-uploads.tar.gz` vers le dossier du projet de la nouvelle machine (via le PC), puis sur celle-ci :

```bash
bash scripts/restore.sh derniere-base.sql.gz     # taper OUI
tar xzf derniers-uploads.tar.gz
sudo chown -R 1000:1000 uploads
docker compose restart app
```

Pour tester avec le vrai nom et le vrai certificat, ajouter dans `C:\Windows\System32\drivers\etc\hosts` (Bloc-notes en administrateur, filtre « Tous les fichiers ») la ligne `<NOUVELLE_IP> frenchforbeginners.duckdns.org`.
Vérifier : accueil, leçon avec images, connexion d'un compte existant, tableau de bord admin, quiz avec audio. **Retirer la ligne du fichier `hosts` ensuite.**

## 7. Le jour de la bascule

1. Ancienne machine : `docker compose stop app`, puis refaire la sauvegarde du point 6.
2. Copier et restaurer sur la nouvelle machine (point 6).
3. Changer l'adresse IP du domaine sur duckdns.org (*update ip*).
4. Vérifier : `nslookup frenchforbeginners.duckdns.org` affiche la nouvelle IP. Si le navigateur affiche une erreur 502, c'est son cache : `Ctrl+Maj+R`.
5. Sur la nouvelle machine : `sudo certbot renew --dry-run` (ne peut réussir qu'après la bascule) et `curl -sI https://frenchforbeginners.duckdns.org/js/score-sender.js | grep -i x-cache-status` (`MISS` puis `HIT`).
6. **Ne pas redémarrer l'application de l'ancienne machine.**

## 8. Après la bascule

* `crontab -e` : `0 3 * * * cd /home/opc/french-for-beginners && bash scripts/backup.sh >> backups/backup.log 2>&1`.
* Secrets GitHub : `SSH_HOST`, `SSH_USER`, `SSH_KNOWN_HOSTS` (`ssh-keyscan -t ed25519 <NOUVELLE_IP>`), et la clé publique de déploiement dans `~/.ssh/authorized_keys` de la nouvelle machine. Test : *Actions* → *CD* → *Run workflow*.
* **Attention à `authorized_keys`** : après toute modification, tester une deuxième connexion avant de fermer la première (voir l'incident du 4 novembre dans [OPERATIONS.md](OPERATIONS.md)).
* Supprimer les fichiers sensibles : `nginx-ancien.tgz`, `.env-ancien`, les sauvegardes copiées sur le PC.
* Surveiller 2 à 3 jours (`free -h`, `docker stats --no-stream`, `df -h`, `systemctl list-timers | grep -i certbot`).
* Au bout d'une semaine : dernière sauvegarde de l'ancienne machine gardée hors serveur, puis *Terminate* de l'instance (cocher la suppression du volume de démarrage).

## Retour arrière

* Avant le changement d'adresse : sur l'ancienne machine, `docker compose start app`.
* Après : remettre l'ancienne IP chez DuckDNS et `docker compose start app`. Ce qui a été enregistré sur la nouvelle machine entre-temps est à sauvegarder et restaurer sur l'ancienne avant de relancer.

## Pièges rencontrés

| Symptôme | Cause | Solution |
| --- | --- | --- |
| `exec format error` | Image sans version ARM | Vérifier `APP_TAG` et la commande `docker manifest inspect` |
| La console n'affiche pas la version ARM | Shape pas encore choisi | Choisir `VM.Standard.A1.Flex` avant l'image |
| 502 dans le navigateur après la bascule | Cache du navigateur | `Ctrl+Maj+R`, ou navigation privée |
| Dossier `etc` vide dans le Bloc-notes | Filtre « Documents texte » | Choisir « Tous les fichiers » ou taper `hosts` |
| `Permission denied (publickey)` | `authorized_keys` modifié | Voir OPERATIONS.md, incident du 4 novembre |
| Images ou envois de fichiers en erreur | Droits de `uploads` | `sudo chown -R 1000:1000 uploads` |
