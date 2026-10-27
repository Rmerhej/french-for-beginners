-- Lot 2 de leçons de vocabulaire : Au restaurant, Au supermarché, La cuisine, La salle de bain, L'argent et les prix, À la poste et à la banque.
-- Crée les leçons et leurs mots (images dans static/images/vocab, sans audio : la voix du navigateur lit les mots et les phrases). Peut être exécuté plusieurs fois sans doublons ; relancé, il ajoute seulement ce qui manque.
-- Les illustrations sont dans l'application : déployer d'abord la nouvelle image Docker, puis sur le serveur :
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_vocab_lot2.sql
SET NAMES utf8mb4;

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A1', 'AU RESTAURANT' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'AU RESTAURANT');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a restaurant', 'un restaurant', '/images/vocab/un-restaurant.svg', 'rès-to-ran', l.`id`, 'Nous mangeons au restaurant samedi soir.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un restaurant');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-restaurant.svg' WHERE `french_word` = 'un restaurant' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a menu', 'un menu', '/images/vocab/un-menu.svg', 'me-nu', l.`id`, 'Le serveur apporte le menu.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un menu');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-menu.svg' WHERE `french_word` = 'un menu' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a table', 'une table', '/images/vocab/une-table.svg', 'tabl', l.`id`, 'Nous voudrions une table pour quatre personnes.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une table');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-table.svg' WHERE `french_word` = 'une table' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a waiter', 'un serveur', '/images/vocab/un-serveur.svg', 'sèr-veur', l.`id`, 'Le serveur est très aimable.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un serveur');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-serveur.svg' WHERE `french_word` = 'un serveur' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a booking', 'une réservation', '/images/vocab/une-reservation.svg', 'ré-zèr-va-syon', l.`id`, 'J''ai fait une réservation pour vingt heures.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une réservation');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-reservation.svg' WHERE `french_word` = 'une réservation' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a starter', 'une entrée', '/images/vocab/une-entree.svg', 'an-tré', l.`id`, 'Comme entrée, je prends une salade.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une entrée');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-entree.svg' WHERE `french_word` = 'une entrée' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a main course', 'un plat principal', '/images/vocab/un-plat-principal.svg', 'pla pran-si-pal', l.`id`, 'Le plat principal est du poulet avec du riz.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un plat principal');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-plat-principal.svg' WHERE `french_word` = 'un plat principal' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a dessert', 'un dessert', '/images/vocab/un-dessert.svg', 'dé-sèr', l.`id`, 'Comme dessert, je voudrais un gâteau.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un dessert');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-dessert.svg' WHERE `french_word` = 'un dessert' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the bill', 'l''addition', '/images/vocab/l-addition.svg', 'a-di-syon', l.`id`, 'L''addition, s''il vous plaît.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'l''addition');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/l-addition.svg' WHERE `french_word` = 'l''addition' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the tip', 'le pourboire', '/images/vocab/le-pourboire.svg', 'pour-bwar', l.`id`, 'Nous laissons un pourboire au serveur.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le pourboire');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-pourboire.svg' WHERE `french_word` = 'le pourboire' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a plate', 'une assiette', '/images/vocab/une-assiette.svg', 'a-syèt', l.`id`, 'Il y a une assiette devant chaque personne.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une assiette');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-assiette.svg' WHERE `french_word` = 'une assiette' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a fork', 'une fourchette', '/images/vocab/une-fourchette.svg', 'four-shèt', l.`id`, 'Je mange les pâtes avec une fourchette.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une fourchette');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-fourchette.svg' WHERE `french_word` = 'une fourchette' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a knife', 'un couteau', '/images/vocab/un-couteau.svg', 'kou-to', l.`id`, 'Il coupe la viande avec un couteau.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un couteau');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-couteau.svg' WHERE `french_word` = 'un couteau' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a spoon', 'une cuillère', '/images/vocab/une-cuillere.svg', 'kui-yèr', l.`id`, 'On mange la soupe avec une cuillère.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une cuillère');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-cuillere.svg' WHERE `french_word` = 'une cuillère' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a napkin', 'une serviette', '/images/vocab/une-serviette.svg', 'sèr-vyèt', l.`id`, 'Je pose ma serviette sur mes genoux.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une serviette');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-serviette.svg' WHERE `french_word` = 'une serviette' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to order', 'commander', '/images/vocab/commander.svg', 'ko-man-dé', l.`id`, 'Nous voulons commander, s''il vous plaît.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'commander');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/commander.svg' WHERE `french_word` = 'commander' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'vegetarian', 'végétarien', '/images/vocab/vegetarien.svg', 'vé-zhé-ta-ryan', l.`id`, 'Ma sœur est végétarienne.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'végétarien');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/vegetarien.svg' WHERE `french_word` = 'végétarien' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'enjoy your meal', 'bon appétit', '/images/vocab/bon-appetit.svg', 'bo na-pé-ti', l.`id`, 'Bon appétit, tout le monde !', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'bon appétit');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/bon-appetit.svg' WHERE `french_word` = 'bon appétit' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU RESTAURANT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A1', 'AU SUPERMARCHÉ' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a supermarket', 'un supermarché', '/images/vocab/un-supermarche.svg', 'su-pèr-mar-shé', l.`id`, 'Je fais mes courses au supermarché.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un supermarché');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-supermarche.svg' WHERE `french_word` = 'un supermarché' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a trolley', 'un caddie', '/images/vocab/un-caddie.svg', 'ka-di', l.`id`, 'Je prends un caddie à l''entrée.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un caddie');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-caddie.svg' WHERE `french_word` = 'un caddie' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a basket', 'un panier', '/images/vocab/un-panier.svg', 'pa-nyé', l.`id`, 'Un panier suffit pour quelques produits.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un panier');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-panier.svg' WHERE `french_word` = 'un panier' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an aisle', 'un rayon', '/images/vocab/un-rayon.svg', 'rè-yon', l.`id`, 'Le rayon des fruits est au fond.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un rayon');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-rayon.svg' WHERE `french_word` = 'un rayon' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a checkout', 'une caisse', '/images/vocab/une-caisse.svg', 'kès', l.`id`, 'Il y a beaucoup de monde à la caisse.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une caisse');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-caisse.svg' WHERE `french_word` = 'une caisse' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a receipt', 'un ticket de caisse', '/images/vocab/un-ticket-de-caisse.svg', 'ti-kè de kès', l.`id`, 'Je garde mon ticket de caisse.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un ticket de caisse');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-ticket-de-caisse.svg' WHERE `french_word` = 'un ticket de caisse' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a special offer', 'une promotion', '/images/vocab/une-promotion.svg', 'pro-mo-syon', l.`id`, 'Les pommes sont en promotion cette semaine.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une promotion');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-promotion.svg' WHERE `french_word` = 'une promotion' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a shopping list', 'une liste de courses', '/images/vocab/une-liste-de-courses.svg', 'list de kourss', l.`id`, 'J''écris une liste de courses.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une liste de courses');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-liste-de-courses.svg' WHERE `french_word` = 'une liste de courses' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a kilo', 'un kilo', '/images/vocab/un-kilo.svg', 'ki-lo', l.`id`, 'Je voudrais un kilo de pommes de terre.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un kilo');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-kilo.svg' WHERE `french_word` = 'un kilo' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a litre', 'un litre', '/images/vocab/un-litre.svg', 'litr', l.`id`, 'J''achète un litre de lait.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un litre');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-litre.svg' WHERE `french_word` = 'un litre' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a packet', 'un paquet', '/images/vocab/un-paquet.svg', 'pa-kè', l.`id`, 'Il prend un paquet de pâtes.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un paquet');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-paquet.svg' WHERE `french_word` = 'un paquet' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a tin / a box', 'une boîte', '/images/vocab/une-boite.svg', 'bwat', l.`id`, 'Elle ouvre une boîte de tomates.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une boîte');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-boite.svg' WHERE `french_word` = 'une boîte' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a tray', 'une barquette', '/images/vocab/une-barquette.svg', 'bar-kèt', l.`id`, 'Je prends une barquette de fraises.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une barquette');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-barquette.svg' WHERE `french_word` = 'une barquette' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'fresh', 'frais', '/images/vocab/frais.svg', 'frè', l.`id`, 'Les produits frais sont dans le rayon du fond.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'frais');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/frais.svg' WHERE `french_word` = 'frais' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'frozen', 'surgelé', '/images/vocab/surgele.svg', 'sur-zhe-lé', l.`id`, 'Les légumes surgelés sont pratiques.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'surgelé');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/surgele.svg' WHERE `french_word` = 'surgelé' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the use-by date', 'la date limite', '/images/vocab/la-date-limite.svg', 'dat li-mit', l.`id`, 'Je regarde la date limite avant d''acheter.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la date limite');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-date-limite.svg' WHERE `french_word` = 'la date limite' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a reusable bag', 'un sac réutilisable', '/images/vocab/un-sac-reutilisable.svg', 'sak ré-u-ti-li-zabl', l.`id`, 'J''apporte mon sac réutilisable.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un sac réutilisable');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-sac-reutilisable.svg' WHERE `french_word` = 'un sac réutilisable' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to pay', 'payer', '/images/vocab/payer.svg', 'pé-yé', l.`id`, 'Je paie à la caisse.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'payer');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/payer.svg' WHERE `french_word` = 'payer' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'AU SUPERMARCHÉ') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A1', 'LA CUISINE' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LA CUISINE');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a kitchen', 'une cuisine', '/images/vocab/une-cuisine.svg', 'kui-zin', l.`id`, 'Nous mangeons dans la cuisine.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une cuisine');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-cuisine.svg' WHERE `french_word` = 'une cuisine' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a fridge', 'un frigo', '/images/vocab/un-frigo.svg', 'fri-go', l.`id`, 'Le lait est dans le frigo.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un frigo');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-frigo.svg' WHERE `french_word` = 'un frigo' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an oven', 'un four', '/images/vocab/un-four.svg', 'four', l.`id`, 'Le gâteau cuit dans le four.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un four');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-four.svg' WHERE `french_word` = 'un four' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a hob', 'une plaque de cuisson', '/images/vocab/une-plaque-de-cuisson.svg', 'plak de kui-son', l.`id`, 'La plaque de cuisson est chaude.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une plaque de cuisson');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-plaque-de-cuisson.svg' WHERE `french_word` = 'une plaque de cuisson' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a saucepan', 'une casserole', '/images/vocab/une-casserole.svg', 'kas-rol', l.`id`, 'Je fais bouillir l''eau dans une casserole.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une casserole');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-casserole.svg' WHERE `french_word` = 'une casserole' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a frying pan', 'une poêle', '/images/vocab/une-poele.svg', 'pwal', l.`id`, 'Elle fait cuire un œuf dans la poêle.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une poêle');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-poele.svg' WHERE `french_word` = 'une poêle' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a chopping board', 'une planche à découper', '/images/vocab/une-planche-a-decouper.svg', 'plansh a dé-ku-pé', l.`id`, 'Je coupe les légumes sur la planche à découper.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une planche à découper');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-planche-a-decouper.svg' WHERE `french_word` = 'une planche à découper' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a salad bowl', 'un saladier', '/images/vocab/un-saladier.svg', 'sa-la-dyé', l.`id`, 'Il mélange la salade dans un saladier.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un saladier');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-saladier.svg' WHERE `french_word` = 'un saladier' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a sink', 'un évier', '/images/vocab/un-evier.svg', 'é-vyé', l.`id`, 'Les assiettes sont dans l''évier.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un évier');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-evier.svg' WHERE `french_word` = 'un évier' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a dishwasher', 'un lave-vaisselle', '/images/vocab/un-lave-vaisselle.svg', 'lav vè-sèl', l.`id`, 'Je mets les verres dans le lave-vaisselle.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un lave-vaisselle');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-lave-vaisselle.svg' WHERE `french_word` = 'un lave-vaisselle' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a microwave', 'un micro-ondes', '/images/vocab/un-micro-ondes.svg', 'mi-kro-ond', l.`id`, 'Je réchauffe mon plat au micro-ondes.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un micro-ondes');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-micro-ondes.svg' WHERE `french_word` = 'un micro-ondes' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a cupboard', 'un placard', '/images/vocab/un-placard.svg', 'pla-kar', l.`id`, 'Les assiettes sont dans le placard.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un placard');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-placard.svg' WHERE `french_word` = 'un placard' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a drawer', 'un tiroir', '/images/vocab/un-tiroir.svg', 'ti-rwar', l.`id`, 'Les couteaux sont dans le tiroir.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un tiroir');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-tiroir.svg' WHERE `french_word` = 'un tiroir' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a recipe', 'une recette', '/images/vocab/une-recette.svg', 're-sèt', l.`id`, 'Je suis la recette pas à pas.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une recette');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-recette.svg' WHERE `french_word` = 'une recette' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to peel', 'éplucher', '/images/vocab/eplucher.svg', 'é-plu-shé', l.`id`, 'Je dois éplucher les pommes de terre.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'éplucher');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/eplucher.svg' WHERE `french_word` = 'éplucher' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to cut', 'couper', '/images/vocab/couper.svg', 'kou-pé', l.`id`, 'Elle coupe les carottes en rondelles.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'couper');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/couper.svg' WHERE `french_word` = 'couper' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to mix', 'mélanger', '/images/vocab/melanger.svg', 'mé-lan-zhé', l.`id`, 'Je mélange la farine et les œufs.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'mélanger');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/melanger.svg' WHERE `french_word` = 'mélanger' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to cook', 'faire cuire', '/images/vocab/faire-cuire.svg', 'fèr kuir', l.`id`, 'Je fais cuire le riz dix minutes.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'faire cuire');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/faire-cuire.svg' WHERE `french_word` = 'faire cuire' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA CUISINE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A1', 'LA SALLE DE BAIN' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a bathroom', 'une salle de bain', '/images/vocab/une-salle-de-bain.svg', 'sal de ban', l.`id`, 'Ma salle de bain est petite.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une salle de bain');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-salle-de-bain.svg' WHERE `french_word` = 'une salle de bain' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a shower', 'une douche', '/images/vocab/une-douche.svg', 'doush', l.`id`, 'Je prends une douche le matin.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une douche');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-douche.svg' WHERE `french_word` = 'une douche' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a bathtub', 'une baignoire', '/images/vocab/une-baignoire.svg', 'bè-nywar', l.`id`, 'Les enfants jouent dans la baignoire.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une baignoire');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-baignoire.svg' WHERE `french_word` = 'une baignoire' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a washbasin', 'un lavabo', '/images/vocab/un-lavabo.svg', 'la-va-bo', l.`id`, 'Je me lave les mains au lavabo.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un lavabo');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-lavabo.svg' WHERE `french_word` = 'un lavabo' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a mirror', 'un miroir', '/images/vocab/un-miroir.svg', 'mi-rwar', l.`id`, 'Je me regarde dans le miroir.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un miroir');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-miroir.svg' WHERE `french_word` = 'un miroir' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a soap', 'un savon', '/images/vocab/un-savon.svg', 'sa-von', l.`id`, 'Le savon sent bon.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un savon');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-savon.svg' WHERE `french_word` = 'un savon' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a shampoo', 'un shampoing', '/images/vocab/un-shampoing.svg', 'shan-pwan', l.`id`, 'J''achète un shampoing doux.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un shampoing');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-shampoing.svg' WHERE `french_word` = 'un shampoing' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a bath towel', 'une serviette de bain', '/images/vocab/une-serviette-de-bain.svg', 'sèr-vyèt de ban', l.`id`, 'Je me sèche avec une serviette de bain.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une serviette de bain');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-serviette-de-bain.svg' WHERE `french_word` = 'une serviette de bain' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a toothbrush', 'une brosse à dents', '/images/vocab/une-brosse-a-dents.svg', 'bros a dan', l.`id`, 'Chacun a sa brosse à dents.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une brosse à dents');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-brosse-a-dents.svg' WHERE `french_word` = 'une brosse à dents' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'toothpaste', 'le dentifrice', '/images/vocab/le-dentifrice.svg', 'dan-ti-fris', l.`id`, 'Je mets du dentifrice sur ma brosse.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le dentifrice');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-dentifrice.svg' WHERE `french_word` = 'le dentifrice' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a comb', 'un peigne', '/images/vocab/un-peigne.svg', 'pèny', l.`id`, 'Elle prend un peigne pour se coiffer.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un peigne');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-peigne.svg' WHERE `french_word` = 'un peigne' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a razor', 'un rasoir', '/images/vocab/un-rasoir.svg', 'ra-zwar', l.`id`, 'Mon père utilise un rasoir.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un rasoir');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-rasoir.svg' WHERE `french_word` = 'un rasoir' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'toilet paper', 'le papier toilette', '/images/vocab/le-papier-toilette.svg', 'pa-pyé twa-lèt', l.`id`, 'Il n''y a plus de papier toilette.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le papier toilette');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-papier-toilette.svg' WHERE `french_word` = 'le papier toilette' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the toilet', 'les toilettes', '/images/vocab/les-toilettes.svg', 'twa-lèt', l.`id`, 'Les toilettes sont au fond du couloir.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'les toilettes');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/les-toilettes.svg' WHERE `french_word` = 'les toilettes' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a washing machine', 'une machine à laver', '/images/vocab/une-machine-a-laver.svg', 'ma-shin a la-vé', l.`id`, 'Je mets le linge dans la machine à laver.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une machine à laver');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-machine-a-laver.svg' WHERE `french_word` = 'une machine à laver' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to wash (oneself)', 'se laver', '/images/vocab/se-laver.svg', 'se la-vé', l.`id`, 'Je me lave tous les matins.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'se laver');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/se-laver.svg' WHERE `french_word` = 'se laver' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to brush one''s teeth', 'se brosser les dents', '/images/vocab/se-brosser-les-dents.svg', 'se bro-sé lè dan', l.`id`, 'Je me brosse les dents trois fois par jour.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'se brosser les dents');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/se-brosser-les-dents.svg' WHERE `french_word` = 'se brosser les dents' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to do one''s hair', 'se coiffer', '/images/vocab/se-coiffer.svg', 'se kwa-fé', l.`id`, 'Elle se coiffe devant le miroir.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'se coiffer');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/se-coiffer.svg' WHERE `french_word` = 'se coiffer' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA SALLE DE BAIN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A1', 'L''ARGENT ET LES PRIX' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'money', 'l''argent', '/images/vocab/l-argent.svg', 'ar-zhan', l.`id`, 'Je n''ai pas assez d''argent aujourd''hui.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'l''argent');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/l-argent.svg' WHERE `french_word` = 'l''argent' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a euro', 'un euro', '/images/vocab/un-euro.svg', 'eu-ro', l.`id`, 'Ce café coûte deux euros.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un euro');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-euro.svg' WHERE `french_word` = 'un euro' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a cent', 'un centime', '/images/vocab/un-centime.svg', 'san-tim', l.`id`, 'Un euro, c''est cent centimes.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un centime');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-centime.svg' WHERE `french_word` = 'un centime' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a coin', 'une pièce', '/images/vocab/une-piece.svg', 'pyès', l.`id`, 'J''ai une pièce de deux euros.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une pièce');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-piece.svg' WHERE `french_word` = 'une pièce' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a banknote', 'un billet', '/images/vocab/un-billet.svg', 'bi-yè', l.`id`, 'Il donne un billet de vingt euros.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un billet');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-billet.svg' WHERE `french_word` = 'un billet' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'change', 'la monnaie', '/images/vocab/la-monnaie.svg', 'mo-nè', l.`id`, 'La vendeuse me rend la monnaie.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la monnaie');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-monnaie.svg' WHERE `french_word` = 'la monnaie' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the price', 'le prix', '/images/vocab/le-prix.svg', 'pri', l.`id`, 'Quel est le prix de ce pain ?', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le prix');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-prix.svg' WHERE `french_word` = 'le prix' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'expensive', 'cher', '/images/vocab/cher.svg', 'shèr', l.`id`, 'Ce manteau est trop cher.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'cher');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/cher.svg' WHERE `french_word` = 'cher' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'cheap', 'bon marché', '/images/vocab/bon-marche.svg', 'bon mar-shé', l.`id`, 'Ces pommes sont bon marché.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'bon marché');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/bon-marche.svg' WHERE `french_word` = 'bon marché' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'free', 'gratuit', '/images/vocab/gratuit.svg', 'gra-tui', l.`id`, 'L''entrée du musée est gratuite le dimanche.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'gratuit');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/gratuit.svg' WHERE `french_word` = 'gratuit' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to buy', 'acheter', '/images/vocab/acheter.svg', 'ash-té', l.`id`, 'Je veux acheter du pain.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'acheter');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/acheter.svg' WHERE `french_word` = 'acheter' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to cost', 'coûter', '/images/vocab/couter.svg', 'kou-té', l.`id`, 'Combien coûte ce livre ?', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'coûter');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/couter.svg' WHERE `french_word` = 'coûter' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a wallet', 'un portefeuille', '/images/vocab/un-portefeuille.svg', 'port-feuy', l.`id`, 'Mon portefeuille est dans mon sac.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un portefeuille');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-portefeuille.svg' WHERE `french_word` = 'un portefeuille' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'in cash', 'en espèces', '/images/vocab/en-especes.svg', 'an ès-pès', l.`id`, 'Je paie en espèces.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'en espèces');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/en-especes.svg' WHERE `french_word` = 'en espèces' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a discount', 'une réduction', '/images/vocab/une-reduction.svg', 'ré-duk-syon', l.`id`, 'Les étudiants ont une réduction.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une réduction');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-reduction.svg' WHERE `french_word` = 'une réduction' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the sales', 'les soldes', '/images/vocab/les-soldes.svg', 'sold', l.`id`, 'Les soldes commencent en janvier.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'les soldes');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/les-soldes.svg' WHERE `french_word` = 'les soldes' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to save', 'économiser', '/images/vocab/economiser.svg', 'é-ko-no-mi-zé', l.`id`, 'J''économise pour mes vacances.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'économiser');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/economiser.svg' WHERE `french_word` = 'économiser' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to spend', 'dépenser', '/images/vocab/depenser.svg', 'dé-pan-sé', l.`id`, 'Je dépense peu d''argent.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'dépenser');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/depenser.svg' WHERE `french_word` = 'dépenser' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ARGENT ET LES PRIX') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A2', 'À LA POSTE ET À LA BANQUE' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the post office', 'la poste', '/images/vocab/la-poste.svg', 'post', l.`id`, 'La poste ferme à dix-sept heures.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la poste');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-poste.svg' WHERE `french_word` = 'la poste' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a letter', 'une lettre', '/images/vocab/une-lettre.svg', 'lètr', l.`id`, 'J''écris une lettre à ma sœur.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une lettre');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-lettre.svg' WHERE `french_word` = 'une lettre' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an envelope', 'une enveloppe', '/images/vocab/une-enveloppe.svg', 'an-vlop', l.`id`, 'Je mets la lettre dans l''enveloppe.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une enveloppe');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-enveloppe.svg' WHERE `french_word` = 'une enveloppe' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a stamp', 'un timbre', '/images/vocab/un-timbre.svg', 'tanbr', l.`id`, 'Il faut un timbre pour envoyer une lettre.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un timbre');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-timbre.svg' WHERE `french_word` = 'un timbre' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a parcel', 'un colis', '/images/vocab/un-colis.svg', 'ko-li', l.`id`, 'Je vais à la poste pour envoyer un colis.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un colis');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-colis.svg' WHERE `french_word` = 'un colis' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a postman', 'un facteur', '/images/vocab/un-facteur.svg', 'fak-teur', l.`id`, 'Le facteur passe tous les matins.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un facteur');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-facteur.svg' WHERE `french_word` = 'un facteur' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a letterbox', 'une boîte aux lettres', '/images/vocab/une-boite-aux-lettres.svg', 'bwat o lètr', l.`id`, 'Le courrier est dans la boîte aux lettres.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une boîte aux lettres');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-boite-aux-lettres.svg' WHERE `french_word` = 'une boîte aux lettres' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a registered letter', 'un recommandé', '/images/vocab/un-recommande.svg', 're-ko-man-dé', l.`id`, 'J''envoie un recommandé à la mairie.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un recommandé');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-recommande.svg' WHERE `french_word` = 'un recommandé' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to send', 'envoyer', '/images/vocab/envoyer.svg', 'an-vwa-yé', l.`id`, 'Je dois envoyer cette lettre aujourd''hui.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'envoyer');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/envoyer.svg' WHERE `french_word` = 'envoyer' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an address', 'une adresse', '/images/vocab/une-adresse.svg', 'a-dres', l.`id`, 'J''écris l''adresse sur l''enveloppe.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une adresse');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-adresse.svg' WHERE `french_word` = 'une adresse' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a postcode', 'un code postal', '/images/vocab/un-code-postal.svg', 'kod pos-tal', l.`id`, 'Mon code postal a cinq chiffres.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un code postal');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-code-postal.svg' WHERE `french_word` = 'un code postal' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a bank', 'une banque', '/images/vocab/une-banque.svg', 'bank', l.`id`, 'Ma banque est près de la gare.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une banque');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-banque.svg' WHERE `french_word` = 'une banque' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a bank account', 'un compte bancaire', '/images/vocab/un-compte-bancaire.svg', 'kont ban-kèr', l.`id`, 'J''ouvre un compte bancaire.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un compte bancaire');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-compte-bancaire.svg' WHERE `french_word` = 'un compte bancaire' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a transfer', 'un virement', '/images/vocab/un-virement.svg', 'vir-man', l.`id`, 'Je fais un virement à mon propriétaire.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un virement');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-virement.svg' WHERE `french_word` = 'un virement' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a cash machine', 'un distributeur', '/images/vocab/un-distributeur.svg', 'dis-tri-bu-teur', l.`id`, 'Il retire de l''argent au distributeur.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un distributeur');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-distributeur.svg' WHERE `french_word` = 'un distributeur' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a bank card', 'une carte bancaire', '/images/vocab/une-carte-bancaire.svg', 'kart ban-kèr', l.`id`, 'Je paie avec ma carte bancaire.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une carte bancaire');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-carte-bancaire.svg' WHERE `french_word` = 'une carte bancaire' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to withdraw money', 'retirer de l''argent', '/images/vocab/retirer-de-l-argent.svg', 're-ti-ré de lar-zhan', l.`id`, 'Je retire de l''argent le vendredi.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'retirer de l''argent');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/retirer-de-l-argent.svg' WHERE `french_word` = 'retirer de l''argent' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a bank statement', 'un relevé de compte', '/images/vocab/un-releve-de-compte.svg', 're-le-vé de kont', l.`id`, 'Je reçois un relevé de compte chaque mois.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un relevé de compte');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-releve-de-compte.svg' WHERE `french_word` = 'un relevé de compte' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'À LA POSTE ET À LA BANQUE') AND (`image_url` IS NULL OR `image_url` = '');
