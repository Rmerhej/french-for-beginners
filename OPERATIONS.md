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
ssh -i votre-cle.pem opc@141.145.219.35
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

## Récupérer la dernière version Git

```bash
git pull
```

---

## Reconstruire l'application

```bash
docker compose up -d --build
```

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

# Fin du document
