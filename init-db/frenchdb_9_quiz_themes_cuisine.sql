-- Quiz « glisser-déposer » des deux thèmes « Dans la cuisine » et « Cuisiner un plat » (4 quiz par thème : Vrai ou Faux, Complétez les phrases, Associez, Remettez le dialogue dans l'ordre).
-- Chaque quiz s'affiche sur la page du thème (le titre contient le nom du thème). Peut être exécuté plusieurs fois sans doublons.
SET NAMES utf8mb4;

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Vrai,Faux,Vrai,Faux,Vrai', '', '1.C''est le premier jour de Léa en cuisine.____\r\n2.Les couteaux sont dans le placard, à droite.____\r\n3.L''éplucheur est à côté de l''évier.____\r\n4.La poêle est en haut, sur l''étagère.____\r\n5.Le four est très chaud : il faut prendre les maniques.____', 'Dans la cuisine - Vrai ou Faux', 'Faux,Vrai,Vrai,Faux,Vrai', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Dans la cuisine - Vrai ou Faux');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'tablier,couteaux,planche,four,casserole', '', '1.Le chef dit à Léa de mettre son ____.\r\n2.Les ____ sont dans le tiroir, à gauche.\r\n3.On coupe les carottes sur la ____ à découper.\r\n4.Le ____ est très chaud : on prend les maniques.\r\n5.La grande ____ est sur l''étagère, en haut.', 'Dans la cuisine - Complétez les phrases', 'fouet,planche,casserole,four,couteaux,tablier', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Dans la cuisine - Complétez les phrases');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Dans le tiroir à gauche,Sur l''étagère en haut,En bas sous le plan de travail,À côté de l''évier,Le four est très chaud', '', '1.Où sont les couteaux ?____\r\n2.Où est la grande casserole ?____\r\n3.Où est la poêle ?____\r\n4.Où est l''éplucheur ?____\r\n5.Pourquoi prendre les maniques ?____', 'Dans la cuisine - Associez les questions aux réponses.', 'Dans le tiroir à gauche,À côté de l''évier,Sur l''étagère en haut,Le four est très chaud,En bas sous le plan de travail', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Dans la cuisine - Associez les questions aux réponses.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Bonjour Léa ! C''est ton premier jour en cuisine.,Bonjour chef. Je suis prête !,Mets ton tablier et lave-toi les mains.,Où sont les couteaux ?,Dans le tiroir à gauche.', '', '1.____\r\n2.____\r\n3.____\r\n4.____\r\n5.____', 'Dans la cuisine - Remettez le dialogue dans le bon ordre.', 'Dans le tiroir à gauche.,Bonjour chef. Je suis prête !,Où sont les couteaux ?,Bonjour Léa ! C''est ton premier jour en cuisine.,Mets ton tablier et lave-toi les mains.', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Dans la cuisine - Remettez le dialogue dans le bon ordre.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Vrai,Faux,Vrai,Faux,Vrai', '', '1.La table douze a commandé un poulet rôti et une soupe.____\r\n2.Léa commence par le poulet.____\r\n3.Il faut faire bouillir l''eau pendant vingt minutes.____\r\n4.Le poulet cuit pendant vingt minutes.____\r\n5.Après la cuisson, on laisse reposer le poulet cinq minutes.____', 'Cuisiner un plat - Vrai ou Faux', 'Vrai,Vrai,Vrai,Faux,Faux', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Cuisiner un plat - Vrai ou Faux');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'épluche,coupe,bouillir,goûte,four', '', '1.Léa ____ les pommes de terre.\r\n2.Elle ____ les oignons.\r\n3.Elle fait ____ l''eau pendant vingt minutes.\r\n4.Elle ____ la soupe pour vérifier le sel.\r\n5.Le poulet cuit au ____.', 'Cuisiner un plat - Complétez les phrases', 'coupe,mijoter,épluche,bouillir,goûte,four', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Cuisiner un plat - Complétez les phrases');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Un poulet rôti et une soupe,Vingt minutes,À deux cents degrés,Cinq minutes,Table douze départ !', '', '1.Que prépare Léa pour la table douze ?____\r\n2.Combien de temps faut-il faire bouillir l''eau ?____\r\n3.À quelle température cuit le poulet ?____\r\n4.Combien de temps laisse-t-on reposer le poulet ?____\r\n5.Que dit le chef à la fin ?____', 'Cuisiner un plat - Associez les questions aux réponses.', 'Table douze départ !,Cinq minutes,Un poulet rôti et une soupe,À deux cents degrés,Vingt minutes', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Cuisiner un plat - Associez les questions aux réponses.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Table douze : un poulet rôti et une soupe.,Je commence par la soupe ?,Épluche les pommes de terre et coupe les oignons.,Le poulet est cuit. Je le sors ?,Bravo ! Table douze départ !', '', '1.____\r\n2.____\r\n3.____\r\n4.____\r\n5.____', 'Cuisiner un plat - Remettez le dialogue dans le bon ordre.', 'Je commence par la soupe ?,Le poulet est cuit. Je le sors ?,Table douze : un poulet rôti et une soupe.,Bravo ! Table douze départ !,Épluche les pommes de terre et coupe les oignons.', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Cuisiner un plat - Remettez le dialogue dans le bon ordre.');
