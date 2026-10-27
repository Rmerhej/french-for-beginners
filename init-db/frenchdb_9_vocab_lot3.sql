-- Lot 3 de leçons de vocabulaire : Les loisirs et les sports, Les voyages et les vacances, Les technologies, Les adjectifs de description, Les verbes du quotidien, Les contraires.
-- Crée les leçons et leurs mots (images dans static/images/vocab, sans audio : la voix du navigateur lit les mots et les phrases). Peut être exécuté plusieurs fois sans doublons ; relancé, il ajoute seulement ce qui manque.
-- Les illustrations sont dans l'application : déployer d'abord la nouvelle image Docker, puis sur le serveur :
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_vocab_lot3.sql
SET NAMES utf8mb4;

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A1', 'LES LOISIRS ET LES SPORTS' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'football', 'le football', '/images/vocab/le-football.svg', 'foot-bol', l.`id`, 'Les enfants jouent au football dans le parc.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le football');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-football.svg' WHERE `french_word` = 'le football' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'basketball', 'le basket', '/images/vocab/le-basket.svg', 'bas-kèt', l.`id`, 'Mon fils joue au basket le mercredi.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le basket');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-basket.svg' WHERE `french_word` = 'le basket' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'tennis', 'le tennis', '/images/vocab/le-tennis.svg', 'té-nis', l.`id`, 'Elle joue au tennis avec son frère.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le tennis');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-tennis.svg' WHERE `french_word` = 'le tennis' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'swimming', 'la natation', '/images/vocab/la-natation.svg', 'na-ta-syon', l.`id`, 'Je fais de la natation à la piscine.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la natation');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-natation.svg' WHERE `french_word` = 'la natation' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'cycling', 'le vélo', '/images/vocab/le-velo.svg', 'vé-lo', l.`id`, 'Je vais au travail à vélo.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le vélo');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-velo.svg' WHERE `french_word` = 'le vélo' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'running', 'la course à pied', '/images/vocab/la-course-a-pied.svg', 'kours a pyé', l.`id`, 'Il fait de la course à pied le dimanche.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la course à pied');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-course-a-pied.svg' WHERE `french_word` = 'la course à pied' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'hiking', 'la randonnée', '/images/vocab/la-randonnee.svg', 'ran-do-né', l.`id`, 'Nous faisons une randonnée en montagne.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la randonnée');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-randonnee.svg' WHERE `french_word` = 'la randonnée' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'yoga', 'le yoga', '/images/vocab/le-yoga.svg', 'yo-ga', l.`id`, 'Elle fait du yoga le matin.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le yoga');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-yoga.svg' WHERE `french_word` = 'le yoga' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'dancing', 'la danse', '/images/vocab/la-danse.svg', 'dans', l.`id`, 'Ma fille adore la danse.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la danse');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-danse.svg' WHERE `french_word` = 'la danse' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'music', 'la musique', '/images/vocab/la-musique.svg', 'mu-zik', l.`id`, 'J''écoute de la musique dans le bus.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la musique');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-musique.svg' WHERE `french_word` = 'la musique' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'cinema', 'le cinéma', '/images/vocab/le-cinema.svg', 'si-né-ma', l.`id`, 'Nous allons au cinéma samedi.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le cinéma');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-cinema.svg' WHERE `french_word` = 'le cinéma' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'reading', 'la lecture', '/images/vocab/la-lecture.svg', 'lèk-tur', l.`id`, 'La lecture est mon activité préférée.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la lecture');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-lecture.svg' WHERE `french_word` = 'la lecture' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'gardening', 'le jardinage', '/images/vocab/le-jardinage.svg', 'zhar-di-nazh', l.`id`, 'Il fait du jardinage dans son jardin.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le jardinage');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-jardinage.svg' WHERE `french_word` = 'le jardinage' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'fishing', 'la pêche', '/images/vocab/la-peche.svg', 'pèsh', l.`id`, 'Mon grand-père aime la pêche.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la pêche');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-peche.svg' WHERE `french_word` = 'la pêche' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a match', 'un match', '/images/vocab/un-match.svg', 'match', l.`id`, 'Nous regardons un match de football.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un match');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-match.svg' WHERE `french_word` = 'un match' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a team', 'une équipe', '/images/vocab/une-equipe.svg', 'é-kip', l.`id`, 'Mon équipe a gagné le match.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une équipe');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-equipe.svg' WHERE `french_word` = 'une équipe' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to play', 'jouer', '/images/vocab/jouer.svg', 'zhou-é', l.`id`, 'Les enfants aiment jouer dehors.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'jouer');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/jouer.svg' WHERE `french_word` = 'jouer' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to go for a walk', 'se promener', '/images/vocab/se-promener.svg', 'se pro-me-né', l.`id`, 'Le dimanche, nous nous promenons au bord de la rivière.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'se promener');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/se-promener.svg' WHERE `french_word` = 'se promener' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES LOISIRS ET LES SPORTS') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A2', 'LES VOYAGES ET LES VACANCES' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a trip', 'un voyage', '/images/vocab/un-voyage.svg', 'vwa-yazh', l.`id`, 'Je prépare mon voyage en France.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un voyage');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-voyage.svg' WHERE `french_word` = 'un voyage' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a suitcase', 'une valise', '/images/vocab/une-valise.svg', 'va-liz', l.`id`, 'Ma valise est très lourde.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une valise');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-valise.svg' WHERE `french_word` = 'une valise' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a train ticket', 'un billet de train', '/images/vocab/un-billet-de-train.svg', 'bi-yè de tran', l.`id`, 'J''achète un billet de train pour Lyon.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un billet de train');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-billet-de-train.svg' WHERE `french_word` = 'un billet de train' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a plane', 'un avion', '/images/vocab/un-avion.svg', 'a-vyon', l.`id`, 'L''avion part à huit heures.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un avion');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-avion.svg' WHERE `french_word` = 'un avion' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a train', 'un train', '/images/vocab/un-train.svg', 'tran', l.`id`, 'Le train arrive à quinze heures.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un train');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-train.svg' WHERE `french_word` = 'un train' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a station', 'une gare', '/images/vocab/une-gare.svg', 'gar', l.`id`, 'Nous attendons à la gare.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une gare');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-gare.svg' WHERE `french_word` = 'une gare' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an airport', 'un aéroport', '/images/vocab/un-aeroport.svg', 'a-é-ro-por', l.`id`, 'L''aéroport est loin de la ville.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un aéroport');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-aeroport.svg' WHERE `french_word` = 'un aéroport' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a hotel', 'un hôtel', '/images/vocab/un-hotel.svg', 'o-tèl', l.`id`, 'Nous réservons un hôtel près de la plage.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un hôtel');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-hotel.svg' WHERE `french_word` = 'un hôtel' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a bedroom', 'une chambre', '/images/vocab/une-chambre.svg', 'shanbr', l.`id`, 'La chambre a un grand lit.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une chambre');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-chambre.svg' WHERE `french_word` = 'une chambre' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the beach', 'la plage', '/images/vocab/la-plage.svg', 'plazh', l.`id`, 'Les enfants jouent sur la plage.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la plage');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-plage.svg' WHERE `french_word` = 'la plage' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the sea', 'la mer', '/images/vocab/la-mer.svg', 'mèr', l.`id`, 'L''eau de la mer est froide.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la mer');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-mer.svg' WHERE `french_word` = 'la mer' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the mountain', 'la montagne', '/images/vocab/la-montagne.svg', 'mon-tany', l.`id`, 'Nous passons l''hiver à la montagne.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'la montagne');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/la-montagne.svg' WHERE `french_word` = 'la montagne' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a map', 'une carte', '/images/vocab/une-carte.svg', 'kart', l.`id`, 'Je regarde la carte de la ville.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une carte');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-carte.svg' WHERE `french_word` = 'une carte' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a boat', 'un bateau', '/images/vocab/un-bateau.svg', 'ba-to', l.`id`, 'Nous prenons le bateau pour aller sur l''île.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un bateau');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-bateau.svg' WHERE `french_word` = 'un bateau' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a tent', 'une tente', '/images/vocab/une-tente.svg', 'tant', l.`id`, 'Nous dormons sous une tente.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une tente');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-tente.svg' WHERE `french_word` = 'une tente' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the holidays', 'les vacances', '/images/vocab/les-vacances.svg', 'va-kans', l.`id`, 'Les vacances commencent demain.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'les vacances');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/les-vacances.svg' WHERE `french_word` = 'les vacances' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to visit', 'visiter', '/images/vocab/visiter.svg', 'vi-zi-té', l.`id`, 'Nous voulons visiter le musée.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'visiter');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/visiter.svg' WHERE `french_word` = 'visiter' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a timetable', 'un horaire', '/images/vocab/un-horaire.svg', 'o-rèr', l.`id`, 'Je regarde l''horaire du train.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un horaire');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-horaire.svg' WHERE `french_word` = 'un horaire' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VOYAGES ET LES VACANCES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A2', 'LES TECHNOLOGIES' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a phone', 'un téléphone', '/images/vocab/un-telephone.svg', 'té-lé-fon', l.`id`, 'Mon téléphone est sur la table.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un téléphone');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-telephone.svg' WHERE `french_word` = 'un téléphone' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a computer', 'un ordinateur', '/images/vocab/un-ordinateur.svg', 'or-di-na-teur', l.`id`, 'Je travaille sur mon ordinateur.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un ordinateur');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-ordinateur.svg' WHERE `french_word` = 'un ordinateur' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a keyboard', 'un clavier', '/images/vocab/un-clavier.svg', 'kla-vyé', l.`id`, 'Le clavier de mon ordinateur est en français.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un clavier');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-clavier.svg' WHERE `french_word` = 'un clavier' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a mouse', 'une souris', '/images/vocab/une-souris.svg', 'sou-ri', l.`id`, 'Je clique avec la souris.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une souris');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-souris.svg' WHERE `french_word` = 'une souris' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a screen', 'un écran', '/images/vocab/un-ecran.svg', 'é-kran', l.`id`, 'L''écran est très grand.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un écran');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-ecran.svg' WHERE `french_word` = 'un écran' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a tablet', 'une tablette', '/images/vocab/une-tablette.svg', 'ta-blèt', l.`id`, 'Les enfants regardent un dessin animé sur la tablette.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une tablette');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-tablette.svg' WHERE `french_word` = 'une tablette' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'the Internet', 'Internet', '/images/vocab/internet.svg', 'in-tèr-nèt', l.`id`, 'J''ai Internet à la maison.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'Internet');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/internet.svg' WHERE `french_word` = 'Internet' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an email', 'un mail', '/images/vocab/un-mail.svg', 'mèl', l.`id`, 'J''envoie un mail à mon professeur.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un mail');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-mail.svg' WHERE `french_word` = 'un mail' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a password', 'un mot de passe', '/images/vocab/un-mot-de-passe.svg', 'mo de pas', l.`id`, 'Je change mon mot de passe.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un mot de passe');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-mot-de-passe.svg' WHERE `french_word` = 'un mot de passe' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'an app', 'une application', '/images/vocab/une-application.svg', 'a-pli-ka-syon', l.`id`, 'Je télécharge une application pour apprendre le français.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une application');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-application.svg' WHERE `french_word` = 'une application' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a message', 'un message', '/images/vocab/un-message.svg', 'mè-sazh', l.`id`, 'Je reçois un message de ma sœur.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un message');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-message.svg' WHERE `french_word` = 'un message' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a call', 'un appel', '/images/vocab/un-appel.svg', 'a-pèl', l.`id`, 'J''ai un appel important.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un appel');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-appel.svg' WHERE `french_word` = 'un appel' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a camera', 'un appareil photo', '/images/vocab/un-appareil-photo.svg', 'a-pa-rèy fo-to', l.`id`, 'Je prends une photo avec mon appareil photo.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un appareil photo');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-appareil-photo.svg' WHERE `french_word` = 'un appareil photo' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a photo', 'une photo', '/images/vocab/une-photo.svg', 'fo-to', l.`id`, 'Cette photo est très belle.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une photo');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-photo.svg' WHERE `french_word` = 'une photo' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a charger', 'un chargeur', '/images/vocab/un-chargeur.svg', 'shar-zheur', l.`id`, 'J''ai oublié mon chargeur.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'un chargeur');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/un-chargeur.svg' WHERE `french_word` = 'un chargeur' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'a battery', 'une batterie', '/images/vocab/une-batterie.svg', 'ba-tri', l.`id`, 'Ma batterie est presque vide.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'une batterie');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/une-batterie.svg' WHERE `french_word` = 'une batterie' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'Wi-Fi', 'le Wi-Fi', '/images/vocab/le-wi-fi.svg', 'wi-fi', l.`id`, 'Il y a du Wi-Fi dans la bibliothèque.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'le Wi-Fi');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/le-wi-fi.svg' WHERE `french_word` = 'le Wi-Fi' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to download', 'télécharger', '/images/vocab/telecharger.svg', 'té-lé-shar-zhé', l.`id`, 'Je télécharge un document.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'télécharger');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/telecharger.svg' WHERE `french_word` = 'télécharger' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES TECHNOLOGIES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A1', 'LES ADJECTIFS DE DESCRIPTION' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'tall', 'grand', '/images/vocab/grand.svg', 'gran', l.`id`, 'Mon frère est grand.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'grand');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/grand.svg' WHERE `french_word` = 'grand' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'small', 'petit', '/images/vocab/petit.svg', 'pe-ti', l.`id`, 'Ma sœur est petite.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'petit');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/petit.svg' WHERE `french_word` = 'petit' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'young', 'jeune', '/images/vocab/jeune.svg', 'zheun', l.`id`, 'Cette femme est jeune.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'jeune');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/jeune.svg' WHERE `french_word` = 'jeune' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'old', 'vieux', '/images/vocab/vieux.svg', 'vyeu', l.`id`, 'Mon grand-père est vieux.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'vieux');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/vieux.svg' WHERE `french_word` = 'vieux' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'blond', 'blond', '/images/vocab/blond.svg', 'blon', l.`id`, 'Mon fils est blond.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'blond');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/blond.svg' WHERE `french_word` = 'blond' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'dark-haired', 'brun', '/images/vocab/brun.svg', 'brun', l.`id`, 'Elle est brune.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'brun');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/brun.svg' WHERE `french_word` = 'brun' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'red-haired', 'roux', '/images/vocab/roux.svg', 'rou', l.`id`, 'Il est roux, avec des taches de rousseur.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'roux');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/roux.svg' WHERE `french_word` = 'roux' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'bald', 'chauve', '/images/vocab/chauve.svg', 'shov', l.`id`, 'Mon oncle est chauve.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'chauve');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/chauve.svg' WHERE `french_word` = 'chauve' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'bearded', 'barbu', '/images/vocab/barbu.svg', 'bar-bu', l.`id`, 'Cet homme est barbu.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'barbu');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/barbu.svg' WHERE `french_word` = 'barbu' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'kind', 'gentil', '/images/vocab/gentil.svg', 'zhan-ti', l.`id`, 'Mon voisin est très gentil.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'gentil');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/gentil.svg' WHERE `french_word` = 'gentil' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'funny', 'drôle', '/images/vocab/drole.svg', 'drol', l.`id`, 'Il est drôle, il me fait rire.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'drôle');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/drole.svg' WHERE `french_word` = 'drôle' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'shy', 'timide', '/images/vocab/timide.svg', 'ti-mid', l.`id`, 'Ma fille est timide.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'timide');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/timide.svg' WHERE `french_word` = 'timide' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'intelligent', 'intelligent', '/images/vocab/intelligent.svg', 'an-tè-li-zhan', l.`id`, 'Cet élève est intelligent.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'intelligent');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/intelligent.svg' WHERE `french_word` = 'intelligent' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'calm', 'calme', '/images/vocab/calme.svg', 'kalm', l.`id`, 'Le bébé est calme.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'calme');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/calme.svg' WHERE `french_word` = 'calme' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'talkative', 'bavard', '/images/vocab/bavard.svg', 'ba-var', l.`id`, 'Mon collègue est bavard.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'bavard');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/bavard.svg' WHERE `french_word` = 'bavard' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'brave', 'courageux', '/images/vocab/courageux.svg', 'kou-ra-zheu', l.`id`, 'Ce pompier est courageux.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'courageux');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/courageux.svg' WHERE `french_word` = 'courageux' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'lazy', 'paresseux', '/images/vocab/paresseux.svg', 'pa-re-seu', l.`id`, 'Le chat est paresseux.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'paresseux');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/paresseux.svg' WHERE `french_word` = 'paresseux' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'friendly', 'sympathique', '/images/vocab/sympathique.svg', 'san-pa-tik', l.`id`, 'Ma voisine est sympathique.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'sympathique');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/sympathique.svg' WHERE `french_word` = 'sympathique' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES ADJECTIFS DE DESCRIPTION') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A1', 'LES VERBES DU QUOTIDIEN' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to wake up', 'se réveiller', '/images/vocab/se-reveiller.svg', 'se ré-vé-yé', l.`id`, 'Je me réveille à sept heures.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'se réveiller');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/se-reveiller.svg' WHERE `french_word` = 'se réveiller' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to get up', 'se lever', '/images/vocab/se-lever.svg', 'se le-vé', l.`id`, 'Je me lève tout de suite.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'se lever');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/se-lever.svg' WHERE `french_word` = 'se lever' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to eat', 'manger', '/images/vocab/manger.svg', 'man-zhé', l.`id`, 'Nous mangeons à midi.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'manger');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/manger.svg' WHERE `french_word` = 'manger' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to drink', 'boire', '/images/vocab/boire.svg', 'bwar', l.`id`, 'Je bois de l''eau.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'boire');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/boire.svg' WHERE `french_word` = 'boire' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to sleep', 'dormir', '/images/vocab/dormir.svg', 'dor-mir', l.`id`, 'Les enfants dorment huit heures.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'dormir');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/dormir.svg' WHERE `french_word` = 'dormir' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to go to bed', 'se coucher', '/images/vocab/se-coucher.svg', 'se kou-shé', l.`id`, 'Je me couche à vingt-deux heures.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'se coucher');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/se-coucher.svg' WHERE `french_word` = 'se coucher' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to work', 'travailler', '/images/vocab/travailler.svg', 'tra-va-yé', l.`id`, 'Je travaille du lundi au vendredi.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'travailler');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/travailler.svg' WHERE `french_word` = 'travailler' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to speak', 'parler', '/images/vocab/parler.svg', 'par-lé', l.`id`, 'Je parle français avec mes voisins.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'parler');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/parler.svg' WHERE `french_word` = 'parler' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to listen', 'écouter', '/images/vocab/ecouter.svg', 'é-kou-té', l.`id`, 'J''écoute la radio.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'écouter');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/ecouter.svg' WHERE `french_word` = 'écouter' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to watch', 'regarder', '/images/vocab/regarder.svg', 're-gar-dé', l.`id`, 'Je regarde la télévision.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'regarder');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/regarder.svg' WHERE `french_word` = 'regarder' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to read', 'lire', '/images/vocab/lire.svg', 'lir', l.`id`, 'Je lis un livre.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'lire');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/lire.svg' WHERE `french_word` = 'lire' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to write', 'écrire', '/images/vocab/ecrire.svg', 'é-krir', l.`id`, 'J''écris une lettre.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'écrire');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/ecrire.svg' WHERE `french_word` = 'écrire' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to walk', 'marcher', '/images/vocab/marcher.svg', 'mar-shé', l.`id`, 'Je marche jusqu''à l''arrêt de bus.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'marcher');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/marcher.svg' WHERE `french_word` = 'marcher' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to run', 'courir', '/images/vocab/courir.svg', 'kou-rir', l.`id`, 'Il court dans le parc.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'courir');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/courir.svg' WHERE `french_word` = 'courir' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to open', 'ouvrir', '/images/vocab/ouvrir.svg', 'ou-vrir', l.`id`, 'J''ouvre la fenêtre.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'ouvrir');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/ouvrir.svg' WHERE `french_word` = 'ouvrir' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to wait', 'attendre', '/images/vocab/attendre.svg', 'a-tandr', l.`id`, 'J''attends le bus.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'attendre');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/attendre.svg' WHERE `french_word` = 'attendre' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to look for', 'chercher', '/images/vocab/chercher.svg', 'shèr-shé', l.`id`, 'Je cherche mes clés.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'chercher');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/chercher.svg' WHERE `french_word` = 'chercher' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'to find', 'trouver', '/images/vocab/trouver.svg', 'trou-vé', l.`id`, 'J''ai trouvé mon portefeuille.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'trouver');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/trouver.svg' WHERE `french_word` = 'trouver' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES VERBES DU QUOTIDIEN') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `lessons` (`audio_url`, `category`, `content`, `created_at`, `image_url`, `level`, `title`)
SELECT NULL, '', '', NOW(6), NULL, 'A1', 'LES CONTRAIRES' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `lessons` WHERE `title` = 'LES CONTRAIRES');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'hot', 'chaud', '/images/vocab/chaud.svg', 'sho', l.`id`, 'Le café est chaud.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'chaud');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/chaud.svg' WHERE `french_word` = 'chaud' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'cold', 'froid', '/images/vocab/froid.svg', 'frwa', l.`id`, 'L''eau est froide.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'froid');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/froid.svg' WHERE `french_word` = 'froid' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'high', 'haut', '/images/vocab/haut.svg', 'o', l.`id`, 'La montagne est haute.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'haut');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/haut.svg' WHERE `french_word` = 'haut' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'low', 'bas', '/images/vocab/bas.svg', 'ba', l.`id`, 'La table est basse.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'bas');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/bas.svg' WHERE `french_word` = 'bas' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'open', 'ouvert', '/images/vocab/ouvert.svg', 'ou-vèr', l.`id`, 'Le magasin est ouvert.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'ouvert');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/ouvert.svg' WHERE `french_word` = 'ouvert' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'closed', 'fermé', '/images/vocab/ferme.svg', 'fèr-mé', l.`id`, 'La banque est fermée.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'fermé');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/ferme.svg' WHERE `french_word` = 'fermé' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'full', 'plein', '/images/vocab/plein.svg', 'plan', l.`id`, 'Le verre est plein.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'plein');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/plein.svg' WHERE `french_word` = 'plein' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'empty', 'vide', '/images/vocab/vide.svg', 'vid', l.`id`, 'La bouteille est vide.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'vide');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/vide.svg' WHERE `french_word` = 'vide' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'heavy', 'lourd', '/images/vocab/lourd.svg', 'lour', l.`id`, 'Cette valise est lourde.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'lourd');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/lourd.svg' WHERE `french_word` = 'lourd' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'light', 'léger', '/images/vocab/leger.svg', 'lé-zhé', l.`id`, 'Ce sac est léger.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'léger');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/leger.svg' WHERE `french_word` = 'léger' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'fast', 'rapide', '/images/vocab/rapide.svg', 'ra-pid', l.`id`, 'Le train est rapide.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'rapide');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/rapide.svg' WHERE `french_word` = 'rapide' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'slow', 'lent', '/images/vocab/lent.svg', 'lan', l.`id`, 'La tortue est lente.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'lent');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/lent.svg' WHERE `french_word` = 'lent' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'clean', 'propre', '/images/vocab/propre.svg', 'propr', l.`id`, 'Ma chemise est propre.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'propre');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/propre.svg' WHERE `french_word` = 'propre' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'dirty', 'sale', '/images/vocab/sale.svg', 'sal', l.`id`, 'Ses chaussures sont sales.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'sale');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/sale.svg' WHERE `french_word` = 'sale' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'easy', 'facile', '/images/vocab/facile.svg', 'fa-sil', l.`id`, 'Cet exercice est facile.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'facile');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/facile.svg' WHERE `french_word` = 'facile' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'difficult', 'difficile', '/images/vocab/difficile.svg', 'di-fi-sil', l.`id`, 'Cette leçon est difficile.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'difficile');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/difficile.svg' WHERE `french_word` = 'difficile' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'good', 'bon', '/images/vocab/bon.svg', 'bon', l.`id`, 'Ce gâteau est bon.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'bon');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/bon.svg' WHERE `french_word` = 'bon' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND (`image_url` IS NULL OR `image_url` = '');

INSERT INTO `vocabularies` (`audio_url`, `english_translation`, `french_word`, `image_url`, `pronunciation`, `lesson_id`, `example_sentence`, `alt_text`)
SELECT NULL, 'bad', 'mauvais', '/images/vocab/mauvais.svg', 'mo-vè', l.`id`, 'Le café est mauvais.', '' FROM `lessons` l
WHERE l.`id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND NOT EXISTS (SELECT 1 FROM `vocabularies` x WHERE x.`lesson_id` = l.`id` AND x.`french_word` = 'mauvais');
UPDATE `vocabularies` SET `image_url` = '/images/vocab/mauvais.svg' WHERE `french_word` = 'mauvais' AND `lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES CONTRAIRES') AND (`image_url` IS NULL OR `image_url` = '');
