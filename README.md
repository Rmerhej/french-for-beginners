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

```bash
git clone https://github.com/Rmerhej/french-for-beginners.git
cd french-for-beginners

# Copier le fichier d'environnement
cp .env.example .env

# Lancer l'application
docker compose up --build
L’application sera disponible sur : http://localhost:8080

Important : Modifiez le fichier .env avec vos propres mots de passe avant de lancer docker compose up.


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





