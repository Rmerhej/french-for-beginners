-- Quiz des 2 leçons : types et formes de phrases, pronoms interrogatifs (20 quiz glisser-déposer).
-- Peut être exécuté plusieurs fois sans créer de doublons.
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_quiz_lecons_nouvelles_3.sql
SET NAMES utf8mb4;

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'déclarative', '', '« Il pleut aujourd''hui. » est une phrase ____.', 'Les types et formes de phrases - Grammaire', 'déclarative,interrogative,impérative,exclamative', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les types et formes de phrases - Grammaire' AND `sentence` = '« Il pleut aujourd''hui. » est une phrase ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'interrogative', '', '« Où habitez-vous ? » est une phrase ____.', 'Les types et formes de phrases - Grammaire', 'déclarative,interrogative,impérative,exclamative', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les types et formes de phrases - Grammaire' AND `sentence` = '« Où habitez-vous ? » est une phrase ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'impérative', '', '« Ferme la porte, s''il te plaît. » est une phrase ____.', 'Les types et formes de phrases - Grammaire', 'déclarative,interrogative,impérative,exclamative', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les types et formes de phrases - Grammaire' AND `sentence` = '« Ferme la porte, s''il te plaît. » est une phrase ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'exclamative', '', '« Quelle belle journée ! » est une phrase ____.', 'Les types et formes de phrases - Grammaire', 'déclarative,interrogative,impérative,exclamative', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les types et formes de phrases - Grammaire' AND `sentence` = '« Quelle belle journée ! » est une phrase ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'négative', '', '« Je ne veux pas de café. » est une phrase à la forme ____.', 'Les types et formes de phrases - Grammaire', 'négative,affirmative,passive,interrogative', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les types et formes de phrases - Grammaire' AND `sentence` = '« Je ne veux pas de café. » est une phrase à la forme ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'affirmative', '', '« Nous aimons le chocolat. » est une phrase à la forme ____.', 'Les types et formes de phrases - Grammaire', 'affirmative,négative,passive,interrogative', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les types et formes de phrases - Grammaire' AND `sentence` = '« Nous aimons le chocolat. » est une phrase à la forme ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'interrogative', '', 'Une phrase qui pose une question est une phrase ____.', 'Les types et formes de phrases - Grammaire', 'déclarative,interrogative,impérative,exclamative', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les types et formes de phrases - Grammaire' AND `sentence` = 'Une phrase qui pose une question est une phrase ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'impérative', '', 'Une phrase qui donne un ordre ou un conseil est une phrase ____.', 'Les types et formes de phrases - Grammaire', 'déclarative,interrogative,impérative,exclamative', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les types et formes de phrases - Grammaire' AND `sentence` = 'Une phrase qui donne un ordre ou un conseil est une phrase ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'interrogative,impérative', '', '« Tu viens ? » est une phrase ____ et « Viens ! » est une phrase ____.', 'Les types et formes de phrases - Grammaire', 'interrogative,impérative,déclarative,exclamative', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les types et formes de phrases - Grammaire' AND `sentence` = '« Tu viens ? » est une phrase ____ et « Viens ! » est une phrase ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'impérative,négative', '', '« Ne fermez pas la porte. » est une phrase ____ à la forme ____.', 'Les types et formes de phrases - Grammaire', 'impérative,négative,interrogative,exclamative', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les types et formes de phrases - Grammaire' AND `sentence` = '« Ne fermez pas la porte. » est une phrase ____ à la forme ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Qui', '', '____ parle au téléphone ? C''est ma sœur.', 'Pronoms interrogatifs - Grammaire', 'Qui,Que,Quoi,Lequel', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Pronoms interrogatifs - Grammaire' AND `sentence` = '____ parle au téléphone ? C''est ma sœur.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Qu''est-ce que', '', '____ tu fais ce soir ?', 'Pronoms interrogatifs - Grammaire', 'Qu''est-ce que,Qu''est-ce qui,Qui,Quoi', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Pronoms interrogatifs - Grammaire' AND `sentence` = '____ tu fais ce soir ?');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Qu''est-ce qui', '', '____ se passe ? J''entends du bruit.', 'Pronoms interrogatifs - Grammaire', 'Qu''est-ce que,Qu''est-ce qui,Qui,Quoi', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Pronoms interrogatifs - Grammaire' AND `sentence` = '____ se passe ? J''entends du bruit.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'qui', '', 'Avec ____ parles-tu ? Avec mon frère.', 'Pronoms interrogatifs - Grammaire', 'qui,que,quoi,lequel', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Pronoms interrogatifs - Grammaire' AND `sentence` = 'Avec ____ parles-tu ? Avec mon frère.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'quoi', '', 'De ____ parlez-vous ? De mon travail.', 'Pronoms interrogatifs - Grammaire', 'qui,que,quoi,lequel', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Pronoms interrogatifs - Grammaire' AND `sentence` = 'De ____ parlez-vous ? De mon travail.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'lequel', '', 'Voici deux livres : ____ préfères-tu ?', 'Pronoms interrogatifs - Grammaire', 'lequel,laquelle,lesquels,quoi', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Pronoms interrogatifs - Grammaire' AND `sentence` = 'Voici deux livres : ____ préfères-tu ?');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'laquelle', '', 'Voici deux robes : ____ préfères-tu ?', 'Pronoms interrogatifs - Grammaire', 'lequel,laquelle,lesquels,lesquelles', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Pronoms interrogatifs - Grammaire' AND `sentence` = 'Voici deux robes : ____ préfères-tu ?');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'lesquels', '', 'Voici des stylos : ____ voulez-vous ?', 'Pronoms interrogatifs - Grammaire', 'lequel,laquelle,lesquels,lesquelles', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Pronoms interrogatifs - Grammaire' AND `sentence` = 'Voici des stylos : ____ voulez-vous ?');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Que', '', '____ voyez-vous ? Je vois un oiseau.', 'Pronoms interrogatifs - Grammaire', 'Que,Qui,Quoi,Qu''est-ce qui', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Pronoms interrogatifs - Grammaire' AND `sentence` = '____ voyez-vous ? Je vois un oiseau.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'qui', '', 'À ____ téléphones-tu ? À ta mère.', 'Pronoms interrogatifs - Grammaire', 'qui,que,quoi,lequel', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Pronoms interrogatifs - Grammaire' AND `sentence` = 'À ____ téléphones-tu ? À ta mère.');
