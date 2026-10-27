-- Lot 4 de leçons de vocabulaire : Les vêtements et les accessoires, Les métiers, L'école et les études, Le travail et l'entreprise, Les émotions et les sentiments, La nature et l'environnement.
-- Crée les leçons et leurs mots (images dans static/images/vocab, sans audio : la voix du navigateur lit les mots et les phrases). Peut être exécuté plusieurs fois sans doublons ; relancé, il ajoute seulement ce qui manque.
-- Les illustrations sont dans l'application : déployer d'abord la nouvelle image Docker, puis sur le serveur :
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_vocab_lot4.sql
SET NAMES utf8mb4;

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A1', 'LES VÊTEMENTS ET LES ACCESSOIRES' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'clothes', 'les vêtements', '/images/vocab/les-vetements.svg', 'lé vêt-man', l.`id`, 'J''achète des vêtements pour l''hiver.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'les vêtements');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/les-vetements.svg' WHERE `french_word` = 'les vêtements' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a shirt', 'une chemise', '/images/vocab/une-chemise.svg', 'shemiz', l.`id`, 'Il porte une chemise blanche.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une chemise');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-chemise.svg' WHERE `french_word` = 'une chemise' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'trousers', 'un pantalon', '/images/vocab/un-pantalon.svg', 'pan-ta-lon', l.`id`, 'Mon pantalon est trop long.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un pantalon');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-pantalon.svg' WHERE `french_word` = 'un pantalon' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a dress', 'une robe', '/images/vocab/une-robe.svg', 'rob', l.`id`, 'Elle porte une robe rouge.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une robe');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-robe.svg' WHERE `french_word` = 'une robe' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a T-shirt', 'un t-shirt', '/images/vocab/un-t-shirt.svg', 'ti-sheurt', l.`id`, 'En été, je mets un t-shirt.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un t-shirt');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-t-shirt.svg' WHERE `french_word` = 'un t-shirt' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a coat', 'un manteau', '/images/vocab/un-manteau.svg', 'man-to', l.`id`, 'Il fait froid : prends ton manteau.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un manteau');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-manteau.svg' WHERE `french_word` = 'un manteau' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a suit', 'un costume', '/images/vocab/un-costume.svg', 'kos-tum', l.`id`, 'Il met un costume pour le mariage.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un costume');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-costume.svg' WHERE `french_word` = 'un costume' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'shoes', 'des chaussures', '/images/vocab/des-chaussures.svg', 'sho-sur', l.`id`, 'Mes chaussures sont neuves.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'des chaussures');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/des-chaussures.svg' WHERE `french_word` = 'des chaussures' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'boots', 'des bottes', '/images/vocab/des-bottes.svg', 'bot', l.`id`, 'Je mets mes bottes quand il pleut.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'des bottes');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/des-bottes.svg' WHERE `french_word` = 'des bottes' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'socks', 'des chaussettes', '/images/vocab/des-chaussettes.svg', 'sho-sèt', l.`id`, 'J''ai des chaussettes dans mes chaussures.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'des chaussettes');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/des-chaussettes.svg' WHERE `french_word` = 'des chaussettes' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a cap', 'une casquette', '/images/vocab/une-casquette.svg', 'kas-kèt', l.`id`, 'Mon fils porte une casquette.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une casquette');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-casquette.svg' WHERE `french_word` = 'une casquette' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a hat', 'un chapeau', '/images/vocab/un-chapeau.svg', 'sha-po', l.`id`, 'Elle porte un chapeau au soleil.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un chapeau');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-chapeau.svg' WHERE `french_word` = 'un chapeau' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'gloves', 'des gants', '/images/vocab/des-gants.svg', 'gan', l.`id`, 'En hiver, je mets des gants.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'des gants');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/des-gants.svg' WHERE `french_word` = 'des gants' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a scarf', 'une écharpe', '/images/vocab/une-echarpe.svg', 'é-sharp', l.`id`, 'Il met une écharpe autour du cou.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une écharpe');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-echarpe.svg' WHERE `french_word` = 'une écharpe' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'glasses', 'des lunettes', '/images/vocab/des-lunettes.svg', 'lu-nèt', l.`id`, 'Je mets mes lunettes pour lire.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'des lunettes');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/des-lunettes.svg' WHERE `french_word` = 'des lunettes' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a handbag', 'un sac à main', '/images/vocab/un-sac-a-main.svg', 'sak a man', l.`id`, 'Elle cherche ses clés dans son sac à main.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un sac à main');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-sac-a-main.svg' WHERE `french_word` = 'un sac à main' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a swimsuit', 'un maillot de bain', '/images/vocab/un-maillot-de-bain.svg', 'ma-yo de ban', l.`id`, 'N''oublie pas ton maillot de bain !', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un maillot de bain');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-maillot-de-bain.svg' WHERE `french_word` = 'un maillot de bain' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the size', 'la taille', '/images/vocab/la-taille.svg', 'tay', l.`id`, 'Quelle est votre taille ?', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la taille');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-taille.svg' WHERE `french_word` = 'la taille' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to wear', 'porter', '/images/vocab/porter.svg', 'por-té', l.`id`, 'Je porte un manteau aujourd''hui.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'porter');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/porter.svg' WHERE `french_word` = 'porter' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VÊTEMENTS ET LES ACCESSOIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A1', 'LES MÉTIERS' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LES MÉTIERS');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a job (trade)', 'un métier', '/images/vocab/un-metier.svg', 'mé-tyé', l.`id`, 'Quel est votre métier ?', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un métier');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-metier.svg' WHERE `french_word` = 'un métier' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a doctor', 'un médecin', '/images/vocab/un-medecin.svg', 'méd-san', l.`id`, 'Le médecin soigne les malades.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un médecin');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-medecin.svg' WHERE `french_word` = 'un médecin' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a nurse', 'une infirmière', '/images/vocab/une-infirmiere.svg', 'en-fir-myèr', l.`id`, 'L''infirmière travaille à l''hôpital.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une infirmière');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-infirmiere.svg' WHERE `french_word` = 'une infirmière' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a teacher', 'un professeur', '/images/vocab/un-professeur.svg', 'pro-fè-seur', l.`id`, 'Le professeur explique la leçon.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un professeur');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-professeur.svg' WHERE `french_word` = 'un professeur' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a cook', 'un cuisinier', '/images/vocab/un-cuisinier.svg', 'kui-zi-nyé', l.`id`, 'Le cuisinier prépare le repas.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un cuisinier');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-cuisinier.svg' WHERE `french_word` = 'un cuisinier' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a baker', 'un boulanger', '/images/vocab/un-boulanger.svg', 'bou-lan-zhé', l.`id`, 'Le boulanger fait du pain tous les matins.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un boulanger');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-boulanger.svg' WHERE `french_word` = 'un boulanger' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a police officer', 'un policier', '/images/vocab/un-policier.svg', 'po-li-syé', l.`id`, 'Le policier aide les gens dans la rue.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un policier');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-policier.svg' WHERE `french_word` = 'un policier' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a firefighter', 'un pompier', '/images/vocab/un-pompier.svg', 'pon-pyé', l.`id`, 'Le pompier éteint le feu.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un pompier');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-pompier.svg' WHERE `french_word` = 'un pompier' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a salesperson', 'un vendeur', '/images/vocab/un-vendeur.svg', 'van-deur', l.`id`, 'Le vendeur aide les clients dans le magasin.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un vendeur');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-vendeur.svg' WHERE `french_word` = 'un vendeur' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a farmer', 'un agriculteur', '/images/vocab/un-agriculteur.svg', 'a-gri-kul-teur', l.`id`, 'L''agriculteur travaille dans les champs.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un agriculteur');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-agriculteur.svg' WHERE `french_word` = 'un agriculteur' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a mechanic', 'un mécanicien', '/images/vocab/un-mecanicien.svg', 'mé-ka-ni-syin', l.`id`, 'Le mécanicien répare ma voiture.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un mécanicien');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-mecanicien.svg' WHERE `french_word` = 'un mécanicien' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a worker', 'un ouvrier', '/images/vocab/un-ouvrier.svg', 'ou-vri-yé', l.`id`, 'L''ouvrier construit une maison.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un ouvrier');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-ouvrier.svg' WHERE `french_word` = 'un ouvrier' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a lawyer', 'un avocat', '/images/vocab/un-avocat.svg', 'a-vo-ka', l.`id`, 'L''avocat défend son client.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un avocat');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-avocat.svg' WHERE `french_word` = 'un avocat' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an IT specialist', 'un informaticien', '/images/vocab/un-informaticien.svg', 'in-for-ma-ti-syin', l.`id`, 'L''informaticien répare mon ordinateur.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un informaticien');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-informaticien.svg' WHERE `french_word` = 'un informaticien' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an artist', 'un artiste', '/images/vocab/un-artiste.svg', 'ar-tist', l.`id`, 'L''artiste peint un grand tableau.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un artiste');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-artiste.svg' WHERE `french_word` = 'un artiste' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a hairdresser', 'un coiffeur', '/images/vocab/un-coiffeur.svg', 'kwa-feur', l.`id`, 'Le coiffeur coupe les cheveux.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un coiffeur');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-coiffeur.svg' WHERE `french_word` = 'un coiffeur' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a pilot', 'un pilote', '/images/vocab/un-pilote.svg', 'pi-lot', l.`id`, 'Le pilote conduit l''avion.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un pilote');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-pilote.svg' WHERE `french_word` = 'un pilote' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a dentist', 'un dentiste', '/images/vocab/un-dentiste.svg', 'dan-tist', l.`id`, 'Le dentiste soigne les dents.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un dentiste');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-dentiste.svg' WHERE `french_word` = 'un dentiste' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a student', 'un étudiant', '/images/vocab/un-etudiant.svg', 'é-tu-dyan', l.`id`, 'Mon frère est étudiant à l''université.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un étudiant');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-etudiant.svg' WHERE `french_word` = 'un étudiant' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MÉTIERS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A1', 'L''ÉCOLE ET LES ÉTUDES' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a school', 'une école', '/images/vocab/une-ecole.svg', 'é-kol', l.`id`, 'Les enfants vont à l''école à pied.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une école');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-ecole.svg' WHERE `french_word` = 'une école' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a teacher', 'un enseignant', '/images/vocab/un-enseignant.svg', 'an-sè-nyan', l.`id`, 'L''enseignant parle doucement.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un enseignant');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-enseignant.svg' WHERE `french_word` = 'un enseignant' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a pupil', 'un élève', '/images/vocab/un-eleve.svg', 'é-lèv', l.`id`, 'Chaque élève a un cahier.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un élève');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-eleve.svg' WHERE `french_word` = 'un élève' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a notebook', 'un cahier', '/images/vocab/un-cahier.svg', 'ka-yé', l.`id`, 'J''écris dans mon cahier.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un cahier');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-cahier.svg' WHERE `french_word` = 'un cahier' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a book', 'un livre', '/images/vocab/un-livre.svg', 'li-vr', l.`id`, 'Ce livre est très intéressant.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un livre');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-livre.svg' WHERE `french_word` = 'un livre' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a pen', 'un stylo', '/images/vocab/un-stylo.svg', 'sti-lo', l.`id`, 'Je n''ai pas de stylo.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un stylo');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-stylo.svg' WHERE `french_word` = 'un stylo' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a pencil', 'un crayon', '/images/vocab/un-crayon.svg', 'kré-yon', l.`id`, 'Elle dessine avec un crayon.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un crayon');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-crayon.svg' WHERE `french_word` = 'un crayon' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a school bag', 'un cartable', '/images/vocab/un-cartable.svg', 'kar-ta-bl', l.`id`, 'Mon cartable est lourd.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un cartable');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-cartable.svg' WHERE `french_word` = 'un cartable' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a ruler', 'une règle', '/images/vocab/une-regle.svg', 'rè-gl', l.`id`, 'Je trace une ligne avec une règle.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une règle');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-regle.svg' WHERE `french_word` = 'une règle' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'scissors', 'des ciseaux', '/images/vocab/des-ciseaux.svg', 'si-zo', l.`id`, 'Il coupe le papier avec des ciseaux.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'des ciseaux');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/des-ciseaux.svg' WHERE `french_word` = 'des ciseaux' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'homework', 'un devoir', '/images/vocab/un-devoir.svg', 'de-vwar', l.`id`, 'Je fais mes devoirs le soir.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un devoir');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-devoir.svg' WHERE `french_word` = 'un devoir' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an exam', 'un examen', '/images/vocab/un-examen.svg', 'èg-za-min', l.`id`, 'L''examen commence à neuf heures.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un examen');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-examen.svg' WHERE `french_word` = 'un examen' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a mark', 'une note', '/images/vocab/une-note.svg', 'not', l.`id`, 'J''ai eu une bonne note.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une note');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-note.svg' WHERE `french_word` = 'une note' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a diploma', 'un diplôme', '/images/vocab/un-diplome.svg', 'di-plom', l.`id`, 'Elle a un diplôme de français.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un diplôme');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-diplome.svg' WHERE `french_word` = 'un diplôme' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a timetable', 'un emploi du temps', '/images/vocab/un-emploi-du-temps.svg', 'an-plwa du tan', l.`id`, 'Mon emploi du temps change chaque semaine.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un emploi du temps');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-emploi-du-temps.svg' WHERE `french_word` = 'un emploi du temps' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'break time', 'la récréation', '/images/vocab/la-recreation.svg', 'ré-kré-a-syon', l.`id`, 'Les enfants jouent pendant la récréation.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la récréation');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-recreation.svg' WHERE `french_word` = 'la récréation' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a library', 'une bibliothèque', '/images/vocab/une-bibliotheque.svg', 'bi-bli-o-tèk', l.`id`, 'Je lis à la bibliothèque.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une bibliothèque');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-bibliotheque.svg' WHERE `french_word` = 'une bibliothèque' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to learn', 'apprendre', '/images/vocab/apprendre.svg', 'a-pran-dr', l.`id`, 'J''apprends le français avec plaisir.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'apprendre');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/apprendre.svg' WHERE `french_word` = 'apprendre' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to study', 'étudier', '/images/vocab/etudier.svg', 'é-tu-dyé', l.`id`, 'Nous étudions chaque soir.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'étudier');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/etudier.svg' WHERE `french_word` = 'étudier' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'L''ÉCOLE ET LES ÉTUDES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A2', 'LE TRAVAIL ET L''ENTREPRISE' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'work', 'le travail', '/images/vocab/le-travail.svg', 'tra-vay', l.`id`, 'Le travail commence à huit heures.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le travail');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-travail.svg' WHERE `french_word` = 'le travail' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a job', 'un emploi', '/images/vocab/un-emploi.svg', 'an-plwa', l.`id`, 'Il cherche un emploi dans le commerce.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un emploi');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-emploi.svg' WHERE `french_word` = 'un emploi' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a company', 'une entreprise', '/images/vocab/une-entreprise.svg', 'an-tre-priz', l.`id`, 'Elle travaille dans une grande entreprise.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une entreprise');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-entreprise.svg' WHERE `french_word` = 'une entreprise' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a boss', 'un patron', '/images/vocab/un-patron.svg', 'pa-tron', l.`id`, 'Mon patron est très gentil.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un patron');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-patron.svg' WHERE `french_word` = 'un patron' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a colleague', 'un collègue', '/images/vocab/un-collegue.svg', 'ko-lèg', l.`id`, 'Mon collègue m''aide beaucoup.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un collègue');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-collegue.svg' WHERE `french_word` = 'un collègue' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an office, a desk', 'un bureau', '/images/vocab/un-bureau.svg', 'bu-ro', l.`id`, 'Mon bureau est au deuxième étage.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un bureau');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-bureau.svg' WHERE `french_word` = 'un bureau' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a salary', 'un salaire', '/images/vocab/un-salaire.svg', 'sa-lèr', l.`id`, 'Il reçoit son salaire à la fin du mois.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un salaire');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-salaire.svg' WHERE `french_word` = 'un salaire' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a CV (résumé)', 'un CV', '/images/vocab/un-cv.svg', 'sé-vé', l.`id`, 'J''envoie mon CV par mail.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un CV');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-cv.svg' WHERE `french_word` = 'un CV' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a job interview', 'un entretien d''embauche', '/images/vocab/un-entretien-d-embauche.svg', 'an-tret-yin dan-bosh', l.`id`, 'J''ai un entretien d''embauche demain.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un entretien d''embauche');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-entretien-d-embauche.svg' WHERE `french_word` = 'un entretien d''embauche' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a job offer', 'une offre d''emploi', '/images/vocab/une-offre-d-emploi.svg', 'o-fr do-plwa', l.`id`, 'J''ai lu une offre d''emploi intéressante.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une offre d''emploi');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-offre-d-emploi.svg' WHERE `french_word` = 'une offre d''emploi' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an employment contract', 'un contrat de travail', '/images/vocab/un-contrat-de-travail.svg', 'kon-tra de tra-vay', l.`id`, 'Il signe son contrat de travail.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un contrat de travail');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-contrat-de-travail.svg' WHERE `french_word` = 'un contrat de travail' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a meeting', 'une réunion', '/images/vocab/une-reunion.svg', 'ré-u-nyon', l.`id`, 'La réunion dure une heure.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une réunion');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-reunion.svg' WHERE `french_word` = 'une réunion' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'leave, holiday', 'un congé', '/images/vocab/un-conge.svg', 'kon-zhé', l.`id`, 'Elle prend un congé en août.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un congé');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-conge.svg' WHERE `french_word` = 'un congé' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'retirement', 'la retraite', '/images/vocab/la-retraite.svg', 're-trèt', l.`id`, 'Mon grand-père est à la retraite.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la retraite');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-retraite.svg' WHERE `french_word` = 'la retraite' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'unemployment', 'le chômage', '/images/vocab/le-chomage.svg', 'shô-mazh', l.`id`, 'Il est au chômage depuis six mois.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le chômage');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-chomage.svg' WHERE `french_word` = 'le chômage' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a work placement', 'un stage', '/images/vocab/un-stage.svg', 'stazh', l.`id`, 'Elle fait un stage dans un hôtel.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un stage');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-stage.svg' WHERE `french_word` = 'un stage' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a factory', 'une usine', '/images/vocab/une-usine.svg', 'u-zin', l.`id`, 'Mon voisin travaille dans une usine.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une usine');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-usine.svg' WHERE `french_word` = 'une usine' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a customer', 'un client', '/images/vocab/un-client.svg', 'kli-yan', l.`id`, 'Le client attend à la caisse.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un client');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-client.svg' WHERE `french_word` = 'un client' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to hire', 'embaucher', '/images/vocab/embaucher.svg', 'an-bo-shé', l.`id`, 'L''entreprise embauche trois personnes.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'embaucher');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/embaucher.svg' WHERE `french_word` = 'embaucher' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LE TRAVAIL ET L''ENTREPRISE') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A2', 'LES ÉMOTIONS ET LES SENTIMENTS' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'pleased', 'content', '/images/vocab/content.svg', 'kon-tan', l.`id`, 'Je suis content de te voir.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'content');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/content.svg' WHERE `french_word` = 'content' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'happy', 'heureux', '/images/vocab/heureux.svg', 'eu-reu', l.`id`, 'Il est heureux avec sa famille.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'heureux');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/heureux.svg' WHERE `french_word` = 'heureux' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'sad', 'triste', '/images/vocab/triste.svg', 'trist', l.`id`, 'Elle est triste aujourd''hui.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'triste');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/triste.svg' WHERE `french_word` = 'triste' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'angry', 'en colère', '/images/vocab/en-colere.svg', 'an ko-lèr', l.`id`, 'Il est en colère parce que le train est en retard.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'en colère');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/en-colere.svg' WHERE `french_word` = 'en colère' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'tired', 'fatigué', '/images/vocab/fatigue.svg', 'fa-ti-gé', l.`id`, 'Je suis fatigué après le travail.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'fatigué');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/fatigue.svg' WHERE `french_word` = 'fatigué' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'surprised', 'surpris', '/images/vocab/surpris.svg', 'sur-pri', l.`id`, 'Elle est surprise par la nouvelle.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'surpris');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/surpris.svg' WHERE `french_word` = 'surpris' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'worried', 'inquiet', '/images/vocab/inquiet.svg', 'in-kyè', l.`id`, 'Ma mère est inquiète quand je suis en retard.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'inquiet');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/inquiet.svg' WHERE `french_word` = 'inquiet' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'stressed', 'stressé', '/images/vocab/stresse.svg', 'stré-sé', l.`id`, 'Il est stressé avant l''examen.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'stressé');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/stresse.svg' WHERE `french_word` = 'stressé' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'in love', 'amoureux', '/images/vocab/amoureux.svg', 'a-mou-reu', l.`id`, 'Ils sont amoureux depuis deux ans.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'amoureux');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/amoureux.svg' WHERE `french_word` = 'amoureux' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'disappointed', 'déçu', '/images/vocab/decu.svg', 'dé-su', l.`id`, 'Je suis déçu par le résultat.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'déçu');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/decu.svg' WHERE `french_word` = 'déçu' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'proud', 'fier', '/images/vocab/fier.svg', 'fyèr', l.`id`, 'Mon père est fier de moi.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'fier');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/fier.svg' WHERE `french_word` = 'fier' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to be bored', 's''ennuyer', '/images/vocab/s-ennuyer.svg', 'san-nui-yé', l.`id`, 'Je m''ennuie quand il pleut.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 's''ennuyer');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/s-ennuyer.svg' WHERE `french_word` = 's''ennuyer' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to be afraid', 'avoir peur', '/images/vocab/avoir-peur.svg', 'a-vwar peur', l.`id`, 'Les enfants ont peur du noir.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'avoir peur');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/avoir-peur.svg' WHERE `french_word` = 'avoir peur' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to laugh', 'rire', '/images/vocab/rire.svg', 'rir', l.`id`, 'Nous rions beaucoup ensemble.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'rire');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/rire.svg' WHERE `french_word` = 'rire' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to cry', 'pleurer', '/images/vocab/pleurer.svg', 'pleu-ré', l.`id`, 'Le bébé pleure la nuit.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'pleurer');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/pleurer.svg' WHERE `french_word` = 'pleurer' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to smile', 'sourire', '/images/vocab/sourire.svg', 'sou-rir', l.`id`, 'Elle sourit à son voisin.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'sourire');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/sourire.svg' WHERE `french_word` = 'sourire' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'joy', 'la joie', '/images/vocab/la-joie.svg', 'zhwa', l.`id`, 'Les enfants crient de joie.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la joie');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-joie.svg' WHERE `french_word` = 'la joie' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a feeling', 'un sentiment', '/images/vocab/un-sentiment.svg', 'san-ti-man', l.`id`, 'La peur est un sentiment normal.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un sentiment');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-sentiment.svg' WHERE `french_word` = 'un sentiment' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ÉMOTIONS ET LES SENTIMENTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A2', 'LA NATURE ET L''ENVIRONNEMENT' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a tree', 'un arbre', '/images/vocab/un-arbre.svg', 'a-br', l.`id`, 'Il y a un grand arbre devant la maison.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un arbre');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-arbre.svg' WHERE `french_word` = 'un arbre' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a flower', 'une fleur', '/images/vocab/une-fleur.svg', 'fleur', l.`id`, 'Elle offre une fleur à sa mère.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une fleur');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-fleur.svg' WHERE `french_word` = 'une fleur' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the grass', 'l''herbe', '/images/vocab/l-herbe.svg', 'erb', l.`id`, 'Les enfants jouent sur l''herbe.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'l''herbe');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/l-herbe.svg' WHERE `french_word` = 'l''herbe' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a forest', 'une forêt', '/images/vocab/une-foret.svg', 'fo-rè', l.`id`, 'Nous marchons dans la forêt.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une forêt');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-foret.svg' WHERE `french_word` = 'une forêt' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a river', 'une rivière', '/images/vocab/une-riviere.svg', 'ri-vyèr', l.`id`, 'La rivière traverse le village.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une rivière');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-riviere.svg' WHERE `french_word` = 'une rivière' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a lake', 'un lac', '/images/vocab/un-lac.svg', 'lak', l.`id`, 'Nous faisons du bateau sur le lac.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un lac');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-lac.svg' WHERE `french_word` = 'un lac' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an island', 'une île', '/images/vocab/une-ile.svg', 'il', l.`id`, 'Nous passons nos vacances sur une île.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une île');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-ile.svg' WHERE `french_word` = 'une île' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a field', 'un champ', '/images/vocab/un-champ.svg', 'shan', l.`id`, 'Les vaches sont dans le champ.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un champ');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-champ.svg' WHERE `french_word` = 'un champ' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the sun', 'le soleil', '/images/vocab/le-soleil.svg', 'so-lèy', l.`id`, 'Le soleil brille ce matin.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le soleil');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-soleil.svg' WHERE `french_word` = 'le soleil' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the moon', 'la lune', '/images/vocab/la-lune.svg', 'lun', l.`id`, 'La lune est très belle ce soir.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la lune');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-lune.svg' WHERE `french_word` = 'la lune' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a star', 'une étoile', '/images/vocab/une-etoile.svg', 'é-twal', l.`id`, 'Je vois beaucoup d''étoiles dans le ciel.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une étoile');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-etoile.svg' WHERE `french_word` = 'une étoile' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a cloud', 'un nuage', '/images/vocab/un-nuage.svg', 'nu-azh', l.`id`, 'Il y a un gros nuage noir.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un nuage');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-nuage.svg' WHERE `french_word` = 'un nuage' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the wind', 'le vent', '/images/vocab/le-vent.svg', 'van', l.`id`, 'Le vent est fort aujourd''hui.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le vent');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-vent.svg' WHERE `french_word` = 'le vent' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'snow', 'la neige', '/images/vocab/la-neige.svg', 'nèzh', l.`id`, 'La neige tombe sur la montagne.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la neige');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-neige.svg' WHERE `french_word` = 'la neige' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a bird', 'un oiseau', '/images/vocab/un-oiseau.svg', 'wa-zo', l.`id`, 'Un oiseau chante dans l''arbre.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un oiseau');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-oiseau.svg' WHERE `french_word` = 'un oiseau' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a butterfly', 'un papillon', '/images/vocab/un-papillon.svg', 'pa-pi-yon', l.`id`, 'Un papillon vole sur la fleur.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un papillon');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-papillon.svg' WHERE `french_word` = 'un papillon' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'recycling', 'le recyclage', '/images/vocab/le-recyclage.svg', 're-si-klazh', l.`id`, 'Le recyclage protège la planète.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le recyclage');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-recyclage.svg' WHERE `french_word` = 'le recyclage' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a bin', 'une poubelle', '/images/vocab/une-poubelle.svg', 'pou-bèl', l.`id`, 'Je jette le papier dans la poubelle.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une poubelle');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-poubelle.svg' WHERE `french_word` = 'une poubelle' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'pollution', 'la pollution', '/images/vocab/la-pollution.svg', 'po-lu-syon', l.`id`, 'La pollution est forte dans cette ville.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la pollution');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-pollution.svg' WHERE `french_word` = 'la pollution' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LA NATURE ET L''ENVIRONNEMENT') AND (`image_url` IS NULL OR `image_url` = '');
