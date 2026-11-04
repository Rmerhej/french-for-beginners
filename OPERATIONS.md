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

## Mises à jour de sécurité (Dependabot)

Dependabot (fichier `.github/dependabot.yml`) propose chaque lundi des « pull requests » pour mettre à jour les dépendances Java, l'image de base du Dockerfile et les actions GitHub. Le CI lance les tests sur chacune.

Quand une pull request arrive :
1. Vérifier que le CI est vert (coche verte sur GitHub), puis la fusionner (« Merge »).
2. Publier une nouvelle version : `git tag vX.Y.Z` puis `git push origin vX.Y.Z`. GitHub reconstruit l'image avec la dernière version de l'image de base Java et déploie (voir [CD.md](CD.md)).

Les alertes de sécurité (onglet « Security » du dépôt GitHub) sont à traiter en priorité. Les versions majeures (Spring Boot 4, par exemple) ne sont pas proposées automatiquement.
