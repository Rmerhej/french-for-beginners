-- QCM pour les leçons du lot 5 (Les jours de la semaine, Les mois de l'année, Les directions et la position). Peut être exécuté plusieurs fois sans doublons.
-- À lancer APRÈS frenchdb_9_vocab_lot5.sql :
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_qcm_vocabulaire_7.sql
SET NAMES utf8mb4;

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'MARDI', 'Après lundi, on est mardi.', 'LES JOURS DE LA SEMAINE', 'MARDI', 'MERCREDI', 'DIMANCHE', 'JEUDI', 'Quel jour vient juste après lundi ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES JOURS DE LA SEMAINE' AND `question` = 'Quel jour vient juste après lundi ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'VENDREDI', 'Vendredi est le jour qui précède samedi.', 'LES JOURS DE LA SEMAINE', 'JEUDI', 'VENDREDI', 'DIMANCHE', 'LUNDI', 'Quel jour vient juste avant samedi ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES JOURS DE LA SEMAINE' AND `question` = 'Quel jour vient juste avant samedi ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'SEPT', 'Une semaine a sept jours : de lundi à dimanche.', 'LES JOURS DE LA SEMAINE', 'CINQ', 'SIX', 'SEPT', 'HUIT', 'Combien de jours y a-t-il dans une semaine ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES JOURS DE LA SEMAINE' AND `question` = 'Combien de jours y a-t-il dans une semaine ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE SAMEDI ET LE DIMANCHE', 'Le week-end, c''est le samedi et le dimanche.', 'LES JOURS DE LA SEMAINE', 'LE LUNDI ET LE MARDI', 'LE JEUDI ET LE VENDREDI', 'LE MERCREDI ET LE JEUDI', 'LE SAMEDI ET LE DIMANCHE', 'Quels jours forment le week-end ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES JOURS DE LA SEMAINE' AND `question` = 'Quels jours forment le week-end ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LUNDI', 'En France, la semaine commence le lundi.', 'LES JOURS DE LA SEMAINE', 'LUNDI', 'DIMANCHE', 'MERCREDI', 'SAMEDI', 'Quel est le premier jour de la semaine en France ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES JOURS DE LA SEMAINE' AND `question` = 'Quel est le premier jour de la semaine en France ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'MERCREDI', 'Demain, c''est le jour d''après : mercredi.', 'LES JOURS DE LA SEMAINE', 'LUNDI', 'MERCREDI', 'JEUDI', 'VENDREDI', 'Aujourd''hui, c''est mardi. Quel jour est demain ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES JOURS DE LA SEMAINE' AND `question` = 'Aujourd''hui, c''est mardi. Quel jour est demain ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'SAMEDI', 'Hier, c''est le jour d''avant : samedi.', 'LES JOURS DE LA SEMAINE', 'LUNDI', 'VENDREDI', 'SAMEDI', 'MARDI', 'Aujourd''hui, c''est dimanche. Quel jour était hier ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES JOURS DE LA SEMAINE' AND `question` = 'Aujourd''hui, c''est dimanche. Quel jour était hier ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DIMANCHE', 'Demain, c''est samedi ; après-demain, c''est dimanche.', 'LES JOURS DE LA SEMAINE', 'SAMEDI', 'LUNDI', 'JEUDI', 'DIMANCHE', 'Aujourd''hui, c''est vendredi. Quel jour est après-demain ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES JOURS DE LA SEMAINE' AND `question` = 'Aujourd''hui, c''est vendredi. Quel jour est après-demain ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DEMAIN', 'Demain est le jour d''après aujourd''hui.', 'LES JOURS DE LA SEMAINE', 'DEMAIN', 'HIER', 'AUJOURD''HUI', 'LA SEMAINE', 'Quel mot désigne le jour qui suit aujourd''hui ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES JOURS DE LA SEMAINE' AND `question` = 'Quel mot désigne le jour qui suit aujourd''hui ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN JOUR FÉRIÉ', 'Un jour férié est un jour de fête officiel.', 'LES JOURS DE LA SEMAINE', 'UN CALENDRIER', 'UN JOUR FÉRIÉ', 'UNE SEMAINE', 'HIER', 'Comment appelle-t-on un jour où l''on ne travaille pas, comme le 14 juillet ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES JOURS DE LA SEMAINE' AND `question` = 'Comment appelle-t-on un jour où l''on ne travaille pas, comme le 14 juillet ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE MINUSCULE', 'On écrit lundi, mardi… avec une minuscule (sauf en début de phrase).', 'LES JOURS DE LA SEMAINE', 'UNE MAJUSCULE', 'DES CHIFFRES', 'UNE MINUSCULE', 'UN TRAIT D''UNION', 'En français, les jours de la semaine s''écrivent normalement avec…' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES JOURS DE LA SEMAINE' AND `question` = 'En français, les jours de la semaine s''écrivent normalement avec…');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'JANVIER', 'L''année commence en janvier.', 'LES MOIS DE L''ANNÉE', 'JANVIER', 'MARS', 'JUIN', 'DÉCEMBRE', 'Quel est le premier mois de l''année ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES MOIS DE L''ANNÉE' AND `question` = 'Quel est le premier mois de l''année ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'AVRIL', 'Après mars, on est en avril.', 'LES MOIS DE L''ANNÉE', 'FÉVRIER', 'AVRIL', 'MAI', 'JUIN', 'Quel mois vient juste après mars ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES MOIS DE L''ANNÉE' AND `question` = 'Quel mois vient juste après mars ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DOUZE', 'Une année a douze mois.', 'LES MOIS DE L''ANNÉE', 'DIX', 'ONZE', 'DOUZE', 'TREIZE', 'Combien de mois y a-t-il dans une année ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES MOIS DE L''ANNÉE' AND `question` = 'Combien de mois y a-t-il dans une année ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DÉCEMBRE', 'L''année se termine en décembre.', 'LES MOIS DE L''ANNÉE', 'NOVEMBRE', 'JANVIER', 'OCTOBRE', 'DÉCEMBRE', 'Quel est le dernier mois de l''année ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES MOIS DE L''ANNÉE' AND `question` = 'Quel est le dernier mois de l''année ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'FÉVRIER', 'Février a seulement 28 jours (29 certaines années).', 'LES MOIS DE L''ANNÉE', 'FÉVRIER', 'JUIN', 'AVRIL', 'SEPTEMBRE', 'Quel est le mois le plus court de l''année ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES MOIS DE L''ANNÉE' AND `question` = 'Quel est le mois le plus court de l''année ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'JUIN', 'Juin est le mois qui précède juillet.', 'LES MOIS DE L''ANNÉE', 'MAI', 'JUIN', 'AOÛT', 'SEPTEMBRE', 'Quel mois vient juste avant juillet ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES MOIS DE L''ANNÉE' AND `question` = 'Quel mois vient juste avant juillet ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'JUILLET', 'La fête nationale a lieu le 14 juillet.', 'LES MOIS DE L''ANNÉE', 'JANVIER', 'MAI', 'JUILLET', 'OCTOBRE', 'Quel mois est celui de la fête nationale française, le 14 ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES MOIS DE L''ANNÉE' AND `question` = 'Quel mois est celui de la fête nationale française, le 14 ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'SEPTEMBRE', 'Après août, on est en septembre : c''est la rentrée.', 'LES MOIS DE L''ANNÉE', 'JUILLET', 'OCTOBRE', 'JUIN', 'SEPTEMBRE', 'Quel mois vient juste après août ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES MOIS DE L''ANNÉE' AND `question` = 'Quel mois vient juste après août ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'AOÛT', 'Août s''écrit avec un accent circonflexe sur le u.', 'LES MOIS DE L''ANNÉE', 'AOÛT', 'JUIN', 'MARS', 'MAI', 'Quel mois s''écrit avec un accent circonflexe ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES MOIS DE L''ANNÉE' AND `question` = 'Quel mois s''écrit avec un accent circonflexe ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN ANNIVERSAIRE', 'On fête son anniversaire chaque année, à la même date.', 'LES MOIS DE L''ANNÉE', 'UN CALENDRIER', 'UN ANNIVERSAIRE', 'UNE SAISON', 'UNE SEMAINE', 'Comment appelle-t-on le jour de l''année où l''on est né ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES MOIS DE L''ANNÉE' AND `question` = 'Comment appelle-t-on le jour de l''année où l''on est né ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'QUATRE', 'Il y a quatre saisons : le printemps, l''été, l''automne et l''hiver.', 'LES MOIS DE L''ANNÉE', 'DEUX', 'TROIS', 'QUATRE', 'SIX', 'Combien de saisons y a-t-il dans l''année ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES MOIS DE L''ANNÉE' AND `question` = 'Combien de saisons y a-t-il dans l''année ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'SUR', 'Sur veut dire « au-dessus, posé dessus ».', 'LES DIRECTIONS ET LA POSITION', 'SUR', 'SOUS', 'DANS', 'ENTRE', 'Le livre est posé … la table : il est dessus.' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES DIRECTIONS ET LA POSITION' AND `question` = 'Le livre est posé … la table : il est dessus.');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'SOUS', 'Sous veut dire « en dessous ».', 'LES DIRECTIONS ET LA POSITION', 'SUR', 'SOUS', 'DEVANT', 'ENTRE', 'Le chien dort … la table : il est en dessous.' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES DIRECTIONS ET LA POSITION' AND `question` = 'Le chien dort … la table : il est en dessous.');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'TOUT DROIT', 'Tout droit veut dire « sans tourner ».', 'LES DIRECTIONS ET LA POSITION', 'À GAUCHE', 'À DROITE', 'TOUT DROIT', 'EN BAS', 'Pour aller à la gare, je ne tourne ni à gauche ni à droite. Je vais…' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES DIRECTIONS ET LA POSITION' AND `question` = 'Pour aller à la gare, je ne tourne ni à gauche ni à droite. Je vais…');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DERRIÈRE', 'Devant et derrière sont des contraires.', 'LES DIRECTIONS ET LA POSITION', 'DANS', 'SUR', 'ENTRE', 'DERRIÈRE', 'Quel est le contraire de « devant » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES DIRECTIONS ET LA POSITION' AND `question` = 'Quel est le contraire de « devant » ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'EN BAS', 'En haut et en bas sont des contraires.', 'LES DIRECTIONS ET LA POSITION', 'EN BAS', 'EN FACE DE', 'À GAUCHE', 'TOUT DROIT', 'Quel est le contraire de « en haut » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES DIRECTIONS ET LA POSITION' AND `question` = 'Quel est le contraire de « en haut » ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LOIN DE', 'Près de et loin de sont des contraires.', 'LES DIRECTIONS ET LA POSITION', 'À CÔTÉ DE', 'LOIN DE', 'EN FACE DE', 'ENTRE', 'Quel est le contraire de « près de » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES DIRECTIONS ET LA POSITION' AND `question` = 'Quel est le contraire de « près de » ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DANS', 'Dans veut dire « à l''intérieur de ».', 'LES DIRECTIONS ET LA POSITION', 'SUR', 'SOUS', 'DANS', 'DEVANT', 'Le stylo est … le sac : il est à l''intérieur.' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES DIRECTIONS ET LA POSITION' AND `question` = 'Le stylo est … le sac : il est à l''intérieur.');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ENTRE', 'Entre se dit quand on est au milieu de deux choses.', 'LES DIRECTIONS ET LA POSITION', 'SUR', 'DANS', 'LOIN DE', 'ENTRE', 'La poste est … la banque et la pharmacie : elle est au milieu des deux.' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES DIRECTIONS ET LA POSITION' AND `question` = 'La poste est … la banque et la pharmacie : elle est au milieu des deux.');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'EN FACE DE', 'En face de veut dire « de l''autre côté, face à ».', 'LES DIRECTIONS ET LA POSITION', 'EN FACE DE', 'DERRIÈRE', 'DANS', 'SOUS', 'Le café est de l''autre côté de la rue, face à la gare. Il est…' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES DIRECTIONS ET LA POSITION' AND `question` = 'Le café est de l''autre côté de la rue, face à la gare. Il est…');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'EN BAS', 'Le rez-de-chaussée est en bas de la maison.', 'LES DIRECTIONS ET LA POSITION', 'EN HAUT', 'EN BAS', 'À GAUCHE', 'DEVANT', 'Dans une maison, la chambre est à l''étage et la cuisine au rez-de-chaussée. La cuisine est…' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES DIRECTIONS ET LA POSITION' AND `question` = 'Dans une maison, la chambre est à l''étage et la cuisine au rez-de-chaussée. La cuisine est…');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'À DROITE', 'À gauche et à droite sont des contraires.', 'LES DIRECTIONS ET LA POSITION', 'EN HAUT', 'TOUT DROIT', 'À DROITE', 'DEVANT', 'Quel est le contraire de « à gauche » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES DIRECTIONS ET LA POSITION' AND `question` = 'Quel est le contraire de « à gauche » ?');
