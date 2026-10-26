-- Lot 1 de leçons de vocabulaire : Les aliments de base, Les boissons, À la mairie et à la préfecture, Le logement et la location.
-- Crée les leçons et leurs mots (sans audio : la voix du navigateur lit les mots). Peut être exécuté plusieurs fois sans doublons.
-- Sur le serveur (aucune nouvelle image nécessaire) :
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_vocab_lot1.sql
SET NAMES utf8mb4;

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A1', 'LES ALIMENTS DE BASE' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'bread', 'le pain', NULL, 'pan', l.`id`, 'J''achète du pain à la boulangerie.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le pain');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'milk', 'le lait', NULL, 'lè', l.`id`, 'Les enfants boivent du lait le matin.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le lait');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an egg', 'un œuf', NULL, 'eun-euf', l.`id`, 'Je mange un œuf au petit-déjeuner.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un œuf');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'cheese', 'le fromage', NULL, 'fro-mazh', l.`id`, 'Le fromage est dans le frigo.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le fromage');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'meat', 'la viande', NULL, 'vyand', l.`id`, 'Je ne mange pas de viande le vendredi.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la viande');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'chicken', 'le poulet', NULL, 'pou-lè', l.`id`, 'Ce soir, nous mangeons du poulet avec du riz.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le poulet');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'fish', 'le poisson', NULL, 'pwa-son', l.`id`, 'Le poisson est frais aujourd''hui.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le poisson');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'rice', 'le riz', NULL, 'ri', l.`id`, 'Elle prépare du riz pour le déjeuner.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le riz');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'pasta', 'les pâtes', NULL, 'pat', l.`id`, 'Les enfants adorent les pâtes.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'les pâtes');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'butter', 'le beurre', NULL, 'beur', l.`id`, 'Je mets du beurre sur mon pain.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le beurre');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'sugar', 'le sucre', NULL, 'sukr', l.`id`, 'Je prends un café sans sucre.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le sucre');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'salt', 'le sel', NULL, 'sèl', l.`id`, 'Passe-moi le sel, s''il te plaît.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le sel');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'flour', 'la farine', NULL, 'fa-rin', l.`id`, 'Pour faire un gâteau, il faut de la farine.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la farine');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'ham', 'le jambon', NULL, 'zhan-bon', l.`id`, 'Je voudrais un sandwich au jambon.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le jambon');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'soup', 'la soupe', NULL, 'soup', l.`id`, 'La soupe est très chaude.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la soupe');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'salad', 'la salade', NULL, 'sa-lad', l.`id`, 'Nous mangeons une salade en entrée.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la salade');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'yoghurt', 'le yaourt', NULL, 'ya-ourt', l.`id`, 'Il mange un yaourt après le repas.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le yaourt');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'cake', 'le gâteau', NULL, 'ga-to', l.`id`, 'Le gâteau d''anniversaire est délicieux.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le gâteau');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'oil', 'l''huile', NULL, 'wil', l.`id`, 'On cuisine avec de l''huile.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'l''huile');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'honey', 'le miel', NULL, 'myèl', l.`id`, 'Je mets du miel dans mon thé.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ALIMENTS DE BASE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le miel');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A1', 'LES BOISSONS' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LES BOISSONS');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'water', 'l''eau', NULL, 'o', l.`id`, 'Je bois un verre d''eau.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'l''eau');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'sparkling water', 'l''eau gazeuse', NULL, 'o ga-zeuz', l.`id`, 'Elle préfère l''eau gazeuse.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'l''eau gazeuse');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'coffee', 'le café', NULL, 'ka-fé', l.`id`, 'Je prends un café le matin.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le café');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'tea', 'le thé', NULL, 'té', l.`id`, 'Il boit du thé avec du citron.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le thé');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'orange juice', 'le jus d''orange', NULL, 'zhu do-ranzh', l.`id`, 'Les enfants boivent du jus d''orange.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le jus d''orange');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'lemonade', 'la limonade', NULL, 'li-mo-nad', l.`id`, 'Nous buvons de la limonade en été.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la limonade');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'wine', 'le vin', NULL, 'van', l.`id`, 'Le vin rouge accompagne le fromage.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le vin');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'beer', 'la bière', NULL, 'byèr', l.`id`, 'Il commande une bière au café.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la bière');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'hot chocolate', 'le chocolat chaud', NULL, 'sho-ko-la sho', l.`id`, 'Le chocolat chaud est parfait en hiver.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le chocolat chaud');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'syrup', 'le sirop', NULL, 'si-ro', l.`id`, 'Je mets du sirop dans mon eau.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le sirop');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'ice cubes', 'les glaçons', NULL, 'gla-son', l.`id`, 'Je voudrais de l''eau avec des glaçons.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'les glaçons');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a bottle', 'une bouteille', NULL, 'bou-tèy', l.`id`, 'J''achète une bouteille d''eau.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une bouteille');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a glass', 'un verre', NULL, 'vèr', l.`id`, 'Il casse un verre.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un verre');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a cup', 'une tasse', NULL, 'tas', l.`id`, 'Elle boit son café dans une grande tasse.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une tasse');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a can', 'une canette', NULL, 'ka-nèt', l.`id`, 'Il boit une canette de soda.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une canette');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a jug of water', 'une carafe d''eau', NULL, 'ka-raf do', l.`id`, 'Au restaurant, on demande une carafe d''eau.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES BOISSONS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une carafe d''eau');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A2', 'À LA MAIRIE ET À LA PRÉFECTURE' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the town hall', 'la mairie', NULL, 'mè-ri', l.`id`, 'La mairie ouvre à huit heures trente.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la mairie');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the prefecture', 'la préfecture', NULL, 'pré-fèk-tur', l.`id`, 'Je vais à la préfecture avec mon dossier.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la préfecture');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a file', 'un dossier', NULL, 'do-syé', l.`id`, 'Je prépare mon dossier.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un dossier');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a form', 'un formulaire', NULL, 'for-mu-lèr', l.`id`, 'Je remplis un formulaire.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un formulaire');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an appointment', 'un rendez-vous', NULL, 'ran-dé-vou', l.`id`, 'J''ai rendez-vous mardi à dix heures.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un rendez-vous');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'proof of address', 'un justificatif de domicile', NULL, 'zhus-ti-fi-ka-tif de do-mi-sil', l.`id`, 'Je donne un justificatif de domicile.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un justificatif de domicile');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an ID document', 'une pièce d''identité', NULL, 'pyès di-dan-ti-té', l.`id`, 'Il faut apporter une pièce d''identité.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une pièce d''identité');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a residence permit', 'une carte de séjour', NULL, 'kart de sé-zhour', l.`id`, 'Sa carte de séjour est valable un an.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une carte de séjour');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a passport', 'un passeport', NULL, 'pas-por', l.`id`, 'Mon passeport est dans mon sac.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un passeport');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a birth certificate', 'un acte de naissance', NULL, 'akt de nè-sans', l.`id`, 'On demande souvent un acte de naissance.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un acte de naissance');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a request', 'une demande', NULL, 'de-mand', l.`id`, 'Je fais une demande en ligne.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une demande');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a counter', 'un guichet', NULL, 'gui-shè', l.`id`, 'Je vais au guichet numéro trois.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un guichet');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a queue', 'une file d''attente', NULL, 'fil da-tant', l.`id`, 'Il y a une longue file d''attente.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une file d''attente');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a number (ticket)', 'un numéro', NULL, 'nu-mé-ro', l.`id`, 'Je prends un numéro et j''attends.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un numéro');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a photocopy', 'une photocopie', NULL, 'fo-to-ko-pi', l.`id`, 'Je fais une photocopie de mon passeport.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une photocopie');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a certificate', 'une attestation', NULL, 'a-tès-ta-syon', l.`id`, 'Je demande une attestation.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une attestation');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the signature', 'la signature', NULL, 'si-nya-tur', l.`id`, 'La signature est en bas du document.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la signature');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to fill in', 'remplir', NULL, 'ran-plir', l.`id`, 'Je dois remplir ce document.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA MAIRIE ET À LA PRÉFECTURE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'remplir');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A2', 'LE LOGEMENT ET LA LOCATION' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the housing', 'le logement', NULL, 'lozh-man', l.`id`, 'Je cherche un logement près du centre.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le logement');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a flat', 'un appartement', NULL, 'a-par-te-man', l.`id`, 'Notre appartement a trois pièces.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un appartement');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the rent', 'le loyer', NULL, 'lwa-yé', l.`id`, 'Le loyer est de six cents euros par mois.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le loyer');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the lease', 'le bail', NULL, 'bay', l.`id`, 'Nous signons le bail demain.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le bail');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the landlord', 'le propriétaire', NULL, 'pro-pri-é-tèr', l.`id`, 'Le propriétaire habite dans l''immeuble.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le propriétaire');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the tenant', 'le locataire', NULL, 'lo-ka-tèr', l.`id`, 'Le locataire paie le loyer chaque mois.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le locataire');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the service charges', 'les charges', NULL, 'sharzh', l.`id`, 'Les charges comprennent l''eau et le chauffage.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'les charges');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the deposit', 'la caution', NULL, 'ko-syon', l.`id`, 'Je verse une caution au propriétaire.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la caution');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a rental contract', 'un contrat de location', NULL, 'kon-tra de lo-ka-syon', l.`id`, 'Je lis bien le contrat de location.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un contrat de location');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an estate agency', 'une agence immobilière', NULL, 'a-zhans i-mo-bi-lyèr', l.`id`, 'Nous visitons avec une agence immobilière.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une agence immobilière');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an advert', 'une annonce', NULL, 'a-nons', l.`id`, 'Je lis une annonce pour un appartement.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une annonce');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a neighbour', 'un voisin', NULL, 'vwa-zan', l.`id`, 'Mon voisin est très gentil.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un voisin');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a building', 'un immeuble', NULL, 'i-meubl', l.`id`, 'Notre immeuble a six étages.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un immeuble');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a floor', 'un étage', NULL, 'é-tazh', l.`id`, 'J''habite au deuxième étage.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un étage');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a lift', 'un ascenseur', NULL, 'a-san-seur', l.`id`, 'L''ascenseur est en panne.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un ascenseur');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a check-in report', 'un état des lieux', NULL, 'é-ta dé lyeu', l.`id`, 'On fait l''état des lieux à l''entrée.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un état des lieux');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a move', 'un déménagement', NULL, 'dé-mé-na-zhe-man', l.`id`, 'Le déménagement est samedi.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un déménagement');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to rent', 'louer', NULL, 'lou-é', l.`id`, 'Nous voulons louer un appartement.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE LOGEMENT ET LA LOCATION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'louer');
