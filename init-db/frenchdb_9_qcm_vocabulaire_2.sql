-- QCM supplémentaires pour 3 leçons de vocabulaire : Les objets, Les parties du corps, Les animaux (18 questions).
-- Peut être exécuté plusieurs fois sans créer de doublons.
-- Sur le serveur (aucune nouvelle image nécessaire) :
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_qcm_vocabulaire_2.sql
SET NAMES utf8mb4;

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LES CISEAUX', 'Les ciseaux ont deux lames qui coupent le papier.', 'LES OBJETS', 'UNE LAMPE', 'LES CISEAUX', 'UNE GOMME', 'UNE CLÉ', 'Quel objet sert à couper du papier ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES OBJETS' AND `question` = 'Quel objet sert à couper du papier ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE MONTRE', 'Une montre se porte au poignet.', 'LES OBJETS', 'UN STYLO', 'UN LIVRE', 'UNE MONTRE', 'UNE CHAISE', 'Quel objet se porte au poignet pour voir l''heure ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES OBJETS' AND `question` = 'Quel objet se porte au poignet pour voir l''heure ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE CHAISE', 'On s''assoit sur une chaise.', 'LES OBJETS', 'UNE CLÉ', 'UN SAC', 'UNE LAMPE', 'UNE CHAISE', 'Sur quel objet s''assoit-on ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES OBJETS' AND `question` = 'Sur quel objet s''assoit-on ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN SAC', 'Un sac à dos permet de porter ses cahiers et ses livres.', 'LES OBJETS', 'UNE LAMPE', 'UNE BOUTEILLE', 'UN SAC', 'UN MIROIR', 'Quel objet sert à transporter ses affaires à l''école ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES OBJETS' AND `question` = 'Quel objet sert à transporter ses affaires à l''école ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN VERRE', 'On boit l''eau dans un verre.', 'LES OBJETS', 'UN LIVRE', 'UN CRAYON', 'UN VERRE', 'UN STYLO', 'Dans quel objet met-on de l''eau pour la boire ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES OBJETS' AND `question` = 'Dans quel objet met-on de l''eau pour la boire ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN MIROIR', 'Dans un miroir, on voit son visage.', 'LES OBJETS', 'UN MIROIR', 'UN SAC', 'UNE CLÉ', 'UN CRAYON', 'Quel objet sert à se regarder ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES OBJETS' AND `question` = 'Quel objet sert à se regarder ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA BOUCHE', 'La bouche sert à manger et à parler.', 'LES PARTIES DU CORPS', 'LES OREILLES', 'LA BOUCHE', 'LE NEZ', 'LE COU', 'Avec quelle partie du corps mange-t-on et parle-t-on ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES PARTIES DU CORPS' AND `question` = 'Avec quelle partie du corps mange-t-on et parle-t-on ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'CINQ', 'Une main a cinq doigts ; deux mains en ont dix.', 'LES PARTIES DU CORPS', 'DIX', 'SIX', 'CINQ', 'QUATRE', 'Combien de doigts a-t-on à une main ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES PARTIES DU CORPS' AND `question` = 'Combien de doigts a-t-on à une main ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE POIGNET', 'Le poignet est entre la main et l''avant-bras.', 'LES PARTIES DU CORPS', 'LE POIGNET', 'LE COU', 'LE PIED', 'LE GENOU', 'Quelle partie du corps relie la main au bras ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES PARTIES DU CORPS' AND `question` = 'Quelle partie du corps relie la main au bras ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE GENOU', 'Le genou se plie au milieu de la jambe ; le coude se plie au milieu du bras.', 'LES PARTIES DU CORPS', 'LE POIGNET', 'LE COU', 'LE COUDE', 'LE GENOU', 'Quelle partie du corps se plie au milieu de la jambe ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES PARTIES DU CORPS' AND `question` = 'Quelle partie du corps se plie au milieu de la jambe ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'SUR LA TÊTE', 'Un chapeau se porte sur la tête.', 'LES PARTIES DU CORPS', 'SUR LE PIED', 'SUR LA MAIN', 'SUR LE GENOU', 'SUR LA TÊTE', 'Où porte-t-on un chapeau ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES PARTIES DU CORPS' AND `question` = 'Où porte-t-on un chapeau ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE CŒUR', 'Le cœur fait circuler le sang dans tout le corps.', 'LES PARTIES DU CORPS', 'LE CŒUR', 'LE COU', 'LE GENOU', 'LE NEZ', 'Quel organe fait circuler le sang dans le corps ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES PARTIES DU CORPS' AND `question` = 'Quel organe fait circuler le sang dans le corps ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE CHAT', 'Le chat miaule.', 'Les ANIMAUX', 'LE CHEVAL', 'LA VACHE', 'LE CHIEN', 'LE CHAT', 'Quel animal miaule ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Les ANIMAUX' AND `question` = 'Quel animal miaule ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE CHIEN', 'Le chien aboie.', 'Les ANIMAUX', 'LE CHIEN', 'LA POULE', 'LE CHAT', 'LE CHEVAL', 'Quel animal aboie ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Les ANIMAUX' AND `question` = 'Quel animal aboie ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA VACHE', 'La vache donne du lait.', 'Les ANIMAUX', 'LA VACHE', 'LE CHAT', 'LE POISSON', 'L''OISEAU', 'Quel animal donne du lait ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Les ANIMAUX' AND `question` = 'Quel animal donne du lait ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE POISSON', 'Le poisson vit dans l''eau et nage avec ses nageoires.', 'Les ANIMAUX', 'LE CHEVAL', 'LA POULE', 'LE POISSON', 'LE CHIEN', 'Quel animal vit dans l''eau et a des nageoires ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Les ANIMAUX' AND `question` = 'Quel animal vit dans l''eau et a des nageoires ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA POULE', 'La poule pond des œufs.', 'Les ANIMAUX', 'LE CHIEN', 'LE CHAT', 'LA VACHE', 'LA POULE', 'Quel animal pond des œufs que l''on mange ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Les ANIMAUX' AND `question` = 'Quel animal pond des œufs que l''on mange ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'L''OISEAU', 'Les oiseaux ont des ailes et volent.', 'Les ANIMAUX', 'LA VACHE', 'LE POISSON', 'L''OISEAU', 'LE CHIEN', 'Quel animal a des ailes et peut voler ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Les ANIMAUX' AND `question` = 'Quel animal a des ailes et peut voler ?');
