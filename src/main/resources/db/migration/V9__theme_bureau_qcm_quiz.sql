-- Thème « Au Bureau » (page /themes/Bureau) : QCM et quiz. Sur la page d'un thème, la bonne réponse d'un QCM est la LETTRE (A, B, C ou D).
-- Remet les QCM et les quiz d'origine s'ils ont disparu et ajoute des QCM sur le dialogue. Peut être exécuté plusieurs fois sans doublons.
SET NAMES utf8mb4;

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'B', 'Sophie doit répondre à plusieurs e-mails et préparer une réunion.', 'Au Bureau', 'Partir en vacances', 'Préparer une réunion', 'Rencontrer un client à la gare', 'Faire du rangement', 'Que doit faire Sophie cet après-midi ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Au Bureau' AND `question` = 'Que doit faire Sophie cet après-midi ?');
UPDATE `exercises` SET `correct_answer` = 'B' WHERE `lesson_title` = 'Au Bureau' AND `question` = 'Que doit faire Sophie cet après-midi ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'C', 'La réunion est à 14 heures.', 'Au Bureau', 'À 10 heures', 'À 12 heures', 'À 14 heures', 'À 16 heures', 'À quelle heure est la réunion ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Au Bureau' AND `question` = 'À quelle heure est la réunion ?');
UPDATE `exercises` SET `correct_answer` = 'C' WHERE `lesson_title` = 'Au Bureau' AND `question` = 'À quelle heure est la réunion ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'A', 'La réunion a lieu dans la salle de conférence.', 'Au Bureau', 'Dans la salle de conférence', 'Dans la cuisine', 'Dans le couloir', 'À la réception', 'Où a lieu la réunion ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Au Bureau' AND `question` = 'Où a lieu la réunion ?');
UPDATE `exercises` SET `correct_answer` = 'A' WHERE `lesson_title` = 'Au Bureau' AND `question` = 'Où a lieu la réunion ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'D', 'Sophie n''a pas encore imprimé les documents : elle va les imprimer maintenant.', 'Au Bureau', 'Oui, elle les a tous imprimés', 'Non, elle ne veut pas les imprimer', 'Oui, Paul les a imprimés', 'Non, pas encore : elle va le faire maintenant', 'Est-ce que Sophie a déjà imprimé les documents ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Au Bureau' AND `question` = 'Est-ce que Sophie a déjà imprimé les documents ?');
UPDATE `exercises` SET `correct_answer` = 'D' WHERE `lesson_title` = 'Au Bureau' AND `question` = 'Est-ce que Sophie a déjà imprimé les documents ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'B', 'Paul demande à Sophie d''apporter son ordinateur portable.', 'Au Bureau', 'Son téléphone', 'Son ordinateur portable', 'Son café', 'Son manteau', 'Que Paul demande-t-il à Sophie d''apporter ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Au Bureau' AND `question` = 'Que Paul demande-t-il à Sophie d''apporter ?');
UPDATE `exercises` SET `correct_answer` = 'B' WHERE `lesson_title` = 'Au Bureau' AND `question` = 'Que Paul demande-t-il à Sophie d''apporter ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'A', 'Sophie demande à Paul de préparer le vidéoprojecteur, et Paul répond : « Oui, aucun problème. »', 'Au Bureau', 'Paul', 'Sophie', 'Le chef', 'Personne', 'Qui prépare le vidéoprojecteur ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Au Bureau' AND `question` = 'Qui prépare le vidéoprojecteur ?');
UPDATE `exercises` SET `correct_answer` = 'A' WHERE `lesson_title` = 'Au Bureau' AND `question` = 'Qui prépare le vidéoprojecteur ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'C', 'Sophie répond à plusieurs e-mails.', 'Au Bureau', 'fenêtres', 'chaises', 'e-mails', 'voitures', 'Sophie répond à plusieurs ____ .' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Au Bureau' AND `question` = 'Sophie répond à plusieurs ____ .');
UPDATE `exercises` SET `correct_answer` = 'C' WHERE `lesson_title` = 'Au Bureau' AND `question` = 'Sophie répond à plusieurs ____ .';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'D', 'Paul dit : « Avec plaisir. » après le « Merci beaucoup ! » de Sophie.', 'Au Bureau', 'Au revoir.', 'Je ne sais pas.', 'Pas du tout.', 'Avec plaisir.', 'Sophie dit « Merci beaucoup ! ». Que répond Paul ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Au Bureau' AND `question` = 'Sophie dit « Merci beaucoup ! ». Que répond Paul ?');
UPDATE `exercises` SET `correct_answer` = 'D' WHERE `lesson_title` = 'Au Bureau' AND `question` = 'Sophie dit « Merci beaucoup ! ». Que répond Paul ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'A', 'Sophie et Paul travaillent dans un bureau.', 'Au Bureau', 'Dans un bureau', 'Dans un restaurant', 'Dans une gare', 'À l''école', 'Où travaillent Sophie et Paul ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Au Bureau' AND `question` = 'Où travaillent Sophie et Paul ?');
UPDATE `exercises` SET `correct_answer` = 'A' WHERE `lesson_title` = 'Au Bureau' AND `question` = 'Où travaillent Sophie et Paul ?';

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'B', 'Après « avoir », on utilise le participe passé : « je vous ai envoyé ».', 'Au Bureau', 'décider', 'envoyé', 'reporter', 'réservé', 'je vous ai ________ par mail la liste des participants hier.' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Au Bureau' AND `question` = 'je vous ai ________ par mail la liste des participants hier.');
UPDATE `exercises` SET `correct_answer` = 'B' WHERE `lesson_title` = 'Au Bureau' AND `question` = 'je vous ai ________ par mail la liste des participants hier.';

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'convocations,reportée,réserver', '', '1.Avant la réunion on envoie des____,2.La réunion à été____ à vendredi,3.On doit____ une salle de conférences.', 'Au Bureau', 'confirmer,réserver,décidée,reportée,participations,convocations', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Au Bureau' AND `correct_answers` = 'convocations,reportée,réserver');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'bien,remercie,reçu,appeler,présente', '', '1.Nous avons____  reçu votre courrier du 17 Juin dernier .2.Je vous en____ par avance .3.J''ai bien____ les documents que vous m''avez transmis. 4.N''hésitez pa à m''____ si vous avez des questions. 5.Je vous____ Michel Garnier. ', 'Au Bureau', 'mal,bien,contacte,remercie,envoyé,reçu,appeler,envoyer,présente,prépare', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Au Bureau' AND `correct_answers` = 'bien,remercie,reçu,appeler,présente');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'vrai,vrai,faux,faux,faux,vrai', '', '1-Pour demander le nom d''un collègue, vous dites :comment s''appelle t-il ?____.\r\n2-Si vous présentez quelqu''un ,vous dites : je vous présente monsieur Fabre____.\r\n3-Pour vérifier l''heure de la réunion , vous dites :Je confirme bien l''heure de la réunion____.\r\n4-On peut finir un courriel à un nouveau client en écrivant : salut , à bientôt____.\r\n5-Si vous confirmez votre participation , vous dites : il y a bien une réunion ?____.\r\n6-Vous pouvez finir un courrier électronique par : n''hésitez pas à me contacter____.\r\n', 'Au Bureau', 'vrai,faux,faux,faux,vrai,vrai', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Au Bureau' AND `correct_answers` = 'vrai,vrai,faux,faux,faux,vrai');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Je vous présente,comment vous appelez-vous,Tiens c''est bizarre,J''ai bien reçu le document', '', '1.Vous présentez un collègue____\r\n\r\n2.Vous demandez le nom de quelqu''un____\r\n\r\n3.Vous exprimez la surprise____\r\n\r\n4.Vous confirmez que vous avez reçu un document____', 'Au Bureau - Que dites vous dans chacune des situations suivantes ?', 'Tiens c''est bizarre,Je vous présente,comment vous appelez-vous,J''ai bien reçu le document', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Au Bureau - Que dites vous dans chacune des situations suivantes ?' AND `correct_answers` = 'Je vous présente,comment vous appelez-vous,Tiens c''est bizarre,J''ai bien reçu le document');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Vrai,Faux,Faux,Vrai,Vrai', '', '1.Sophie travaille dans un bureau____\r\n2.La réunion est le matin____\r\n3.Sophie a déjà imprimé les documents____\r\n4.Paul prépare le vidéoprojecteur____\r\n5.Sophie remercie Paul____.', 'Au Bureau - Vrai ou Faux', 'Vrai,Vrai,Vrai,Faux,Faux', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Au Bureau - Vrai ou Faux' AND `correct_answers` = 'Vrai,Faux,Faux,Vrai,Vrai');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'e-mails,réunion,ordinateur,documents,bureau', '', '1.Sophie répond à des ____\r\n2.La ____est à 14 heures\r\n3.Paul prépare l'' ____portable\r\n4.Sophie imprime les____\r\n5.Ils travaillent au____', 'Au Bureau - Complétez les phrases', 'bureau,réunion,documents,ordinateur,e-mails', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Au Bureau - Complétez les phrases' AND `correct_answers` = 'e-mails,réunion,ordinateur,documents,bureau');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Paul,Sophie,Paul,Sophie,Paul', '', '1.Tu as beaucoup de travail aujourd''hui ?____\r\n2.Je vais imprimer les documents____\r\n3.Je peux préparer le vidéoprojecteur____\r\n4.Merci beaucoup !____\r\n5.À tout à l''heure !____', 'Au Bureau - Qui parle ?', 'Sophie,Paul,Paul,Sophie,Paul', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Au Bureau - Qui parle ?' AND `correct_answers` = 'Paul,Sophie,Paul,Sophie,Paul');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Vidéoprojecteur,Réunion,E-mail,Ordinateur,Document', '', '1. Machine pour afficher une présentation____\r\n2. Rencontre de plusieurs personnes____\r\n3. Message électronique____\r\n4. Appareil informatique____\r\n5. Feuille ou fichier d''information____', 'Au Bureau - Associez les mots', 'Document,Vidéoprojecteur,Réunion,Ordinateur,E-mail', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Au Bureau - Associez les mots' AND `correct_answers` = 'Vidéoprojecteur,Réunion,E-mail,Ordinateur,Document');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Au Bureau,une réunion,son ordinateur portable,des documents,À tout à l''heure !', '', '1. Où travaillent Sophie et Paul ?____\r\n2. Sophie prépare...____\r\n3.Paul demande à Sophie d''apporter...____\r\n4.Sophie imprime...____\r\n5.Comment se termine la conversation ?____', 'Au Bureau - Choisissez la bonne réponse', 'À tout à l''heure !,des documents,une réunion,son ordinateur portable,Au Bureau', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Au Bureau - Choisissez la bonne réponse' AND `correct_answers` = 'Au Bureau,une réunion,son ordinateur portable,des documents,À tout à l''heure !');
