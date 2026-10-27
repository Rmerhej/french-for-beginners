-- QCM pour les leçons du lot 3 (Les loisirs et les sports, Les voyages et les vacances, Les technologies, Les adjectifs de description, Les verbes du quotidien, Les contraires). Peut être exécuté plusieurs fois sans doublons.
-- À lancer APRÈS frenchdb_9_vocab_lot3.sql :
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_qcm_vocabulaire_5.sql
SET NAMES utf8mb4;

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE FOOTBALL', 'Au football, on marque des buts avec un ballon rond.', 'LES LOISIRS ET LES SPORTS', 'LE FOOTBALL', 'LE TENNIS', 'LA NATATION', 'LE YOGA', 'Quel sport se joue avec un ballon rond et des buts ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES LOISIRS ET LES SPORTS' AND `question` = 'Quel sport se joue avec un ballon rond et des buts ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA NATATION', 'On nage dans la piscine : c''est la natation.', 'LES LOISIRS ET LES SPORTS', 'LE BASKET', 'LA NATATION', 'LE VÉLO', 'LE YOGA', 'Quel sport se pratique dans une piscine ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES LOISIRS ET LES SPORTS' AND `question` = 'Quel sport se pratique dans une piscine ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE TENNIS', 'Au tennis, on frappe la balle avec une raquette.', 'LES LOISIRS ET LES SPORTS', 'LE FOOTBALL', 'LA NATATION', 'LE TENNIS', 'LA DANSE', 'Quel sport se joue avec une raquette et une balle ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES LOISIRS ET LES SPORTS' AND `question` = 'Quel sport se joue avec une raquette et une balle ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE VÉLO', 'Le vélo a deux roues.', 'LES LOISIRS ET LES SPORTS', 'LA NATATION', 'LE YOGA', 'LE FOOTBALL', 'LE VÉLO', 'Quel sport se pratique sur deux roues ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES LOISIRS ET LES SPORTS' AND `question` = 'Quel sport se pratique sur deux roues ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA RANDONNÉE', 'Pendant une randonnée, on marche dans la nature.', 'LES LOISIRS ET LES SPORTS', 'LA RANDONNÉE', 'LA LECTURE', 'LE CINÉMA', 'LA DANSE', 'Quelle activité consiste à marcher longtemps dans la nature ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES LOISIRS ET LES SPORTS' AND `question` = 'Quelle activité consiste à marcher longtemps dans la nature ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA LECTURE', 'On lit un livre : c''est la lecture.', 'LES LOISIRS ET LES SPORTS', 'LA PÊCHE', 'LA LECTURE', 'LE VÉLO', 'LE TENNIS', 'Quelle activité se pratique avec un livre ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES LOISIRS ET LES SPORTS' AND `question` = 'Quelle activité se pratique avec un livre ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'AU CINÉMA', 'On voit les films au cinéma.', 'LES LOISIRS ET LES SPORTS', 'À LA PISCINE', 'À LA PLAGE', 'AU CINÉMA', 'À LA GARE', 'Où va-t-on pour voir un film ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES LOISIRS ET LES SPORTS' AND `question` = 'Où va-t-on pour voir un film ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE JARDINAGE', 'Le jardinage, c''est s''occuper des plantes.', 'LES LOISIRS ET LES SPORTS', 'LA PÊCHE', 'LA DANSE', 'LA MUSIQUE', 'LE JARDINAGE', 'Quelle activité consiste à s''occuper des plantes ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES LOISIRS ET LES SPORTS' AND `question` = 'Quelle activité consiste à s''occuper des plantes ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE ÉQUIPE', 'Une équipe est un groupe de joueurs.', 'LES LOISIRS ET LES SPORTS', 'UNE ÉQUIPE', 'UN MATCH', 'UNE RANDONNÉE', 'UNE LECTURE', 'Comment appelle-t-on un groupe de joueurs qui jouent ensemble ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES LOISIRS ET LES SPORTS' AND `question` = 'Comment appelle-t-on un groupe de joueurs qui jouent ensemble ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA PÊCHE', 'On attrape des poissons avec la pêche.', 'LES LOISIRS ET LES SPORTS', 'LA DANSE', 'LA PÊCHE', 'LE YOGA', 'LE BASKET', 'Quelle activité consiste à attraper des poissons ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES LOISIRS ET LES SPORTS' AND `question` = 'Quelle activité consiste à attraper des poissons ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'SE PROMENER', 'Se promener, c''est marcher pour le plaisir.', 'LES LOISIRS ET LES SPORTS', 'JOUER', 'NAGER', 'SE PROMENER', 'LIRE', 'Quel verbe veut dire marcher tranquillement pour le plaisir ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES LOISIRS ET LES SPORTS' AND `question` = 'Quel verbe veut dire marcher tranquillement pour le plaisir ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'L''AVION', 'L''avion vole dans le ciel.', 'LES VOYAGES ET LES VACANCES', 'LE TRAIN', 'LE BATEAU', 'LA TENTE', 'L''AVION', 'Quel moyen de transport vole dans le ciel ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VOYAGES ET LES VACANCES' AND `question` = 'Quel moyen de transport vole dans le ciel ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'À LA GARE', 'On prend le train à la gare.', 'LES VOYAGES ET LES VACANCES', 'À LA GARE', 'À L''AÉROPORT', 'À LA PLAGE', 'À L''HÔTEL', 'Où attend-on le train ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VOYAGES ET LES VACANCES' AND `question` = 'Où attend-on le train ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'À L''AÉROPORT', 'Les avions partent de l''aéroport.', 'LES VOYAGES ET LES VACANCES', 'À LA GARE', 'À L''AÉROPORT', 'À L''HÔTEL', 'À LA PLAGE', 'Où prend-on l''avion ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VOYAGES ET LES VACANCES' AND `question` = 'Où prend-on l''avion ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE VALISE', 'On range ses vêtements dans une valise.', 'LES VOYAGES ET LES VACANCES', 'UNE TENTE', 'UN HORAIRE', 'UNE VALISE', 'UNE CARTE', 'Que prépare-t-on pour mettre ses vêtements en voyage ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VOYAGES ET LES VACANCES' AND `question` = 'Que prépare-t-on pour mettre ses vêtements en voyage ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN BILLET DE TRAIN', 'Le billet permet de monter dans le train.', 'LES VOYAGES ET LES VACANCES', 'UNE TENTE', 'LA MER', 'UN HORAIRE', 'UN BILLET DE TRAIN', 'Que doit-on acheter pour voyager en train ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VOYAGES ET LES VACANCES' AND `question` = 'Que doit-on acheter pour voyager en train ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DANS UN HÔTEL', 'Un hôtel propose des chambres.', 'LES VOYAGES ET LES VACANCES', 'DANS UN HÔTEL', 'DANS UNE GARE', 'DANS UN AVION', 'DANS UNE VALISE', 'Où dort-on pendant un voyage, avec une chambre et des services ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VOYAGES ET LES VACANCES' AND `question` = 'Où dort-on pendant un voyage, avec une chambre et des services ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA PLAGE', 'Il y a du sable sur la plage.', 'LES VOYAGES ET LES VACANCES', 'LA MONTAGNE', 'LA PLAGE', 'LA GARE', 'LA VALISE', 'Quel endroit est couvert de sable au bord de la mer ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VOYAGES ET LES VACANCES' AND `question` = 'Quel endroit est couvert de sable au bord de la mer ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE CARTE', 'Une carte montre les rues et les lieux.', 'LES VOYAGES ET LES VACANCES', 'UN BILLET DE TRAIN', 'UNE TENTE', 'UNE CARTE', 'UNE VALISE', 'Que lit-on pour trouver son chemin dans une ville ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VOYAGES ET LES VACANCES' AND `question` = 'Que lit-on pour trouver son chemin dans une ville ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'SOUS UNE TENTE', 'Les campeurs dorment sous une tente.', 'LES VOYAGES ET LES VACANCES', 'DANS UN AVION', 'DANS UNE GARE', 'SUR UNE CARTE', 'SOUS UNE TENTE', 'Où dort-on quand on fait du camping ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VOYAGES ET LES VACANCES' AND `question` = 'Où dort-on quand on fait du camping ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN BATEAU', 'Un bateau navigue sur l''eau.', 'LES VOYAGES ET LES VACANCES', 'UN BATEAU', 'UN TRAIN', 'UN AVION', 'UNE VALISE', 'Quel moyen de transport navigue sur l''eau ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VOYAGES ET LES VACANCES' AND `question` = 'Quel moyen de transport navigue sur l''eau ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LES VACANCES', 'Pendant les vacances, on se repose ou on voyage.', 'LES VOYAGES ET LES VACANCES', 'LES HORAIRES', 'LES VACANCES', 'LA GARE', 'LA VALISE', 'Comment appelle-t-on la période où l''on ne travaille pas et où l''on part souvent en voyage ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VOYAGES ET LES VACANCES' AND `question` = 'Comment appelle-t-on la période où l''on ne travaille pas et où l''on part souvent en voyage ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'VISITER', 'Visiter, c''est découvrir un lieu.', 'LES VOYAGES ET LES VACANCES', 'DORMIR', 'MANGER', 'VISITER', 'LIRE', 'Quel verbe veut dire aller voir un lieu touristique ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VOYAGES ET LES VACANCES' AND `question` = 'Quel verbe veut dire aller voir un lieu touristique ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN TÉLÉPHONE', 'On téléphone avec un téléphone.', 'LES TECHNOLOGIES', 'UNE SOURIS', 'UN CLAVIER', 'UN CHARGEUR', 'UN TÉLÉPHONE', 'Quel objet sert à téléphoner et à envoyer des messages ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES TECHNOLOGIES' AND `question` = 'Quel objet sert à téléphoner et à envoyer des messages ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN CLAVIER', 'On tape les lettres sur le clavier.', 'LES TECHNOLOGIES', 'UN CLAVIER', 'UNE SOURIS', 'UN ÉCRAN', 'UNE BATTERIE', 'Avec quoi tape-t-on du texte sur un ordinateur ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES TECHNOLOGIES' AND `question` = 'Avec quoi tape-t-on du texte sur un ordinateur ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE SOURIS', 'On déplace le curseur avec la souris.', 'LES TECHNOLOGIES', 'UN CLAVIER', 'UNE SOURIS', 'UN CHARGEUR', 'UN MOT DE PASSE', 'Avec quoi déplace-t-on le curseur sur l''écran ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES TECHNOLOGIES' AND `question` = 'Avec quoi déplace-t-on le curseur sur l''écran ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'SUR UN ÉCRAN', 'On regarde les images sur un écran.', 'LES TECHNOLOGIES', 'SUR UN CLAVIER', 'SUR UNE SOURIS', 'SUR UN ÉCRAN', 'SUR UN CHARGEUR', 'Sur quoi regarde-t-on une vidéo ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES TECHNOLOGIES' AND `question` = 'Sur quoi regarde-t-on une vidéo ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE WI-FI', 'Le Wi-Fi connecte sans fil à Internet.', 'LES TECHNOLOGIES', 'UN CLAVIER', 'UN APPEL', 'UNE PHOTO', 'LE WI-FI', 'Que faut-il pour se connecter sans fil à Internet ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES TECHNOLOGIES' AND `question` = 'Que faut-il pour se connecter sans fil à Internet ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN MAIL', 'Un mail est un message électronique.', 'LES TECHNOLOGIES', 'UN MAIL', 'UN CHARGEUR', 'UN ÉCRAN', 'UNE BATTERIE', 'Comment appelle-t-on un message envoyé par Internet ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES TECHNOLOGIES' AND `question` = 'Comment appelle-t-on un message envoyé par Internet ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN MOT DE PASSE', 'Le mot de passe protège votre compte.', 'LES TECHNOLOGIES', 'UNE SOURIS', 'UN MOT DE PASSE', 'UN CHARGEUR', 'UN ÉCRAN', 'Que faut-il taper pour protéger l''accès à son compte ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES TECHNOLOGIES' AND `question` = 'Que faut-il taper pour protéger l''accès à son compte ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN CHARGEUR', 'Le chargeur recharge la batterie.', 'LES TECHNOLOGIES', 'UNE SOURIS', 'UN CLAVIER', 'UN CHARGEUR', 'UN MAIL', 'Que branche-t-on pour recharger son téléphone ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES TECHNOLOGIES' AND `question` = 'Que branche-t-on pour recharger son téléphone ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE BATTERIE', 'La batterie donne l''énergie au téléphone.', 'LES TECHNOLOGIES', 'UN CLAVIER', 'UNE SOURIS', 'UN MAIL', 'UNE BATTERIE', 'Que contient un téléphone pour fonctionner sans être branché ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES TECHNOLOGIES' AND `question` = 'Que contient un téléphone pour fonctionner sans être branché ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE PHOTO', 'Un appareil photo prend des photos.', 'LES TECHNOLOGIES', 'UNE PHOTO', 'UN MOT DE PASSE', 'UN CHARGEUR', 'UN ÉCRAN', 'Que prend-on avec un appareil photo ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES TECHNOLOGIES' AND `question` = 'Que prend-on avec un appareil photo ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'TÉLÉCHARGER', 'Télécharger, c''est copier un fichier d''Internet sur son appareil.', 'LES TECHNOLOGIES', 'ENVOYER', 'TÉLÉCHARGER', 'OUVRIR', 'ATTENDRE', 'Quel verbe veut dire enregistrer un fichier depuis Internet sur son appareil ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES TECHNOLOGIES' AND `question` = 'Quel verbe veut dire enregistrer un fichier depuis Internet sur son appareil ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'CHAUVE', 'Une personne chauve n''a pas de cheveux.', 'LES ADJECTIFS DE DESCRIPTION', 'BLOND', 'ROUX', 'CHAUVE', 'BRUN', 'Quel mot décrit quelqu''un qui n''a pas de cheveux ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ADJECTIFS DE DESCRIPTION' AND `question` = 'Quel mot décrit quelqu''un qui n''a pas de cheveux ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'BLOND', 'Les cheveux blonds sont jaune clair.', 'LES ADJECTIFS DE DESCRIPTION', 'BRUN', 'ROUX', 'CHAUVE', 'BLOND', 'Quel mot décrit quelqu''un qui a les cheveux jaune clair ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ADJECTIFS DE DESCRIPTION' AND `question` = 'Quel mot décrit quelqu''un qui a les cheveux jaune clair ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ROUX', 'Les cheveux roux sont orange ou rouges.', 'LES ADJECTIFS DE DESCRIPTION', 'ROUX', 'BLOND', 'BRUN', 'BARBU', 'Quel mot décrit quelqu''un qui a les cheveux orange ou rouges ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ADJECTIFS DE DESCRIPTION' AND `question` = 'Quel mot décrit quelqu''un qui a les cheveux orange ou rouges ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'BARBU', 'Un homme barbu a de la barbe.', 'LES ADJECTIFS DE DESCRIPTION', 'CHAUVE', 'BARBU', 'BLOND', 'BRUN', 'Quel mot décrit un homme qui a de la barbe ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ADJECTIFS DE DESCRIPTION' AND `question` = 'Quel mot décrit un homme qui a de la barbe ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'TIMIDE', 'Une personne timide n''ose pas parler.', 'LES ADJECTIFS DE DESCRIPTION', 'BAVARD', 'DRÔLE', 'TIMIDE', 'COURAGEUX', 'Comment est une personne qui a peur de parler aux autres ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ADJECTIFS DE DESCRIPTION' AND `question` = 'Comment est une personne qui a peur de parler aux autres ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'BAVARD', 'Une personne bavarde parle beaucoup.', 'LES ADJECTIFS DE DESCRIPTION', 'TIMIDE', 'CALME', 'PARESSEUX', 'BAVARD', 'Comment est une personne qui parle beaucoup ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ADJECTIFS DE DESCRIPTION' AND `question` = 'Comment est une personne qui parle beaucoup ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DRÔLE', 'Une personne drôle fait rire.', 'LES ADJECTIFS DE DESCRIPTION', 'DRÔLE', 'TIMIDE', 'PARESSEUX', 'CHAUVE', 'Comment est une personne qui fait rire les autres ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ADJECTIFS DE DESCRIPTION' AND `question` = 'Comment est une personne qui fait rire les autres ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'PARESSEUX', 'Une personne paresseuse n''aime pas faire d''efforts.', 'LES ADJECTIFS DE DESCRIPTION', 'COURAGEUX', 'PARESSEUX', 'INTELLIGENT', 'GENTIL', 'Comment est une personne qui n''aime pas travailler ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ADJECTIFS DE DESCRIPTION' AND `question` = 'Comment est une personne qui n''aime pas travailler ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'INTELLIGENT', 'Une personne intelligente comprend vite.', 'LES ADJECTIFS DE DESCRIPTION', 'PARESSEUX', 'TIMIDE', 'INTELLIGENT', 'BARBU', 'Comment est une personne qui comprend vite et a beaucoup d''idées ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ADJECTIFS DE DESCRIPTION' AND `question` = 'Comment est une personne qui comprend vite et a beaucoup d''idées ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'COURAGEUX', 'Une personne courageuse n''a pas peur.', 'LES ADJECTIFS DE DESCRIPTION', 'TIMIDE', 'PARESSEUX', 'BAVARD', 'COURAGEUX', 'Comment est une personne qui n''a pas peur du danger ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ADJECTIFS DE DESCRIPTION' AND `question` = 'Comment est une personne qui n''a pas peur du danger ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'GENTIL', 'Une personne gentille est aimable.', 'LES ADJECTIFS DE DESCRIPTION', 'GENTIL', 'PARESSEUX', 'TIMIDE', 'BARBU', 'Quel mot décrit une personne aimable avec tout le monde ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ADJECTIFS DE DESCRIPTION' AND `question` = 'Quel mot décrit une personne aimable avec tout le monde ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'JEUNE', 'Jeune est le contraire de vieux.', 'LES ADJECTIFS DE DESCRIPTION', 'CHAUVE', 'JEUNE', 'BARBU', 'ROUX', 'Quel est le contraire de « vieux » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ADJECTIFS DE DESCRIPTION' AND `question` = 'Quel est le contraire de « vieux » ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'SE RÉVEILLER', 'On se réveille le matin.', 'LES VERBES DU QUOTIDIEN', 'DORMIR', 'SE COUCHER', 'SE RÉVEILLER', 'MANGER', 'Quel verbe veut dire ouvrir les yeux le matin ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VERBES DU QUOTIDIEN' AND `question` = 'Quel verbe veut dire ouvrir les yeux le matin ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ON DORT', 'On dort la nuit.', 'LES VERBES DU QUOTIDIEN', 'ON COURT', 'ON TRAVAILLE', 'ON MANGE', 'ON DORT', 'Que fait-on la nuit dans son lit ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VERBES DU QUOTIDIEN' AND `question` = 'Que fait-on la nuit dans son lit ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ON MANGE', 'On mange à table.', 'LES VERBES DU QUOTIDIEN', 'ON MANGE', 'ON ÉCRIT', 'ON ÉCOUTE', 'ON COURT', 'Que fait-on à table ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VERBES DU QUOTIDIEN' AND `question` = 'Que fait-on à table ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LES OREILLES', 'On écoute avec les oreilles.', 'LES VERBES DU QUOTIDIEN', 'LES YEUX', 'LES OREILLES', 'LA BOUCHE', 'LES MAINS', 'Avec quelle partie du corps écoute-t-on la musique ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VERBES DU QUOTIDIEN' AND `question` = 'Avec quelle partie du corps écoute-t-on la musique ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ON REGARDE', 'On regarde avec les yeux.', 'LES VERBES DU QUOTIDIEN', 'ON ÉCOUTE', 'ON PARLE', 'ON REGARDE', 'ON MANGE', 'Que fait-on avec les yeux ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VERBES DU QUOTIDIEN' AND `question` = 'Que fait-on avec les yeux ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ON LIT', 'On lit un livre.', 'LES VERBES DU QUOTIDIEN', 'ON COURT', 'ON DORT', 'ON BOIT', 'ON LIT', 'Que fait-on avec un livre ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VERBES DU QUOTIDIEN' AND `question` = 'Que fait-on avec un livre ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ON ÉCRIT', 'On écrit avec un stylo.', 'LES VERBES DU QUOTIDIEN', 'ON ÉCRIT', 'ON COURT', 'ON BOIT', 'ON DORT', 'Que fait-on avec un stylo ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VERBES DU QUOTIDIEN' AND `question` = 'Que fait-on avec un stylo ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'COURIR', 'Courir, c''est aller plus vite que marcher.', 'LES VERBES DU QUOTIDIEN', 'MARCHER', 'COURIR', 'DORMIR', 'ATTENDRE', 'Quel verbe veut dire aller très vite à pied ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VERBES DU QUOTIDIEN' AND `question` = 'Quel verbe veut dire aller très vite à pied ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ON ATTEND', 'On attend le bus.', 'LES VERBES DU QUOTIDIEN', 'ON DORT', 'ON ÉCRIT', 'ON ATTEND', 'ON TRAVAILLE', 'Que fait-on à l''arrêt de bus quand le bus n''est pas là ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VERBES DU QUOTIDIEN' AND `question` = 'Que fait-on à l''arrêt de bus quand le bus n''est pas là ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ON LES CHERCHE', 'On cherche ses clés.', 'LES VERBES DU QUOTIDIEN', 'ON LES MANGE', 'ON LES BOIT', 'ON LES ÉCOUTE', 'ON LES CHERCHE', 'Que fait-on quand on ne retrouve plus ses clés ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VERBES DU QUOTIDIEN' AND `question` = 'Que fait-on quand on ne retrouve plus ses clés ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ON L''OUVRE', 'On ouvre la porte pour entrer.', 'LES VERBES DU QUOTIDIEN', 'ON L''OUVRE', 'ON LA MANGE', 'ON LA BOIT', 'ON LA LIT', 'Que fait-on avec une porte pour entrer ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VERBES DU QUOTIDIEN' AND `question` = 'Que fait-on avec une porte pour entrer ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ON SE COUCHE', 'On se couche avant de dormir.', 'LES VERBES DU QUOTIDIEN', 'ON SE RÉVEILLE', 'ON SE COUCHE', 'ON SE LÈVE', 'ON TRAVAILLE', 'Que fait-on le soir avant de dormir ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VERBES DU QUOTIDIEN' AND `question` = 'Que fait-on le soir avant de dormir ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'FROID', 'Froid est le contraire de chaud.', 'LES CONTRAIRES', 'HAUT', 'LENT', 'FROID', 'PROPRE', 'Quel est le contraire de « chaud » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES CONTRAIRES' AND `question` = 'Quel est le contraire de « chaud » ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'FERMÉ', 'Fermé est le contraire d''ouvert.', 'LES CONTRAIRES', 'VIDE', 'FACILE', 'LENT', 'FERMÉ', 'Quel est le contraire de « ouvert » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES CONTRAIRES' AND `question` = 'Quel est le contraire de « ouvert » ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'VIDE', 'Vide est le contraire de plein.', 'LES CONTRAIRES', 'VIDE', 'FROID', 'SALE', 'LOURD', 'Quel est le contraire de « plein » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES CONTRAIRES' AND `question` = 'Quel est le contraire de « plein » ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LÉGER', 'Léger est le contraire de lourd.', 'LES CONTRAIRES', 'LENT', 'LÉGER', 'SALE', 'FERMÉ', 'Quel est le contraire de « lourd » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES CONTRAIRES' AND `question` = 'Quel est le contraire de « lourd » ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LENT', 'Lent est le contraire de rapide.', 'LES CONTRAIRES', 'LÉGER', 'CHAUD', 'LENT', 'PLEIN', 'Quel est le contraire de « rapide » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES CONTRAIRES' AND `question` = 'Quel est le contraire de « rapide » ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'SALE', 'Sale est le contraire de propre.', 'LES CONTRAIRES', 'LENT', 'FROID', 'VIDE', 'SALE', 'Quel est le contraire de « propre » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES CONTRAIRES' AND `question` = 'Quel est le contraire de « propre » ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DIFFICILE', 'Difficile est le contraire de facile.', 'LES CONTRAIRES', 'DIFFICILE', 'BAS', 'PLEIN', 'CHAUD', 'Quel est le contraire de « facile » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES CONTRAIRES' AND `question` = 'Quel est le contraire de « facile » ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'MAUVAIS', 'Mauvais est le contraire de bon.', 'LES CONTRAIRES', 'LOURD', 'MAUVAIS', 'VIDE', 'HAUT', 'Quel est le contraire de « bon » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES CONTRAIRES' AND `question` = 'Quel est le contraire de « bon » ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'BAS', 'Bas est le contraire de haut.', 'LES CONTRAIRES', 'PLEIN', 'LENT', 'BAS', 'PROPRE', 'Quel est le contraire de « haut » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES CONTRAIRES' AND `question` = 'Quel est le contraire de « haut » ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'FERMÉ', 'Un magasin non ouvert est fermé.', 'LES CONTRAIRES', 'OUVERT', 'PLEIN', 'PROPRE', 'FERMÉ', 'Le magasin n''est pas ouvert : il est…' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES CONTRAIRES' AND `question` = 'Le magasin n''est pas ouvert : il est…');
