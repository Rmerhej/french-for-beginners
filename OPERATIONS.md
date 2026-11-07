# OPERATIONS.md

# Guide d'exploitation - French For Beginners

## 1. Architecture rapide

Serveur de production :

```
Internet
   |
   | HTTPS :443
   |
Nginx
   |
   | localhost:8080
   |
Docker Container
   |
Spring Boot Application
   |
MySQL Container
```

Domaine :

```
https://frenchforbeginners.duckdns.org
```

---

# 2. Connexion au serveur

Connexion SSH :

```bash
ssh -i votre-cle.pem opc@<IP_SERVEUR>
```

Utilisateur :

```
opc
```

---

# 3. Vérifier que le serveur fonctionne

## Vérifier Docker

```bash
docker ps
```

Résultat attendu :

```
french-app
french-db
```

---

## Vérifier Nginx

```bash
sudo systemctl status nginx
```

Redémarrer Nginx :

```bash
sudo systemctl restart nginx
```

---

## Vérifier les ports ouverts

```bash
sudo ss -tlnp
```

Ports importants :

```
80   Nginx HTTP
443  Nginx HTTPS
8080 Spring Boot interne
3306 MySQL interne
```

---

# 4. Gestion de l'application

Aller dans le projet :

```bash
cd french-for-beginners
```

---

## Démarrer l'application

```bash
docker compose up -d
```

---

## Arrêter l'application

```bash
docker compose down
```

---

## Redémarrer l'application

```bash
docker compose restart
```

---

## Voir l'état des containers

```bash
docker ps
```

Exemple :

```
french-app   Up
french-db    Up (healthy)
```

---

# 5. Consulter les logs

## Logs Spring Boot

Dernières lignes :

```bash
docker logs french-app --tail 100
```

Suivre en temps réel :

```bash
docker logs -f french-app
```

Quitter :

```
CTRL + C
```

---

## Logs MySQL

```bash
docker logs french-db --tail 100
```

---

## Logs Nginx

Erreurs :

```bash
sudo tail -50 /var/log/nginx/error.log
```

Accès :

```bash
sudo tail -50 /var/log/nginx/access.log
```

---

# 6. Mise à jour de l'application

## Méthode normale : le déploiement automatique

Depuis votre PC, après fusion dans `main` et un CI vert :

```bash
git tag v1.2.3
git push origin v1.2.3
```

GitHub teste, construit l'image, puis met le serveur à jour (sauvegarde avant, retour arrière automatique si le site ne répond pas). Voir [CD.md](CD.md).

## À la main, sur le serveur

Pour (re)mettre une version précise, depuis le dossier du projet :

```bash
bash scripts/deploy.sh v1.2.3
```

Le script fait la sauvegarde, installe la version, contrôle le site et revient à la précédente en cas d'échec.
Une version modifiant la base de données demande d'abord de passer le SQL (voir [CD.md](CD.md), section « À savoir »).

---

## Vérifier après mise à jour

```bash
docker ps
```

Puis :

```bash
docker logs french-app --tail 50
```

---

# 7. Redémarrage complet du serveur

Après un reboot Oracle :

Connexion SSH puis :

Vérifier Docker :

```bash
docker ps
```

Si nécessaire :

```bash
cd french-for-beginners
docker compose up -d
```

Vérifier Nginx :

```bash
sudo systemctl status nginx
```

---

# 8. Sauvegarde MySQL

> **Méthode recommandée : les scripts du dossier `scripts/`** (`./scripts/backup.sh`, `./scripts/restore.sh`).
> Ils vérifient la sauvegarde, gardent les 14 dernières et n'écrivent aucun mot de passe.
> Voir [scripts/README.md](scripts/README.md). Les commandes manuelles ci-dessous restent valables.

## Export manuel de la base

Créer un backup :

```bash
docker exec french-db mysqldump \
-u frenchuser \
-p frenchdb > backup.sql
```

---

Restaurer :

```bash
docker exec -i french-db mysql \
-u frenchuser \
-p frenchdb < backup.sql
```

---

# 9. Sauvegarde des fichiers utilisateurs

Les fichiers importants :

```
uploads/
    images/
    audio/
```

Créer une archive :

```bash
tar -czf uploads-backup.tar.gz uploads/
```

---

# 10. Vérifier l'espace disque

Important sur une petite VM :

```bash
df -h
```

Voir la taille Docker :

```bash
docker system df
```

Nettoyage Docker (avec prudence) :

```bash
docker system prune
```

---

# 11. HTTPS / Certificat

Voir les certificats :

```bash
sudo certbot certificates
```

Tester le renouvellement :

```bash
sudo certbot renew --dry-run
```

Le renouvellement automatique est assuré par une tâche systemd (`certbot-renew.timer`, deux passages par jour). Vérifier qu'elle est bien planifiée :

```bash
systemctl list-timers | grep -i certbot
```

Si la liste est vide, le certificat n'est plus renouvelé et expirera au bout de 90 jours (cela est arrivé le 27 octobre 2026) : recréer la tâche, puis lancer `sudo certbot renew`.

---

# 12. Problèmes fréquents

## Le site ne répond plus

Vérifier dans l'ordre :

### 1 - Nginx

```bash
sudo systemctl status nginx
```

### 2 - Docker

```bash
docker ps
```

### 3 - Application

```bash
docker logs french-app --tail 100
```

### 4 - Port interne

```bash
curl http://localhost:8080
```

---

## Erreur 502 Bad Gateway

Signification :

Nginx fonctionne mais Spring Boot ne répond pas.

Vérifier :

```bash
docker ps
```

puis :

```bash
docker logs french-app
```

---

## Erreur connexion MySQL

Vérifier :

```bash
docker ps
```

Le container doit être :

```
french-db   healthy
```

---

# 13. Sécurité

Ports publics nécessaires :

```
22   SSH
80   HTTP → redirection HTTPS
443  HTTPS
```

Le port :

```
8080
```

doit rester interne après validation.

---

# 13 bis. Politique de sécurité du contenu (CSP)

La CSP dit au navigateur d'où le site a le droit de charger ses scripts, styles, images, polices et sons. Avec la politique stricte, tout ce qui ne vient pas du site lui-même est refusé (un script injecté depuis un autre site, par exemple, ne s'exécute pas). Les scripts écrits directement dans les pages sont encore permis par la politique imposée ; une politique encore plus stricte, sans eux, est en cours de vérification (voir plus bas).

Deux modes, choisis par `APP_CSP_ENFORCE` dans le `.env` du serveur :
- **absent ou `false`** (par défaut) : mode « rapport ». Rien n'est bloqué (seules les règles de base le sont). Le navigateur écrit dans sa console (F12, onglet Console) ce qu'il aurait bloqué, en commençant par `[Report Only]`.
- **`true`** : mode strict. Ce qui n'est pas autorisé est bloqué.

Passer en mode strict :
1. Dans un navigateur (F12, onglet Console ouvert), parcourir les pages importantes (accueil, une leçon, un quiz, un QCM, le test de positionnement, la connexion, l'inscription, l'espace admin) et noter toute ligne `[Report Only] Refused to …`. Il ne doit y en avoir aucune.
2. Faire une sauvegarde : `bash scripts/backup.sh`.
3. Ajouter la ligne dans le `.env` du serveur : `echo 'APP_CSP_ENFORCE=true' >> .env`, puis `docker compose up -d` (le conteneur de l'application est recréé).
4. Refaire le parcours des pages. Si une page est cassée : retirer la ligne (`sed -i '/^APP_CSP_ENFORCE=/d' .env`) et relancer `docker compose up -d` : le site revient au mode rapport.

**Étape suivante : retirer les scripts en ligne.** Les pages ne contiennent plus de `<script>` ni de `onclick` écrits dedans (tout est dans `static/js`). Quel que soit le mode, le serveur envoie donc aussi un en-tête `Content-Security-Policy-Report-Only` avec `script-src 'self'` (sans `'unsafe-inline'`). Il ne bloque rien. Pour vérifier : parcourir les pages avec la console ouverte ; aucune ligne `[Report Only] Refused to execute inline script` ne doit apparaître. Quand c'est le cas sur toutes les pages, une version suivante retirera `'unsafe-inline'` de `script-src` dans la politique imposée (`SecurityConfig.CSP_STRICT`). Les `style="..."` restent permis.

Vérifier le mode actif : `curl -sI https://frenchforbeginners.duckdns.org/login | grep -i content-security`. En mode rapport, on voit `Content-Security-Policy-Report-Only` ; en mode strict, `Content-Security-Policy` avec `default-src 'self'`.

---

# 13 ter. Flyway : modifier la base de données

Flyway applique automatiquement, au démarrage de l'application, les modifications de la base écrites dans `src/main/resources/db/migration`. Plus besoin de lancer les scripts SQL à la main avec `docker exec` : un script déposé là part avec le déploiement.

**Règles**
- Un fichier = une modification, nommé `V<numéro>__<description_en_minuscules>.sql` (deux tirets bas). Le premier numéro libre est `V2` (la base existante est la « version 1 »).
- Un fichier déjà déployé ne se modifie **jamais** : Flyway refuserait de démarrer. Pour corriger, on ajoute le numéro suivant.
- Préférer les ajouts (`INSERT`, nouvelle table, nouvelle colonne) aux suppressions.
- Le dossier `init-db/` ne sert plus qu'à créer une base neuve : n'y rien ajouter.
- Faire une sauvegarde juste avant de déployer une migration : `bash scripts/backup.sh`. Le retour automatique de `deploy.sh` remet l'ancienne image, mais ne défait pas une modification déjà faite dans la base.

**Mise en service (une seule fois)**
L'ancien essai de Flyway a laissé dans la base une table `flyway_schema_history` avec une migration « en échec » : elle empêcherait le démarrage. Il faut la supprimer **avant** de déployer la version qui active Flyway :
1. `cd ~/french-for-beginners`
2. `bash scripts/backup.sh`
3. `docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE" -e "DROP TABLE IF EXISTS flyway_schema_history;"'`
4. Déployer la version (tag), puis vérifier :
   - `docker logs french-app 2>&1 | grep -i flyway` doit contenir « Successfully baselined schema with version: 1 » et « No migration necessary » ;
   - `docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE" -e "SELECT installed_rank, version, description, type, success FROM flyway_schema_history;"'` doit montrer une ligne : version 1, type BASELINE, success 1.

Si on a oublié l'étape 3, l'application ne démarre pas, `deploy.sh` revient à la version précédente et le site reste en ligne. Faire alors l'étape 3 et redéployer.

**Si une migration échoue plus tard**
L'application ne démarre pas et `deploy.sh` revient en arrière. Lire `docker logs french-app 2>&1 | grep -i -B2 -A8 flyway`, corriger le script dans un **nouveau** fichier, puis redéployer. Si la migration a été à moitié appliquée, restaurer la sauvegarde faite juste avant (section « Restaurer une sauvegarde ») avant de redéployer.

---

# 14. Arrêter temporairement le serveur

Pour arrêter uniquement l'application :

```bash
docker compose down
```

Pour arrêter la VM Oracle :

Console Oracle Cloud :

```
Compute
→ Instances
→ Stop
```

La fermeture du terminal SSH ne coupe pas le serveur.

---

# 15. Contacts techniques

Application :

```
French For Beginners
```

Repository :

```
https://github.com/Rmerhej/french-for-beginners
```

Serveur :

```
Oracle Linux 9
```

Domaine :

```
https://frenchforbeginners.duckdns.org
```

## Incident SSH - août 2026

Symptôme:
- SSH bloqué malgré port 22 accessible
- Site temporairement inaccessible

Cause:
- Oracle Linux réservait 448 Mo RAM via crashkernel

Correction:
- Modification crashkernel=128M avec grubby
- RAM disponible passée d'environ 500 MiB à 800 MiB
---

## Incident SSH - 4 novembre 2026

Symptôme :
- `Permission denied (publickey)` sur le nouveau serveur, alors que la même clé fonctionnait sur l'ancien et que la veille la connexion marchait.

Cause probable :
- le fichier `~/.ssh/authorized_keys` avait été modifié à la main pour ajouter la clé de déploiement, et la ligne de la clé personnelle avait disparu. La session ouverte continuait de marcher, donc l'erreur n'a été vue que le lendemain.

Correction :
- connexion avec la clé de déploiement, puis ajout de la clé personnelle : `(echo; ssh-keygen -y -f ~/.ssh/<cle>) | ssh -i <cle-deploiement> opc@<IP> 'cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys && restorecon -R ~/.ssh'`

À retenir :
- après toute modification de `~/.ssh/authorized_keys`, ouvrir une **deuxième** connexion pour la tester avant de fermer la première ;
- contrôle : `ssh-keygen -lf ~/.ssh/authorized_keys` doit lister la clé personnelle **et** la clé de déploiement ;
- ne jamais ranger une clé privée ou une sauvegarde dans le dossier du projet (le `.gitignore` les bloque, mais le mieux est de ne pas les y mettre) ;
- ne pas utiliser `git add .` dans le dossier du projet : ajouter les fichiers un par un.

---

# Fin du document

## Cache et compression Nginx

Voir `deploy/nginx/README.md` : installation en 4 étapes, vérification, vidage du cache après un déploiement et retour en arrière.

## Alerte si la sauvegarde de la nuit ne se fait pas (Healthchecks.io)

La sauvegarde de 03:00 UTC peut échouer sans que personne ne le voie. Healthchecks.io (gratuit) attend un « signal » chaque nuit et vous écrit s'il ne vient pas.

1. Créer un compte sur healthchecks.io, puis **Add Check** : nom « Sauvegarde French For Beginners », période **1 day**, délai de grâce **3 hours**.
2. Copier l'adresse « ping » de la vérification (de la forme `https://hc-ping.com/<identifiant>`).
3. Sur le serveur, l'ajouter à la fin du fichier `.env` (une seule fois) :
   ```bash
   cd ~/french-for-beginners
   echo 'HEALTHCHECK_URL=<adresse ping>' >> .env
   ```
4. Tester : `bash scripts/backup.sh`. À la fin, la vérification passe au vert sur le site. Si la sauvegarde échoue, le script le signale tout de suite (`/fail`) ; si elle ne tourne pas du tout, vous recevez un e-mail après le délai de grâce.

Sans `HEALTHCHECK_URL`, le script fonctionne exactement comme avant.

## Copie des sauvegardes hors du serveur (Oracle Object Storage)

Tant que les sauvegardes restent sur l'A1, elles disparaissent avec lui. Chaque nuit, `backup.sh` peut en envoyer une copie dans un « bucket » Oracle (espace de stockage séparé des serveurs, gratuit jusqu'à 20 Go avec l'offre Always Free ; nos données pèsent environ 150 Mo). Le bucket est privé : les sauvegardes contiennent des adresses e-mail et des mots de passe chiffrés.

Ce qui est copié : les sauvegardes de la base (conservées 60 jours, réglable avec `OFFSITE_KEEP_DAYS=<nombre de jours>` dans `.env`) et le dossier `uploads` (copie qui n'efface jamais rien).

### 1. Créer le bucket (console Oracle)
1. Menu ☰ → **Stockage** → **Buckets** → **Créer un bucket**. Nom : `french-backups`. Garder « Standard » et la visibilité **privée**.
2. Sur la page du bucket, noter **l'espace de noms** (Namespace) et, en haut de la console, **la région** (par exemple `eu-paris-1`).

### 2. Créer une clé d'accès
1. Cliquer sur votre profil (en haut à droite) → votre nom d'utilisateur → **Clés secrètes client** → **Générer une clé secrète**. Nom : `french-backups-a1`.
2. **Copier la clé secrète tout de suite** : elle ne s'affiche qu'une fois. La « clé d'accès » (Access key) apparaît ensuite dans la liste.
3. Ne tapez jamais ces deux valeurs dans une commande (elles resteraient dans l'historique) : on les écrit dans un fichier à l'étape 4.

Si votre compte n'est pas administrateur de la location, une règle (policy) doit l'autoriser à gérer les objets du compartiment ; sinon l'étape 5 répond « AccessDenied ».

### 3. Installer rclone sur l'A1
```bash
sudo dnf install -y unzip
cd /tmp
curl -fsSLO https://downloads.rclone.org/rclone-current-linux-arm64.zip
unzip -q rclone-current-linux-arm64.zip
sudo cp rclone-*-linux-arm64/rclone /usr/local/bin/rclone
rm -rf /tmp/rclone-*
rclone version
```

### 4. Écrire la configuration (les clés restent dans un fichier privé)
```bash
mkdir -p ~/.config/rclone
nano ~/.config/rclone/rclone.conf
```
Y coller ceci, en remplaçant chaque `<...>` (sans garder les chevrons), puis enregistrer (Ctrl+O, Entrée, Ctrl+X) :
```
[oci]
type = s3
provider = Other
env_auth = false
access_key_id = <clé d'accès>
secret_access_key = <clé secrète>
region = <région>
endpoint = https://<espace de noms>.compat.objectstorage.<région>.oraclecloud.com
no_check_bucket = true
```
Puis : `chmod 600 ~/.config/rclone/rclone.conf`

### 5. Tester
```bash
rclone lsd oci:                                   # doit afficher « french-backups »
echo essai > /tmp/essai.txt
rclone copy /tmp/essai.txt oci:french-backups/essai
rclone ls oci:french-backups                      # doit afficher essai.txt
rclone purge oci:french-backups/essai
rm /tmp/essai.txt
```

### 6. Activer et vérifier
```bash
cd ~/french-for-beginners
echo 'OFFSITE_REMOTE=oci:french-backups' >> .env
bash scripts/backup.sh
rclone ls oci:french-backups | head
```
Le script doit afficher « copie hors serveur terminée » ; la première fois, l'envoi des images (environ 114 Mo) prend une minute ou deux. La sauvegarde de 03:00 le fait ensuite toute seule. Si l'envoi échoue, le script le signale (et l'alerte Healthchecks.io, si elle est réglée).

### Restaurer depuis le bucket
```bash
rclone ls oci:french-backups/db                   # liste des bases
rclone copy oci:french-backups/db/<nom du fichier>.sql.gz ~/
rclone copy oci:french-backups/uploads ~/french-for-beginners/uploads
```
Puis restaurer la base avec `scripts/restore.sh` (voir `scripts/README.md`).

### En cas d'erreur
- `SignatureDoesNotMatch` / `InvalidAccessKeyId` : clé d'accès ou clé secrète mal recopiée (en générer une nouvelle).
- `NoSuchBucket` : nom du bucket différent, ou mauvaise région dans `endpoint`.
- `AccessDenied` : le compte n'a pas le droit (règle manquante, voir l'étape 2).

## Mises à jour de sécurité automatiques du serveur (A1)

Les correctifs de sécurité du système (Oracle Linux) sont installés chaque jour par `dnf-automatic`. Les conteneurs, eux, se mettent à jour par une nouvelle version de l'application (voir « Dependabot » ci-dessous).

```bash
sudo dnf install -y dnf-automatic
sudo sed -i 's/^upgrade_type.*/upgrade_type = security/; s/^apply_updates.*/apply_updates = yes/' /etc/dnf/automatic.conf
sudo systemctl enable --now dnf-automatic.timer
systemctl list-timers | grep dnf-automatic
```

La dernière commande doit afficher une ligne `dnf-automatic.timer`. Vérifier aussi :
```bash
grep -E '^(upgrade_type|apply_updates)' /etc/dnf/automatic.conf     # security / yes
docker inspect --format '{{.Name}} {{.HostConfig.RestartPolicy.Name}}' french-app french-db     # always
```
Un nouveau noyau n'est actif qu'après un redémarrage du serveur. De temps en temps (par exemple une fois par mois) : `sudo dnf needs-restarting -r`. S'il répond qu'un redémarrage est nécessaire, faites `sudo reboot` à un moment calme ; les conteneurs repartent seuls (`restart: always`).

## Mises à jour de sécurité (Dependabot)

Dependabot (fichier `.github/dependabot.yml`) propose chaque lundi des « pull requests » pour mettre à jour les dépendances Java, l'image de base du Dockerfile et les actions GitHub. Le CI lance les tests sur chacune.

Quand une pull request arrive :
1. Vérifier que le CI est vert (coche verte sur GitHub), puis la fusionner (« Merge »).
2. Publier une nouvelle version : `git tag vX.Y.Z` puis `git push origin vX.Y.Z`. GitHub reconstruit l'image avec la dernière version de l'image de base Java et déploie (voir [CD.md](CD.md)).

Les alertes de sécurité (onglet « Security » du dépôt GitHub) sont à traiter en priorité. Les versions majeures (Spring Boot 4, par exemple) ne sont pas proposées automatiquement.
