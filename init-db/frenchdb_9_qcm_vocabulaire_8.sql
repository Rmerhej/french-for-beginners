-- QCM des leçons du lot 6 (Les ustensiles de cuisine, Les gestes de cuisine). Peut être exécuté plusieurs fois sans doublons. À lancer APRÈS frenchdb_9_vocab_lot6.sql.
SET NAMES utf8mb4;

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN COUTEAU', 'On coupe les légumes avec un couteau, sur une planche à découper.', 'LES USTENSILES DE CUISINE', 'UN COUTEAU', 'UNE LOUCHE', 'UN FOUET', 'UN MINUTEUR', 'Avec quoi coupe-t-on les légumes ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES USTENSILES DE CUISINE' AND `question` = 'Avec quoi coupe-t-on les légumes ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE LOUCHE', 'La louche sert à servir la soupe, la sauce ou le bouillon.', 'LES USTENSILES DE CUISINE', 'UN COUTEAU', 'UNE LOUCHE', 'UNE RÂPE', 'UN ÉPLUCHEUR', 'Avec quoi sert-on la soupe ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES USTENSILES DE CUISINE' AND `question` = 'Avec quoi sert-on la soupe ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN FOUET', 'Le fouet sert à battre les œufs ou à mélanger une sauce.', 'LES USTENSILES DE CUISINE', 'UNE PASSOIRE', 'UNE SPATULE', 'UN FOUET', 'UN TABLIER', 'Qu''utilise-t-on pour battre des œufs ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES USTENSILES DE CUISINE' AND `question` = 'Qu''utilise-t-on pour battre des œufs ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DANS UNE PASSOIRE', 'La passoire laisse passer l''eau et garde les pâtes.', 'LES USTENSILES DE CUISINE', 'DANS UN FOUR', 'DANS UN SALADIER', 'SUR UNE BALANCE', 'DANS UNE PASSOIRE', 'Où égoutte-t-on les pâtes ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES USTENSILES DE CUISINE' AND `question` = 'Où égoutte-t-on les pâtes ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE BALANCE', 'La balance sert à peser les ingrédients.', 'LES USTENSILES DE CUISINE', 'UNE BALANCE', 'UN MINUTEUR', 'UNE LOUCHE', 'UN TABLIER', 'Qu''utilise-t-on pour peser la farine ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES USTENSILES DE CUISINE' AND `question` = 'Qu''utilise-t-on pour peser la farine ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DES MANIQUES', 'Les maniques protègent les mains de la chaleur du four.', 'LES USTENSILES DE CUISINE', 'UN TABLIER', 'DES MANIQUES', 'UN FOUET', 'UNE RÂPE', 'Que met-on pour ne pas se brûler en prenant un plat chaud ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES USTENSILES DE CUISINE' AND `question` = 'Que met-on pour ne pas se brûler en prenant un plat chaud ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN ROULEAU À PÂTISSERIE', 'Le rouleau à pâtisserie sert à étaler la pâte.', 'LES USTENSILES DE CUISINE', 'UNE ÉCUMOIRE', 'UNE PASSOIRE', 'UN ROULEAU À PÂTISSERIE', 'UNE POÊLE', 'Qu''utilise-t-on pour étaler la pâte ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES USTENSILES DE CUISINE' AND `question` = 'Qu''utilise-t-on pour étaler la pâte ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DANS UNE POÊLE', 'On fait cuire un steak dans une poêle chaude.', 'LES USTENSILES DE CUISINE', 'DANS UN SALADIER', 'DANS UN MINUTEUR', 'DANS UNE RÂPE', 'DANS UNE POÊLE', 'Dans quoi fait-on cuire un steak ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES USTENSILES DE CUISINE' AND `question` = 'Dans quoi fait-on cuire un steak ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE RÂPE', 'La râpe sert à transformer le fromage en petits filaments.', 'LES USTENSILES DE CUISINE', 'UNE RÂPE', 'UN ÉPLUCHEUR', 'UNE LOUCHE', 'UN FOUET', 'Qu''utilise-t-on pour râper du fromage ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES USTENSILES DE CUISINE' AND `question` = 'Qu''utilise-t-on pour râper du fromage ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN MINUTEUR', 'Le minuteur sonne quand le temps de cuisson est terminé.', 'LES USTENSILES DE CUISINE', 'UNE BALANCE', 'UN MINUTEUR', 'UN FOUET', 'UN FOUR', 'Quel objet mesure le temps de cuisson ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES USTENSILES DE CUISINE' AND `question` = 'Quel objet mesure le temps de cuisson ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN ÉPLUCHEUR', 'L''éplucheur enlève la peau des légumes.', 'LES USTENSILES DE CUISINE', 'UNE ÉCUMOIRE', 'UNE RÂPE', 'UN ÉPLUCHEUR', 'UNE SPATULE', 'Qu''utilise-t-on pour éplucher des carottes ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES USTENSILES DE CUISINE' AND `question` = 'Qu''utilise-t-on pour éplucher des carottes ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ON LES ÉPLUCHE', 'On épluche les pommes de terre : on enlève leur peau.', 'LES GESTES DE CUISINE', 'ON LES ÉPLUCHE', 'ON LES GRILLE', 'ON LES GOÛTE', 'ON LES PÈSE', 'Que fait-on aux pommes de terre avant de les cuire ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES GESTES DE CUISINE' AND `question` = 'Que fait-on aux pommes de terre avant de les cuire ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ON LA GOÛTE', 'Goûter, c''est prendre un peu de nourriture pour sentir le goût.', 'LES GESTES DE CUISINE', 'ON LA REMUE', 'ON LA GOÛTE', 'ON L''ÉGOUTTE', 'ON LA RÂPE', 'Que fait-on pour savoir si la soupe est assez salée ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES GESTES DE CUISINE' AND `question` = 'Que fait-on pour savoir si la soupe est assez salée ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ON LA FAIT BOUILLIR', 'On fait bouillir l''eau avant d''y mettre les pâtes.', 'LES GESTES DE CUISINE', 'ON LA RÂPE', 'ON LA PÈSE', 'ON LA FAIT BOUILLIR', 'ON LA GRILLE', 'Que fait-on avec de l''eau pour cuire des pâtes ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES GESTES DE CUISINE' AND `question` = 'Que fait-on avec de l''eau pour cuire des pâtes ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ON LE RÂPE', 'Râper, c''est couper en petits filaments avec une râpe.', 'LES GESTES DE CUISINE', 'ON LE FRIT', 'ON LE DRESSE', 'ON LE REMUE', 'ON LE RÂPE', 'Que fait-on au fromage avec une râpe ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES GESTES DE CUISINE' AND `question` = 'Que fait-on au fromage avec une râpe ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'FAIRE FRIRE', 'Les frites sont cuites dans l''huile chaude : on les fait frire.', 'LES GESTES DE CUISINE', 'FAIRE FRIRE', 'FAIRE MIJOTER', 'ÉMINCER', 'GOÛTER', 'Quel verbe veut dire « cuire dans beaucoup d''huile chaude » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES GESTES DE CUISINE' AND `question` = 'Quel verbe veut dire « cuire dans beaucoup d''huile chaude » ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'FAIRE MIJOTER', 'Une sauce mijote longtemps à feu doux.', 'LES GESTES DE CUISINE', 'FAIRE FRIRE', 'FAIRE MIJOTER', 'GRILLER', 'ÉPLUCHER', 'Quel verbe veut dire « cuire lentement, à feu doux » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES GESTES DE CUISINE' AND `question` = 'Quel verbe veut dire « cuire lentement, à feu doux » ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'RÔTIR', 'On rôtit un poulet au four.', 'LES GESTES DE CUISINE', 'ÉGOUTTER', 'PESER', 'RÔTIR', 'LAVER', 'Quel verbe veut dire « cuire de la viande au four » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES GESTES DE CUISINE' AND `question` = 'Quel verbe veut dire « cuire de la viande au four » ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ON LES ÉGOUTTE', 'On égoutte les pâtes pour enlever l''eau de cuisson.', 'LES GESTES DE CUISINE', 'ON LES ÉPLUCHE', 'ON LES HACHE', 'ON LES PÈSE', 'ON LES ÉGOUTTE', 'Que fait-on aux pâtes après la cuisson ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES GESTES DE CUISINE' AND `question` = 'Que fait-on aux pâtes après la cuisson ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'HACHER', 'On hache le persil ou l''oignon en tout petits morceaux.', 'LES GESTES DE CUISINE', 'HACHER', 'ASSAISONNER', 'DRESSER', 'REMUER', 'Quel verbe veut dire « couper en très petits morceaux » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES GESTES DE CUISINE' AND `question` = 'Quel verbe veut dire « couper en très petits morceaux » ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DRESSER', 'Dresser une assiette, c''est présenter le plat avec soin.', 'LES GESTES DE CUISINE', 'LAVER', 'DRESSER', 'GRILLER', 'PESER', 'Quel verbe veut dire « arranger joliment le plat dans l''assiette » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES GESTES DE CUISINE' AND `question` = 'Quel verbe veut dire « arranger joliment le plat dans l''assiette » ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ASSAISONNER', 'Assaisonner, c''est donner du goût à un plat.', 'LES GESTES DE CUISINE', 'ÉMINCER', 'MÉLANGER', 'ASSAISONNER', 'FAIRE REVENIR', 'Quel verbe veut dire « ajouter du sel, du poivre ou des épices » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES GESTES DE CUISINE' AND `question` = 'Quel verbe veut dire « ajouter du sel, du poivre ou des épices » ?');
