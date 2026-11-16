-- Lot 5 de leçons de vocabulaire : Les jours de la semaine, Les mois de l'année, Les directions et la position.
-- Crée les leçons et leurs mots (images dans static/images/vocab, sans audio : la voix du navigateur lit les mots et les phrases). Peut être exécuté plusieurs fois sans doublons ; relancé, il ajoute seulement ce qui manque.
-- Les illustrations sont dans l'application : déployer d'abord la nouvelle image Docker, puis sur le serveur (voir aussi frenchdb_9_qcm_vocabulaire_7.sql et frenchdb_9_traductions_lot5.sql) :
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_vocab_lot5.sql
SET NAMES utf8mb4;

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A1', 'LES JOURS DE LA SEMAINE' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE');


INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'Monday', 'lundi', '/images/vocab/jour-lundi.svg', 'lun-di', l.`id`, 'Le lundi, je commence le travail à huit heures.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'lundi');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/jour-lundi.svg' WHERE `french_word` = 'lundi' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'Tuesday', 'mardi', '/images/vocab/jour-mardi.svg', 'mar-di', l.`id`, 'Mardi, j''ai un cours de français.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'mardi');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/jour-mardi.svg' WHERE `french_word` = 'mardi' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'Wednesday', 'mercredi', '/images/vocab/jour-mercredi.svg', 'mèr-kre-di', l.`id`, 'Le mercredi, les enfants n''ont pas école.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'mercredi');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/jour-mercredi.svg' WHERE `french_word` = 'mercredi' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'Thursday', 'jeudi', '/images/vocab/jour-jeudi.svg', 'jeu-di', l.`id`, 'Jeudi, je vais au marché.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'jeudi');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/jour-jeudi.svg' WHERE `french_word` = 'jeudi' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'Friday', 'vendredi', '/images/vocab/jour-vendredi.svg', 'van-dre-di', l.`id`, 'Vendredi soir, nous dînons au restaurant.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'vendredi');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/jour-vendredi.svg' WHERE `french_word` = 'vendredi' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'Saturday', 'samedi', '/images/vocab/jour-samedi.svg', 'sam-di', l.`id`, 'Samedi, je fais les courses.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'samedi');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/jour-samedi.svg' WHERE `french_word` = 'samedi' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'Sunday', 'dimanche', '/images/vocab/jour-dimanche.svg', 'di-manch', l.`id`, 'Le dimanche, je me repose à la maison.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'dimanche');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/jour-dimanche.svg' WHERE `french_word` = 'dimanche' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the week', 'la semaine', '/images/vocab/jour-semaine.svg', 'la se-mèn', l.`id`, 'Une semaine a sept jours.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la semaine');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/jour-semaine.svg' WHERE `french_word` = 'la semaine' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the weekend', 'le week-end', '/images/vocab/jour-weekend.svg', 'ouï-kènd', l.`id`, 'Ce week-end, nous visitons Paris.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le week-end');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/jour-weekend.svg' WHERE `french_word` = 'le week-end' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a day', 'un jour', '/images/vocab/jour-un-jour.svg', 'un jour', l.`id`, 'Quel jour sommes-nous ?', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un jour');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/jour-un-jour.svg' WHERE `french_word` = 'un jour' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'today', 'aujourd''hui', '/images/vocab/jour-aujourdhui.svg', 'o-jour-dwi', l.`id`, 'Aujourd''hui, c''est mardi.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'aujourd''hui');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/jour-aujourdhui.svg' WHERE `french_word` = 'aujourd''hui' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'tomorrow', 'demain', '/images/vocab/jour-demain.svg', 'de-min', l.`id`, 'Demain, c''est mercredi.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'demain');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/jour-demain.svg' WHERE `french_word` = 'demain' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'yesterday', 'hier', '/images/vocab/jour-hier.svg', 'yèr', l.`id`, 'Hier, c''était lundi.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'hier');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/jour-hier.svg' WHERE `french_word` = 'hier' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the day after tomorrow', 'après-demain', '/images/vocab/jour-apres-demain.svg', 'a-prè-de-min', l.`id`, 'Après-demain, c''est jeudi.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'après-demain');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/jour-apres-demain.svg' WHERE `french_word` = 'après-demain' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a public holiday', 'un jour férié', '/images/vocab/jour-ferie.svg', 'un jour fé-ri-é', l.`id`, 'Le 14 juillet est un jour férié.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un jour férié');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/jour-ferie.svg' WHERE `french_word` = 'un jour férié' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the calendar', 'le calendrier', '/images/vocab/jour-calendrier.svg', 'le ka-lan-dri-é', l.`id`, 'Je regarde le calendrier pour voir la date.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le calendrier');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/jour-calendrier.svg' WHERE `french_word` = 'le calendrier' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A1', 'LES MOIS DE L''ANNÉE' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE');


INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'January', 'janvier', '/images/vocab/mois-janvier.svg', 'jan-vi-é', l.`id`, 'Janvier est le premier mois de l''année.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'janvier');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/mois-janvier.svg' WHERE `french_word` = 'janvier' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'February', 'février', '/images/vocab/mois-fevrier.svg', 'fé-vri-é', l.`id`, 'Février est le mois le plus court.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'février');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/mois-fevrier.svg' WHERE `french_word` = 'février' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'March', 'mars', '/images/vocab/mois-mars.svg', 'mars', l.`id`, 'En mars, le printemps commence.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'mars');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/mois-mars.svg' WHERE `french_word` = 'mars' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'April', 'avril', '/images/vocab/mois-avril.svg', 'a-vril', l.`id`, 'En avril, il pleut souvent.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'avril');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/mois-avril.svg' WHERE `french_word` = 'avril' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'May', 'mai', '/images/vocab/mois-mai.svg', 'mè', l.`id`, 'Le premier mai, on offre du muguet.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'mai');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/mois-mai.svg' WHERE `french_word` = 'mai' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'June', 'juin', '/images/vocab/mois-juin.svg', 'juin', l.`id`, 'En juin, les jours sont longs.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'juin');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/mois-juin.svg' WHERE `french_word` = 'juin' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'July', 'juillet', '/images/vocab/mois-juillet.svg', 'jui-yè', l.`id`, 'Le 14 juillet est la fête nationale.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'juillet');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/mois-juillet.svg' WHERE `french_word` = 'juillet' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'August', 'août', '/images/vocab/mois-aout.svg', 'ou(t)', l.`id`, 'En août, beaucoup de gens partent en vacances.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'août');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/mois-aout.svg' WHERE `french_word` = 'août' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'September', 'septembre', '/images/vocab/mois-septembre.svg', 'sèp-tanbr', l.`id`, 'En septembre, l''école recommence.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'septembre');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/mois-septembre.svg' WHERE `french_word` = 'septembre' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'October', 'octobre', '/images/vocab/mois-octobre.svg', 'ok-tobr', l.`id`, 'En octobre, les feuilles tombent.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'octobre');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/mois-octobre.svg' WHERE `french_word` = 'octobre' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'November', 'novembre', '/images/vocab/mois-novembre.svg', 'no-vanbr', l.`id`, 'En novembre, il fait déjà froid.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'novembre');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/mois-novembre.svg' WHERE `french_word` = 'novembre' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'December', 'décembre', '/images/vocab/mois-decembre.svg', 'dé-sanbr', l.`id`, 'Noël est en décembre.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'décembre');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/mois-decembre.svg' WHERE `french_word` = 'décembre' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a month', 'un mois', '/images/vocab/mois-un-mois.svg', 'un mwa', l.`id`, 'Il y a douze mois dans une année.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un mois');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/mois-un-mois.svg' WHERE `french_word` = 'un mois' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a year', 'une année', '/images/vocab/mois-annee.svg', 'une a-né', l.`id`, 'Une année a trois cent soixante-cinq jours.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une année');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/mois-annee.svg' WHERE `french_word` = 'une année' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a date', 'une date', '/images/vocab/mois-date.svg', 'une dat', l.`id`, 'Quelle est la date de ton anniversaire ?', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une date');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/mois-date.svg' WHERE `french_word` = 'une date' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a birthday', 'un anniversaire', '/images/vocab/mois-anniversaire.svg', 'un a-ni-vèr-sèr', l.`id`, 'Mon anniversaire est en mars.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un anniversaire');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/mois-anniversaire.svg' WHERE `french_word` = 'un anniversaire' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the seasons', 'les saisons', '/images/vocab/mois-saisons.svg', 'lé sè-zon', l.`id`, 'Il y a quatre saisons dans l''année.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'les saisons');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/mois-saisons.svg' WHERE `french_word` = 'les saisons' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A1', 'LES DIRECTIONS ET LA POSITION' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION');


INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'in front of', 'devant', '/images/vocab/dir-devant.svg', 'de-van', l.`id`, 'Le garçon est devant la porte.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'devant');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/dir-devant.svg' WHERE `french_word` = 'devant' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'behind', 'derrière', '/images/vocab/dir-derriere.svg', 'dè-ryèr', l.`id`, 'Le chat est derrière le canapé.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'derrière');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/dir-derriere.svg' WHERE `french_word` = 'derrière' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'up, at the top', 'en haut', '/images/vocab/dir-en-haut.svg', 'an o', l.`id`, 'Ma chambre est en haut.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'en haut');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/dir-en-haut.svg' WHERE `french_word` = 'en haut' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'down, at the bottom', 'en bas', '/images/vocab/dir-en-bas.svg', 'an ba', l.`id`, 'La cuisine est en bas.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'en bas');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/dir-en-bas.svg' WHERE `french_word` = 'en bas' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'on the left', 'à gauche', '/images/vocab/dir-a-gauche.svg', 'a gosh', l.`id`, 'Tournez à gauche au feu rouge.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'à gauche');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/dir-a-gauche.svg' WHERE `french_word` = 'à gauche' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'on the right', 'à droite', '/images/vocab/dir-a-droite.svg', 'a drwat', l.`id`, 'La boulangerie est à droite.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'à droite');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/dir-a-droite.svg' WHERE `french_word` = 'à droite' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'straight ahead', 'tout droit', '/images/vocab/dir-tout-droit.svg', 'tou drwa', l.`id`, 'Allez tout droit jusqu''à la gare.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'tout droit');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/dir-tout-droit.svg' WHERE `french_word` = 'tout droit' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'in, inside', 'dans', '/images/vocab/dir-dans.svg', 'dan', l.`id`, 'Le livre est dans le sac.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'dans');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/dir-dans.svg' WHERE `french_word` = 'dans' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'on', 'sur', '/images/vocab/dir-sur.svg', 'sür', l.`id`, 'Le stylo est sur la table.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'sur');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/dir-sur.svg' WHERE `french_word` = 'sur' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'under', 'sous', '/images/vocab/dir-sous.svg', 'sou', l.`id`, 'Le chien est sous la table.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'sous');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/dir-sous.svg' WHERE `french_word` = 'sous' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'between', 'entre', '/images/vocab/dir-entre.svg', 'antr', l.`id`, 'La banque est entre la poste et la pharmacie.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'entre');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/dir-entre.svg' WHERE `french_word` = 'entre' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'next to', 'à côté de', '/images/vocab/dir-a-cote-de.svg', 'a ko-té de', l.`id`, 'L''école est à côté de la mairie.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'à côté de');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/dir-a-cote-de.svg' WHERE `french_word` = 'à côté de' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'opposite', 'en face de', '/images/vocab/dir-en-face-de.svg', 'an fas de', l.`id`, 'Le café est en face de la gare.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'en face de');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/dir-en-face-de.svg' WHERE `french_word` = 'en face de' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'near', 'près de', '/images/vocab/dir-pres-de.svg', 'prè de', l.`id`, 'J''habite près de la gare.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'près de');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/dir-pres-de.svg' WHERE `french_word` = 'près de' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'far from', 'loin de', '/images/vocab/dir-loin-de.svg', 'lwin de', l.`id`, 'Mon travail est loin de chez moi.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'loin de');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/dir-loin-de.svg' WHERE `french_word` = 'loin de' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'in the middle', 'au milieu', '/images/vocab/dir-au-milieu.svg', 'o mi-lyeu', l.`id`, 'La table est au milieu de la pièce.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'au milieu');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/dir-au-milieu.svg' WHERE `french_word` = 'au milieu' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'here', 'ici', '/images/vocab/dir-ici.svg', 'i-si', l.`id`, 'Venez ici, s''il vous plaît.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'ici');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/dir-ici.svg' WHERE `french_word` = 'ici' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'over there', 'là-bas', '/images/vocab/dir-la-bas.svg', 'la-ba', l.`id`, 'La gare est là-bas.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'là-bas');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/dir-la-bas.svg' WHERE `french_word` = 'là-bas' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND (`image_url` IS NULL OR `image_url` = '');
