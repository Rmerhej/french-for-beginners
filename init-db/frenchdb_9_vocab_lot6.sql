-- Lot 6 de leçons de vocabulaire (cuisine de restaurant) : Les ustensiles de cuisine, Les gestes de cuisine.
-- Crée les leçons et leurs mots (images dans static/images/vocab, sans audio : la voix du navigateur lit les mots et les phrases). Peut être exécuté plusieurs fois sans doublons ; relancé, il ajoute seulement ce qui manque.
-- Déployer d'abord la nouvelle image Docker (les illustrations sont dans l'application), puis exécuter, dans cet ordre :
--   frenchdb_9_vocab_lot6.sql, frenchdb_9_qcm_vocabulaire_8.sql, frenchdb_9_traductions_lot6.sql, frenchdb_9_themes_cuisine.sql, frenchdb_9_themes_qcm_cuisine.sql, frenchdb_9_quiz_themes_cuisine.sql
SET NAMES utf8mb4;

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A1', 'LES USTENSILES DE CUISINE' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE');


INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a knife', 'un couteau', '/images/vocab/cuis-couteau.svg', 'kou-to', l.`id`, 'Passe-moi le couteau, s''il te plaît.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un couteau');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-couteau.svg' WHERE `french_word` = 'un couteau' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a cutting board', 'une planche à découper', '/images/vocab/cuis-planche.svg', 'une plansh a dé-kou-pé', l.`id`, 'Pose les légumes sur la planche à découper.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une planche à découper');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-planche.svg' WHERE `french_word` = 'une planche à découper' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a saucepan', 'une casserole', '/images/vocab/cuis-casserole.svg', 'une kas-rol', l.`id`, 'Mets l''eau dans la casserole.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une casserole');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-casserole.svg' WHERE `french_word` = 'une casserole' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a frying pan', 'une poêle', '/images/vocab/cuis-poele.svg', 'une pwal', l.`id`, 'Fais chauffer la poêle.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une poêle');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-poele.svg' WHERE `french_word` = 'une poêle' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a large pot', 'une marmite', '/images/vocab/cuis-marmite.svg', 'une mar-mit', l.`id`, 'La marmite est pleine de soupe.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une marmite');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-marmite.svg' WHERE `french_word` = 'une marmite' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a ladle', 'une louche', '/images/vocab/cuis-louche.svg', 'une loush', l.`id`, 'Sers la soupe avec la louche.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une louche');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-louche.svg' WHERE `french_word` = 'une louche' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a whisk', 'un fouet', '/images/vocab/cuis-fouet.svg', 'un fwè', l.`id`, 'Bats les œufs avec le fouet.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un fouet');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-fouet.svg' WHERE `french_word` = 'un fouet' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a colander', 'une passoire', '/images/vocab/cuis-passoire.svg', 'une pa-swar', l.`id`, 'Égoutte les pâtes dans la passoire.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une passoire');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-passoire.svg' WHERE `french_word` = 'une passoire' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a skimmer', 'une écumoire', '/images/vocab/cuis-ecumoire.svg', 'une é-ku-mwar', l.`id`, 'Retire les légumes avec l''écumoire.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une écumoire');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-ecumoire.svg' WHERE `french_word` = 'une écumoire' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a peeler', 'un éplucheur', '/images/vocab/cuis-eplucheur.svg', 'un é-plu-sheur', l.`id`, 'L''éplucheur est dans le tiroir.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un éplucheur');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-eplucheur.svg' WHERE `french_word` = 'un éplucheur' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a wooden spoon', 'une cuillère en bois', '/images/vocab/cuis-cuillere-bois.svg', 'une kui-yèr an bwa', l.`id`, 'Remue la sauce avec la cuillère en bois.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une cuillère en bois');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-cuillere-bois.svg' WHERE `french_word` = 'une cuillère en bois' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a spatula', 'une spatule', '/images/vocab/cuis-spatule.svg', 'une spa-tül', l.`id`, 'Retourne la viande avec la spatule.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une spatule');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-spatule.svg' WHERE `french_word` = 'une spatule' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a rolling pin', 'un rouleau à pâtisserie', '/images/vocab/cuis-rouleau.svg', 'un rou-lo a pa-ti-sri', l.`id`, 'Étale la pâte avec le rouleau à pâtisserie.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un rouleau à pâtisserie');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-rouleau.svg' WHERE `french_word` = 'un rouleau à pâtisserie' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a grater', 'une râpe', '/images/vocab/cuis-rape.svg', 'une rap', l.`id`, 'Utilise la râpe pour le fromage.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une râpe');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-rape.svg' WHERE `french_word` = 'une râpe' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a salad bowl', 'un saladier', '/images/vocab/cuis-saladier.svg', 'un sa-la-dyé', l.`id`, 'Mélange tout dans le saladier.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un saladier');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-saladier.svg' WHERE `french_word` = 'un saladier' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an oven', 'un four', '/images/vocab/cuis-four.svg', 'un four', l.`id`, 'Le four est à deux cents degrés.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un four');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-four.svg' WHERE `french_word` = 'un four' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'oven mitts', 'des maniques', '/images/vocab/cuis-maniques.svg', 'dé ma-nik', l.`id`, 'Mets les maniques avant de prendre le plat.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'des maniques');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-maniques.svg' WHERE `french_word` = 'des maniques' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an apron', 'un tablier', '/images/vocab/cuis-tablier.svg', 'un ta-bli-yé', l.`id`, 'Mets ton tablier avant de cuisiner.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un tablier');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-tablier.svg' WHERE `french_word` = 'un tablier' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a scale', 'une balance', '/images/vocab/cuis-balance.svg', 'une ba-lans', l.`id`, 'Pèse la farine sur la balance.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une balance');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-balance.svg' WHERE `french_word` = 'une balance' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a timer', 'un minuteur', '/images/vocab/cuis-minuteur.svg', 'un mi-nu-teur', l.`id`, 'Règle le minuteur sur dix minutes.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un minuteur');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-minuteur.svg' WHERE `french_word` = 'un minuteur' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A1', 'LES GESTES DE CUISINE' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE');


INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to peel', 'éplucher', '/images/vocab/cuis-eplucher.svg', 'é-plu-shé', l.`id`, 'Épluche les pommes de terre.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'éplucher');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-eplucher.svg' WHERE `french_word` = 'éplucher' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to cut', 'couper', '/images/vocab/cuis-couper.svg', 'kou-pé', l.`id`, 'Coupe les oignons en petits morceaux.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'couper');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-couper.svg' WHERE `french_word` = 'couper' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to chop finely', 'hacher', '/images/vocab/cuis-hacher.svg', 'a-shé', l.`id`, 'Hache le persil.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'hacher');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-hacher.svg' WHERE `french_word` = 'hacher' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to slice thinly', 'émincer', '/images/vocab/cuis-emincer.svg', 'é-min-sé', l.`id`, 'Émince les champignons.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'émincer');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-emincer.svg' WHERE `french_word` = 'émincer' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to grate', 'râper', '/images/vocab/cuis-raper.svg', 'ra-pé', l.`id`, 'Râpe le fromage.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'râper');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-raper.svg' WHERE `french_word` = 'râper' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to weigh', 'peser', '/images/vocab/cuis-peser.svg', 'pe-zé', l.`id`, 'Pèse deux cents grammes de farine.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'peser');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-peser.svg' WHERE `french_word` = 'peser' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to wash', 'laver', '/images/vocab/cuis-laver.svg', 'la-vé', l.`id`, 'Lave les légumes à l''eau froide.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'laver');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-laver.svg' WHERE `french_word` = 'laver' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to mix', 'mélanger', '/images/vocab/cuis-melanger.svg', 'mé-lan-jé', l.`id`, 'Mélange la farine et les œufs.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'mélanger');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-melanger.svg' WHERE `french_word` = 'mélanger' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to stir', 'remuer', '/images/vocab/cuis-remuer.svg', 're-mu-é', l.`id`, 'Remue la sauce de temps en temps.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'remuer');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-remuer.svg' WHERE `french_word` = 'remuer' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to season', 'assaisonner', '/images/vocab/cuis-assaisonner.svg', 'a-sé-zo-né', l.`id`, 'Assaisonne la salade avec de l''huile et du vinaigre.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'assaisonner');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-assaisonner.svg' WHERE `french_word` = 'assaisonner' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to taste', 'goûter', '/images/vocab/cuis-gouter.svg', 'gou-té', l.`id`, 'Goûte la soupe avant de la servir.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'goûter');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-gouter.svg' WHERE `french_word` = 'goûter' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to boil', 'faire bouillir', '/images/vocab/cuis-bouillir.svg', 'fèr bou-yir', l.`id`, 'Fais bouillir l''eau pour les pâtes.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'faire bouillir');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-bouillir.svg' WHERE `french_word` = 'faire bouillir' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to sauté', 'faire revenir', '/images/vocab/cuis-revenir.svg', 'fèr re-ve-nir', l.`id`, 'Fais revenir les oignons dans l''huile.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'faire revenir');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-revenir.svg' WHERE `french_word` = 'faire revenir' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to simmer', 'faire mijoter', '/images/vocab/cuis-mijoter.svg', 'fèr mi-jo-té', l.`id`, 'Fais mijoter la sauce à feu doux.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'faire mijoter');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-mijoter.svg' WHERE `french_word` = 'faire mijoter' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to cook', 'faire cuire', '/images/vocab/cuis-cuire.svg', 'fèr kuir', l.`id`, 'Fais cuire le riz pendant quinze minutes.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'faire cuire');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-cuire.svg' WHERE `french_word` = 'faire cuire' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to grill', 'griller', '/images/vocab/cuis-griller.svg', 'gri-yé', l.`id`, 'Grille la viande des deux côtés.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'griller');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-griller.svg' WHERE `french_word` = 'griller' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to roast', 'rôtir', '/images/vocab/cuis-rotir.svg', 'ro-tir', l.`id`, 'Rôtis le poulet au four.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'rôtir');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-rotir.svg' WHERE `french_word` = 'rôtir' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to fry', 'faire frire', '/images/vocab/cuis-frire.svg', 'fèr frir', l.`id`, 'Fais frire les pommes de terre dans l''huile chaude.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'faire frire');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-frire.svg' WHERE `french_word` = 'faire frire' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to drain', 'égoutter', '/images/vocab/cuis-egoutter.svg', 'é-gou-té', l.`id`, 'Égoutte les pâtes dans la passoire.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'égoutter');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-egoutter.svg' WHERE `french_word` = 'égoutter' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to plate up', 'dresser', '/images/vocab/cuis-dresser.svg', 'dré-sé', l.`id`, 'Dresse l''assiette avec soin.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'dresser');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cuis-dresser.svg' WHERE `french_word` = 'dresser' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND (`image_url` IS NULL OR `image_url` = '');
