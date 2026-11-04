# Guide de déploiement - French For Beginners

## 1. Architecture de production

Application déployée sur une instance Oracle Cloud :

```
Utilisateur
    |
    | HTTPS
    |
frenchforbeginners.duckdns.org
    |
    | Port 443
    |
Nginx (Reverse Proxy + SSL)
    |
    | localhost:8080
    |
Docker Container
    |
Spring Boot Application
    |
Docker Network
    |
MySQL Container
```

---

# 2. Serveur Oracle Cloud

## Configuration

* Cloud provider : Oracle Cloud
* OS : Oracle Linux 9 (aarch64)
* Région : eu-paris-1
* Instance : VM.Standard.A1.Flex (ARM Ampere, 1 OCPU, 6 Go de mémoire, disque de 50 Go)
* Domaine :
  https://frenchforbeginners.duckdns.org
* IP publique :

```
Adresse publique :
Voir la console Oracle Cloud
```

```
opc
```

---

# 3. Préparation du serveur

## Mise à jour des dépôts

```bash
sudo dnf update -y
```

Note :
Oracle Linux peut parfois rencontrer des problèmes de synchronisation de packages. Ne pas forcer une mise à jour complète si le serveur fonctionne.

---

# 4. Installation Docker

Sur un serveur neuf (Oracle Linux 9) :

```bash
sudo dnf install -y dnf-plugins-core git nginx
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable --now docker nginx
sudo usermod -aG docker opc
sudo setsebool -P httpd_can_network_connect 1
```

Si `dnf` signale des conflits, ajouter `--allowerasing` à la commande qui échoue.

Vérifier Docker :

```bash
docker --version
```

Vérifier Docker Compose :

```bash
docker compose version
```

Ajouter l'utilisateur au groupe Docker :

```bash
sudo usermod -aG docker opc
```

Reconnecter la session SSH après cette commande.

---

# 5. Installation de Git

Vérifier :

```bash
git --version
```

Cloner le projet :

```bash
git clone https://github.com/Rmerhej/french-for-beginners.git
```

Entrer dans le dossier :

```bash
cd french-for-beginners
```

---

# 6. Configuration environnement

Créer le fichier `.env` :

```bash
cp .env.exemple .env
```

Modifier :

```bash
nano .env
```

Exemple :

```
MYSQL_ROOT_PASSWORD=******
MYSQL_DATABASE=frenchdb
MYSQL_USER=frenchuser
MYSQL_PASSWORD=******
```
REMEMBER_ME_KEY=****** (32 caractères minimum, ex. résultat de `openssl rand -hex 32`)

Variables facultatives du `.env` (voir `.env.exemple`) :

```
APP_TAG=v1.2.3                 # version de l'application (écrite par scripts/deploy.sh)
JAVA_OPTS=-Xms256m -Xmx1024m   # mémoire de Java : prudente par défaut (1 Go), à augmenter sur 6 Go
MYSQL_BUFFER_POOL=512M         # mémoire de MySQL : 128M par défaut, 512M sur 6 Go
```

Sauvegarder nano :

```
CTRL + O
ENTER
CTRL + X
```

---

# 7. Déploiement Docker

Les mises à jour courantes se font par le déploiement automatique : voir [CD.md](CD.md).
Les commandes ci-dessous servent à la première installation.

Sur un serveur ARM (Oracle A1), l'image publiée contient une version ARM : le serveur prend la bonne tout seul.
Vérification : `docker exec french-app uname -m` doit afficher `aarch64`.

Démarrer les containers :

```bash
docker compose up -d
```

Vérifier :

```bash
docker ps
```

Exemple :

```
french-app
french-db
```

Logs application :

```bash
docker logs french-app
```

Arrêter :

```bash
docker compose down
```

Redémarrer :

```bash
docker compose up -d
```

---

# 8. Vérification Spring Boot

Tester depuis le serveur :

```bash
curl http://localhost:8080
```

Une réponse HTTP confirme que Spring Boot fonctionne.

---

# 9. Configuration réseau Oracle Cloud

Dans :

```
Networking
→ Virtual Cloud Network
→ Security List
→ Ingress Rules
```

Ports ouverts :

| Port | Usage |
| ---- | ----- |
| 22   | SSH   |
| 80   | HTTP  |
| 443  | HTTPS |

Le port 8080 peut être fermé après configuration Nginx.

---

# 10. Firewall Linux

Vérifier :

```bash
sudo firewall-cmd --state
```

Ouvrir HTTP :

```bash
sudo firewall-cmd --permanent --add-service=http
```

Ouvrir HTTPS :

```bash
sudo firewall-cmd --permanent --add-service=https
```

Recharger :

```bash
sudo firewall-cmd --reload
```

Vérifier :

```bash
sudo firewall-cmd --list-all
```

---

# 11. Installation Nginx

Installer :

```bash
sudo dnf install nginx -y
```

Démarrer :

```bash
sudo systemctl enable nginx
sudo systemctl start nginx
```

Vérifier :

```bash
sudo systemctl status nginx
```

---

# 12. Configuration Reverse Proxy

Créer :

```bash
sudo nano /etc/nginx/conf.d/french-app.conf
```

Contenu :

```nginx
server {

    listen 80;
    server_name frenchforbeginners.duckdns.org;

    location / {

        proxy_pass http://127.0.0.1:8080;

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

    }
}
```

Tester :

```bash
sudo nginx -t
```

Redémarrer :

```bash
sudo systemctl restart nginx
```

---

# 13. SELinux

Oracle Linux utilise SELinux.

Vérifier :

```bash
getenforce
```

Si :

```
Enforcing
```

Autoriser Nginx à communiquer :

```bash
sudo setsebool -P httpd_can_network_connect 1
```

---

# 14. DNS DuckDNS

Créer un sous-domaine :

```
frenchforbeginners.duckdns.org
```

Pointer vers :

```
Public IP
```

Vérifier :

```bash
nslookup frenchforbeginners.duckdns.org
```

---

# 15. HTTPS Let's Encrypt

Activer EPEL :

```bash
sudo dnf config-manager --enable ol9_developer_EPEL
```

Installer Certbot :

```bash
sudo dnf install certbot python3-certbot-nginx -y
```

Créer le certificat :

```bash
sudo certbot --nginx
```

Choisir :

```
Redirect HTTP to HTTPS
```

Tester :

```bash
https://frenchforbeginners.duckdns.org
```

---

# 16. Renouvellement certificat

Tester :

```bash
sudo certbot renew --dry-run
```

Les certificats Let's Encrypt sont valides 90 jours et renouvelés automatiquement.
Sur un serveur neuf, vérifier que la tâche de renouvellement est bien active :

```bash
sudo systemctl enable --now certbot-renew.timer
systemctl list-timers | grep -i certbot
```

Si la deuxième commande n'affiche rien, le certificat ne sera pas renouvelé.

---

# 17. Commandes utiles

Voir les containers :

```bash
docker ps
```

Logs Spring Boot :

```bash
docker logs -f french-app
```

Redémarrer :

```bash
docker compose restart
```

Voir ports ouverts :

```bash
sudo ss -tlnp
```

Voir Nginx :

```bash
sudo systemctl status nginx
```

---

# 18. Maintenance

En place :

* Sauvegarde automatique de MySQL et du dossier uploads (`scripts/backup.sh`, tâche `crontab` chaque nuit) : voir [scripts/README.md](scripts/README.md)
* Tests automatiques (CI) et déploiement automatique (CD) : voir [CD.md](CD.md)
* Alerte avant l'expiration du certificat (GitHub Actions)

À faire régulièrement :

* Copier une sauvegarde hors du serveur (voir [scripts/README.md](scripts/README.md))
* Surveiller la mémoire et le disque : `free -h`, `docker stats --no-stream`, `df -h`
* Appliquer les mises à jour de sécurité proposées par Dependabot (voir [OPERATIONS.md](OPERATIONS.md))

---

# 19. Changer de serveur

Voir [DEMENAGEMENT.md](DEMENAGEMENT.md) (y compris vers un serveur ARM).

---

# Résultat final

Application accessible :

```
https://frenchforbeginners.duckdns.org
```

Sécurité :

* HTTPS actif
* Certificat automatique
* Nginx reverse proxy
* Docker isolé
* MySQL non exposé publiquement

---

## Fin du guide



