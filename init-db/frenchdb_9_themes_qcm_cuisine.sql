-- QCM des deux thèmes « Dans la cuisine » et « Cuisiner un plat » (page /themes). Sur la page d'un thème, la bonne réponse est la LETTRE (A, B, C ou D). Peut être exécuté plusieurs fois sans doublons ; les lignes déjà présentes voient leur bonne réponse corrigée (UPDATE). À lancer APRÈS frenchdb_9_themes_cuisine.sql.
SET NAMES utf8mb4;

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'A', 'Le chef dit : « Aujourd''hui, c''est ton premier jour en cuisine. »', 'DANS LA CUISINE', 'SON PREMIER JOUR EN CUISINE', 'SON DERNIER JOUR', 'SON JOUR DE CONGÉ', 'SON ANNIVERSAIRE', 'Quel jour est-ce pour Léa dans le dialogue ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'DANS LA CUISINE' AND `question` = 'Quel jour est-ce pour Léa dans le dialogue ?');
UPDATE `exercises` SET `correct_answer` = 'A' WHERE `lesson_title` = 'DANS LA CUISINE' AND `question` = 'Quel jour est-ce pour Léa dans le dialogue ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'B', 'Le chef demande d''abord de mettre le tablier et de se laver les mains.', 'DANS LA CUISINE', 'OUVRIR LE FOUR', 'METTRE SON TABLIER ET SE LAVER LES MAINS', 'ÉPLUCHER LES CAROTTES', 'NETTOYER LA CUISINE', 'Que doit faire Léa d''abord ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'DANS LA CUISINE' AND `question` = 'Que doit faire Léa d''abord ?');
UPDATE `exercises` SET `correct_answer` = 'B' WHERE `lesson_title` = 'DANS LA CUISINE' AND `question` = 'Que doit faire Léa d''abord ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'C', 'Les couteaux sont dans le tiroir, à gauche.', 'DANS LA CUISINE', 'SUR L''ÉTAGÈRE, EN HAUT', 'À CÔTÉ DE L''ÉVIER', 'DANS LE TIROIR, À GAUCHE', 'DANS LE PLACARD', 'Où sont les couteaux ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'DANS LA CUISINE' AND `question` = 'Où sont les couteaux ?');
UPDATE `exercises` SET `correct_answer` = 'C' WHERE `lesson_title` = 'DANS LA CUISINE' AND `question` = 'Où sont les couteaux ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'D', 'L''éplucheur est à côté de l''évier.', 'DANS LA CUISINE', 'DANS LE TIROIR', 'SUR L''ÉTAGÈRE', 'DANS LE FOUR', 'À CÔTÉ DE L''ÉVIER', 'Où est l''éplucheur ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'DANS LA CUISINE' AND `question` = 'Où est l''éplucheur ?');
UPDATE `exercises` SET `correct_answer` = 'D' WHERE `lesson_title` = 'DANS LA CUISINE' AND `question` = 'Où est l''éplucheur ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'A', 'La grande casserole est sur l''étagère, en haut.', 'DANS LA CUISINE', 'SUR L''ÉTAGÈRE, EN HAUT', 'EN BAS, SOUS LE PLAN DE TRAVAIL', 'DANS LE TIROIR', 'DANS LE FOUR', 'Où est la grande casserole ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'DANS LA CUISINE' AND `question` = 'Où est la grande casserole ?');
UPDATE `exercises` SET `correct_answer` = 'A' WHERE `lesson_title` = 'DANS LA CUISINE' AND `question` = 'Où est la grande casserole ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'B', 'La poêle est en bas, sous le plan de travail.', 'DANS LA CUISINE', 'SUR L''ÉTAGÈRE, EN HAUT', 'EN BAS, SOUS LE PLAN DE TRAVAIL', 'À CÔTÉ DE L''ÉVIER', 'DANS LE PLACARD', 'Où est la poêle ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'DANS LA CUISINE' AND `question` = 'Où est la poêle ?');
UPDATE `exercises` SET `correct_answer` = 'B' WHERE `lesson_title` = 'DANS LA CUISINE' AND `question` = 'Où est la poêle ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'C', 'Le fouet et la passoire sont dans le placard, devant Léa.', 'DANS LA CUISINE', 'DANS LE TIROIR', 'SUR LE PLAN DE TRAVAIL', 'DANS LE PLACARD, DEVANT ELLE', 'DANS LE FOUR', 'Où sont le fouet et la passoire ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'DANS LA CUISINE' AND `question` = 'Où sont le fouet et la passoire ?');
UPDATE `exercises` SET `correct_answer` = 'C' WHERE `lesson_title` = 'DANS LA CUISINE' AND `question` = 'Où sont le fouet et la passoire ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'D', 'Les maniques protègent les mains : le four est très chaud.', 'DANS LA CUISINE', 'PARCE QUE C''EST LE RÈGLEMENT', 'PARCE QUE LE TIROIR EST LOURD', 'PARCE QUE L''EAU EST FROIDE', 'PARCE QUE LE FOUR EST TRÈS CHAUD', 'Pourquoi faut-il prendre les maniques ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'DANS LA CUISINE' AND `question` = 'Pourquoi faut-il prendre les maniques ?');
UPDATE `exercises` SET `correct_answer` = 'D' WHERE `lesson_title` = 'DANS LA CUISINE' AND `question` = 'Pourquoi faut-il prendre les maniques ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'A', 'Le chef demande de couper les carottes en rondelles.', 'DANS LA CUISINE', 'EN RONDELLES', 'EN POUDRE', 'EN GRANDS MORCEAUX', 'EN BÂTONNETS FINS', 'Comment coupe-t-on les carottes ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'DANS LA CUISINE' AND `question` = 'Comment coupe-t-on les carottes ?');
UPDATE `exercises` SET `correct_answer` = 'A' WHERE `lesson_title` = 'DANS LA CUISINE' AND `question` = 'Comment coupe-t-on les carottes ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'B', 'Le chef dit : « Après, tu nettoies tout ! »', 'DANS LA CUISINE', 'PARTIR TOUT DE SUITE', 'TOUT NETTOYER', 'SERVIR LES CLIENTS', 'FAIRE LES COURSES', 'Que doit faire Léa à la fin ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'DANS LA CUISINE' AND `question` = 'Que doit faire Léa à la fin ?');
UPDATE `exercises` SET `correct_answer` = 'B' WHERE `lesson_title` = 'DANS LA CUISINE' AND `question` = 'Que doit faire Léa à la fin ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'A', 'Le chef annonce : « Table douze : un poulet rôti et une soupe de légumes. »', 'CUISINER UN PLAT', 'UN POULET RÔTI ET UNE SOUPE DE LÉGUMES', 'UN STEAK ET DES FRITES', 'UN POISSON ET DU RIZ', 'UNE SALADE ET UN DESSERT', 'Qu''est-ce que la table douze a commandé ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'CUISINER UN PLAT' AND `question` = 'Qu''est-ce que la table douze a commandé ?');
UPDATE `exercises` SET `correct_answer` = 'A' WHERE `lesson_title` = 'CUISINER UN PLAT' AND `question` = 'Qu''est-ce que la table douze a commandé ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'B', 'Léa commence par la soupe.', 'CUISINER UN PLAT', 'PAR LE POULET', 'PAR LA SOUPE', 'PAR LE DESSERT', 'PAR LA PURÉE', 'Par quoi Léa commence-t-elle ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'CUISINER UN PLAT' AND `question` = 'Par quoi Léa commence-t-elle ?');
UPDATE `exercises` SET `correct_answer` = 'B' WHERE `lesson_title` = 'CUISINER UN PLAT' AND `question` = 'Par quoi Léa commence-t-elle ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'C', 'Le chef dit : « Épluche les pommes de terre et coupe les oignons. »', 'CUISINER UN PLAT', 'LE POULET', 'LES ASSIETTES', 'LES OIGNONS', 'LA PURÉE', 'Que faut-il couper pour la soupe ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'CUISINER UN PLAT' AND `question` = 'Que faut-il couper pour la soupe ?');
UPDATE `exercises` SET `correct_answer` = 'C' WHERE `lesson_title` = 'CUISINER UN PLAT' AND `question` = 'Que faut-il couper pour la soupe ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'D', 'On fait bouillir l''eau pendant vingt minutes.', 'CUISINER UN PLAT', 'CINQ MINUTES', 'QUARANTE MINUTES', 'UNE HEURE', 'VINGT MINUTES', 'Combien de temps faut-il faire bouillir l''eau ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'CUISINER UN PLAT' AND `question` = 'Combien de temps faut-il faire bouillir l''eau ?');
UPDATE `exercises` SET `correct_answer` = 'D' WHERE `lesson_title` = 'CUISINER UN PLAT' AND `question` = 'Combien de temps faut-il faire bouillir l''eau ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'A', 'On goûte d''abord, puis on ajoute du sel et du poivre.', 'CUISINER UN PLAT', 'APRÈS AVOIR GOÛTÉ LA SOUPE', 'AVANT D''ÉPLUCHER', 'APRÈS AVOIR SORTI LE POULET', 'À LA FIN, DANS L''ASSIETTE', 'Quand ajoute-t-on le sel et le poivre ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'CUISINER UN PLAT' AND `question` = 'Quand ajoute-t-on le sel et le poivre ?');
UPDATE `exercises` SET `correct_answer` = 'A' WHERE `lesson_title` = 'CUISINER UN PLAT' AND `question` = 'Quand ajoute-t-on le sel et le poivre ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'B', 'Le poulet cuit au four à deux cents degrés.', 'CUISINER UN PLAT', 'À CENT DEGRÉS', 'À DEUX CENTS DEGRÉS', 'À CINQUANTE DEGRÉS', 'À TROIS CENTS DEGRÉS', 'À quelle température cuit le poulet ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'CUISINER UN PLAT' AND `question` = 'À quelle température cuit le poulet ?');
UPDATE `exercises` SET `correct_answer` = 'B' WHERE `lesson_title` = 'CUISINER UN PLAT' AND `question` = 'À quelle température cuit le poulet ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'C', 'Le poulet cuit pendant quarante minutes.', 'CUISINER UN PLAT', 'VINGT MINUTES', 'CINQ MINUTES', 'QUARANTE MINUTES', 'DEUX HEURES', 'Combien de temps cuit le poulet ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'CUISINER UN PLAT' AND `question` = 'Combien de temps cuit le poulet ?');
UPDATE `exercises` SET `correct_answer` = 'C' WHERE `lesson_title` = 'CUISINER UN PLAT' AND `question` = 'Combien de temps cuit le poulet ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'D', 'Le chef dit : « Laisse-le reposer cinq minutes, puis coupe-le en tranches. »', 'CUISINER UN PLAT', 'ON LE REMET AU FOUR', 'ON LE LAVE', 'ON LE RÂPE', 'ON LE LAISSE REPOSER CINQ MINUTES', 'Que fait-on avant de couper le poulet ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'CUISINER UN PLAT' AND `question` = 'Que fait-on avant de couper le poulet ?');
UPDATE `exercises` SET `correct_answer` = 'D' WHERE `lesson_title` = 'CUISINER UN PLAT' AND `question` = 'Que fait-on avant de couper le poulet ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'A', 'L''assiette est dressée avec de la purée, deux tranches de poulet et de la sauce.', 'CUISINER UN PLAT', 'DE LA PURÉE, DEUX TRANCHES DE POULET ET DE LA SAUCE', 'DU RIZ ET DE LA SOUPE', 'DES FRITES ET DU POISSON', 'UNE SALADE ET DU FROMAGE', 'Qu''est-ce qu''on met dans l''assiette ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'CUISINER UN PLAT' AND `question` = 'Qu''est-ce qu''on met dans l''assiette ?');
UPDATE `exercises` SET `correct_answer` = 'A' WHERE `lesson_title` = 'CUISINER UN PLAT' AND `question` = 'Qu''est-ce qu''on met dans l''assiette ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'B', '« Départ ! » veut dire que les plats peuvent partir en salle.', 'CUISINER UN PLAT', '« TABLE DOUZE, ATTENTION ! »', '« TABLE DOUZE, DÉPART ! »', '« TABLE DOUZE, FERMÉ ! »', '« TABLE DOUZE, MERCI ! »', 'Que dit le chef à la fin ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'CUISINER UN PLAT' AND `question` = 'Que dit le chef à la fin ?');
UPDATE `exercises` SET `correct_answer` = 'B' WHERE `lesson_title` = 'CUISINER UN PLAT' AND `question` = 'Que dit le chef à la fin ?';
