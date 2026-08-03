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
* OS : Oracle Linux 9
* Région : eu-paris-1
* Instance : VM.Standard.E2.1.Micro
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
cp .env.example .env
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

Sauvegarder nano :

```
CTRL + O
ENTER
CTRL + X
```

---

# 7. Déploiement Docker

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

# 18. Maintenance recommandée

À prévoir :

* Sauvegarde MySQL automatique
* Sauvegarde du dossier uploads
* Monitoring espace disque
* Mise à jour Docker image
* CI/CD GitHub Actions
* Fermeture du port 8080 public

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



