-- QCM pour les 4 leçons du lot 1 (aliments, boissons, mairie, logement). Peut être exécuté plusieurs fois sans doublons.
-- À lancer APRÈS frenchdb_9_vocab_lot1.sql :
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_qcm_vocabulaire_3.sql
SET NAMES utf8mb4;

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE LAIT', 'Le lait est une boisson blanche produite par la vache.', 'LES ALIMENTS DE BASE', 'LE LAIT', 'LE RIZ', 'LE PAIN', 'LE SEL', 'Quel produit blanc se boit et vient de la vache ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ALIMENTS DE BASE' AND `question` = 'Quel produit blanc se boit et vient de la vache ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE PAIN', 'On achète le pain à la boulangerie.', 'LES ALIMENTS DE BASE', 'LE POISSON', 'LE PAIN', 'LE JAMBON', 'LE MIEL', 'Quel aliment achète-t-on à la boulangerie ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ALIMENTS DE BASE' AND `question` = 'Quel aliment achète-t-on à la boulangerie ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE POULET', 'Le poulet est une volaille.', 'LES ALIMENTS DE BASE', 'LE SUCRE', 'LE BEURRE', 'LE POULET', 'LA SOUPE', 'Quel aliment est une viande de volaille ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ALIMENTS DE BASE' AND `question` = 'Quel aliment est une viande de volaille ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE POISSON', 'Le poisson vit dans l''eau.', 'LES ALIMENTS DE BASE', 'LE JAMBON', 'LE POULET', 'LE FROMAGE', 'LE POISSON', 'Quel aliment vit dans l''eau avant d''être cuisiné ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ALIMENTS DE BASE' AND `question` = 'Quel aliment vit dans l''eau avant d''être cuisiné ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE SEL', 'Le sel donne du goût salé.', 'LES ALIMENTS DE BASE', 'LE SEL', 'LE SUCRE', 'LE MIEL', 'LA FARINE', 'Que met-on sur la table pour saler un plat ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ALIMENTS DE BASE' AND `question` = 'Que met-on sur la table pour saler un plat ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE MIEL', 'Les abeilles fabriquent le miel.', 'LES ALIMENTS DE BASE', 'LE SUCRE', 'LE MIEL', 'LE BEURRE', 'LE SEL', 'Quel aliment sucré est produit par les abeilles ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ALIMENTS DE BASE' AND `question` = 'Quel aliment sucré est produit par les abeilles ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA FARINE', 'On fait le pain avec de la farine, de l''eau et du sel.', 'LES ALIMENTS DE BASE', 'LE POISSON', 'LA SOUPE', 'LA FARINE', 'LE JAMBON', 'Avec quel produit fait-on le pain ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ALIMENTS DE BASE' AND `question` = 'Avec quel produit fait-on le pain ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA SOUPE', 'On mange la soupe avec une cuillère.', 'LES ALIMENTS DE BASE', 'LE JAMBON', 'LE FROMAGE', 'LA SALADE', 'LA SOUPE', 'Quel plat liquide et chaud mange-t-on avec une cuillère ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ALIMENTS DE BASE' AND `question` = 'Quel plat liquide et chaud mange-t-on avec une cuillère ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE GÂTEAU', 'Le gâteau d''anniversaire est un dessert.', 'LES ALIMENTS DE BASE', 'LE GÂTEAU', 'LE SEL', 'LE POULET', 'LA SOUPE', 'Que mange-t-on souvent pour un anniversaire ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ALIMENTS DE BASE' AND `question` = 'Que mange-t-on souvent pour un anniversaire ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN ŒUF', 'La poule pond des œufs.', 'LES ALIMENTS DE BASE', 'DU BEURRE', 'UN ŒUF', 'DU RIZ', 'DU LAIT', 'Quel produit la poule pond-elle ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ALIMENTS DE BASE' AND `question` = 'Quel produit la poule pond-elle ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'L''EAU', 'L''eau n''a ni couleur ni goût.', 'LES BOISSONS', 'LE VIN', 'LE CAFÉ', 'L''EAU', 'LA BIÈRE', 'Quelle boisson est incolore et sans goût ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES BOISSONS' AND `question` = 'Quelle boisson est incolore et sans goût ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE CAFÉ', 'Le café contient de la caféine.', 'LES BOISSONS', 'LA LIMONADE', 'LE JUS D''ORANGE', 'LE SIROP', 'LE CAFÉ', 'Quelle boisson chaude prend-on souvent le matin et contient de la caféine ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES BOISSONS' AND `question` = 'Quelle boisson chaude prend-on souvent le matin et contient de la caféine ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE JUS D''ORANGE', 'Le jus d''orange vient des oranges.', 'LES BOISSONS', 'LE JUS D''ORANGE', 'LE THÉ', 'LE CAFÉ', 'LA BIÈRE', 'Quelle boisson est faite avec des oranges ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES BOISSONS' AND `question` = 'Quelle boisson est faite avec des oranges ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE TASSE', 'On boit le café dans une tasse.', 'LES BOISSONS', 'UNE BOUTEILLE', 'UNE TASSE', 'UNE ASSIETTE', 'UNE FOURCHETTE', 'Dans quoi boit-on son café ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES BOISSONS' AND `question` = 'Dans quoi boit-on son café ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE BOUTEILLE', 'On achète l''eau en bouteille.', 'LES BOISSONS', 'UNE TASSE', 'UNE ASSIETTE', 'UNE BOUTEILLE', 'UN COUTEAU', 'Quel récipient contient souvent de l''eau et se vend au supermarché ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES BOISSONS' AND `question` = 'Quel récipient contient souvent de l''eau et se vend au supermarché ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DES GLAÇONS', 'Les glaçons rendent la boisson froide.', 'LES BOISSONS', 'DU SEL', 'DU PAIN', 'DU RIZ', 'DES GLAÇONS', 'Que met-on dans une boisson pour la rafraîchir ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES BOISSONS' AND `question` = 'Que met-on dans une boisson pour la rafraîchir ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'L''EAU GAZEUSE', 'L''eau gazeuse contient des bulles.', 'LES BOISSONS', 'L''EAU GAZEUSE', 'LE LAIT', 'LE CAFÉ', 'LE SIROP', 'Quelle boisson pétille ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES BOISSONS' AND `question` = 'Quelle boisson pétille ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE VIN', 'Le vin est fait avec du raisin.', 'LES BOISSONS', 'LE THÉ', 'LE VIN', 'LE JUS D''ORANGE', 'LE CHOCOLAT CHAUD', 'Quelle boisson alcoolisée est faite avec du raisin ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES BOISSONS' AND `question` = 'Quelle boisson alcoolisée est faite avec du raisin ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE CHOCOLAT CHAUD', 'On prépare le chocolat chaud avec du lait.', 'LES BOISSONS', 'LE THÉ', 'LE CAFÉ', 'LE CHOCOLAT CHAUD', 'LA LIMONADE', 'Quelle boisson chaude est faite avec du chocolat et du lait ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES BOISSONS' AND `question` = 'Quelle boisson chaude est faite avec du chocolat et du lait ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE CANETTE', 'Une canette est un petit récipient en métal.', 'LES BOISSONS', 'UNE TASSE', 'UN VERRE', 'UNE CARAFE', 'UNE CANETTE', 'Comment appelle-t-on un petit récipient en métal pour une boisson gazeuse ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES BOISSONS' AND `question` = 'Comment appelle-t-on un petit récipient en métal pour une boisson gazeuse ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'À LA MAIRIE', 'La naissance se déclare à la mairie.', 'À LA MAIRIE ET À LA PRÉFECTURE', 'À LA MAIRIE', 'À LA PHARMACIE', 'AU SUPERMARCHÉ', 'À LA BOULANGERIE', 'Où va-t-on pour déclarer une naissance dans sa commune ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'À LA MAIRIE ET À LA PRÉFECTURE' AND `question` = 'Où va-t-on pour déclarer une naissance dans sa commune ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE PIÈCE D''IDENTITÉ', 'Une pièce d''identité, comme un passeport, prouve qui vous êtes.', 'À LA MAIRIE ET À LA PRÉFECTURE', 'UN FORMULAIRE', 'UNE PIÈCE D''IDENTITÉ', 'UNE ANNONCE', 'UN TIMBRE', 'Quel document prouve votre identité ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'À LA MAIRIE ET À LA PRÉFECTURE' AND `question` = 'Quel document prouve votre identité ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN FORMULAIRE', 'On remplit un formulaire pour faire une demande.', 'À LA MAIRIE ET À LA PRÉFECTURE', 'UN GUICHET', 'UN PASSEPORT', 'UN FORMULAIRE', 'UN VOISIN', 'Que remplit-on pour faire une demande ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'À LA MAIRIE ET À LA PRÉFECTURE' AND `question` = 'Que remplit-on pour faire une demande ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN PASSEPORT', 'Le passeport est le document de voyage.', 'À LA MAIRIE ET À LA PRÉFECTURE', 'UN FORMULAIRE', 'UN JUSTIFICATIF DE DOMICILE', 'UN NUMÉRO', 'UN PASSEPORT', 'Quel document permet de voyager à l''étranger ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'À LA MAIRIE ET À LA PRÉFECTURE' AND `question` = 'Quel document permet de voyager à l''étranger ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN JUSTIFICATIF DE DOMICILE', 'Le justificatif de domicile prouve votre adresse.', 'À LA MAIRIE ET À LA PRÉFECTURE', 'UN JUSTIFICATIF DE DOMICILE', 'UN PASSEPORT', 'UN GUICHET', 'UN RENDEZ-VOUS', 'Quel document prouve l''adresse où vous habitez ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'À LA MAIRIE ET À LA PRÉFECTURE' AND `question` = 'Quel document prouve l''adresse où vous habitez ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN RENDEZ-VOUS', 'Un rendez-vous fixe un jour et une heure.', 'À LA MAIRIE ET À LA PRÉFECTURE', 'UN GUICHET', 'UN RENDEZ-VOUS', 'UNE PHOTOCOPIE', 'UN FORMULAIRE', 'Que prend-on pour venir à une date et à une heure précises ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'À LA MAIRIE ET À LA PRÉFECTURE' AND `question` = 'Que prend-on pour venir à une date et à une heure précises ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE GUICHET', 'On parle à l''employé au guichet.', 'À LA MAIRIE ET À LA PRÉFECTURE', 'LE DOSSIER', 'LA SIGNATURE', 'LE GUICHET', 'LE NUMÉRO', 'Comment s''appelle l''endroit où l''on parle à l''employé ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'À LA MAIRIE ET À LA PRÉFECTURE' AND `question` = 'Comment s''appelle l''endroit où l''on parle à l''employé ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA SIGNATURE', 'On signe en bas du document.', 'À LA MAIRIE ET À LA PRÉFECTURE', 'LE GUICHET', 'LA PHOTOCOPIE', 'LA FILE D''ATTENTE', 'LA SIGNATURE', 'Que met-on en bas d''un document pour le valider ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'À LA MAIRIE ET À LA PRÉFECTURE' AND `question` = 'Que met-on en bas d''un document pour le valider ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE FILE D''ATTENTE', 'Les personnes qui attendent forment une file d''attente.', 'À LA MAIRIE ET À LA PRÉFECTURE', 'UNE FILE D''ATTENTE', 'UN DOSSIER', 'UN PASSEPORT', 'UN ACTE DE NAISSANCE', 'Comment appelle-t-on des personnes qui attendent l''une derrière l''autre ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'À LA MAIRIE ET À LA PRÉFECTURE' AND `question` = 'Comment appelle-t-on des personnes qui attendent l''une derrière l''autre ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE PHOTOCOPIE', 'Une photocopie est une copie du document.', 'À LA MAIRIE ET À LA PRÉFECTURE', 'UNE SIGNATURE', 'UNE PHOTOCOPIE', 'UN NUMÉRO', 'UNE DEMANDE', 'Comment appelle-t-on la copie d''un document ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'À LA MAIRIE ET À LA PRÉFECTURE' AND `question` = 'Comment appelle-t-on la copie d''un document ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'À LA PRÉFECTURE', 'La carte de séjour dépend de la préfecture.', 'À LA MAIRIE ET À LA PRÉFECTURE', 'À LA BOULANGERIE', 'À LA PHARMACIE', 'À LA PRÉFECTURE', 'AU CINÉMA', 'Dans quel lieu dépose-t-on souvent une demande de carte de séjour ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'À LA MAIRIE ET À LA PRÉFECTURE' AND `question` = 'Dans quel lieu dépose-t-on souvent une demande de carte de séjour ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE LOYER', 'Le loyer se paie chaque mois.', 'LE LOGEMENT ET LA LOCATION', 'LA CAUTION', 'LE CONTRAT', 'L''ANNONCE', 'LE LOYER', 'Comment s''appelle la somme payée chaque mois pour louer un logement ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE LOGEMENT ET LA LOCATION' AND `question` = 'Comment s''appelle la somme payée chaque mois pour louer un logement ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE PROPRIÉTAIRE', 'Le propriétaire est la personne à qui appartient le logement.', 'LE LOGEMENT ET LA LOCATION', 'LE PROPRIÉTAIRE', 'LE LOCATAIRE', 'LE VOISIN', 'L''ÉTAGE', 'Qui loue son logement à un locataire ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE LOGEMENT ET LA LOCATION' AND `question` = 'Qui loue son logement à un locataire ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE BAIL', 'Le bail est le contrat de location.', 'LE LOGEMENT ET LA LOCATION', 'LE VOISIN', 'LE BAIL', 'L''ÉTAGE', 'L''ASCENSEUR', 'Quel document signe-t-on avec le propriétaire pour louer un logement ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE LOGEMENT ET LA LOCATION' AND `question` = 'Quel document signe-t-on avec le propriétaire pour louer un logement ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'L''ASCENSEUR', 'L''ascenseur monte aux étages.', 'LE LOGEMENT ET LA LOCATION', 'LA CAUTION', 'LE LOYER', 'L''ASCENSEUR', 'LES CHARGES', 'Que prend-on pour monter au cinquième étage sans les escaliers ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE LOGEMENT ET LA LOCATION' AND `question` = 'Que prend-on pour monter au cinquième étage sans les escaliers ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN VOISIN', 'Un voisin habite près de chez vous.', 'LE LOGEMENT ET LA LOCATION', 'UN ASCENSEUR', 'UN LOYER', 'UN BAIL', 'UN VOISIN', 'Qui habite à côté de chez vous ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE LOGEMENT ET LA LOCATION' AND `question` = 'Qui habite à côté de chez vous ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE ANNONCE', 'Les annonces présentent les logements à louer.', 'LE LOGEMENT ET LA LOCATION', 'UNE ANNONCE', 'UN ASCENSEUR', 'UN VOISIN', 'UN ÉTAGE', 'Que lit-on pour trouver un logement à louer ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE LOGEMENT ET LA LOCATION' AND `question` = 'Que lit-on pour trouver un logement à louer ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN DÉMÉNAGEMENT', 'Déménager, c''est changer de logement.', 'LE LOGEMENT ET LA LOCATION', 'UN ÉTAGE', 'UN DÉMÉNAGEMENT', 'UN LOYER', 'UNE ANNONCE', 'Comment s''appelle le fait de changer de logement avec ses affaires ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE LOGEMENT ET LA LOCATION' AND `question` = 'Comment s''appelle le fait de changer de logement avec ses affaires ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA CAUTION', 'La caution est rendue à la fin si le logement est en bon état.', 'LE LOGEMENT ET LA LOCATION', 'L''ASCENSEUR', 'LE VOISIN', 'LA CAUTION', 'L''ÉTAGE', 'Que verse-t-on au propriétaire au début de la location et que l''on peut récupérer à la fin ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE LOGEMENT ET LA LOCATION' AND `question` = 'Que verse-t-on au propriétaire au début de la location et que l''on peut récupérer à la fin ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'L''ÉTAT DES LIEUX', 'On vérifie l''état du logement avec le propriétaire.', 'LE LOGEMENT ET LA LOCATION', 'LE LOYER', 'LE VOISIN', 'L''ASCENSEUR', 'L''ÉTAT DES LIEUX', 'Que vérifie-t-on à l''entrée et à la sortie du logement ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE LOGEMENT ET LA LOCATION' AND `question` = 'Que vérifie-t-on à l''entrée et à la sortie du logement ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE LOCATAIRE', 'Le locataire loue le logement et paie le loyer.', 'LE LOGEMENT ET LA LOCATION', 'LE LOCATAIRE', 'LE VOISIN', 'LE PROPRIÉTAIRE', 'L''ASCENSEUR', 'Quelle personne paie le loyer pour habiter un logement ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE LOGEMENT ET LA LOCATION' AND `question` = 'Quelle personne paie le loyer pour habiter un logement ?');
