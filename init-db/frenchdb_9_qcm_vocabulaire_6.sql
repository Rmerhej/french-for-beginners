-- QCM pour les leçons du lot 4 (Les vêtements et les accessoires, Les métiers, L'école et les études, Le travail et l'entreprise, Les émotions et les sentiments, La nature et l'environnement). Peut être exécuté plusieurs fois sans doublons.
-- À lancer APRÈS frenchdb_9_vocab_lot4.sql :
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_qcm_vocabulaire_6.sql
SET NAMES utf8mb4;

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DES CHAUSSURES', 'On porte des chaussures aux pieds.', 'LES VÊTEMENTS ET LES ACCESSOIRES', 'DES CHAUSSURES', 'DES GANTS', 'UNE ÉCHARPE', 'UN CHAPEAU', 'Que met-on aux pieds pour marcher dans la rue ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VÊTEMENTS ET LES ACCESSOIRES' AND `question` = 'Que met-on aux pieds pour marcher dans la rue ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DES GANTS', 'Les gants protègent les mains du froid.', 'LES VÊTEMENTS ET LES ACCESSOIRES', 'DES CHAUSSETTES', 'DES GANTS', 'DES LUNETTES', 'UNE ROBE', 'Que met-on sur les mains quand il fait très froid ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VÊTEMENTS ET LES ACCESSOIRES' AND `question` = 'Que met-on sur les mains quand il fait très froid ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE ÉCHARPE', 'Une écharpe se met autour du cou.', 'LES VÊTEMENTS ET LES ACCESSOIRES', 'UNE CASQUETTE', 'UN PANTALON', 'UNE ÉCHARPE', 'UN MAILLOT DE BAIN', 'Que met-on autour du cou en hiver ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VÊTEMENTS ET LES ACCESSOIRES' AND `question` = 'Que met-on autour du cou en hiver ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN MAILLOT DE BAIN', 'On porte un maillot de bain pour nager.', 'LES VÊTEMENTS ET LES ACCESSOIRES', 'UN MANTEAU', 'UN COSTUME', 'DES BOTTES', 'UN MAILLOT DE BAIN', 'Que met-on pour nager à la piscine ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VÊTEMENTS ET LES ACCESSOIRES' AND `question` = 'Que met-on pour nager à la piscine ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DES LUNETTES', 'Les lunettes aident à mieux voir.', 'LES VÊTEMENTS ET LES ACCESSOIRES', 'DES LUNETTES', 'DES GANTS', 'UN SAC À MAIN', 'UNE CHEMISE', 'Que met-on pour lire quand on voit mal ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VÊTEMENTS ET LES ACCESSOIRES' AND `question` = 'Que met-on pour lire quand on voit mal ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN PANTALON', 'Un pantalon couvre les jambes.', 'LES VÊTEMENTS ET LES ACCESSOIRES', 'UNE ÉCHARPE', 'UN PANTALON', 'UN CHAPEAU', 'UNE CASQUETTE', 'Quel vêtement met-on sur les jambes ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VÊTEMENTS ET LES ACCESSOIRES' AND `question` = 'Quel vêtement met-on sur les jambes ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN MANTEAU', 'Un manteau est chaud : on le met dehors en hiver.', 'LES VÊTEMENTS ET LES ACCESSOIRES', 'UN T-SHIRT', 'UN MAILLOT DE BAIN', 'UN MANTEAU', 'UNE ROBE', 'Quel vêtement épais met-on par-dessus les autres quand il fait froid ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VÊTEMENTS ET LES ACCESSOIRES' AND `question` = 'Quel vêtement épais met-on par-dessus les autres quand il fait froid ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DES CHAUSSETTES', 'Les chaussettes se mettent dans les chaussures.', 'LES VÊTEMENTS ET LES ACCESSOIRES', 'DES GANTS', 'UNE ÉCHARPE', 'UNE CEINTURE', 'DES CHAUSSETTES', 'Que met-on dans les chaussures ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VÊTEMENTS ET LES ACCESSOIRES' AND `question` = 'Que met-on dans les chaussures ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'PORTER', 'Porter un vêtement, c''est l''avoir sur soi.', 'LES VÊTEMENTS ET LES ACCESSOIRES', 'PORTER', 'ACHETER', 'ESSAYER', 'CHERCHER', 'Comment dit-on « to wear » en français ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VÊTEMENTS ET LES ACCESSOIRES' AND `question` = 'Comment dit-on « to wear » en français ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN MÉDECIN', 'Le médecin soigne les malades.', 'LES MÉTIERS', 'UN VENDEUR', 'UN MÉDECIN', 'UN BOULANGER', 'UN PILOTE', 'Qui soigne les malades à l''hôpital ou au cabinet ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES MÉTIERS' AND `question` = 'Qui soigne les malades à l''hôpital ou au cabinet ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN BOULANGER', 'Le boulanger fait le pain.', 'LES MÉTIERS', 'UN POMPIER', 'UN COIFFEUR', 'UN BOULANGER', 'UN AVOCAT', 'Qui fait le pain ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES MÉTIERS' AND `question` = 'Qui fait le pain ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN POMPIER', 'Le pompier éteint le feu.', 'LES MÉTIERS', 'UN POLICIER', 'UN VENDEUR', 'UN DENTISTE', 'UN POMPIER', 'Qui éteint les incendies ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES MÉTIERS' AND `question` = 'Qui éteint les incendies ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN VENDEUR', 'Le vendeur vend des produits aux clients.', 'LES MÉTIERS', 'UN VENDEUR', 'UN MÉCANICIEN', 'UN OUVRIER', 'UN ARTISTE', 'Qui vend des produits dans un magasin ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES MÉTIERS' AND `question` = 'Qui vend des produits dans un magasin ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN COIFFEUR', 'Le coiffeur coupe les cheveux.', 'LES MÉTIERS', 'UN DENTISTE', 'UN COIFFEUR', 'UN PROFESSEUR', 'UN AGRICULTEUR', 'Qui coupe les cheveux ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES MÉTIERS' AND `question` = 'Qui coupe les cheveux ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN MÉCANICIEN', 'Le mécanicien répare les voitures.', 'LES MÉTIERS', 'UN PILOTE', 'UN CUISINIER', 'UN MÉCANICIEN', 'UN AVOCAT', 'Qui répare une voiture ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES MÉTIERS' AND `question` = 'Qui répare une voiture ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN PILOTE', 'Le pilote conduit l''avion.', 'LES MÉTIERS', 'UN POLICIER', 'UN VENDEUR', 'UN COIFFEUR', 'UN PILOTE', 'Qui conduit un avion ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES MÉTIERS' AND `question` = 'Qui conduit un avion ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN DENTISTE', 'Le dentiste soigne les dents.', 'LES MÉTIERS', 'UN DENTISTE', 'UN COIFFEUR', 'UN CUISINIER', 'UN OUVRIER', 'Qui soigne les dents ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES MÉTIERS' AND `question` = 'Qui soigne les dents ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN AGRICULTEUR', 'L''agriculteur cultive la terre.', 'LES MÉTIERS', 'UN AVOCAT', 'UN AGRICULTEUR', 'UN INFORMATICIEN', 'UN DENTISTE', 'Qui travaille dans les champs ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES MÉTIERS' AND `question` = 'Qui travaille dans les champs ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'À L''ÉCOLE', 'Les enfants apprennent à l''école.', 'L''ÉCOLE ET LES ÉTUDES', 'À LA GARE', 'À LA POSTE', 'À L''ÉCOLE', 'À LA PLAGE', 'Où vont les enfants pour apprendre ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'L''ÉCOLE ET LES ÉTUDES' AND `question` = 'Où vont les enfants pour apprendre ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN STYLO', 'On écrit à l''encre avec un stylo.', 'L''ÉCOLE ET LES ÉTUDES', 'UN CRAYON', 'UNE RÈGLE', 'DES CISEAUX', 'UN STYLO', 'Avec quoi écrit-on à l''encre ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'L''ÉCOLE ET LES ÉTUDES' AND `question` = 'Avec quoi écrit-on à l''encre ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE RÈGLE', 'Une règle sert à tracer des lignes droites.', 'L''ÉCOLE ET LES ÉTUDES', 'UNE RÈGLE', 'UNE GOMME', 'UN CAHIER', 'UN CARTABLE', 'Avec quoi trace-t-on une ligne droite ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'L''ÉCOLE ET LES ÉTUDES' AND `question` = 'Avec quoi trace-t-on une ligne droite ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DES CISEAUX', 'Des ciseaux coupent le papier.', 'L''ÉCOLE ET LES ÉTUDES', 'UN CRAYON', 'DES CISEAUX', 'UN LIVRE', 'UNE RÈGLE', 'Avec quoi coupe-t-on du papier ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'L''ÉCOLE ET LES ÉTUDES' AND `question` = 'Avec quoi coupe-t-on du papier ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN CARTABLE', 'Le cartable contient les affaires de l''élève.', 'L''ÉCOLE ET LES ÉTUDES', 'UN CAHIER', 'UNE NOTE', 'UN CARTABLE', 'UN DIPLÔME', 'Que porte l''élève sur le dos avec ses affaires ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'L''ÉCOLE ET LES ÉTUDES' AND `question` = 'Que porte l''élève sur le dos avec ses affaires ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA RÉCRÉATION', 'Pendant la récréation, les élèves jouent.', 'L''ÉCOLE ET LES ÉTUDES', 'UN EXAMEN', 'UN DEVOIR', 'UN DIPLÔME', 'LA RÉCRÉATION', 'Comment appelle-t-on le temps de jeu entre deux cours ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'L''ÉCOLE ET LES ÉTUDES' AND `question` = 'Comment appelle-t-on le temps de jeu entre deux cours ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'À LA BIBLIOTHÈQUE', 'On emprunte des livres à la bibliothèque.', 'L''ÉCOLE ET LES ÉTUDES', 'À LA BIBLIOTHÈQUE', 'À LA BOULANGERIE', 'À LA PISCINE', 'À LA GARE', 'Où peut-on emprunter des livres ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'L''ÉCOLE ET LES ÉTUDES' AND `question` = 'Où peut-on emprunter des livres ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN DIPLÔME', 'Un diplôme prouve qu''on a fini ses études.', 'L''ÉCOLE ET LES ÉTUDES', 'UN CAHIER', 'UN DIPLÔME', 'UN CARTABLE', 'UNE RÈGLE', 'Comment appelle-t-on le papier qu''on reçoit à la fin des études ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'L''ÉCOLE ET LES ÉTUDES' AND `question` = 'Comment appelle-t-on le papier qu''on reçoit à la fin des études ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'SES DEVOIRS', 'On fait ses devoirs à la maison.', 'L''ÉCOLE ET LES ÉTUDES', 'UN EXAMEN', 'SA RÉCRÉATION', 'SES DEVOIRS', 'SON CARTABLE', 'Que fait un élève à la maison le soir pour l''école ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'L''ÉCOLE ET LES ÉTUDES' AND `question` = 'Que fait un élève à la maison le soir pour l''école ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN SALAIRE', 'Le salaire est l''argent qu''on reçoit pour son travail.', 'LE TRAVAIL ET L''ENTREPRISE', 'UN CONGÉ', 'UN STAGE', 'UN CLIENT', 'UN SALAIRE', 'Comment appelle-t-on l''argent reçu chaque mois pour son travail ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE TRAVAIL ET L''ENTREPRISE' AND `question` = 'Comment appelle-t-on l''argent reçu chaque mois pour son travail ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN PATRON', 'Le patron dirige l''entreprise.', 'LE TRAVAIL ET L''ENTREPRISE', 'UN PATRON', 'UN COLLÈGUE', 'UN CLIENT', 'UN STAGIAIRE', 'Comment appelle-t-on la personne qui dirige l''entreprise ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE TRAVAIL ET L''ENTREPRISE' AND `question` = 'Comment appelle-t-on la personne qui dirige l''entreprise ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN COLLÈGUE', 'Un collègue travaille dans la même entreprise.', 'LE TRAVAIL ET L''ENTREPRISE', 'UN CLIENT', 'UN COLLÈGUE', 'UN PATRON', 'UN VOISIN', 'Comment appelle-t-on une personne qui travaille avec vous ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE TRAVAIL ET L''ENTREPRISE' AND `question` = 'Comment appelle-t-on une personne qui travaille avec vous ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN CV', 'On envoie un CV pour chercher un travail.', 'LE TRAVAIL ET L''ENTREPRISE', 'UN CONGÉ', 'UN SALAIRE', 'UN CV', 'UNE USINE', 'Quel document présente vos études et vos expériences ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE TRAVAIL ET L''ENTREPRISE' AND `question` = 'Quel document présente vos études et vos expériences ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN ENTRETIEN D''EMBAUCHE', 'On passe un entretien d''embauche pour obtenir un emploi.', 'LE TRAVAIL ET L''ENTREPRISE', 'UNE RÉUNION', 'UN CONGÉ', 'UN STAGE', 'UN ENTRETIEN D''EMBAUCHE', 'Comment appelle-t-on un rendez-vous pour obtenir un emploi ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE TRAVAIL ET L''ENTREPRISE' AND `question` = 'Comment appelle-t-on un rendez-vous pour obtenir un emploi ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA RETRAITE', 'À la retraite, on ne travaille plus.', 'LE TRAVAIL ET L''ENTREPRISE', 'LA RETRAITE', 'LE CHÔMAGE', 'UN STAGE', 'UN CONGÉ', 'Comment appelle-t-on le moment où on ne travaille plus, à un âge avancé ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE TRAVAIL ET L''ENTREPRISE' AND `question` = 'Comment appelle-t-on le moment où on ne travaille plus, à un âge avancé ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE CHÔMAGE', 'Au chômage, on n''a pas d''emploi.', 'LE TRAVAIL ET L''ENTREPRISE', 'LA RETRAITE', 'LE CHÔMAGE', 'UN CONGÉ', 'UNE RÉUNION', 'Comment appelle-t-on la situation d''une personne sans emploi ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE TRAVAIL ET L''ENTREPRISE' AND `question` = 'Comment appelle-t-on la situation d''une personne sans emploi ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DANS UNE USINE', 'Les produits sont fabriqués dans une usine.', 'LE TRAVAIL ET L''ENTREPRISE', 'DANS UN BUREAU', 'DANS UNE ÉCOLE', 'DANS UNE USINE', 'À LA MAIRIE', 'Où fabrique-t-on beaucoup de produits avec des machines ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE TRAVAIL ET L''ENTREPRISE' AND `question` = 'Où fabrique-t-on beaucoup de produits avec des machines ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ELLE L''EMBAUCHE', 'Embaucher, c''est donner un emploi à quelqu''un.', 'LE TRAVAIL ET L''ENTREPRISE', 'ELLE LE LICENCIE', 'ELLE LE VISITE', 'ELLE LE PORTE', 'ELLE L''EMBAUCHE', 'Que fait une entreprise quand elle donne un travail à quelqu''un ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE TRAVAIL ET L''ENTREPRISE' AND `question` = 'Que fait une entreprise quand elle donne un travail à quelqu''un ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'HEUREUX', 'Quand on est heureux, on se sent bien.', 'LES ÉMOTIONS ET LES SENTIMENTS', 'HEUREUX', 'TRISTE', 'EN COLÈRE', 'DÉÇU', 'Comment est-on quand on rit et qu''on se sent bien ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ÉMOTIONS ET LES SENTIMENTS' AND `question` = 'Comment est-on quand on rit et qu''on se sent bien ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'TRISTE', 'On est triste quand on a de la peine.', 'LES ÉMOTIONS ET LES SENTIMENTS', 'CONTENT', 'TRISTE', 'FIER', 'AMOUREUX', 'Comment est-on quand on pleure parce qu''on a de la peine ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ÉMOTIONS ET LES SENTIMENTS' AND `question` = 'Comment est-on quand on pleure parce qu''on a de la peine ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'EN COLÈRE', 'Quand on est fâché, on est en colère.', 'LES ÉMOTIONS ET LES SENTIMENTS', 'HEUREUX', 'FIER', 'EN COLÈRE', 'SURPRIS', 'Comment est-on quand on est très fâché ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ÉMOTIONS ET LES SENTIMENTS' AND `question` = 'Comment est-on quand on est très fâché ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'FATIGUÉ', 'Après une longue journée, on est fatigué.', 'LES ÉMOTIONS ET LES SENTIMENTS', 'AMOUREUX', 'SURPRIS', 'FIER', 'FATIGUÉ', 'Comment est-on après une longue journée de travail ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ÉMOTIONS ET LES SENTIMENTS' AND `question` = 'Comment est-on après une longue journée de travail ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'STRESSÉ', 'Avant un examen, beaucoup de personnes sont stressées.', 'LES ÉMOTIONS ET LES SENTIMENTS', 'STRESSÉ', 'ENNUYÉ', 'AMOUREUX', 'HEUREUX', 'Comment est-on avant un examen important ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ÉMOTIONS ET LES SENTIMENTS' AND `question` = 'Comment est-on avant un examen important ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DE L''INQUIÉTUDE', 'On est inquiet quand on attend une nouvelle importante.', 'LES ÉMOTIONS ET LES SENTIMENTS', 'DE LA JOIE', 'DE L''INQUIÉTUDE', 'DE LA FIERTÉ', 'DE L''ENNUI', 'Que ressent-on quand on attend un résultat qui ne vient pas ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ÉMOTIONS ET LES SENTIMENTS' AND `question` = 'Que ressent-on quand on attend un résultat qui ne vient pas ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'PLEURER', 'Pleurer, c''est avoir des larmes.', 'LES ÉMOTIONS ET LES SENTIMENTS', 'RIRE', 'SOURIRE', 'PLEURER', 'S''ENNUYER', 'Quel verbe signifie « to cry » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ÉMOTIONS ET LES SENTIMENTS' AND `question` = 'Quel verbe signifie « to cry » ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'RIRE', 'Rire, c''est montrer qu''on s''amuse.', 'LES ÉMOTIONS ET LES SENTIMENTS', 'PLEURER', 'AVOIR PEUR', 'S''ENNUYER', 'RIRE', 'Quel verbe signifie « to laugh » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ÉMOTIONS ET LES SENTIMENTS' AND `question` = 'Quel verbe signifie « to laugh » ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ON S''ENNUIE', 'S''ennuyer, c''est ne pas avoir d''activité intéressante.', 'LES ÉMOTIONS ET LES SENTIMENTS', 'ON S''ENNUIE', 'ON RIT', 'ON SOURIT', 'ON A PEUR', 'Que fait-on quand on n''a rien d''intéressant à faire ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ÉMOTIONS ET LES SENTIMENTS' AND `question` = 'Que fait-on quand on n''a rien d''intéressant à faire ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN ARBRE', 'Un arbre a un tronc, des branches et des feuilles.', 'LA NATURE ET L''ENVIRONNEMENT', 'UNE FLEUR', 'UN ARBRE', 'UN CHAMP', 'UN LAC', 'Quel grand végétal a un tronc et des feuilles ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA NATURE ET L''ENVIRONNEMENT' AND `question` = 'Quel grand végétal a un tronc et des feuilles ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE SOLEIL', 'Le soleil brille le jour.', 'LA NATURE ET L''ENVIRONNEMENT', 'LA LUNE', 'UNE ÉTOILE', 'LE SOLEIL', 'UN NUAGE', 'Quel astre brille dans le ciel pendant la journée ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA NATURE ET L''ENVIRONNEMENT' AND `question` = 'Quel astre brille dans le ciel pendant la journée ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA LUNE', 'On voit la lune la nuit.', 'LA NATURE ET L''ENVIRONNEMENT', 'LE SOLEIL', 'LE VENT', 'UN NUAGE', 'LA LUNE', 'Quel astre brille la nuit et change de forme ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA NATURE ET L''ENVIRONNEMENT' AND `question` = 'Quel astre brille la nuit et change de forme ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN NUAGE', 'Les nuages apportent la pluie.', 'LA NATURE ET L''ENVIRONNEMENT', 'UN NUAGE', 'UN PAPILLON', 'UN LAC', 'UNE ÎLE', 'Que voit-on dans le ciel quand il va pleuvoir ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA NATURE ET L''ENVIRONNEMENT' AND `question` = 'Que voit-on dans le ciel quand il va pleuvoir ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN PAPILLON', 'Un papillon a de belles ailes colorées.', 'LA NATURE ET L''ENVIRONNEMENT', 'UN OISEAU', 'UN PAPILLON', 'UN NUAGE', 'UN ARBRE', 'Quel animal a des ailes colorées et vole de fleur en fleur ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA NATURE ET L''ENVIRONNEMENT' AND `question` = 'Quel animal a des ailes colorées et vole de fleur en fleur ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN LAC', 'Un lac est entouré de terre.', 'LA NATURE ET L''ENVIRONNEMENT', 'UNE RIVIÈRE', 'UN CHAMP', 'UN LAC', 'UNE FORÊT', 'Comment appelle-t-on une grande étendue d''eau entourée de terre ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA NATURE ET L''ENVIRONNEMENT' AND `question` = 'Comment appelle-t-on une grande étendue d''eau entourée de terre ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE ÎLE', 'Une île est entourée d''eau.', 'LA NATURE ET L''ENVIRONNEMENT', 'UN CHAMP', 'UNE FORÊT', 'UN LAC', 'UNE ÎLE', 'Comment appelle-t-on une terre entourée d''eau ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA NATURE ET L''ENVIRONNEMENT' AND `question` = 'Comment appelle-t-on une terre entourée d''eau ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA NEIGE', 'La neige est blanche et froide.', 'LA NATURE ET L''ENVIRONNEMENT', 'LA NEIGE', 'LE VENT', 'LE SOLEIL', 'L''HERBE', 'Qu''est-ce qui tombe du ciel en hiver, blanc et froid ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA NATURE ET L''ENVIRONNEMENT' AND `question` = 'Qu''est-ce qui tombe du ciel en hiver, blanc et froid ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE RECYCLAGE', 'Recycler permet de réutiliser les déchets.', 'LA NATURE ET L''ENVIRONNEMENT', 'LA POLLUTION', 'LE RECYCLAGE', 'LE VENT', 'UNE POUBELLE', 'Comment s''appelle le tri des déchets pour les réutiliser ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA NATURE ET L''ENVIRONNEMENT' AND `question` = 'Comment s''appelle le tri des déchets pour les réutiliser ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DANS LA POUBELLE', 'On jette les papiers à la poubelle.', 'LA NATURE ET L''ENVIRONNEMENT', 'DANS LE LAC', 'DANS LE CIEL', 'DANS LA POUBELLE', 'DANS LA FORÊT', 'Où jette-t-on les papiers sales ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA NATURE ET L''ENVIRONNEMENT' AND `question` = 'Où jette-t-on les papiers sales ?');
