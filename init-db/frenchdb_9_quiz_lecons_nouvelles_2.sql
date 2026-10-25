-- Quiz des 3 leçons : négation approfondie, adjectifs interrogatifs et exclamatifs, orthographe grammaticale (30 quiz glisser-déposer).
-- Peut être exécuté plusieurs fois sans créer de doublons.
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_quiz_lecons_nouvelles_2.sql
SET NAMES utf8mb4;

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'personne', '', 'Il n''y avait pas un seul homme dans la rue : je n''ai vu ____.', 'La négation approfondie - Grammaire', 'personne,rien,jamais,plus', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'La négation approfondie - Grammaire' AND `sentence` = 'Il n''y avait pas un seul homme dans la rue : je n''ai vu ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'rien', '', 'Le frigo est vide : il n''y a ____ à manger.', 'La négation approfondie - Grammaire', 'rien,personne,jamais,aucun', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'La négation approfondie - Grammaire' AND `sentence` = 'Le frigo est vide : il n''y a ____ à manger.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'plus', '', 'Il habitait ici avant, mais maintenant il n''habite ____ ici.', 'La négation approfondie - Grammaire', 'plus,jamais,rien,personne', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'La négation approfondie - Grammaire' AND `sentence` = 'Il habitait ici avant, mais maintenant il n''habite ____ ici.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'jamais', '', 'Il ne fait ____ de sport : même pas une fois par an.', 'La négation approfondie - Grammaire', 'jamais,plus,rien,personne', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'La négation approfondie - Grammaire' AND `sentence` = 'Il ne fait ____ de sport : même pas une fois par an.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'aucun', '', 'Il n''y a ____ problème.', 'La négation approfondie - Grammaire', 'aucun,personne,rien,plus', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'La négation approfondie - Grammaire' AND `sentence` = 'Il n''y a ____ problème.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'ne,personne', '', 'Je suis nouveau en ville : je ____ connais ____ ici.', 'La négation approfondie - Grammaire', 'ne,personne,rien,jamais', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'La négation approfondie - Grammaire' AND `sentence` = 'Je suis nouveau en ville : je ____ connais ____ ici.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'rien', '', 'Elle n''a ____ mangé ce matin : elle a faim.', 'La négation approfondie - Grammaire', 'rien,personne,jamais,plus', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'La négation approfondie - Grammaire' AND `sentence` = 'Elle n''a ____ mangé ce matin : elle a faim.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Personne', '', '____ ne répond au téléphone : la ligne est vide.', 'La négation approfondie - Grammaire', 'Personne,Rien,Jamais,Aucun', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'La négation approfondie - Grammaire' AND `sentence` = '____ ne répond au téléphone : la ligne est vide.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'ne,jamais', '', 'Je ____ suis ____ allé au Japon : j''aimerais y aller.', 'La négation approfondie - Grammaire', 'ne,jamais,plus,personne', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'La négation approfondie - Grammaire' AND `sentence` = 'Je ____ suis ____ allé au Japon : j''aimerais y aller.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'aucune', '', 'Elle n''a ____ idée.', 'La négation approfondie - Grammaire', 'aucune,personne,rien,plus', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'La négation approfondie - Grammaire' AND `sentence` = 'Elle n''a ____ idée.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Quelle', '', '____ heure est-il ?', 'Les adjectifs interrogatifs et exclamatifs - Grammaire', 'Quel,Quelle,Quels,Quelles', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les adjectifs interrogatifs et exclamatifs - Grammaire' AND `sentence` = '____ heure est-il ?');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Quel', '', '____ âge as-tu ?', 'Les adjectifs interrogatifs et exclamatifs - Grammaire', 'Quel,Quelle,Quels,Quelles', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les adjectifs interrogatifs et exclamatifs - Grammaire' AND `sentence` = '____ âge as-tu ?');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Quelles', '', '____ langues parlez-vous ?', 'Les adjectifs interrogatifs et exclamatifs - Grammaire', 'Quel,Quelle,Quels,Quelles', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les adjectifs interrogatifs et exclamatifs - Grammaire' AND `sentence` = '____ langues parlez-vous ?');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Quels', '', '____ livres préférez-vous ?', 'Les adjectifs interrogatifs et exclamatifs - Grammaire', 'Quel,Quelle,Quels,Quelles', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les adjectifs interrogatifs et exclamatifs - Grammaire' AND `sentence` = '____ livres préférez-vous ?');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'quelle', '', 'À ____ heure commence le cours ?', 'Les adjectifs interrogatifs et exclamatifs - Grammaire', 'quel,quelle,quels,quelles', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les adjectifs interrogatifs et exclamatifs - Grammaire' AND `sentence` = 'À ____ heure commence le cours ?');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Quel', '', '____ est ton numéro de téléphone ?', 'Les adjectifs interrogatifs et exclamatifs - Grammaire', 'Quel,Quelle,Quels,Quelles', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les adjectifs interrogatifs et exclamatifs - Grammaire' AND `sentence` = '____ est ton numéro de téléphone ?');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Quelle', '', '____ belle journée !', 'Les adjectifs interrogatifs et exclamatifs - Grammaire', 'Quel,Quelle,Quels,Quelles', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les adjectifs interrogatifs et exclamatifs - Grammaire' AND `sentence` = '____ belle journée !');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Quels', '', '____ beaux enfants !', 'Les adjectifs interrogatifs et exclamatifs - Grammaire', 'Quel,Quelle,Quels,Quelles', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les adjectifs interrogatifs et exclamatifs - Grammaire' AND `sentence` = '____ beaux enfants !');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'quel', '', 'De ____ pays venez-vous ?', 'Les adjectifs interrogatifs et exclamatifs - Grammaire', 'quel,quelle,quels,quelles', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les adjectifs interrogatifs et exclamatifs - Grammaire' AND `sentence` = 'De ____ pays venez-vous ?');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Quelle', '', '____ est votre adresse ?', 'Les adjectifs interrogatifs et exclamatifs - Grammaire', 'Quel,Quelle,Quels,Quelles', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les adjectifs interrogatifs et exclamatifs - Grammaire' AND `sentence` = '____ est votre adresse ?');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'a,à', '', 'Il ____ faim. Je vais ____ la boulangerie.', 'L''orthographe grammaticale - Grammaire', 'a,à,et,est', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'L''orthographe grammaticale - Grammaire' AND `sentence` = 'Il ____ faim. Je vais ____ la boulangerie.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'et,est', '', 'Paul ____ Marie sont amis. Il ____ content.', 'L''orthographe grammaticale - Grammaire', 'et,est,a,à', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'L''orthographe grammaticale - Grammaire' AND `sentence` = 'Paul ____ Marie sont amis. Il ____ content.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'sont,son', '', 'Mes parents ____ gentils et ____ voisin est sympa.', 'L''orthographe grammaticale - Grammaire', 'sont,son,ses,ces', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'L''orthographe grammaticale - Grammaire' AND `sentence` = 'Mes parents ____ gentils et ____ voisin est sympa.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'se', '', 'Il ____ lave les mains.', 'L''orthographe grammaticale - Grammaire', 'se,ce,ces,ses', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'L''orthographe grammaticale - Grammaire' AND `sentence` = 'Il ____ lave les mains.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Ce', '', '____ livre est à moi.', 'L''orthographe grammaticale - Grammaire', 'Ce,Se,Ces,Ses', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'L''orthographe grammaticale - Grammaire' AND `sentence` = '____ livre est à moi.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'ces', '', 'Regarde ____ oiseaux, là-bas !', 'L''orthographe grammaticale - Grammaire', 'ces,ses,se,ce', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'L''orthographe grammaticale - Grammaire' AND `sentence` = 'Regarde ____ oiseaux, là-bas !');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'ses', '', 'Elle cherche ____ clés (les clés à elle).', 'L''orthographe grammaticale - Grammaire', 'ses,ces,se,ce', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'L''orthographe grammaticale - Grammaire' AND `sentence` = 'Elle cherche ____ clés (les clés à elle).');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'ou,Où', '', 'Tu veux du thé ____ du café ? ____ est la gare ?', 'L''orthographe grammaticale - Grammaire', 'ou,où,Ou,Où', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'L''orthographe grammaticale - Grammaire' AND `sentence` = 'Tu veux du thé ____ du café ? ____ est la gare ?');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'On,ont', '', '____ mange ici et ils ____ faim.', 'L''orthographe grammaticale - Grammaire', 'On,ont,sont,son', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'L''orthographe grammaticale - Grammaire' AND `sentence` = '____ mange ici et ils ____ faim.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'français,France', '', 'Nous parlons ____ en ____.', 'L''orthographe grammaticale - Grammaire', 'français,Français,France,france', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'L''orthographe grammaticale - Grammaire' AND `sentence` = 'Nous parlons ____ en ____.');
