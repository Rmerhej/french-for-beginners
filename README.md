# 🇫🇷 French For Beginners

**Application web éducative pour apprendre le français depuis le niveau débutant absolu (A1).**

Une plateforme interactive pour maîtriser le vocabulaire, la grammaire, la prononciation et les exercices pratiques.

![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.3.5-brightgreen)
![Java](https://img.shields.io/badge/Java-17-orange)
![MySQL](https://img.shields.io/badge/MySQL-8-blue)
![Docker](https://img.shields.io/badge/Docker-ready-blue)

---

## ✨ Fonctionnalités

- **Leçons interactives** structurées par niveau (A1)
- **Vocabulaire** illustré avec images et exemples audio
- **Exercices et quizzes** corrigés automatiquement
- **Système d'authentification** complet (utilisateurs + administrateur)
- **Upload et optimisation d'images** (Thumbnailator)
- **Interface moderne** et responsive avec Bootstrap 5
- Gestion des progrès et scores

---

## 🛠 Technologies

### Backend
- **Spring Boot 3.3.5** + Java 17
- **Spring Security** (authentification & autorisation)
- **Spring Data JPA** + Hibernate
- **MySQL 8**
- **Lombok**

### Frontend
- **Thymeleaf**
- **Bootstrap 5** + Bootstrap Icons
- **HTML5 / CSS3 / JavaScript**

### DevOps
- **Maven**
- **Docker** + Docker Compose
- Multi-stage Dockerfile

---

## 🚀 Installation Locale

### Prérequis
- Java 17+
- Maven 3.8+
- MySQL 8
- Docker

### Avec Docker

# French for Beginners

Application Spring Boot + MySQL exécutée avec Docker Compose.

## Prérequis

- Docker Desktop (Windows/Mac) ou Docker Engine + Docker Compose (Linux)
- Git

Vérifiez les installations :

```bash
docker --version
docker compose version
git --version
```

---

## Installation

### 1. Cloner le projet
Choisissez le dossier dans lequel vous souhaitez installer l'application, puis exécutez :
```bash
git clone https://github.com/Rmerhej/french-for-beginners.git
cd french-for-beginners
```

### 2. Créer le fichier d'environnement

Copiez le fichier d'exemple :

```bash
cp .env.exemple .env
```

Sous Windows PowerShell :

```powershell
Copy-Item .env.exemple .env
```

### 3. Modifier le fichier `.env`

Avant de lancer l'application, remplacez les mots de passe d'exemple par vos propres valeurs.

Par exemple :

```env
MYSQL_ROOT_PASSWORD=StrongRootPassword123!
MYSQL_DATABASE=frenchdb
MYSQL_USER=frenchuser
MYSQL_PASSWORD=StrongDatabasePassword123!

ADMIN_USERNAME=admin
ADMIN_PASSWORD=StrongAdminPassword123!
```

---

### 4. Construire et lancer l'application

```bash
docker compose up --build
```

Ou en arrière-plan :

```bash
docker compose up --build -d
```

---

## Accès

Application :

```
http://localhost:8080
```

---

## Arrêter l'application

```bash
docker compose down
```

---

## Supprimer également les données MySQL

⚠️ Cette commande supprime également la base de données.

```bash
docker compose down -v
```

---

## Première utilisation

L'utilisateur administrateur est créé avec les informations définies dans le fichier `.env` :

```
ADMIN_USERNAME
ADMIN_PASSWORD
```

---

## Dépannage

### Vérifier les logs

```bash
docker compose logs
```

ou

```bash
docker compose logs app
docker compose logs db
```

### Reconstruire complètement

```bash
docker compose down
docker compose build --no-cache
docker compose up
```

> **Important**
>
> Le fichier `.env` contient des informations sensibles (mots de passe).
> Il ne doit jamais être versionné sur GitHub.
> Seul le fichier `.env.example` est inclus dans le dépôt.


## Ports utilisés

| Service | Port |
|----------|------|
| Spring Boot | 8080 |
| MySQL (interne uniquement) | 3306 |



 ###Routes Principales
 Route                  Accès                 Description
 
/                       Public                Page d'accueil
/register               Public                Inscription
/login                  Public                Connexion
/lessons/**             Authentifié           Liste des leçons
/quizzes/**             Authentifié           Exercices et quizzes
/admin/**               Admin                 Panel administrateur



### Structure du Projet

src/main/java/com/apprendrefr/
├── config/              → Configuration Spring (Security, Web)
├── controller/          → Contrôleurs MVC
├── entity/              → Entités JPA
├── repository/          → Repositories Spring Data
├── service/             → Logique métier
├── security/            → Configuration de sécurité
├── DataInitializer.java → Création du compte admin
└── FrenchForBeginnersApplication.java


### Sécurité
-Authentification basée sur Spring Security
-Mots de passe hashés avec BCrypt
-Protection CSRF
-Gestion des rôles (ROLE_USER et ROLE_ADMIN)


### Auteur
-Merhej Roland

Merci d’utiliser French For Beginners !
N’hésite pas à contribuer ou à signaler des bugs.





