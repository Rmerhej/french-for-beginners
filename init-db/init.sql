-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 13 juin 2026 à 06:12
-- Version du serveur : 5.7.36
-- Version de PHP : 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `frenchdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `exercises`
--

DROP TABLE IF EXISTS `exercises`;
CREATE TABLE IF NOT EXISTS `exercises` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `correct_answer` varchar(255) DEFAULT NULL,
  `explanation` varchar(255) DEFAULT NULL,
  `lesson_title` varchar(255) DEFAULT NULL,
  `optiona` varchar(255) DEFAULT NULL,
  `optionb` varchar(255) DEFAULT NULL,
  `optionc` varchar(255) DEFAULT NULL,
  `optiond` varchar(255) DEFAULT NULL,
  `question` text,
  `exercise_type` varchar(255) DEFAULT NULL,
  `lesson_level` varchar(255) DEFAULT NULL,
  `sentences` text,
  `words` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `exercises`
--

INSERT INTO `exercises` (`id`, `correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`, `lesson_level`, `sentences`, `words`) VALUES
(3, 'un livre', '', 'LES OBJETS', 'une lampe', 'une porte', 'un livre', 'une fenêtre', 'quel objet utilise-t-on pour s\'instruire?', 'QCM', NULL, 'je m\'assoie sur une___;j\'ai acheté un___;je me déplace en___;je ferme la porte avec une___;j\'accroche le tableau au___;', 'mur;sac;voiture,clé;chaise;'),
(4, 'LES YEUX', '', 'LES PARTIES DU CORPS', 'LES MAINS', 'LES PIEDS', 'LES OREILLES', 'LES YEUX', 'QUEL ORGANE DU CORPS UTILISE-T-ON POUR REGARDER', NULL, NULL, NULL, NULL),
(5, 'OREILLES', '', 'LES PARTIES DU CORPS', 'OREILLES', 'JAMBES', 'OREILLES', 'BRAS', 'ON ECOUTE AVEC SES :', NULL, NULL, NULL, NULL),
(6, 'MEDECIN', '', 'LES PROFESSIONS', 'ENSEIGNANT', 'AVOCAT', 'MEDECIN', 'CUISINIER', 'QUAND ON EST MALADE ON VA CHEZ UN :', NULL, NULL, NULL, NULL),
(7, 'ARCHITECTE', '', 'LES PROFESSIONS', 'MEDECIN', ' ARCHITECTE', 'VENDEUR', 'CUISINIER', 'POUR CONSTRUIRE UNE MAISON ON FAIT APPEL A UN :', NULL, NULL, NULL, NULL),
(8, 'POLICIER', '', 'LES PROFESSIONS', 'MEDECIN', 'AVOCAT', 'POLICIER', 'INFIRMIER', 'EN CAS DE DANGER ON APPELLE UN :', NULL, NULL, NULL, NULL),
(9, 'VENDEUR', '', 'LES PROFESSIONS', 'MEDECIN', 'AVOCAT', 'INFIRMIER', 'VENDEUR', 'POUR FAIRE UN ACHAT ON FAIT APPEL A UN :', NULL, NULL, NULL, NULL),
(10, 'LA SALLE DE BAIN', '', 'LA MAISON', 'LA CUISINE ', 'LA CHAMBRE', 'LA SALLE DE BAIN', 'LA SALON', 'ON PRED SA DOUCHE DANS :', NULL, NULL, NULL, NULL),
(11, 'CHAMBRE', '', 'LA MAISON', 'LA CUISINE', 'CHAMBRE', 'SALLE DE BAIN', 'SALON', 'ON DORT DANS :', NULL, NULL, NULL, NULL),
(12, 'LA JOIE', '', 'LES EMOTIONS', 'LA TRISTESSE', 'LA COLèRE', 'LA JOIE', 'L\'AMOUR', 'QUAND JE SUIS CONTENT J\'EXPRIME QUEL SENTIMENT ?', NULL, NULL, NULL, NULL),
(13, 'LA CUISINE', '', 'LA MAISON', 'LA SALLE DE BAIN', 'LA CUISINE', 'LE JARDIN', 'LA CHAMBRE', '. Où prépare-t-on les repas ?', NULL, NULL, NULL, NULL),
(14, 'UNE CHAISE', '', 'LA MAISON', 'UN LIT', 'UNE CHAISE', 'UNE FENËTRE', 'UN TAPIS', 'Quel objet utilise-t-on pour s\'asseoir ?', NULL, NULL, NULL, NULL),
(15, 'LA SALLE DE BAIN', '', 'LA MAISON', 'Le salon', 'LA CHAMBRE', 'LA SALLE DE BAIN', 'LE GARAGE', 'Dans quelle pièce prend-on une douche ?', NULL, NULL, NULL, NULL),
(16, 'Un canapé', '', 'LA MAISON', '. Un réfrigérateur', 'Une voiture', 'Un canapé', 'UNE DOUCHE', 'Que trouve-t-on généralement dans le salon ?', NULL, NULL, NULL, NULL),
(17, 'LAPEUR', '', 'LES EMOTIONS', 'LA PEUR', 'LA SURPRISE', 'LA FIERTé', 'LA CONFIANCE', 'Quelle émotion peut-on ressentir devant un danger ?', NULL, NULL, NULL, NULL),
(18, 'TRISTE', '', 'LES EMOTIONS', 'HEUREUSE', 'CALME', 'TRISTE', 'Amusée', 'Comment se sent une personne qui a perdu quelque chose d\'important ?', NULL, NULL, NULL, NULL),
(19, 'LA colère', '', 'LES EMOTIONS', 'LA JOIE', 'LA COLèRE', 'LA curiosité', 'L\'AMOUR', 'Quelle émotion peut-on ressentir lorsqu\'une personne nous ment ?', NULL, NULL, NULL, NULL),
(20, 'LA SURPRISE', '', 'LES EMOTIONS', 'LA surprise', 'LA tristesse', 'LA PEUR', 'L{ENNUI', 'Quelle émotion ressent-on souvent lorsqu\'il se passe quelque chose d\'inattendu ?', NULL, NULL, NULL, NULL),
(21, 'LES OREILLES', '', 'LES PARTIES DU CORPS', 'LES YEUX', 'LES OREILLES', 'LES MAINS', 'LES PIEDS', 'Avec quelle partie du corps écoute-t-on les sons ?', NULL, NULL, NULL, NULL),
(22, 'LES YEUX', '', 'LES PARTIES DU CORPS', 'LES TEUX', 'LE NEZ', 'LES BRAS', 'LES JAMBES', 'Avec quelle partie du corps voit-on ?', NULL, NULL, NULL, NULL),
(23, 'LES PIEDS', '', 'LES PARTIES DU CORPS', 'LES OREILLES', 'LES CHEVEUX', 'LES PIEDS', 'LE COU', 'Quelle partie du corps utilise-t-on pour marcher ?', NULL, NULL, NULL, NULL),
(24, 'LE NEZ', '', 'LES PARTIES DU CORPS', 'LA BOUCHE', 'LE NEZ', 'LES MAINS', 'LES YEUX', 'Avec quelle partie du corps sent-on les odeurs ?', NULL, NULL, NULL, NULL),
(25, 'LE COU', '', 'LES PARTIES DU CORPS', 'LE COU', 'LE DOS', 'LE VENTRE', 'LE BRAS', 'Quelle partie du corps se trouve entre la tête et les épaules ?', NULL, NULL, NULL, NULL),
(26, 'LA BANANE', '', 'LES FRUITS', 'LA BANANE', 'LE CERISE', 'LA PRUNE', 'LE RAISIN', 'Quel fruit est généralement jaune lorsqu\'il est mûr ?', NULL, NULL, NULL, NULL),
(27, 'LA FRAISE', '', 'LES FRUITS', 'LA POIRE', 'LA FRAISE', 'L\'ORANGE', 'LE KIWI', 'Quel fruit est souvent rouge et contient de petites graines à l\'extérieur ?', NULL, NULL, NULL, NULL),
(28, 'LA POMME', '', 'LES FRUITS', 'LA POMME', 'LA BANANE', 'L\'ANANAS', 'LE CITRON', 'Quel fruit est généralement vert ou rouge et pousse dans les pommiers ?', NULL, NULL, NULL, NULL),
(29, 'LE KIWI', '', 'LES FRUITS', 'LA CERISE', 'LE KIWI', 'LE RAISIN', 'L\'ABRICOT', 'Quel fruit a une peau brune et une chair verte ?', NULL, NULL, NULL, NULL),
(30, 'UN STYLO', '', 'LES OBJETS', 'UNE cuillère', 'UN STYLO', 'UNE ASSIETTE', 'UNE CLé', 'Quel objet utilise-t-on pour écrire sur du papier ?', NULL, NULL, NULL, NULL),
(31, 'UNE CLé', '', 'LES OBJETS', 'UNE CLé', 'UN LIVRE', 'UNE GOMME', 'UNE LAMPE', 'Quel objet permet d\'ouvrir une porte verrouillée ?', NULL, NULL, NULL, NULL),
(32, 'UN LIVRE', '', 'LES OBJETS', 'UN CAHIER', 'UNE RèGLE', 'UN LIVRE', 'UN t2LéPHONE', 'Quel objet utilise-t-on pour lire une histoire ?', NULL, NULL, NULL, NULL),
(33, 'UNE LAMPE', '', 'LES OBJETS', 'UNE LAMPE', 'UNE CHAISE', 'UNE BOUTEILLE', 'UN SAC', 'Quel objet éclaire une pièce lorsqu\'il fait sombre ?', NULL, NULL, NULL, NULL),
(34, 'UNE GOMME', '', 'LES OBJETS', 'UNE FOURCHETTE', 'UNE GOMME', 'UNE MONTRE', 'UN VERRE', 'Quel objet utilise-t-on pour effacer ce qui est écrit au crayon ?', NULL, NULL, NULL, NULL),
(35, '24', '', 'LE TEMPS ET L\'HEURE', '12', '18', '24', '30', 'Combien y a-t-il d\'heures dans une journée ?', NULL, NULL, NULL, NULL),
(36, 'TROIS HEURES', '', 'LE TEMPS ET L\'HEURE', 'TROIS HEURES', 'SIX HEURES', 'DOUZE HEURES', 'NEUF HEURES', 'Quelle heure est-il quand la petite aiguille est sur 3 et la grande aiguille sur 12 ?', NULL, NULL, NULL, NULL),
(37, 'LE SOIR', '', 'LE TEMPS ET L\'HEURE', 'LE MATIN', 'LA NUIT', 'LE SOIR', 'MIDI', '. Quel moment de la journée vient après l\'après-midi ?', NULL, NULL, NULL, NULL),
(38, '60', '', 'LE TEMPS ET L\'HEURE', '30', '4', '60', '100', 'Combien y a-t-il de minutes dans une heure?', NULL, NULL, NULL, NULL),
(39, 'MERCREDI', '', 'LE TEMPS ET L\'HEURE', 'LUNDI', 'MERCREDI', 'JEUDI', 'VENDREDI', 'Quel jour vient après mardi ?', NULL, NULL, NULL, NULL),
(40, 'UN CHAPEAU', '', 'LES VËTEMENTS', 'UN CHAPEAU', 'UNE VESTE', 'UNE éCHARPE', 'UB PULL', 'Quel vêtement porte-t-on sur la tête ?', NULL, NULL, NULL, NULL),
(41, 'UN PANTALON', '', 'LES VËTEMENTS', 'UN PANTALON', 'DES GANTS', 'UNE CEINTURE', 'UNE CASQUETTE', '. Quel vêtement porte-t-on sur les jambes ?', NULL, NULL, NULL, NULL),
(42, 'DES GANTS', '', 'LES VËTEMENTS', 'DES CHAUSSETTES', 'DES GANTS', 'UN MANTEAU', 'UNE JUPE', 'Quel vêtement porte-t-on lorsqu\'il fait froid aux mains ?', NULL, NULL, NULL, NULL),
(43, 'UN PULL', '', 'LES VËTEMENTS', 'UN PULL', 'UN SHORT', 'UN MAILLOT DE BAIN', 'DES SANDALES', 'Quel vêtement porte-t-on souvent par-dessus une chemise lorsqu\'il fait froid ?', NULL, NULL, NULL, NULL),
(44, 'JAUNE', '', 'LES COULEURS', 'BLEU', 'JAUNE', 'NOIR', 'VIOLET', 'Quelle est la couleur du soleil dans les dessins d\'enfants ?', NULL, NULL, NULL, NULL),
(45, 'VERTE', '', 'LES COULEURS', 'ROUGE', 'BLANCHE', 'VERTE', 'ORANGE', 'De quelle couleur est souvent l\'herbe ?', NULL, NULL, NULL, NULL),
(46, 'ROUGE', '', 'LES COULEURS', 'ROUGE', 'BLEUE', 'GRISE', 'ROSE', 'Quelle est la couleur d\'une tomate mûre ?', NULL, NULL, NULL, NULL),
(47, 'BLEU', '', 'LES COULEURS', 'NOIR', 'BLEU', 'MARRON', 'VERT', 'De quelle couleur est généralement le ciel par beau temps ?', NULL, NULL, NULL, NULL),
(48, 'Votre grand-père', '', 'LA FAMILLE', 'VOTRE ONCLE', 'VOTRE COUSIN', 'VOTRE GRAND-PèRE', 'VOTRE FRèRE', 'Qui est le père de votre père ?', NULL, NULL, NULL, NULL),
(49, 'VOTRE TANTE', '', 'LA FAMILLE', 'VOTRE TANTE', 'VOTRE COUSINE', 'VOTRE NIèCE', 'VOTRE GRAND-MèRE', 'Comment appelle-t-on la sœur de votre mère ?', NULL, NULL, NULL, NULL),
(50, 'VOTRE COUSIN', '', 'LA FAMILLE', 'VOTRE FRèRE', 'VOTRE COUSIN', 'VOTRE PèRE', 'VOTRE NEVEU', 'Qui est le fils de votre oncle ou de votre tante ?', NULL, NULL, NULL, NULL),
(51, 'VOTRE ONCLE', '', 'LA FAMILLE', 'VOTRE NEVEU', 'VOTRE GRAND-PèRE', 'VOTRE ONCLE', 'VOTRE BEAU-PèRE', 'Comment appelle-t-on le frère de votre père ?', NULL, NULL, NULL, NULL),
(52, 'VOTRE GRAND-MèRE', '', 'LA FAMILLE', 'VOTRE TANTE', 'VOTRE SOEUR', 'VOTRE COUSINE', 'VOTRE GRAND-MèRE', 'Qui est la mère de votre mère ?', NULL, NULL, NULL, NULL),
(53, 'BONJOUR', '', 'FORMULES DE POLITESSE', 'AU REVOIR', 'BONJOUR', 'MERCI', 'BONNE NUIT', 'Que dit-on lorsqu\'on rencontre une personne le matin ?', NULL, NULL, NULL, NULL),
(54, 'MERCI', '', 'FORMULES DE POLITESSE', 'PARDON', 'SALUT', 'MERCI', 'à BIENTÖT', 'Que dit-on lorsqu\'une personne nous aide ?', NULL, NULL, NULL, NULL),
(55, 'S\'il vous plaît', '', 'FORMULES DE POLITESSE', 'Quelle expression utilise-t-on pour demander quelque chose poliment', 'e veux ça', 'S\'il vous plaît', '. Dépêche-toi !', 'Quelle expression utilise-t-on pour demander quelque chose poliment', NULL, NULL, NULL, NULL),
(56, 'AU REVOIR', '', 'FORMULES DE POLITESSE', 'BONJOUR', 'AU REVOIR', 'MERCI', 'EXCUSEZ-MOI', 'Que dit-on lorsqu\'on quitte une personne ?', NULL, NULL, NULL, NULL),
(57, 'Excusez-moi', '', 'FORMULES DE POLITESSE', 'Excusez-moi', 'BONNE NUIT', 'Félicitations', 'BIENVENUE', 'Que dit-on lorsqu\'on a fait une erreur ou qu\'on veut attirer l\'attention de quelqu\'un poliment ?', NULL, NULL, NULL, NULL),
(58, 'LA CAROTTE', '', 'LES LEGUMES', 'LA CAROTTE', 'LE LAITUE', 'LE CONCOMBRE', 'L\'AUBERGINE', '. Quel légume est généralement orange et pousse sous la terre ?', NULL, NULL, NULL, NULL),
(59, 'La laitue', '', 'LES LEGUMES', 'La pomme de terre', 'La laitue', 'L\'OIGNON', 'LE POIREAU', 'Quel légume est souvent utilisé pour faire une salade verte ?', NULL, NULL, NULL, NULL),
(60, 'L\'OIGNON', '', 'LES LEGUMES', 'LE HARICOT', 'LE POIVRON', 'L\'OIGNON', 'LA COURGETTE', 'Quel légume fait souvent pleurer quand on le coupe ?', NULL, NULL, NULL, NULL),
(61, 'LE CHOU-FLEUR', '', 'LES LEGUMES', 'LE BROCOLI', 'LE CHOU-FLEUR', 'L\'éPINARD', 'LE CéLERI', 'Quel légume est connu pour être blanc avec des petites fleurs regroupées ?', NULL, NULL, NULL, NULL),
(62, 'JEUDI', '', 'LES JOURS,MOIS ET DATES', 'MARDI', 'JEUDI', 'VENDREDI', 'SAMEDI', 'Quel jour vient après mercredi ?', NULL, NULL, NULL, NULL),
(63, 'JANVIER', '', 'LES JOURS,MOIS ET DATES', 'DéCEMBRE', 'FéVRIER', 'JANVIER', 'MARS', 'Quel est le premier mois de l\'année ?', NULL, NULL, NULL, NULL),
(64, '12', '', 'LES JOURS,MOIS ET DATES', '10', '11', '12', '13', 'Combien y a-t-il de mois dans une année ?', NULL, NULL, NULL, NULL),
(65, 'SEPTEMBRE', '', 'LES JOURS,MOIS ET DATES', 'JUILLET', 'OCTOBRE', 'JUIN', 'SEPTEMBRE', 'Quel mois vient après août ?', NULL, NULL, NULL, NULL),
(66, '14 juillet', '', 'LES JOURS,MOIS ET DATES', '. 1er janvier', '14 juillet', '25 décembre', '1er mai', 'Quelle date correspond généralement à la fête nationale française ?', NULL, NULL, NULL, NULL),
(69, 'un mur', '', 'LES OBJETS', 'une voiture', 'un mur', 'une clé', 'une chaise', 'on accroche un tableau sur :', 'QCM', NULL, 'j\'ai acheté un nouveau ___;j\'accroche mon tableau au ___;je me déplace en ___;je m\'assoie sur une ___;j\'ai fermé la porte à ___', 'mur;voiture;chaise;clé;sac');

-- --------------------------------------------------------

--
-- Structure de la table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
CREATE TABLE IF NOT EXISTS `lessons` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `audio_url` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` datetime(6) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `title` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lessons`
--

INSERT INTO `lessons` (`id`, `audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`) VALUES
(1, NULL, '', '', '2026-05-28 16:54:55.893654', NULL, 'A1', 'LES FRUITS'),
(2, NULL, '', '', '2026-05-29 04:12:14.996335', NULL, 'A1', 'LES OBJETS'),
(3, NULL, '', '', '2026-05-29 07:21:55.372702', NULL, 'A1', 'FORMULES DE POLITESSE'),
(4, NULL, '', '', '2026-05-29 14:00:18.237249', NULL, 'A1', 'LES LÉGUMES'),
(5, NULL, '', '', '2026-05-30 02:28:20.384504', NULL, 'A1', 'LES JOURS,MOIS ET DATES'),
(6, NULL, '', '', '2026-05-30 02:28:37.963719', NULL, 'A1', 'LA FAMILLE'),
(7, NULL, '', '', '2026-05-30 02:28:52.364731', NULL, 'A1', 'LES COULEURS'),
(8, NULL, '', '', '2026-05-30 02:29:13.468565', NULL, 'A1', 'LA MAISON'),
(9, NULL, '', '', '2026-05-30 02:29:42.745455', NULL, 'A1', 'LES VÊTEMENTS'),
(10, NULL, '', '', '2026-05-30 02:30:02.562513', NULL, 'A1', 'LES PROFESSIONS'),
(11, NULL, '', '', '2026-05-30 02:31:07.236093', NULL, 'A1', 'LES PARTIES DU CORPS'),
(12, NULL, '', '', '2026-05-30 02:31:37.771777', NULL, 'A1', 'LE TEMPS ET L\'HEURE'),
(13, NULL, '', '', '2026-05-30 02:31:57.915709', NULL, 'A1', 'LES ÉMOTIONS');

-- --------------------------------------------------------

--
-- Structure de la table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
CREATE TABLE IF NOT EXISTS `quizzes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `correct_answers` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `sentence` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `words` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `quizzes`
--

INSERT INTO `quizzes` (`id`, `correct_answers`, `image_url`, `sentence`, `title`, `words`) VALUES
(1, 'le,a', '', 'L\'infirmière aide____malade qui____mal à la tête', 'préposition,conjonction de coordination', 'le,a'),
(2, 'belle,beau', '', 'La fleur est____et le jardin est_____.', 'Accords des adjectifs', 'beau,belle'),
(3, 'il,nous,tu', '', '____mange une pomme alors que ____ regardons un film et que  ____ dors.', 'Les pronoms', 'nous,il,tu'),
(4, 'grandes,grands', NULL, 'Ces fleurs sont____et ces arbres sont____.', 'Les Adjectifs(Accord au pluriel)', 'grandes,grands'),
(5, 'le,lui', NULL, 'Je____vois dans la rue et____donne un cadeau.', 'Utilisation des pronoms', 'le,lui'),
(6, 'hier,demain,aujourd\'hui,la semaine prochaine', '', 'je pars____.Nous avons étudié____.Elle viendra____.Ils voyageront____.', 'Les Expressions de temps', 'aujourd\'hui,hier,la semaine prochaine,demain     '),
(7, 'parlerai,irons,trouveras,feront', '', 'Je____français demain.Nous____à Paris la semaine prochaine.Tu____un nouveau travail bientôt.Ils____leurs devoirs ce soir.', 'Futur simple', 'trouveras,parlerai,feront,irons'),
(8, 'ce,cette,ces,cet', '', '____livre est intérressant.____voiture est rapide.____étudiants sont motivés.____hôtel est beau .', 'Adjectifs démonstratifs', 'ces,ce,cette,cet'),
(9, 'parle,mangeons,écoutes,travaillent', '', 'Je____français(parler).Nous____ensemble(manger).Tu____la musique(écouter).Ils____vite(travailler).', 'Verbes réguliers', 'écoutes,parle,travaillent,mangeons');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `created_at`, `email`, `enabled`, `password`, `role`, `username`) VALUES
(2, '2026-05-28 12:55:45.051614', 'rolandmerhej8@gmail.com', b'1', '$2a$10$K2eCuZuhFEZFX6ohkvy0du.m46N1EVcc/OWPF9QDga6JEyY4j3RRy', 'USER', 'toto'),
(14, '2026-06-05 09:54:10.799231', 'rolandladminadmin@apprendrefr.com', b'1', '$2a$10$O/jaFJ7YFKna38JYIeohVOY.2AuGpxNvvxuTKKHCdM4Rnlg/Nql1O', 'ADMIN', 'rolandladmin'),
(15, '2026-06-07 04:42:40.213476', 'testu1@gmail.com', b'1', '$2a$10$LNmtfgNsJ3jYpQWU35MhmufY80CfjrOF3k7dGAhdJh6ITav2va5Gm', 'ROLE_USER', 'testu1'),
(16, '2026-06-07 04:44:18.615310', 'testu2@gmail.com', b'1', '$2a$10$uU9KKuLKqELO41DSaOk6Uuz3rWFENSYMLMDQ0XzWWfLIzxw2dUX4O', 'ROLE_USER', 'testu2'),
(17, '2026-06-07 04:45:07.457610', 'testu3@gmail.com', b'1', '$2a$10$9SZoiGuzAm939oiL4OI74eoZtKw4KEpwucYWdE5KBQqGzAlqNZ5jG', 'ROLE_USER', 'testu3'),
(18, '2026-06-07 04:45:43.285412', 'testu4@gmail.com', b'1', '$2a$10$HXjK74pvK8PFZJty7T9ty.J6HVJhoGEBER36LbESDqQGL6G2geNtm', 'ROLE_USER', 'testu4'),
(19, '2026-06-07 04:46:50.812160', 'testu5@gmail.com', b'1', '$2a$10$e/qWGdV.qkvOeNH7/CJZw.oIKXOuf6cFveAQzqU0rRiB0XmnwCXQm', 'ROLE_USER', 'testu5'),
(20, '2026-06-07 04:47:39.797590', 'testu6@gmail.com', b'1', '$2a$10$lJeYg.3Iy5H5erBHD47daeOz8IjNNqmnLF88.0aFUeIiCGTpv26OG', 'ROLE_USER', 'testu6'),
(21, '2026-06-07 04:48:24.926152', 'testu7@gmail.com', b'1', '$2a$10$Ek.BDiUCZOMCGM3QgoQQGe1JPpv2H8KDgmXR56bddMmevhcqWYYKe', 'ROLE_USER', 'testu7'),
(22, '2026-06-07 04:48:55.714798', 'testu8@gmail.com', b'1', '$2a$10$x07BwGrzF.2ephDw7hFY..7tXaBp.ocg9s5tpnjIfXDYDiXGxPtgu', 'ROLE_USER', 'testu8'),
(23, '2026-06-07 04:49:37.039226', 'testu9@gmail.com', b'1', '$2a$10$BWOm/QGv/2ZoTK.di.qm7uW7CTUIakDU431bzLqdP5AYZorF9UiW2', 'ROLE_USER', 'testu9'),
(24, '2026-06-07 04:50:16.858351', 'testu10@gmail.com', b'1', '$2a$10$qCfJU.onxDaU8u.YKbTgJ.wbWoDDMkAmpW6v1tSLmWZDNE9JNvtzq', 'ROLE_USER', 'testu10'),
(25, '2026-06-07 04:51:01.445024', 'testu11@gmail.com', b'1', '$2a$10$DRXU7Dhcu2fBMDs070hWoeQQgG86/TOZCNb5d79JHIzEaCjcC/Yt2', 'ROLE_USER', 'testu11'),
(26, '2026-06-07 04:51:38.421861', 'testu12@gmail.com', b'1', '$2a$10$wPI0AXi/Jv2s2SvCtZhfzOrDOTUlO8mBaKFBR0jxGqUqlKzqE33V.', 'ROLE_USER', 'testu12'),
(27, '2026-06-07 04:53:08.671500', 'testu13@gmail.com', b'1', '$2a$10$BfHY3jmm/btqLKUPDH7.w.wa8cxiUfFfZI638ERpX01CkjTvK33BG', 'ROLE_USER', 'testu13'),
(28, '2026-06-07 04:53:45.124098', 'testu14@gmail.com', b'1', '$2a$10$VNwCt6NTFgC8dGq/85SNyeSPnGAuZj.ZRGMVcjGEG9EmaDM1ekaIW', 'ROLE_USER', 'testu14'),
(29, '2026-06-07 13:54:41.803270', 'testu15@gmail.com', b'0', '$2a$10$B7X2bthG9nfjksijgoLwe.8xJWQe1beXek7ukZWZXk33Lt11esQAO', 'ROLE_USER', 'testu15'),
(30, '2026-06-10 12:01:10.793248', 'adminadmin@apprendrefr.com', b'1', '$2a$10$FF0p3harUoUgjuyls5wJqemhKRz8v/TmhSypZWC6HAEbY9uQQ3lNm', 'ADMIN', 'admin'),
(31, '2026-06-11 13:42:05.896080', 'testu16@gmail.com', b'1', 'testtestp16', 'USER', 'testu16');

-- --------------------------------------------------------

--
-- Structure de la table `users_exercises_scores`
--

DROP TABLE IF EXISTS `users_exercises_scores`;
CREATE TABLE IF NOT EXISTS `users_exercises_scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `exercise_id` bigint(20) NOT NULL,
  `score` int(11) NOT NULL,
  `completed_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_score_users` (`user_id`),
  KEY `fk_score_exercises` (`exercise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users_exercises_scores`
--

INSERT INTO `users_exercises_scores` (`id`, `user_id`, `exercise_id`, `score`, `completed_at`) VALUES
(1, 2, 6, 0, '2026-06-06 20:23:15'),
(2, 2, 7, 100, '2026-06-06 20:23:23'),
(3, 2, 8, 100, '2026-06-06 20:24:21'),
(4, 2, 9, 100, '2026-06-06 20:24:41'),
(5, 2, 62, 100, '2026-06-06 20:29:00'),
(6, 2, 63, 100, '2026-06-06 20:29:34'),
(7, 2, 64, 100, '2026-06-06 20:29:38'),
(8, 2, 65, 100, '2026-06-06 20:29:44'),
(9, 2, 66, 100, '2026-06-06 20:29:50'),
(10, 2, 26, 100, '2026-06-07 07:28:55'),
(11, 14, 10, 0, '2026-06-07 10:15:41'),
(12, 2, 30, 100, '2026-06-07 14:16:38'),
(13, 2, 27, 100, '2026-06-07 13:12:33'),
(14, 14, 53, 100, '2026-06-07 13:53:22'),
(15, 14, 54, 0, '2026-06-07 13:53:27'),
(16, 2, 28, 100, '2026-06-07 14:15:38'),
(17, 2, 29, 100, '2026-06-07 14:15:50'),
(18, 2, 3, 100, '2026-06-07 14:16:30'),
(19, 2, 31, 100, '2026-06-07 14:16:45'),
(20, 2, 32, 100, '2026-06-07 14:17:00'),
(21, 2, 33, 0, '2026-06-07 14:17:08'),
(22, 2, 34, 100, '2026-06-07 14:17:44'),
(23, 2, 69, 100, '2026-06-07 14:17:51'),
(24, 17, 53, 100, '2026-06-07 14:18:19'),
(25, 15, 26, 100, '2026-06-09 16:11:11'),
(26, 15, 27, 100, '2026-06-09 15:32:51'),
(27, 15, 28, 100, '2026-06-09 15:33:04'),
(28, 15, 29, 100, '2026-06-09 15:33:07'),
(29, 23, 66, 100, '2026-06-09 15:53:45'),
(30, 23, 10, 100, '2026-06-09 15:54:29'),
(31, 23, 58, 100, '2026-06-09 15:58:05');

-- --------------------------------------------------------

--
-- Structure de la table `vocabularies`
--

DROP TABLE IF EXISTS `vocabularies`;
CREATE TABLE IF NOT EXISTS `vocabularies` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `audio_url` varchar(255) DEFAULT NULL,
  `english_translation` varchar(100) NOT NULL,
  `french_word` varchar(100) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `pronunciation` varchar(100) DEFAULT NULL,
  `lesson_id` bigint(20) NOT NULL,
  `example_sentence` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKr4cdy69nx0qb4g4vv3ywxerav` (`lesson_id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vocabularies`
--

INSERT INTO `vocabularies` (`id`, `audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`) VALUES
(9, NULL, 'a key', 'une clé', '/uploads/images/1a014f08-1ac7-4d79-abc1-a752b515b38a.png', 'klé', 2, 'J\'OUVRE LA PORTE AVEC UNE CLé'),
(10, NULL, 'a Bag', 'un Sac', '/uploads/images/a9aaf574-0941-4049-8141-afc7f548fd86.png', '', 2, 'VOTRE SAC EST JOLI'),
(11, NULL, 'a phone', 'un téléphone', '/uploads/images/1b13aa5e-ae27-4959-a3ae-5e9cfcd6fae1.png', '', 2, 'MON TéLéPHONE M\'EST INDISPENSABLE'),
(12, NULL, 'a Chair', 'une Chaise', '/uploads/images/c5375169-e0b1-4da7-9cd3-69921f5d7a04.png', '', 2, 'Il manque une chaise.'),
(13, '/uploads/audio/ad7538e7-7625-4061-9699-5bcbed0ee33c.mp3', 'an apple', 'POMME', '/uploads/images/798fbc61-f443-4f82-9453-139da4acb25e.png', 'pom', 1, 'Je mange une pomme chaque matin au petit-déjeuner.'),
(15, '/uploads/audio/24c494b1-ad8d-4f50-8206-57a2a9f97553.mp3', 'grape', 'RAISIN', '/uploads/images/d4b9a175-f647-4fd9-9f3c-1d2d4d0b4d8d.png', 'RÉ-ZIN', 1, 'Le raisin est riche en vitamines et en antioxydants.'),
(16, NULL, 'a wall', 'un mur', '/uploads/images/7dfb6434-11c3-42d2-bffa-384afbb94369.png', '', 2, 'UN MUR NOUS SÉPARE'),
(17, NULL, 'a window', 'une fenêtre ', '/uploads/images/c4b90e15-0a22-4c51-8cb7-76799c469fd6.png', '', 2, 'QUELLE BELLE VUE PAR LA FENÊTRE !'),
(18, NULL, 'a bed', 'un lit', '/uploads/images/5adececc-3e1e-4166-950e-6e50d3462eae.jpg', '', 2, 'J\'AI ACHETÉ UN GRAND LIT'),
(19, NULL, 'shoes', 'des chaussures', '/uploads/images/453e845e-a2f5-4ea2-bd7e-2e8ac2c15f1f.jpg', '', 2, 'CES CHAUSSURES SONT VRAIMENT RÉSISTANTE'),
(20, '/uploads/audio/eaa20861-7738-47cf-ba52-0028a246ea00.mp3', 'ORANGE', 'ORANGE', '/uploads/images/4a83b152-547a-410f-a868-2131c7086262.png', 'O-RANJ', 1, 'Je mange une orange chaque matin'),
(21, '/uploads/audio/1a399008-a49a-4902-a2f3-f9eb1def3f07.mp3', 'STRAWBERRY', 'FRAISE', '/uploads/images/b4768d0c-a908-4750-b54d-a99880f195fe.png', 'FREZ', 1, 'J\'aime préparer un dessert avec des fraises fraîches.'),
(22, '/uploads/audio/6f4814c4-fefb-4d8e-9c67-59c261ee2b6e.mp3', 'CHERRY', 'CERISE', '/uploads/images/28d8936f-1b9b-4ef4-a03e-5a2c6778e7e9.png', 'SE-RIZ', 1, 'Les cerises sont délicieuses lorsqu\'elles sont bien mûres.'),
(23, '/uploads/audio/0e6ad7fe-5c26-4530-907a-609399a02d17.mp3', 'PEAR', 'POIRE', '/uploads/images/a8a0de17-dc51-49f8-bc36-f1e9f7b30639.png', 'PWAR', 1, 'Cette poire est très juteuse et sucrée.'),
(24, '/uploads/audio/ca347e76-43a2-4caa-9a2b-fd49459ae31f.mp3', 'PEACH', 'PÊCHE', '/uploads/images/7f0c6c12-3514-4bdb-98e9-14e8ad284c2b.png', '', 1, 'En été, je bois souvent du jus de pêche.'),
(25, '/uploads/audio/0df05c11-a86e-40a3-a774-de45271b6e87.mp3', 'PINEAPPLE', 'ANANAS', '/uploads/images/9961ec39-6a3d-49b3-8d38-836f4d9cd1b5.png', 'A-NA-NA', 1, 'L\'ananas apporte une saveur exotique aux salades de fruits.'),
(26, '/uploads/audio/dbef7b5f-cb46-4a54-ad15-6899334da1ad.mp3', 'WATERMELON', 'PASTEQUE', '/uploads/images/4c8880eb-9d60-42e4-8a88-831d6f44f119.png', 'PAS-TEK', 1, 'Une tranche de pastèque est très rafraîchissante par temps chaud.'),
(27, NULL, 'CUP', 'TASSE', '/uploads/images/8df90ca0-fa69-46f2-a2f8-6c54993261f2.jpg', '', 2, 'J\'AI BU UNE ÉNORME TASSE DE CAFÉ'),
(28, NULL, 'LAMP', 'LAMPE', '/uploads/images/64c3e3d6-b8cb-4713-827c-7b0e8f65fd57.png', '', 2, 'ALLUME LA LAMPE STP'),
(29, NULL, 'DOOR', 'PORTE', '/uploads/images/4d6a36e6-3137-48c1-823b-2a87d92ead41.jpg', '', 2, 'IL EST ENTRÉ PAR LA GRANDE PORTE.'),
(30, NULL, 'HELLO/GOOD MORNING', 'BONJOUR', '/uploads/images/a7d9ab41-b21e-48d3-b0d2-e4232ad91936.png', '', 3, 'Bonjour madame, Bonhour monsieur'),
(31, NULL, 'GOOD EVENING', 'BONSOIR', '/uploads/images/9b4494a0-6aba-4b38-8f3f-20f465187310.png', '', 3, 'Bonsoir monsieur,Bonsoir madame'),
(32, NULL, 'PLEASE', 'S\'IL VOUS PLAÎT', '/uploads/images/30b394d5-8e7c-43c3-9c5b-60783ddb4445.png', '', 3, 'Puis-je avoir votre attention s\'il vous plaît.'),
(33, NULL, 'THANK YOU', 'MERCI', '/uploads/images/1d084cb5-56e2-42ea-bb94-72221ea7f603.png', '', 3, 'Merci pour les efforts fournis.'),
(34, NULL, 'THANK YOU VERY MUCH', 'MERCI BEAUCOUP', '/uploads/images/8298d929-d8a8-47ca-941c-08b84153c0ff.png', '', 3, 'Merci beaucoup,j\'apprécie.'),
(35, NULL, 'YOU\'RE WELCOME', 'DE RIEN', '/uploads/images/6b4bba40-0ff5-49ae-a041-ebacd39030b3.png', '', 3, 'en réponse à merci ,on peut dire : de rien.'),
(36, NULL, 'EXCUSE ME', 'EXCUSEZ-MOI', '/uploads/images/13eb7442-d289-4110-8139-cdb6f5c39ad2.png', '', 3, 'Excuser-Moi monsieur/madame, puis-je avoir l\'heure s\'il vous plaît.'),
(37, NULL, 'SORRY/PARDON', 'PARDON', '/uploads/images/7efa8a91-2ce8-428d-9864-4d453a17575b.png', '', 3, 'Pardon d\'avoir été impolit.'),
(38, NULL, 'HOW ARE YOU?', 'COMMENT ALLEZ-VOUS?', '/uploads/images/4d314b1e-b03b-444e-9152-913edc08e393.png', '', 3, 'Bonjour madame/monsieur, comment allez-vous?'),
(39, NULL, 'GOODBYE', 'AU REVOIR', '/uploads/images/1f93b244-314a-439e-b494-65bf8ccfb0a8.png', '', 3, 'Je dois partir maintenant ,au revoir.'),
(41, NULL, 'CARROT', 'CAROTTE', '/uploads/images/f4a620c0-39c4-46fa-b5c5-c732ad674ae1.png', 'KA-ROT', 4, 'Il paraît que manger des carottes , c\'est bon pour la vue.'),
(42, NULL, 'TOMATO', 'TOMATE', '/uploads/images/cb5ead6e-8e50-4fc6-9b87-11aa2b4bf3fe.png', 'TO-MAT', 4, 'La tomate c\'est un fruit pas un légume !!'),
(43, NULL, 'POTATO', 'POMME DE TERRE', '/uploads/images/23b9661f-2b49-41a3-84d5-30192eb92294.png', 'POM DE TER', 4, 'Tu achètes des pommes de terre pour qu’on fasse des frites.'),
(44, NULL, 'ONION', 'OIGNON', '/uploads/images/bb06efe6-9e0a-48aa-b70b-dd3eff04ab0c.png', 'O-NYON', 4, 'Ah! les oignons ça pique.'),
(45, NULL, 'GARLIC', 'AIL', '/uploads/images/e5c8642c-c1eb-4b74-a89e-c56747892963.png', 'AY', 4, 'L\'ail est excellent pour la santé.'),
(46, NULL, 'LETTUCE', 'SALADE', '/uploads/images/a0610b70-45fd-43f5-96cb-741b6b77667d.png', 'SA-LAD', 4, 'choisis-moi une salade fraîche.\r\n'),
(47, NULL, 'PEPPER', 'POIVRON', '/uploads/images/6c70035b-1650-47af-bc13-984d92e847c6.png', 'PWA-VRON', 4, 'des poivrons pour les grillades ce soir?'),
(48, NULL, 'ZUCCHINI', 'COURGETTE', '/uploads/images/c8db639c-3c54-4e4d-a20b-2806420b8817.png', 'COUR-JET', 4, 'Les courgettes? je prends deux kilos SVP.'),
(49, NULL, 'RED', 'ROUGE', '/uploads/images/8257dfaa-2d21-4823-8c97-5bd48fb6bdc7.png', 'ROUJ', 7, 'Rouge ,comme le sang?'),
(50, NULL, 'WHITE', 'BLANC', '/uploads/images/e88556de-e947-4519-8920-d58767e08e70.png', '', 7, 'Blanc comme neige.'),
(51, NULL, 'GREEN', 'VERT', '/uploads/images/48c81b52-258f-467c-bc13-9902d6362b6d.png', 'VER', 7, 'Le gazon est bien vert.'),
(52, NULL, 'BLUE', 'BLEU', '/uploads/images/b784f2de-0700-4ceb-a77c-5060697f8058.png', '', 7, 'JE PORTE UN PANTALON BLEU'),
(53, NULL, 'YELLOW', 'JAUNE', '/uploads/images/dab71390-e7a5-4f32-bdac-28e0f3195f0f.png', 'JO-N', 7, 'JE TROUVE QUE LE JAUNE EST UNE BELLE COULEUR'),
(54, NULL, 'BLACK', 'NOIR', '/uploads/images/85ba7e53-4da3-41c3-8f19-e53111387180.png', '', 7, 'LE NOIR EST LA COULEUR DU DEUIL'),
(55, NULL, 'PINK', 'ROSE', '/uploads/images/070dfcd3-b5d0-4d21-8c77-91ee838c3557.png', 'RO-Z', 7, 'Cette rose est rose.'),
(56, NULL, 'ORANGE', 'ORANGE', '/uploads/images/0ac81fd2-31de-4586-92f6-e712622d7ca0.png', 'O-RANJ', 7, 'Orange, comme une orange?'),
(57, NULL, 'PURPLE', 'VIOLET', '/uploads/images/ad1051d0-8a6a-4b00-8b71-bd4aba95825d.png', 'VI-O-Lé', 7, 'J\'adore le violet.'),
(58, NULL, 'BROWN', 'MARRON', '/uploads/images/80051b44-7933-4412-863f-b2ead7dfa57c.png', '', 7, 'Une couleur que je n\'aime pas? le marron!'),
(59, NULL, 'GREY', 'GRIS', '/uploads/images/c4b274f5-bf3a-4c87-af5e-15bbdd3f0eaa.png', 'GRI', 7, 'On va peindre le mur en gris.'),
(60, NULL, 'BEIGE', 'BEIGE', '/uploads/images/120582cd-8f9c-4041-a45e-26d731646f01.png', '', 7, 'Met ta veste beige.'),
(61, NULL, 'SHIRT', 'CHEMISE', '/uploads/images/9854ee2d-d2db-4739-82e4-695d685446ee.png', 'CHE-MIZ', 9, 'Joli chemise !'),
(62, NULL, 'PANTS', 'PANTALON', '/uploads/images/d1354ae9-0e4a-4601-b3cf-8d82b36fd4f2.png', '', 9, 'Ton pantalon est sale!!'),
(63, NULL, 'DRESS', 'ROBE', '/uploads/images/f82baca0-e63e-4a8c-b900-2edc1a18f7f7.png', '', 9, 'Ah ! une robe de princesse'),
(64, NULL, 'JACKET', 'VESTE', '/uploads/images/10e81b2a-00ba-4dcb-9ab1-39b43cdd788e.png', '', 9, 'tu portera quelle veste demain?'),
(65, NULL, 'SKIRT', 'JUPE', '/uploads/images/b7f0e601-c57e-4d27-b2d6-68cf5575233d.jpg', '', 9, 'Tu préfères les jupes courtes ou longues?'),
(66, NULL, 'SWEATER', 'PULL', '/uploads/images/db534fe3-0b9b-4cf1-acce-f0e5f364f44b.jpg', '', 9, 'Portes ce pull là '),
(67, NULL, 'COAT', 'MANTEAU', '/uploads/images/1053f2d8-6f2e-4005-9da9-19282443882c.jpg', 'MAN-TO', 9, 'Ton manteau? t\'en aura besoin avec ce froid.'),
(68, NULL, 'JACKET/BOMBER', 'BLOUSON', '/uploads/images/fb495940-7caf-4f89-8695-0807ae13a78a.jpg', 'BLOU-ZON', 9, 'Un blouson en cuir.'),
(69, NULL, 'MOTHER', 'MÈRE', '/uploads/images/b6a92149-c5f1-44b4-9eb0-193ead7ea040.png', '', 6, 'Ma mère est très jolie'),
(70, NULL, 'FATHER', 'PÈRE', '/uploads/images/a6c34dda-3a7b-45cb-a6e4-b2b0e44364ac.png', '', 6, 'mon père est policier'),
(71, NULL, 'BROTHER', 'FRÈRE', '/uploads/images/f6266fe0-8eec-46ca-890c-e7359c751818.png', '', 6, 'j\'ai une soeur et deux frères'),
(72, NULL, 'SISTER', 'SOEUR', '/uploads/images/c5ab9fe5-2363-4ee3-8677-eccff1a55379.png', 'SEUR', 6, 'une soeur est un cadeau du ciel'),
(73, NULL, 'SON', 'FILS', '/uploads/images/585cee5e-f323-4da6-9a39-9806f28dd27a.png', 'FISS', 6, 'j\'ai toujours voulu avoir un fils'),
(74, NULL, 'DAUGHTER', 'FILLE', '/uploads/images/9e56f166-62c0-49b3-9642-fd66bca438e4.png', '', 6, 'ma fille me couvre d\'amour'),
(75, NULL, 'UNCLE', 'ONCLE', '/uploads/images/c2f382fe-b54f-478b-b782-e0ca65cf93d2.png', 'ON-KLE', 6, 'j\'ai deux oncles du côté paternel'),
(76, NULL, 'AUNT', 'TANTE', '/uploads/images/f85fc4e3-14fe-4e8c-a69a-b54965468114.png', '', 6, 'jma tante est ma deuxième maman'),
(77, NULL, 'KITCHEN', 'CUISINE', '/uploads/images/1c0db0a1-d114-4c4a-8fb6-45b705e61572.png', 'KUI-ZINE', 8, 'Va me chercher une bouteille de la cuisine.'),
(78, NULL, 'LIVING ROOM', 'SALON', '/uploads/images/e6b4f2ac-0eee-4062-b879-c9407d4eb4c5.png', '', 8, 'Installons nous dans la salon.'),
(79, NULL, 'BEDROOM', 'CHAMBRE', '/uploads/images/d0d3a1ab-1a1b-4bc8-bcb6-07e5e5779ad0.jpg', '', 8, 'Ta chambre est grande.'),
(80, NULL, 'BATHROOM', 'SALLE DE BAIN', '/uploads/images/41da986f-07f3-41f0-a767-d2bec3a4b37d.jpg', '', 8, 'Tu passes du temps dans la salle de bain!'),
(81, NULL, 'BED', 'LIT', '/uploads/images/4117e1e5-b7a9-44a9-a9f3-856ff3b09620.jpg', '', 8, 'On souhaite avoir une chambre avec un lit double SVP.'),
(82, NULL, 'TABLE', 'TABLE', '/uploads/images/50a72cba-60d8-4c62-a549-175ae02bc155.jpg', '', 8, 'Tu peux poser ça sur la table.'),
(83, NULL, 'CHAIR', 'CHAISE', '/uploads/images/e1534e93-d3f0-4df9-ba2f-8e7f6169d70a.png', '', 8, 'Il manque une chaise.'),
(84, NULL, 'WINDOW', 'FENÊTRE', '/uploads/images/a05c38e0-840b-4930-b21c-24bb4d7618c4.png', 'FE-NAI-TRE', 8, ''),
(85, NULL, 'SHOWER', 'DOUCHE', '/uploads/images/45c07d84-15ba-4d17-875a-b5e04c9aa53d.jpg', '', 8, 'Tu le trouvera dans la douche.'),
(86, NULL, 'SOFA', 'CANAPÉ', '/uploads/images/ea4d0656-507b-4573-81e6-ee1952614935.jpg', '', 8, 'Va t’asseoir sur le canapé.'),
(87, NULL, 'DOCTOR', 'MÉDECIN', '/uploads/images/54e27d77-4b49-429b-a6bd-1c8fd5d55503.png', '', 10, 'J\'ai besoin de voir un médecin.'),
(88, NULL, 'TEACHER', 'ENSEIGNANT/PROFESSEUR', '/uploads/images/123d3d7a-f613-4b8b-9bfd-7605fc417fa5.png', 'EN-Sé-NIAN', 10, 'Ce professeur , qu\'enseigne-t-il?'),
(89, NULL, 'LAWYER', 'AVOCAT', '/uploads/images/5f8bebf3-10f1-44b0-b8e1-95675688fe32.png', '', 10, 'C\'est un excellent avocat.'),
(90, NULL, 'POLICE OFFICER', 'POLICIER', '/uploads/images/9641cc8a-b835-4270-bbb7-5f02991bc7ca.png', 'PO-LI-SIé', 10, 'J\'ai vu un policier lui courir après!'),
(91, NULL, 'NURSE', 'INFIRMIER', '/uploads/images/dca058d6-fe0d-424b-9441-d192034e844d.png', '', 10, 'Il manque toujours des infirmiers/infirmières.'),
(92, NULL, 'COOK', 'CUISINIER', '/uploads/images/ef8acb3e-dcfb-4528-947f-7a2fdf3678be.png', 'CUI-ZI-NIé', 10, 'Ce cuisinier , c\'est un chef !!'),
(93, NULL, 'ARCHITECT', 'ARCHITECTE', '/uploads/images/a3c43ed3-41e8-4c8a-bee2-1638ce46928f.png', '', 10, 'Il a du goût cet architecte.'),
(94, NULL, 'SALESPERSON', 'VENDEUR', '/uploads/images/5e120fe4-e621-4bc1-afce-1baaed53815b.png', '', 10, 'Ce vendeur/vendeuse est agréable.'),
(95, NULL, 'HEAD', 'TÊTE', '/uploads/images/6e467218-47b0-436f-9a34-84fa4aba19c1.png', '', 11, 'De la tête aux  pieds.'),
(96, NULL, 'EYES', 'YEUX', '/uploads/images/0de81a85-d3cc-4736-8a4d-7650103b805e.png', 'ZYEU', 11, 'Il/elle a les yeux marron.'),
(97, NULL, 'NOSE', 'NEZ', '/uploads/images/9f434196-dfb1-4f69-8953-ed1b72485f07.png', 'Né', 11, 'Respire par le nez.'),
(98, NULL, 'MOUTH', 'BOUCHE', '/uploads/images/8702f5a7-3bde-434e-b305-369055f135d7.png', '', 11, 'Ferme ta bouche.'),
(99, NULL, 'EARS', 'OREILLES', '/uploads/images/99e68c4e-e32f-491c-8383-0d9f053275eb.png', '', 11, 'Je lui tire les oreilles.'),
(100, NULL, 'ARM', 'BRAS', '/uploads/images/fa930084-2e55-411f-a5f8-89f54549d479.png', '', 11, 'Il à le bras long!!'),
(101, NULL, 'HAND', 'MAIN', '/uploads/images/97291e16-48c8-4252-b1b0-b2a064971f47.png', 'MIN', 11, 'serre lui la main.'),
(102, NULL, 'LEG', 'JAMBE', '/uploads/images/477e5daa-9502-45d2-bb7e-1ae222b3f7b3.png', '', 11, 'Il ne te reste que tes jambes pour courir!'),
(103, NULL, 'FOOT', 'PIED', '/uploads/images/1ae1712e-fdeb-4aab-964b-78c5d4910e0d.png', 'PIé', 11, 'J(ai mal aux pieds.'),
(104, NULL, 'JOY', 'JOIE', '/uploads/images/810d6554-c987-4189-a668-232040b85911.png', '', 13, 'Quelle joie de vous voir'),
(105, NULL, 'SADNESS', 'TRISTESSE', '/uploads/images/25d0c864-be4e-4ff2-856d-8c9a36b28860.png', '', 13, 'Je me sent triste.'),
(106, NULL, 'ANGER', 'COLÈRE', '/uploads/images/64740927-cb9a-441a-ae2d-43fbabffd8c3.png', '', 13, 'Il ne faut pas se mettre en colère.'),
(107, NULL, 'FEAR', 'PEUR', '/uploads/images/be80852d-71c6-43c6-afd6-1637c4f23880.png', '', 13, 'J\'ai peur du noir.'),
(108, NULL, 'SURPRISE', 'SURPRISE', '/uploads/images/ed1673b1-e255-4484-a0d7-c5c44aef00d3.png', 'SUR-PRIZ', 13, 'Quelle belle surprise.'),
(109, NULL, 'LOVE', 'AMOUR', '/uploads/images/c2d21530-ada3-4945-99b6-542cccc8f075.png', '', 13, 'Je fais ça par amour.'),
(110, NULL, 'DISGUST', 'DÉGOÛT', '/uploads/images/8a04a628-151f-4077-a0a1-b37fde6296d5.png', '', 13, 'ça me dégoûte!!'),
(111, NULL, 'EXITEMENT', 'EXITATION', '/uploads/images/70925b90-283e-4c91-a1f7-2cb9d1fbd1b5.png', '', 13, 'Il est exité comme une puce.'),
(112, NULL, 'HOUR', 'HEURE', '/uploads/images/55854ded-ccb5-41a9-9f54-64aece6662b3.png', '', 12, 'Il me faut une heure.'),
(113, NULL, 'MINUTE', 'MINUTE', '/uploads/images/5ba94e63-4f5d-4a70-ae90-2a04a080c473.png', '', 12, 'Une minute !'),
(114, NULL, 'SECOND', 'SECONDE', '/uploads/images/6ec1d976-ac94-4051-8135-f8bc52a506ae.png', '', 12, 'ça lui a pris une seconde.'),
(115, NULL, 'CLOCK', 'HORLOGE', '/uploads/images/47f72035-0674-4f71-a98b-be91d3180ef7.png', '', 12, 'C\'est une horloge du 18ème'),
(116, NULL, 'WATCH', 'MONTRE', '/uploads/images/ccef201e-5704-4599-90da-d522656b90b3.png', '', 12, 'Joli montre !'),
(117, NULL, 'MORNING', 'MATIN', '/uploads/images/a204fa20-e595-4347-95f3-ad67bc1ee74d.png', '', 12, 'Il fait frais ce matin.'),
(118, NULL, 'AFTERNOON', 'APRÉS-MIDI', '/uploads/images/93f09fbd-3cf8-4a8c-be3d-71211ed115c9.png', '', 12, 'à cet après-midi.'),
(119, NULL, 'EVENING', 'SOIR', '/uploads/images/2e766142-a85b-486e-bd48-3b66ec310466.png', 'SWAR', 12, 'CE SOIR ON SORT'),
(120, NULL, 'NIGHT', 'NUIT', '/uploads/images/904f88ff-2e30-4618-91e1-454714298952.png', '', 12, 'Bonne nuit.'),
(121, '/uploads/audio/464dd239-2581-488c-86dc-1ab114d98a92.mp3', 'CAR', 'VOITURE', '/uploads/images/f15debe1-3f85-493e-8033-3cde1825041a.jpg', '', 2, 'je me déplace en voiture'),
(122, NULL, 'DAY', 'JOUR', '/uploads/images/e6c878e6-3b18-4a1f-9883-9e55ea15cb46.png', '', 5, 'LES JOURS SE SUCCÈDENT ET SE RESSEMBLENT'),
(123, NULL, 'MONTH', 'MOIS', '/uploads/images/dee68ed0-c8bd-4e35-982e-8da1d17fedda.png', '', 5, 'LE MOIS PROCHAIN JE PART EN VACANCES'),
(124, NULL, 'WEEK', 'SEMAINE', '/uploads/images/b7e8452b-a85b-4c17-acd4-cc30ef25a859.png', '', 5, 'LA LIVRAISON AURA LIEU LA SEMAINE PROCHAINE'),
(125, NULL, 'YEAR', 'ANNÉE', '/uploads/images/fd5c177a-3203-4301-b4e5-279a6c8c94fd.png', '', 5, 'BONNE ANNÉE !'),
(126, NULL, 'DATE', 'DATE', '/uploads/images/d6a8206f-5e70-405e-8e80-73fb73d9d29b.png', '', 5, 'ON CONVIENDRA D\'UNE DATE PLUS TARD'),
(127, NULL, 'CALENDAR', 'CALENDRIER', '/uploads/images/612fabec-34d8-4c8b-ae6c-6c83393c951e.png', '', 5, 'UN CALENDRIER REPRÉSENTE TOUS LES JOURS ET LES MOIS DE L\'ANNÉE');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `users_exercises_scores`
--
ALTER TABLE `users_exercises_scores`
  ADD CONSTRAINT `fk_score_exercises` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_score_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `vocabularies`
--
ALTER TABLE `vocabularies`
  ADD CONSTRAINT `FKr4cdy69nx0qb4g4vv3ywxerav` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
