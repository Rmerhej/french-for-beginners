-- Lot 1 de leçons de vocabulaire : Les aliments de base, Les boissons, À la mairie et à la préfecture, Le logement et la location.
-- Crée les leçons et leurs mots (images dans static/images/vocab, sans audio : la voix du navigateur lit les mots et les phrases). Peut être exécuté plusieurs fois sans doublons ; relancé après une première exécution, il ajoute seulement les images manquantes.
-- Les illustrations sont dans l'application : déployer d'abord la nouvelle image Docker, puis sur le serveur :
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_vocab_lot1.sql
SET NAMES utf8mb4;

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A1', 'LES ALIMENTS DE BASE' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'bread', 'le pain', '/images/vocab/le-pain.svg', 'pan', l.`id`, 'J''achète du pain à la boulangerie.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le pain');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-pain.svg' WHERE `french_word` = 'le pain' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'milk', 'le lait', '/images/vocab/le-lait.svg', 'lè', l.`id`, 'Les enfants boivent du lait le matin.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le lait');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-lait.svg' WHERE `french_word` = 'le lait' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an egg', 'un œuf', '/images/vocab/un-oeuf.svg', 'eun-euf', l.`id`, 'Je mange un œuf au petit-déjeuner.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un œuf');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-oeuf.svg' WHERE `french_word` = 'un œuf' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'cheese', 'le fromage', '/images/vocab/le-fromage.svg', 'fro-mazh', l.`id`, 'Le fromage est dans le frigo.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le fromage');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-fromage.svg' WHERE `french_word` = 'le fromage' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'meat', 'la viande', '/images/vocab/la-viande.svg', 'vyand', l.`id`, 'Je ne mange pas de viande le vendredi.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la viande');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-viande.svg' WHERE `french_word` = 'la viande' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'chicken', 'le poulet', '/images/vocab/le-poulet.svg', 'pou-lè', l.`id`, 'Ce soir, nous mangeons du poulet avec du riz.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le poulet');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-poulet.svg' WHERE `french_word` = 'le poulet' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'fish', 'le poisson', '/images/vocab/le-poisson.svg', 'pwa-son', l.`id`, 'Le poisson est frais aujourd''hui.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le poisson');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-poisson.svg' WHERE `french_word` = 'le poisson' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'rice', 'le riz', '/images/vocab/le-riz.svg', 'ri', l.`id`, 'Elle prépare du riz pour le déjeuner.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le riz');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-riz.svg' WHERE `french_word` = 'le riz' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'pasta', 'les pâtes', '/images/vocab/les-pates.svg', 'pat', l.`id`, 'Les enfants adorent les pâtes.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'les pâtes');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/les-pates.svg' WHERE `french_word` = 'les pâtes' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'butter', 'le beurre', '/images/vocab/le-beurre.svg', 'beur', l.`id`, 'Je mets du beurre sur mon pain.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le beurre');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-beurre.svg' WHERE `french_word` = 'le beurre' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'sugar', 'le sucre', '/images/vocab/le-sucre.svg', 'sukr', l.`id`, 'Je prends un café sans sucre.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le sucre');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-sucre.svg' WHERE `french_word` = 'le sucre' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'salt', 'le sel', '/images/vocab/le-sel.svg', 'sèl', l.`id`, 'Passe-moi le sel, s''il te plaît.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le sel');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-sel.svg' WHERE `french_word` = 'le sel' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'flour', 'la farine', '/images/vocab/la-farine.svg', 'fa-rin', l.`id`, 'Pour faire un gâteau, il faut de la farine.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la farine');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-farine.svg' WHERE `french_word` = 'la farine' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'ham', 'le jambon', '/images/vocab/le-jambon.svg', 'zhan-bon', l.`id`, 'Je voudrais un sandwich au jambon.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le jambon');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-jambon.svg' WHERE `french_word` = 'le jambon' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'soup', 'la soupe', '/images/vocab/la-soupe.svg', 'soup', l.`id`, 'La soupe est très chaude.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la soupe');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-soupe.svg' WHERE `french_word` = 'la soupe' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'salad', 'la salade', '/images/vocab/la-salade.svg', 'sa-lad', l.`id`, 'Nous mangeons une salade en entrée.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la salade');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-salade.svg' WHERE `french_word` = 'la salade' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'yoghurt', 'le yaourt', '/images/vocab/le-yaourt.svg', 'ya-ourt', l.`id`, 'Il mange un yaourt après le repas.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le yaourt');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-yaourt.svg' WHERE `french_word` = 'le yaourt' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'cake', 'le gâteau', '/images/vocab/le-gateau.svg', 'ga-to', l.`id`, 'Le gâteau d''anniversaire est délicieux.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le gâteau');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-gateau.svg' WHERE `french_word` = 'le gâteau' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'oil', 'l''huile', '/images/vocab/l-huile.svg', 'wil', l.`id`, 'On cuisine avec de l''huile.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'l''huile');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/l-huile.svg' WHERE `french_word` = 'l''huile' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'honey', 'le miel', '/images/vocab/le-miel.svg', 'myèl', l.`id`, 'Je mets du miel dans mon thé.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le miel');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-miel.svg' WHERE `french_word` = 'le miel' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A1', 'LES BOISSONS' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LES BOISSONS');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'water', 'l''eau', '/images/vocab/l-eau.svg', 'o', l.`id`, 'Je bois un verre d''eau.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'l''eau');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/l-eau.svg' WHERE `french_word` = 'l''eau' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'sparkling water', 'l''eau gazeuse', '/images/vocab/l-eau-gazeuse.svg', 'o ga-zeuz', l.`id`, 'Elle préfère l''eau gazeuse.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'l''eau gazeuse');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/l-eau-gazeuse.svg' WHERE `french_word` = 'l''eau gazeuse' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'coffee', 'le café', '/images/vocab/le-cafe.svg', 'ka-fé', l.`id`, 'Je prends un café le matin.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le café');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-cafe.svg' WHERE `french_word` = 'le café' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'tea', 'le thé', '/images/vocab/le-the.svg', 'té', l.`id`, 'Il boit du thé avec du citron.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le thé');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-the.svg' WHERE `french_word` = 'le thé' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'orange juice', 'le jus d''orange', '/images/vocab/le-jus-d-orange.svg', 'zhu do-ranzh', l.`id`, 'Les enfants boivent du jus d''orange.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le jus d''orange');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-jus-d-orange.svg' WHERE `french_word` = 'le jus d''orange' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'lemonade', 'la limonade', '/images/vocab/la-limonade.svg', 'li-mo-nad', l.`id`, 'Nous buvons de la limonade en été.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la limonade');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-limonade.svg' WHERE `french_word` = 'la limonade' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'wine', 'le vin', '/images/vocab/le-vin.svg', 'van', l.`id`, 'Le vin rouge accompagne le fromage.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le vin');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-vin.svg' WHERE `french_word` = 'le vin' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'beer', 'la bière', '/images/vocab/la-biere.svg', 'byèr', l.`id`, 'Il commande une bière au café.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la bière');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-biere.svg' WHERE `french_word` = 'la bière' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'hot chocolate', 'le chocolat chaud', '/images/vocab/le-chocolat-chaud.svg', 'sho-ko-la sho', l.`id`, 'Le chocolat chaud est parfait en hiver.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le chocolat chaud');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-chocolat-chaud.svg' WHERE `french_word` = 'le chocolat chaud' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'syrup', 'le sirop', '/images/vocab/le-sirop.svg', 'si-ro', l.`id`, 'Je mets du sirop dans mon eau.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le sirop');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-sirop.svg' WHERE `french_word` = 'le sirop' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'ice cubes', 'les glaçons', '/images/vocab/les-glacons.svg', 'gla-son', l.`id`, 'Je voudrais de l''eau avec des glaçons.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'les glaçons');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/les-glacons.svg' WHERE `french_word` = 'les glaçons' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a bottle', 'une bouteille', '/images/vocab/une-bouteille.svg', 'bou-tèy', l.`id`, 'J''achète une bouteille d''eau.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une bouteille');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-bouteille.svg' WHERE `french_word` = 'une bouteille' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a glass', 'un verre', '/images/vocab/un-verre.svg', 'vèr', l.`id`, 'Il casse un verre.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un verre');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-verre.svg' WHERE `french_word` = 'un verre' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a cup', 'une tasse', '/images/vocab/une-tasse.svg', 'tas', l.`id`, 'Elle boit son café dans une grande tasse.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une tasse');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-tasse.svg' WHERE `french_word` = 'une tasse' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a can', 'une canette', '/images/vocab/une-canette.svg', 'ka-nèt', l.`id`, 'Il boit une canette de soda.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une canette');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-canette.svg' WHERE `french_word` = 'une canette' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a jug of water', 'une carafe d''eau', '/images/vocab/une-carafe-d-eau.svg', 'ka-raf do', l.`id`, 'Au restaurant, on demande une carafe d''eau.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une carafe d''eau');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-carafe-d-eau.svg' WHERE `french_word` = 'une carafe d''eau' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A2', 'À LA MAIRIE ET À LA PRÉFECTURE' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the town hall', 'la mairie', '/images/vocab/la-mairie.svg', 'mè-ri', l.`id`, 'La mairie ouvre à huit heures trente.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la mairie');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-mairie.svg' WHERE `french_word` = 'la mairie' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the prefecture', 'la préfecture', '/images/vocab/la-prefecture.svg', 'pré-fèk-tur', l.`id`, 'Je vais à la préfecture avec mon dossier.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la préfecture');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-prefecture.svg' WHERE `french_word` = 'la préfecture' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a file', 'un dossier', '/images/vocab/un-dossier.svg', 'do-syé', l.`id`, 'Je prépare mon dossier.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un dossier');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-dossier.svg' WHERE `french_word` = 'un dossier' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a form', 'un formulaire', '/images/vocab/un-formulaire.svg', 'for-mu-lèr', l.`id`, 'Je remplis un formulaire.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un formulaire');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-formulaire.svg' WHERE `french_word` = 'un formulaire' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an appointment', 'un rendez-vous', '/images/vocab/un-rendez-vous.svg', 'ran-dé-vou', l.`id`, 'J''ai rendez-vous mardi à dix heures.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un rendez-vous');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-rendez-vous.svg' WHERE `french_word` = 'un rendez-vous' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'proof of address', 'un justificatif de domicile', '/images/vocab/un-justificatif-de-domicile.svg', 'zhus-ti-fi-ka-tif de do-mi-sil', l.`id`, 'Je donne un justificatif de domicile.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un justificatif de domicile');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-justificatif-de-domicile.svg' WHERE `french_word` = 'un justificatif de domicile' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an ID document', 'une pièce d''identité', '/images/vocab/une-piece-d-identite.svg', 'pyès di-dan-ti-té', l.`id`, 'Il faut apporter une pièce d''identité.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une pièce d''identité');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-piece-d-identite.svg' WHERE `french_word` = 'une pièce d''identité' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a residence permit', 'une carte de séjour', '/images/vocab/une-carte-de-sejour.svg', 'kart de sé-zhour', l.`id`, 'Sa carte de séjour est valable un an.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une carte de séjour');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-carte-de-sejour.svg' WHERE `french_word` = 'une carte de séjour' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a passport', 'un passeport', '/images/vocab/un-passeport.svg', 'pas-por', l.`id`, 'Mon passeport est dans mon sac.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un passeport');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-passeport.svg' WHERE `french_word` = 'un passeport' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a birth certificate', 'un acte de naissance', '/images/vocab/un-acte-de-naissance.svg', 'akt de nè-sans', l.`id`, 'On demande souvent un acte de naissance.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un acte de naissance');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-acte-de-naissance.svg' WHERE `french_word` = 'un acte de naissance' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a request', 'une demande', '/images/vocab/une-demande.svg', 'de-mand', l.`id`, 'Je fais une demande en ligne.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une demande');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-demande.svg' WHERE `french_word` = 'une demande' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a counter', 'un guichet', '/images/vocab/un-guichet.svg', 'gui-shè', l.`id`, 'Je vais au guichet numéro trois.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un guichet');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-guichet.svg' WHERE `french_word` = 'un guichet' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a queue', 'une file d''attente', '/images/vocab/une-file-d-attente.svg', 'fil da-tant', l.`id`, 'Il y a une longue file d''attente.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une file d''attente');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-file-d-attente.svg' WHERE `french_word` = 'une file d''attente' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a number (ticket)', 'un numéro', '/images/vocab/un-numero.svg', 'nu-mé-ro', l.`id`, 'Je prends un numéro et j''attends.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un numéro');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-numero.svg' WHERE `french_word` = 'un numéro' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a photocopy', 'une photocopie', '/images/vocab/une-photocopie.svg', 'fo-to-ko-pi', l.`id`, 'Je fais une photocopie de mon passeport.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une photocopie');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-photocopie.svg' WHERE `french_word` = 'une photocopie' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a certificate', 'une attestation', '/images/vocab/une-attestation.svg', 'a-tès-ta-syon', l.`id`, 'Je demande une attestation.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une attestation');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-attestation.svg' WHERE `french_word` = 'une attestation' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the signature', 'la signature', '/images/vocab/la-signature.svg', 'si-nya-tur', l.`id`, 'La signature est en bas du document.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la signature');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-signature.svg' WHERE `french_word` = 'la signature' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to fill in', 'remplir', '/images/vocab/remplir.svg', 'ran-plir', l.`id`, 'Je dois remplir ce document.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'remplir');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/remplir.svg' WHERE `french_word` = 'remplir' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A2', 'LE LOGEMENT ET LA LOCATION' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the housing', 'le logement', '/images/vocab/le-logement.svg', 'lozh-man', l.`id`, 'Je cherche un logement près du centre.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le logement');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-logement.svg' WHERE `french_word` = 'le logement' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a flat', 'un appartement', '/images/vocab/un-appartement.svg', 'a-par-te-man', l.`id`, 'Notre appartement a trois pièces.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un appartement');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-appartement.svg' WHERE `french_word` = 'un appartement' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the rent', 'le loyer', '/images/vocab/le-loyer.svg', 'lwa-yé', l.`id`, 'Le loyer est de six cents euros par mois.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le loyer');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-loyer.svg' WHERE `french_word` = 'le loyer' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the lease', 'le bail', '/images/vocab/le-bail.svg', 'bay', l.`id`, 'Nous signons le bail demain.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le bail');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-bail.svg' WHERE `french_word` = 'le bail' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the landlord', 'le propriétaire', '/images/vocab/le-proprietaire.svg', 'pro-pri-é-tèr', l.`id`, 'Le propriétaire habite dans l''immeuble.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le propriétaire');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-proprietaire.svg' WHERE `french_word` = 'le propriétaire' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the tenant', 'le locataire', '/images/vocab/le-locataire.svg', 'lo-ka-tèr', l.`id`, 'Le locataire paie le loyer chaque mois.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le locataire');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-locataire.svg' WHERE `french_word` = 'le locataire' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the service charges', 'les charges', '/images/vocab/les-charges.svg', 'sharzh', l.`id`, 'Les charges comprennent l''eau et le chauffage.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'les charges');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/les-charges.svg' WHERE `french_word` = 'les charges' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the deposit', 'la caution', '/images/vocab/la-caution.svg', 'ko-syon', l.`id`, 'Je verse une caution au propriétaire.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la caution');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-caution.svg' WHERE `french_word` = 'la caution' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a rental contract', 'un contrat de location', '/images/vocab/un-contrat-de-location.svg', 'kon-tra de lo-ka-syon', l.`id`, 'Je lis bien le contrat de location.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un contrat de location');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-contrat-de-location.svg' WHERE `french_word` = 'un contrat de location' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an estate agency', 'une agence immobilière', '/images/vocab/une-agence-immobiliere.svg', 'a-zhans i-mo-bi-lyèr', l.`id`, 'Nous visitons avec une agence immobilière.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une agence immobilière');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-agence-immobiliere.svg' WHERE `french_word` = 'une agence immobilière' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an advert', 'une annonce', '/images/vocab/une-annonce.svg', 'a-nons', l.`id`, 'Je lis une annonce pour un appartement.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une annonce');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-annonce.svg' WHERE `french_word` = 'une annonce' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a neighbour', 'un voisin', '/images/vocab/un-voisin.svg', 'vwa-zan', l.`id`, 'Mon voisin est très gentil.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un voisin');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-voisin.svg' WHERE `french_word` = 'un voisin' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a building', 'un immeuble', '/images/vocab/un-immeuble.svg', 'i-meubl', l.`id`, 'Notre immeuble a six étages.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un immeuble');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-immeuble.svg' WHERE `french_word` = 'un immeuble' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a floor', 'un étage', '/images/vocab/un-etage.svg', 'é-tazh', l.`id`, 'J''habite au deuxième étage.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un étage');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-etage.svg' WHERE `french_word` = 'un étage' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a lift', 'un ascenseur', '/images/vocab/un-ascenseur.svg', 'a-san-seur', l.`id`, 'L''ascenseur est en panne.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un ascenseur');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-ascenseur.svg' WHERE `french_word` = 'un ascenseur' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a check-in report', 'un état des lieux', '/images/vocab/un-etat-des-lieux.svg', 'é-ta dé lyeu', l.`id`, 'On fait l''état des lieux à l''entrée.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un état des lieux');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-etat-des-lieux.svg' WHERE `french_word` = 'un état des lieux' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a move', 'un déménagement', '/images/vocab/un-demenagement.svg', 'dé-mé-na-zhe-man', l.`id`, 'Le déménagement est samedi.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un déménagement');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-demenagement.svg' WHERE `french_word` = 'un déménagement' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to rent', 'louer', '/images/vocab/louer.svg', 'lou-é', l.`id`, 'Nous voulons louer un appartement.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'louer');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/louer.svg' WHERE `french_word` = 'louer' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND (`image_url` IS NULL OR `image_url` = '');
