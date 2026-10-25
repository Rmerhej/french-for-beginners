-- Quiz des 3 nouvelles leçons (articles indéfinis et partitifs, adjectifs possessifs, verbes irréguliers courants) : 30 quiz glisser-déposer.
-- Peut être exécuté plusieurs fois sans créer de doublons. Aucune nouvelle image nécessaire pour ce fichier.
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_quiz_lecons_nouvelles.sql
SET NAMES utf8mb4;

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'un,une', '', 'J''ai ____ chat et ____ chienne.', 'Les articles indéfinis et partitifs - Grammaire', 'un,une,des,du', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les articles indéfinis et partitifs - Grammaire' AND `sentence` = 'J''ai ____ chat et ____ chienne.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'du,de la', '', 'Je mange ____ pain et ____ confiture.', 'Les articles indéfinis et partitifs - Grammaire', 'du,de la,des,un', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les articles indéfinis et partitifs - Grammaire' AND `sentence` = 'Je mange ____ pain et ____ confiture.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'des', '', 'Elle achète ____ pommes.', 'Les articles indéfinis et partitifs - Grammaire', 'des,du,une,de la', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les articles indéfinis et partitifs - Grammaire' AND `sentence` = 'Elle achète ____ pommes.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'de l''', '', 'Il y a ____ eau dans le verre.', 'Les articles indéfinis et partitifs - Grammaire', 'de l'',du,de la,des', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les articles indéfinis et partitifs - Grammaire' AND `sentence` = 'Il y a ____ eau dans le verre.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'du', '', 'Nous buvons ____ café le matin.', 'Les articles indéfinis et partitifs - Grammaire', 'du,de la,un,des', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les articles indéfinis et partitifs - Grammaire' AND `sentence` = 'Nous buvons ____ café le matin.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'de', '', 'Je n''ai pas ____ voiture.', 'Les articles indéfinis et partitifs - Grammaire', 'de,une,la,du', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les articles indéfinis et partitifs - Grammaire' AND `sentence` = 'Je n''ai pas ____ voiture.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'de', '', 'Il ne reste pas ____ pain.', 'Les articles indéfinis et partitifs - Grammaire', 'de,du,un,des', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les articles indéfinis et partitifs - Grammaire' AND `sentence` = 'Il ne reste pas ____ pain.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'de la,des', '', 'Tu veux ____ salade ou ____ légumes ?', 'Les articles indéfinis et partitifs - Grammaire', 'de la,des,du,un', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les articles indéfinis et partitifs - Grammaire' AND `sentence` = 'Tu veux ____ salade ou ____ légumes ?');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'des,du', '', 'Elle a ____ idées et ____ courage.', 'Les articles indéfinis et partitifs - Grammaire', 'des,du,une,de la', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les articles indéfinis et partitifs - Grammaire' AND `sentence` = 'Elle a ____ idées et ____ courage.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'de', '', 'Il y a beaucoup ____ monde.', 'Les articles indéfinis et partitifs - Grammaire', 'de,du,des,le', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les articles indéfinis et partitifs - Grammaire' AND `sentence` = 'Il y a beaucoup ____ monde.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'ma', '', 'Moi, j''ai une sœur : ____ sœur s''appelle Léa.', 'Les adjectifs possessifs - Grammaire', 'ma,mon,mes,ta', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les adjectifs possessifs - Grammaire' AND `sentence` = 'Moi, j''ai une sœur : ____ sœur s''appelle Léa.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'ton', '', 'Toi, tu as un frère : ____ frère est grand.', 'Les adjectifs possessifs - Grammaire', 'ton,ta,tes,son', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les adjectifs possessifs - Grammaire' AND `sentence` = 'Toi, tu as un frère : ____ frère est grand.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'ses', '', 'Julie a des amis : ____ amis sont gentils.', 'Les adjectifs possessifs - Grammaire', 'ses,son,sa,leurs', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les adjectifs possessifs - Grammaire' AND `sentence` = 'Julie a des amis : ____ amis sont gentils.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'notre', '', 'Nous avons une maison : ____ maison est grande.', 'Les adjectifs possessifs - Grammaire', 'notre,nos,votre,leur', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les adjectifs possessifs - Grammaire' AND `sentence` = 'Nous avons une maison : ____ maison est grande.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'vos', '', 'Vous avez des enfants : ____ enfants sont sages.', 'Les adjectifs possessifs - Grammaire', 'vos,votre,leurs,nos', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les adjectifs possessifs - Grammaire' AND `sentence` = 'Vous avez des enfants : ____ enfants sont sages.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'leur', '', 'Paul et Marie ont un chien : ____ chien est noir.', 'Les adjectifs possessifs - Grammaire', 'leur,leurs,son,ses', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les adjectifs possessifs - Grammaire' AND `sentence` = 'Paul et Marie ont un chien : ____ chien est noir.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'son', '', 'Elle a une amie : ____ amie habite à Lyon.', 'Les adjectifs possessifs - Grammaire', 'son,sa,ses,leur', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les adjectifs possessifs - Grammaire' AND `sentence` = 'Elle a une amie : ____ amie habite à Lyon.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'leurs', '', 'Ils ont des voitures : ____ voitures sont neuves.', 'Les adjectifs possessifs - Grammaire', 'leurs,leur,ses,sa', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les adjectifs possessifs - Grammaire' AND `sentence` = 'Ils ont des voitures : ____ voitures sont neuves.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'mes,mon', '', 'J''ai perdu ____ clés et ____ téléphone.', 'Les adjectifs possessifs - Grammaire', 'mes,mon,ma,tes', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les adjectifs possessifs - Grammaire' AND `sentence` = 'J''ai perdu ____ clés et ____ téléphone.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'notre,nos', '', 'Nous aimons ____ professeur et ____ amis.', 'Les adjectifs possessifs - Grammaire', 'notre,nos,votre,vos', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les adjectifs possessifs - Grammaire' AND `sentence` = 'Nous aimons ____ professeur et ____ amis.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'viens', '', 'Je ____ de Paris.', 'Les verbes irréguliers courants - Conjugaison', 'viens,vient,venez,viennent', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les verbes irréguliers courants - Conjugaison' AND `sentence` = 'Je ____ de Paris.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'peux', '', 'Tu ____ parler français ?', 'Les verbes irréguliers courants - Conjugaison', 'peux,peut,pouvez,peuvent', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les verbes irréguliers courants - Conjugaison' AND `sentence` = 'Tu ____ parler français ?');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'veut', '', 'Il ____ un café.', 'Les verbes irréguliers courants - Conjugaison', 'veut,veux,voulons,veulent', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les verbes irréguliers courants - Conjugaison' AND `sentence` = 'Il ____ un café.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'devons', '', 'Nous ____ partir tôt.', 'Les verbes irréguliers courants - Conjugaison', 'devons,devez,doit,doivent', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les verbes irréguliers courants - Conjugaison' AND `sentence` = 'Nous ____ partir tôt.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'prenez', '', 'Vous ____ le bus ?', 'Les verbes irréguliers courants - Conjugaison', 'prenez,prenons,prend,prennent', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les verbes irréguliers courants - Conjugaison' AND `sentence` = 'Vous ____ le bus ?');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'savent', '', 'Ils ne ____ pas la réponse.', 'Les verbes irréguliers courants - Conjugaison', 'savent,sait,savons,savez', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les verbes irréguliers courants - Conjugaison' AND `sentence` = 'Ils ne ____ pas la réponse.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'vois', '', 'Je ____ un oiseau.', 'Les verbes irréguliers courants - Conjugaison', 'vois,voit,voyons,voient', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les verbes irréguliers courants - Conjugaison' AND `sentence` = 'Je ____ un oiseau.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'dites', '', 'Qu''est-ce que vous ____ ?', 'Les verbes irréguliers courants - Conjugaison', 'dites,disez,disent,dit', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les verbes irréguliers courants - Conjugaison' AND `sentence` = 'Qu''est-ce que vous ____ ?');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'prend,prenons', '', 'Elle ____ du lait et nous ____ du thé.', 'Les verbes irréguliers courants - Conjugaison', 'prend,prenons,prennent,prends', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les verbes irréguliers courants - Conjugaison' AND `sentence` = 'Elle ____ du lait et nous ____ du thé.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'peuvent,peux', '', 'Ils ____ venir demain mais je ne ____ pas.', 'Les verbes irréguliers courants - Conjugaison', 'peuvent,peux,peut,pouvons', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les verbes irréguliers courants - Conjugaison' AND `sentence` = 'Ils ____ venir demain mais je ne ____ pas.');
