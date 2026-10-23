-- Quiz glisser-déposer des cours « approfondis » (A2/B1).
-- Peut être exécuté plusieurs fois sans créer de doublons (chaque quiz n'est inséré que s'il n'existe pas).
-- Sur le serveur : docker exec -i french-db mysql -u root -p <base> < init-db/frenchdb_9_quiz_approfondis.sql
SET NAMES utf8mb4;

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'partis,parties', '', 'Paul et Marc sont ____ à Lyon. Julie et Sara sont ____ ensemble.', 'Accords approfondis - Grammaire', 'partis,parties,partie', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Accords approfondis - Grammaire' AND `sentence` = 'Paul et Marc sont ____ à Lyon. Julie et Sara sont ____ ensemble.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'marron,foncé', '', 'Elle porte des chaussures ____ et une jupe bleu ____.', 'Accords approfondis - Grammaire', 'marron,marrons,foncé,foncée', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Accords approfondis - Grammaire' AND `sentence` = 'Elle porte des chaussures ____ et une jupe bleu ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'écrites,postées', '', 'Les lettres que j''ai ____ sont sur la table. Je les ai ____ hier.', 'Accords approfondis - Grammaire', 'écrites,postées,écrit,posté', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Accords approfondis - Grammaire' AND `sentence` = 'Les lettres que j''ai ____ sont sur la table. Je les ai ____ hier.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'contents,arrivé', '', 'La plupart des gens sont ____. Un groupe d''étudiants est ____.', 'Accords approfondis - Grammaire', 'contents,arrivé,content,arrivés', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Accords approfondis - Grammaire' AND `sentence` = 'La plupart des gens sont ____. Un groupe d''étudiants est ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'depuis,il y a', '', 'J''habite à Paris ____ trois ans. Je suis arrivé en France ____ trois ans.', 'Repères de temps approfondis - Grammaire', 'depuis,il y a,dans,pendant', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Repères de temps approfondis - Grammaire' AND `sentence` = 'J''habite à Paris ____ trois ans. Je suis arrivé en France ____ trois ans.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'dans,en', '', 'Le train part ____ dix minutes. J''ai fait mes devoirs ____ une heure.', 'Repères de temps approfondis - Grammaire', 'dans,en,pendant,depuis', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Repères de temps approfondis - Grammaire' AND `sentence` = 'Le train part ____ dix minutes. J''ai fait mes devoirs ____ une heure.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'pendant,pour', '', 'Elle a dormi ____ huit heures. Je pars ____ une semaine en Espagne.', 'Repères de temps approfondis - Grammaire', 'pendant,pour,depuis,il y a', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Repères de temps approfondis - Grammaire' AND `sentence` = 'Elle a dormi ____ huit heures. Je pars ____ une semaine en Espagne.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Après,Avant', '', '____ avoir mangé, nous avons pris un café. ____ de partir, il a payé.', 'Repères de temps approfondis - Grammaire', 'Après,Avant,Depuis,Pendant', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Repères de temps approfondis - Grammaire' AND `sentence` = '____ avoir mangé, nous avons pris un café. ____ de partir, il a payé.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'finissons,finissent', '', 'Nous ____ le travail à six heures. Ils ____ leur devoir.', 'Verbes en -ir, -re et -yer - Grammaire', 'finissons,finissent,finons,finent', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Verbes en -ir, -re et -yer - Grammaire' AND `sentence` = 'Nous ____ le travail à six heures. Ils ____ leur devoir.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'pars,dort', '', 'Je ____ demain matin. Elle ____ très tard le week-end.', 'Verbes en -ir, -re et -yer - Grammaire', 'pars,dort,parts,dors', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Verbes en -ir, -re et -yer - Grammaire' AND `sentence` = 'Je ____ demain matin. Elle ____ très tard le week-end.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'attend,attendons', '', 'Il ____ la réponse. Nous ____ le bus.', 'Verbes en -ir, -re et -yer - Grammaire', 'attend,attendons,attent,attendent', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Verbes en -ir, -re et -yer - Grammaire' AND `sentence` = 'Il ____ la réponse. Nous ____ le bus.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'nettoies,envoyons', '', 'Tu ____ la table. Nous ____ un message.', 'Verbes en -ir, -re et -yer - Grammaire', 'nettoies,envoyons,nettoyes,envoions', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Verbes en -ir, -re et -yer - Grammaire' AND `sentence` = 'Tu ____ la table. Nous ____ un message.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'est,avons', '', 'Elle ____ arrivée hier. Nous ____ mangé au restaurant.', 'Choisir l''auxiliaire - Grammaire', 'est,avons,a,sommes', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Choisir l''auxiliaire - Grammaire' AND `sentence` = 'Elle ____ arrivée hier. Nous ____ mangé au restaurant.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'est,a', '', 'Il ____ sorti de la maison. Il ____ sorti la poubelle.', 'Choisir l''auxiliaire - Grammaire', 'est,a,sont,ont', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Choisir l''auxiliaire - Grammaire' AND `sentence` = 'Il ____ sorti de la maison. Il ____ sorti la poubelle.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'sommes,sont', '', 'Nous nous ____ levés tôt. Ils ____ partis ensemble.', 'Choisir l''auxiliaire - Grammaire', 'sommes,sont,avons,ont', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Choisir l''auxiliaire - Grammaire' AND `sentence` = 'Nous nous ____ levés tôt. Ils ____ partis ensemble.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'acheté,achetées', '', 'J''ai ____ des fleurs. Les fleurs que j''ai ____ sont belles.', 'Choisir l''auxiliaire - Grammaire', 'acheté,achetées,achetés,achetée', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Choisir l''auxiliaire - Grammaire' AND `sentence` = 'J''ai ____ des fleurs. Les fleurs que j''ai ____ sont belles.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'prudemment,lentement', '', 'Il parle ____. Elle conduit ____.', 'Adverbes en -ment et place - Grammaire', 'prudemment,lentement,prudentement,lentment', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Adverbes en -ment et place - Grammaire' AND `sentence` = 'Il parle ____. Elle conduit ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'bien,poliment', '', 'Il a ____ compris la leçon. Elle a répondu ____.', 'Adverbes en -ment et place - Grammaire', 'bien,poliment,bon,poli', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Adverbes en -ment et place - Grammaire' AND `sentence` = 'Il a ____ compris la leçon. Elle a répondu ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'mieux,cher', '', 'Elle chante ____ que moi. Cette robe coûte ____.', 'Adverbes en -ment et place - Grammaire', 'mieux,cher,chère,meilleur', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Adverbes en -ment et place - Grammaire' AND `sentence` = 'Elle chante ____ que moi. Cette robe coûte ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Heureusement,Malheureusement', '', '____, il n''a pas plu pendant le mariage. ____, nous avons raté le train.', 'Adverbes en -ment et place - Grammaire', 'Heureusement,Malheureusement,Lentement', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Adverbes en -ment et place - Grammaire' AND `sentence` = '____, il n''a pas plu pendant le mariage. ____, nous avons raté le train.');
