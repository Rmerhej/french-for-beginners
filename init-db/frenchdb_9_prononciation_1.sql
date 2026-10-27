-- Nouvelles cartes de la page Prononciation (19 sons ou règles qui posent souvent problème).
-- Sans fichier audio : la page lit les mots d'exemple avec la voix du navigateur. Pour ajouter un enregistrement, modifier la carte dans l'administration.
-- Peut être exécuté plusieurs fois sans créer de doublons (une carte est reconnue à son « son »).
-- Sur le serveur :
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_prononciation_1.sql
SET NAMES utf8mb4;

INSERT INTO `prononciation` (`audio`, `exemple`, `son`)
SELECT NULL, 'été, café, chanter, vous parlez', 'é ; er ; ez' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `prononciation` WHERE `son` = 'é ; er ; ez');

INSERT INTO `prononciation` (`audio`, `exemple`, `son`)
SELECT NULL, 'père, fête, lait, neige, mer', 'è ; ê ; ai ; ei' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `prononciation` WHERE `son` = 'è ; ê ; ai ; ei');

INSERT INTO `prononciation` (`audio`, `exemple`, `son`)
SELECT NULL, 'petite, samedi, boulangerie, je ne sais pas', 'e muet (e non prononcé)' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `prononciation` WHERE `son` = 'e muet (e non prononcé)');

INSERT INTO `prononciation` (`audio`, `exemple`, `son`)
SELECT NULL, 'tu / tout, rue / roue, dessus / dessous, vu / vous', 'u ≠ ou' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `prononciation` WHERE `son` = 'u ≠ ou');

INSERT INTO `prononciation` (`audio`, `exemple`, `son`)
SELECT NULL, 'vent / vont / vin, blanc / blond, sans / son / saint', 'an ≠ on ≠ in' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `prononciation` WHERE `son` = 'an ≠ on ≠ in');

INSERT INTO `prononciation` (`audio`, `exemple`, `son`)
SELECT NULL, 'pain, plein, faim, simple, symbole', 'ain ; ein ; aim ; im ; ym' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `prononciation` WHERE `son` = 'ain ; ein ; aim ; im ; ym');

INSERT INTO `prononciation` (`audio`, `exemple`, `son`)
SELECT NULL, 'rue, rouge, merci, Paris, parler, mur', 'r (le « r » français)' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `prononciation` WHERE `son` = 'r (le « r » français)');

INSERT INTO `prononciation` (`audio`, `exemple`, `son`)
SELECT NULL, 'maison, rose, cuisine / poisson, dessert, classe', 's entre deux voyelles = [z] ; ss = [s]' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `prononciation` WHERE `son` = 's entre deux voyelles = [z] ; ss = [s]');

INSERT INTO `prononciation` (`audio`, `exemple`, `son`)
SELECT NULL, 'petit, grand, trois, vous, chaud, Paris', 'lettres finales muettes' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `prononciation` WHERE `son` = 'lettres finales muettes');

INSERT INTO `prononciation` (`audio`, `exemple`, `son`)
SELECT NULL, 'ils parlent, elles mangent, ils habitent', 'ent muet (ils parlent)' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `prononciation` WHERE `son` = 'ent muet (ils parlent)');

INSERT INTO `prononciation` (`audio`, `exemple`, `son`)
SELECT NULL, 'garçon, français, ça, café, coupe, cuisine', 'ç ; c + a / o / u' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `prononciation` WHERE `son` = 'ç ; c + a / o / u');

INSERT INTO `prononciation` (`audio`, `exemple`, `son`)
SELECT NULL, 'gâteau, gorge, légume, guitare, guerre', 'g + a / o / u ; gu' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `prononciation` WHERE `son` = 'g + a / o / u ; gu');

INSERT INTO `prononciation` (`audio`, `exemple`, `son`)
SELECT NULL, 'l''homme, l''hôtel, l''hiver / le haricot, le héros, la honte', 'h muet ; h aspiré' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `prononciation` WHERE `son` = 'h muet ; h aspiré');

INSERT INTO `prononciation` (`audio`, `exemple`, `son`)
SELECT NULL, 'nuit, huit, bruit, cuisine', 'ui' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `prononciation` WHERE `son` = 'ui');

INSERT INTO `prononciation` (`audio`, `exemple`, `son`)
SELECT NULL, 'sœur, œuf, cœur, vœu', 'œu ; œ' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `prononciation` WHERE `son` = 'œu ; œ');

INSERT INTO `prononciation` (`audio`, `exemple`, `son`)
SELECT NULL, 'yaourt, stylo, système, il y a', 'y' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `prononciation` WHERE `son` = 'y');

INSERT INTO `prononciation` (`audio`, `exemple`, `son`)
SELECT NULL, 'taxi, examen, six, deux', 'x' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `prononciation` WHERE `son` = 'x');

INSERT INTO `prononciation` (`audio`, `exemple`, `son`)
SELECT NULL, 'thé, théâtre, thon, mathématiques', 'th' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `prononciation` WHERE `son` = 'th');

INSERT INTO `prononciation` (`audio`, `exemple`, `son`)
SELECT NULL, 'monsieur, femme, fils, août, second, tous', 'mots-pièges' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `prononciation` WHERE `son` = 'mots-pièges');
