-- QCM supplémentaires pour les leçons de vocabulaire (réponses en majuscules, comme les QCM existants).
-- 66 questions. Peut être exécuté plusieurs fois sans créer de doublons.
-- Sur le serveur (aucune nouvelle image nécessaire) :
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_qcm_vocabulaire.sql
SET NAMES utf8mb4;

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA PASTÈQUE', 'La pastèque est un très gros fruit d''été, rouge à l''intérieur.', 'LES FRUITS', 'LA POIRE', 'LA CERISE', 'LA PASTÈQUE', 'LE RAISIN', 'Quel fruit est très gros, vert à l''extérieur et rouge à l''intérieur ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES FRUITS' AND `question` = 'Quel fruit est très gros, vert à l''extérieur et rouge à l''intérieur ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE RAISIN', 'Le raisin pousse en grappes, sur la vigne.', 'LES FRUITS', 'LA PÊCHE', 'LE RAISIN', 'LA POMME', 'L''ANANAS', 'Quel fruit pousse en grappes ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES FRUITS' AND `question` = 'Quel fruit pousse en grappes ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'L''ORANGE', 'L''orange est un fruit, et « orange » est aussi une couleur.', 'LES FRUITS', 'L''ORANGE', 'LA FRAISE', 'LE RAISIN', 'LA POIRE', 'Quel fruit a le même nom qu''une couleur ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES FRUITS' AND `question` = 'Quel fruit a le même nom qu''une couleur ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'L''ANANAS', 'L''ananas pousse dans les pays chauds.', 'LES FRUITS', 'LA CERISE', 'L''ANANAS', 'LA POIRE', 'LA POMME', 'Quel fruit tropical a des feuilles pointues sur le dessus ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES FRUITS' AND `question` = 'Quel fruit tropical a des feuilles pointues sur le dessus ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE PÊCHE', '« Une pêche » : attention à l''accent circonflexe sur le ê.', 'LES FRUITS', 'UNE POIRE', 'UNE PÊCHE', 'UNE FRAISE', 'UNE POMME', 'Comment dit-on « a peach » en français ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES FRUITS' AND `question` = 'Comment dit-on « a peach » en français ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA CERISE', 'La cerise a un noyau ; la fraise a de petites graines à l''extérieur.', 'LES FRUITS', 'LA POIRE', 'L''ANANAS', 'LA FRAISE', 'LA CERISE', 'Quel fruit est petit, rouge, et a un noyau au milieu ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES FRUITS' AND `question` = 'Quel fruit est petit, rouge, et a un noyau au milieu ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA CAROTTE', 'La carotte est orange ; on la mange crue ou cuite.', 'LES LÉGUMES', 'L''OIGNON', 'LA CAROTTE', 'L''AIL', 'LA SALADE', 'Quel légume est orange et long ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES LÉGUMES' AND `question` = 'Quel légume est orange et long ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA POMME DE TERRE', 'Les frites sont faites avec des pommes de terre.', 'LES LÉGUMES', 'LA CAROTTE', 'LA SALADE', 'L''AIL', 'LA POMME DE TERRE', 'Avec quel légume fait-on les frites ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES LÉGUMES' AND `question` = 'Avec quel légume fait-on les frites ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'L''OIGNON', 'L''oignon pique les yeux quand on le coupe.', 'LES LÉGUMES', 'LA TOMATE', 'LA SALADE', 'L''OIGNON', 'LA COURGETTE', 'Quel légume fait pleurer quand on le coupe ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES LÉGUMES' AND `question` = 'Quel légume fait pleurer quand on le coupe ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA TOMATE', 'La tomate est rouge quand elle est mûre.', 'LES LÉGUMES', 'LA CAROTTE', 'LA COURGETTE', 'LA TOMATE', 'L''AIL', 'Quel légume est rond, rouge, et on le met souvent dans une salade ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES LÉGUMES' AND `question` = 'Quel légume est rond, rouge, et on le met souvent dans une salade ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'L''AIL', 'On utilise une gousse d''ail pour parfumer un plat.', 'LES LÉGUMES', 'LA SALADE', 'L''AIL', 'LE POIVRON', 'LA TOMATE', 'Quel légume a une odeur forte et se vend en « gousses » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES LÉGUMES' AND `question` = 'Quel légume a une odeur forte et se vend en « gousses » ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA COURGETTE', '« Courgette » est un mot féminin : une courgette.', 'LES LÉGUMES', 'LA CAROTTE', 'LA COURGETTE', 'LE POIVRON', 'LA TOMATE', 'Comment dit-on « zucchini » en français ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES LÉGUMES' AND `question` = 'Comment dit-on « zucchini » en français ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN MANTEAU', 'Un manteau protège du froid.', 'LES VÊTEMENTS', 'UNE CHEMISE', 'UN MANTEAU', 'UNE ROBE', 'UNE JUPE', 'Que porte-t-on en hiver pour avoir chaud dehors ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VÊTEMENTS' AND `question` = 'Que porte-t-on en hiver pour avoir chaud dehors ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN PANTALON', 'Un pantalon couvre chaque jambe séparément.', 'LES VÊTEMENTS', 'UNE ROBE', 'UN PANTALON', 'UNE JUPE', 'UNE CHEMISE', 'Quel vêtement a deux jambes ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VÊTEMENTS' AND `question` = 'Quel vêtement a deux jambes ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE CHEMISE', 'Une chemise se ferme avec des boutons.', 'LES VÊTEMENTS', 'UN PANTALON', 'UNE ROBE', 'UNE JUPE', 'UNE CHEMISE', 'Quel vêtement porte-t-on sur le haut du corps, avec des boutons ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VÊTEMENTS' AND `question` = 'Quel vêtement porte-t-on sur le haut du corps, avec des boutons ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE JUPE', 'Une jupe commence à la taille ; une robe couvre aussi le haut du corps.', 'LES VÊTEMENTS', 'UNE JUPE', 'UN MANTEAU', 'UNE ROBE', 'UN PULL', 'Quel vêtement commence à la taille et descend vers les genoux ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VÊTEMENTS' AND `question` = 'Quel vêtement commence à la taille et descend vers les genoux ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN PULL', 'Un pull est souvent en laine.', 'LES VÊTEMENTS', 'UN SHORT', 'UN MAILLOT DE BAIN', 'UN PULL', 'UNE ROBE D''ÉTÉ', 'Quel vêtement en laine est chaud et se porte sur le haut du corps ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VÊTEMENTS' AND `question` = 'Quel vêtement en laine est chaud et se porte sur le haut du corps ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'MANTEAU', 'On met un manteau quand il fait froid.', 'LES VÊTEMENTS', 'MAILLOT DE BAIN', 'MANTEAU', 'ROBE D''ÉTÉ', 'SHORT', 'Complétez : « Il fait froid, je mets mon ____. »' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES VÊTEMENTS' AND `question` = 'Complétez : « Il fait froid, je mets mon ____. »');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'BLANCHE', 'La neige est blanche. Avec « neige » (féminin), on dit « blanche ».', 'LES COULEURS', 'VERTE', 'BLANCHE', 'ROUGE', 'NOIRE', 'De quelle couleur est la neige ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES COULEURS' AND `question` = 'De quelle couleur est la neige ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'VERT', 'Le bleu et le jaune donnent le vert.', 'LES COULEURS', 'ORANGE', 'VIOLET', 'VERT', 'ROUGE', 'Bleu + jaune = ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES COULEURS' AND `question` = 'Bleu + jaune = ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ROSE', 'Le rouge et le blanc donnent le rose.', 'LES COULEURS', 'VERT', 'NOIR', 'MARRON', 'ROSE', 'Rouge + blanc = ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES COULEURS' AND `question` = 'Rouge + blanc = ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'BLEU', 'Par beau temps, le ciel est bleu.', 'LES COULEURS', 'BLEU', 'VERT', 'GRIS', 'ROUGE', 'De quelle couleur est le ciel par beau temps ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES COULEURS' AND `question` = 'De quelle couleur est le ciel par beau temps ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'GRIS', '« Gris » est la couleur des nuages les jours de pluie.', 'LES COULEURS', 'ROSE', 'MARRON', 'BEIGE', 'GRIS', 'Comment dit-on « grey » en français ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES COULEURS' AND `question` = 'Comment dit-on « grey » en français ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'VIOLET', 'Une aubergine est violette (violet, violette).', 'LES COULEURS', 'ORANGE', 'JAUNE', 'VIOLET', 'BLANC', 'De quelle couleur est une aubergine ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES COULEURS' AND `question` = 'De quelle couleur est une aubergine ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'BONSOIR', '« Bonsoir » se dit le soir, pour saluer.', 'FORMULES DE POLITESSE', 'BONSOIR', 'DE RIEN', 'MERCI', 'AU REVOIR', 'Que dit-on le soir quand on arrive chez quelqu''un ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'FORMULES DE POLITESSE' AND `question` = 'Que dit-on le soir quand on arrive chez quelqu''un ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DE RIEN', '« De rien » répond à « Merci ».', 'FORMULES DE POLITESSE', 'DE RIEN', 'AU REVOIR', 'BONSOIR', 'PARDON', 'On vous dit « Merci ». Que répondez-vous ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'FORMULES DE POLITESSE' AND `question` = 'On vous dit « Merci ». Que répondez-vous ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'PARDON', '« Pardon » sert à s''excuser.', 'FORMULES DE POLITESSE', 'BONJOUR', 'BONSOIR', 'PARDON', 'DE RIEN', 'Vous marchez sur le pied de quelqu''un. Que dites-vous ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'FORMULES DE POLITESSE' AND `question` = 'Vous marchez sur le pied de quelqu''un. Que dites-vous ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'S''IL VOUS PLAÎT', '« S''il vous plaît » rend la demande polie.', 'FORMULES DE POLITESSE', 'DE RIEN', 'S''IL VOUS PLAÎT', 'AU REVOIR', 'BONSOIR', 'Vous demandez un café. Que dites-vous à la fin de votre phrase ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'FORMULES DE POLITESSE' AND `question` = 'Vous demandez un café. Que dites-vous à la fin de votre phrase ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'AU REVOIR', '« Au revoir » se dit en partant.', 'FORMULES DE POLITESSE', 'AU REVOIR', 'BONJOUR', 'PARDON', 'MERCI', 'Que dit-on quand on part ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'FORMULES DE POLITESSE' AND `question` = 'Que dit-on quand on part ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'COMMENT ALLEZ-VOUS ?', '« Comment allez-vous ? » demande des nouvelles, avec « vous ».', 'FORMULES DE POLITESSE', 'DE RIEN', 'MERCI BEAUCOUP', 'AU REVOIR', 'COMMENT ALLEZ-VOUS ?', 'Quelle phrase est une question polie ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'FORMULES DE POLITESSE' AND `question` = 'Quelle phrase est une question polie ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE MÉDECIN', 'Le médecin soigne les malades.', 'LES PROFESSIONS', 'LE VENDEUR', 'LE MÉDECIN', 'L''AVOCAT', 'LE POLICIER', 'Qui soigne les malades et prescrit des médicaments ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES PROFESSIONS' AND `question` = 'Qui soigne les malades et prescrit des médicaments ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'L''AVOCAT', 'L''avocat défend ses clients au tribunal.', 'LES PROFESSIONS', 'LE VENDEUR', 'L''ARCHITECTE', 'L''AVOCAT', 'LE CUISINIER', 'Qui défend une personne devant un juge ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES PROFESSIONS' AND `question` = 'Qui défend une personne devant un juge ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE CUISINIER', 'Le cuisinier travaille dans la cuisine.', 'LES PROFESSIONS', 'LE POLICIER', 'LE PROFESSEUR', 'LE CUISINIER', 'L''AVOCAT', 'Qui prépare les repas dans un restaurant ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES PROFESSIONS' AND `question` = 'Qui prépare les repas dans un restaurant ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'L''ARCHITECTE', 'L''architecte dessine les plans des maisons et des immeubles.', 'LES PROFESSIONS', 'LE VENDEUR', 'LE MÉDECIN', 'LE POLICIER', 'L''ARCHITECTE', 'Qui dessine les plans d''un bâtiment ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES PROFESSIONS' AND `question` = 'Qui dessine les plans d''un bâtiment ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE VENDEUR', 'Le vendeur (la vendeuse) travaille dans un magasin.', 'LES PROFESSIONS', 'LE MÉDECIN', 'L''AVOCAT', 'LE CUISINIER', 'LE VENDEUR', 'Qui travaille dans un magasin et vend des produits ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES PROFESSIONS' AND `question` = 'Qui travaille dans un magasin et vend des produits ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE PROFESSEUR', 'Le professeur enseigne ; on dit aussi « l''enseignant ».', 'LES PROFESSIONS', 'LE PROFESSEUR', 'LE POLICIER', 'L''ARCHITECTE', 'LE VENDEUR', 'Qui enseigne à l''école ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES PROFESSIONS' AND `question` = 'Qui enseigne à l''école ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ONCLE', 'Le frère de la mère (ou du père) est l''oncle.', 'LA FAMILLE', 'PÈRE', 'FRÈRE', 'FILS', 'ONCLE', 'Le frère de ma mère est mon…' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA FAMILLE' AND `question` = 'Le frère de ma mère est mon…');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'TANTE', 'La sœur du père (ou de la mère) est la tante.', 'LA FAMILLE', 'SŒUR', 'MÈRE', 'TANTE', 'FILLE', 'La sœur de mon père est ma…' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA FAMILLE' AND `question` = 'La sœur de mon père est ma…');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'SŒUR', 'Les enfants de mes parents sont mes frères et sœurs.', 'LA FAMILLE', 'SŒUR', 'TANTE', 'MÈRE', 'FILLE', 'Si je suis un garçon, la fille de mes parents est ma…' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA FAMILLE' AND `question` = 'Si je suis un garçon, la fille de mes parents est ma…');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'COUSIN', 'Les enfants de l''oncle et de la tante sont les cousins et cousines.', 'LA FAMILLE', 'FRÈRE', 'PÈRE', 'FILS', 'COUSIN', 'Le fils de mon oncle est mon…' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA FAMILLE' AND `question` = 'Le fils de mon oncle est mon…');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE PÈRE', '« Père » (le papa) ne se confond pas avec « frère ».', 'LA FAMILLE', 'LE FRÈRE', 'LE PÈRE', 'LE FILS', 'L''ONCLE', 'Comment dit-on « father » en français ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA FAMILLE' AND `question` = 'Comment dit-on « father » en français ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA FILLE', '« Fille » : l''enfant féminin de ses parents (et aussi « girl »).', 'LA FAMILLE', 'LA FILLE', 'LA SŒUR', 'LA TANTE', 'LA MÈRE', 'Comment dit-on « daughter » en français ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA FAMILLE' AND `question` = 'Comment dit-on « daughter » en français ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'MARDI', 'Lundi, mardi, mercredi, jeudi, vendredi, samedi, dimanche.', 'LES JOURS,MOIS ET DATES', 'DIMANCHE', 'MERCREDI', 'JEUDI', 'MARDI', 'Quel jour vient après lundi ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES JOURS,MOIS ET DATES' AND `question` = 'Quel jour vient après lundi ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'SEPT', 'Une semaine a sept jours.', 'LES JOURS,MOIS ET DATES', 'CINQ', 'SEPT', 'SIX', 'HUIT', 'Combien de jours y a-t-il dans une semaine ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES JOURS,MOIS ET DATES' AND `question` = 'Combien de jours y a-t-il dans une semaine ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DOUZE', 'Une année a douze mois.', 'LES JOURS,MOIS ET DATES', 'ONZE', 'DOUZE', 'TREIZE', 'DIX', 'Combien de mois y a-t-il dans une année ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES JOURS,MOIS ET DATES' AND `question` = 'Combien de mois y a-t-il dans une année ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'JANVIER', 'L''année commence en janvier.', 'LES JOURS,MOIS ET DATES', 'DÉCEMBRE', 'FÉVRIER', 'MARS', 'JANVIER', 'Quel est le premier mois de l''année ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES JOURS,MOIS ET DATES' AND `question` = 'Quel est le premier mois de l''année ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'SAMEDI ET DIMANCHE', 'Le week-end, c''est le samedi et le dimanche.', 'LES JOURS,MOIS ET DATES', 'VENDREDI ET SAMEDI', 'LUNDI ET MARDI', 'DIMANCHE ET LUNDI', 'SAMEDI ET DIMANCHE', 'Quels jours forment le week-end ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES JOURS,MOIS ET DATES' AND `question` = 'Quels jours forment le week-end ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE CALENDRIER', 'Le calendrier montre les jours, les semaines et les mois.', 'LES JOURS,MOIS ET DATES', 'LA SEMAINE', 'LA DATE', 'LE CALENDRIER', 'LE MOIS', 'Comment dit-on « calendar » en français ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES JOURS,MOIS ET DATES' AND `question` = 'Comment dit-on « calendar » en français ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA TRISTESSE', 'Quand on est triste, on ressent de la tristesse.', 'LES ÉMOTIONS', 'LA TRISTESSE', 'LA JOIE', 'L''AMOUR', 'LA SURPRISE', 'Je pleure parce que je suis très triste. Quelle émotion est-ce ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ÉMOTIONS' AND `question` = 'Je pleure parce que je suis très triste. Quelle émotion est-ce ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA COLÈRE', 'On crie souvent quand on ressent de la colère.', 'LES ÉMOTIONS', 'LA COLÈRE', 'LA SURPRISE', 'L''AMOUR', 'LA JOIE', 'Je crie parce que quelqu''un m''a menti. Quelle émotion est-ce ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ÉMOTIONS' AND `question` = 'Je crie parce que quelqu''un m''a menti. Quelle émotion est-ce ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA PEUR', 'Un film d''horreur fait peur.', 'LES ÉMOTIONS', 'L''AMOUR', 'LA PEUR', 'LA JOIE', 'LA TRISTESSE', 'Quelle émotion ressent-on devant un film d''horreur ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ÉMOTIONS' AND `question` = 'Quelle émotion ressent-on devant un film d''horreur ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA JOIE', 'Quand on est joyeux, on ressent de la joie.', 'LES ÉMOTIONS', 'LA COLÈRE', 'LA PEUR', 'LA JOIE', 'LE DÉGOÛT', 'Je souris et je danse. Quelle émotion est-ce ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ÉMOTIONS' AND `question` = 'Je souris et je danse. Quelle émotion est-ce ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA SURPRISE', 'Un événement inattendu provoque de la surprise.', 'LES ÉMOTIONS', 'LA TRISTESSE', 'LE DÉGOÛT', 'LA COLÈRE', 'LA SURPRISE', 'Vous ouvrez la porte : tout le monde crie « Joyeux anniversaire ! ». Quelle émotion ressentez-vous ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ÉMOTIONS' AND `question` = 'Vous ouvrez la porte : tout le monde crie « Joyeux anniversaire ! ». Quelle émotion ressentez-vous ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA TRISTESSE', 'La joie et la tristesse sont deux émotions opposées.', 'LES ÉMOTIONS', 'LA SURPRISE', 'L''AMOUR', 'LA TRISTESSE', 'LA PEUR', 'Quel est le contraire de « la joie » ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LES ÉMOTIONS' AND `question` = 'Quel est le contraire de « la joie » ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT '60', 'Une minute a soixante secondes.', 'LE TEMPS ET L''HEURE', '60', '30', '100', '12', 'Combien de secondes y a-t-il dans une minute ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE TEMPS ET L''HEURE' AND `question` = 'Combien de secondes y a-t-il dans une minute ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE MONTRE', 'Une montre se porte au poignet ; une horloge est posée ou accrochée.', 'LE TEMPS ET L''HEURE', 'UNE LAMPE', 'UNE HORLOGE', 'UN CALENDRIER', 'UNE MONTRE', 'Quel objet se porte au poignet pour voir l''heure ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE TEMPS ET L''HEURE' AND `question` = 'Quel objet se porte au poignet pour voir l''heure ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA SECONDE', 'La seconde est la plus courte des trois.', 'LE TEMPS ET L''HEURE', 'LA SEMAINE', 'L''HEURE', 'LA SECONDE', 'LA MINUTE', 'Quel est le plus petit : l''heure, la minute ou la seconde ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE TEMPS ET L''HEURE' AND `question` = 'Quel est le plus petit : l''heure, la minute ou la seconde ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA NUIT', 'On dort la nuit.', 'LE TEMPS ET L''HEURE', 'LE MATIN', 'LE SOIR', 'LA NUIT', 'L''APRÈS-MIDI', 'On dort surtout pendant…' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE TEMPS ET L''HEURE' AND `question` = 'On dort surtout pendant…');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE HORLOGE', 'Une horloge murale donne l''heure.', 'LE TEMPS ET L''HEURE', 'UNE HORLOGE', 'UNE CHAISE', 'UNE LAMPE', 'UN CALENDRIER', 'Quel objet accroché au mur indique l''heure ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE TEMPS ET L''HEURE' AND `question` = 'Quel objet accroché au mur indique l''heure ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE MATIN', 'Le matin est le début de la journée.', 'LE TEMPS ET L''HEURE', 'LE MATIN', 'LE SOIR', 'LA NUIT', 'L''APRÈS-MIDI', 'Quand on se réveille et qu''on prend le petit-déjeuner, c''est…' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LE TEMPS ET L''HEURE' AND `question` = 'Quand on se réveille et qu''on prend le petit-déjeuner, c''est…');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA CUISINE', 'On prépare les repas dans la cuisine.', 'LA MAISON', 'LA CUISINE', 'LE SALON', 'LA SALLE DE BAIN', 'LA CHAMBRE', 'Dans quelle pièce prépare-t-on le repas ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA MAISON' AND `question` = 'Dans quelle pièce prépare-t-on le repas ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA CHAMBRE', 'On dort dans la chambre, dans un lit.', 'LA MAISON', 'LA CHAMBRE', 'LA CUISINE', 'LE SALON', 'LA SALLE DE BAIN', 'Dans quelle pièce dort-on ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA MAISON' AND `question` = 'Dans quelle pièce dort-on ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DANS LA SALLE DE BAIN', 'La douche est dans la salle de bain.', 'LA MAISON', 'DANS LA SALLE DE BAIN', 'DANS LA CHAMBRE', 'DANS LE SALON', 'DANS LA CUISINE', 'Où prend-on une douche ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA MAISON' AND `question` = 'Où prend-on une douche ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE CANAPÉ', 'Le canapé est dans le salon.', 'LA MAISON', 'LA FENÊTRE', 'LA TABLE', 'LE LIT', 'LE CANAPÉ', 'Sur quel meuble s''assoit-on pour regarder la télévision, dans le salon ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA MAISON' AND `question` = 'Sur quel meuble s''assoit-on pour regarder la télévision, dans le salon ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'PAR LA FENÊTRE', 'La fenêtre laisse entrer la lumière.', 'LA MAISON', 'PAR LA FENÊTRE', 'PAR LA TABLE', 'PAR LE LIT', 'PAR LA CHAISE', 'Par quoi la lumière du jour entre-t-elle dans une pièce ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA MAISON' AND `question` = 'Par quoi la lumière du jour entre-t-elle dans une pièce ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'TABLE', 'On mange à table (et on s''assoit sur une chaise).', 'LA MAISON', 'DOUCHE', 'FENÊTRE', 'TABLE', 'CHAISE', 'Pour manger, on s''assoit à la ____.' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA MAISON' AND `question` = 'Pour manger, on s''assoit à la ____.');
