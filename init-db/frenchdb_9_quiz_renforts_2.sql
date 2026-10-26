-- Quiz de renfort (suite) : 8 étapes qui avaient 7 à 9 quiz. 40 quiz glisser-déposer.
-- Peut être exécuté plusieurs fois sans créer de doublons. Aucune nouvelle image nécessaire pour ce fichier.
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_quiz_renforts_2.sql
SET NAMES utf8mb4;

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'chevaux,journaux', '', 'Un cheval, des ____ . Un journal, des ____ .', 'Genre et nombre des noms - Grammaire', 'chevaux,journaux,chevals,journals', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Genre et nombre des noms - Grammaire' AND `sentence` = 'Un cheval, des ____ . Un journal, des ____ .');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'enfants,fleurs', '', 'Un enfant, des ____ . Une fleur, des ____ .', 'Genre et nombre des noms - Grammaire', 'enfants,fleurs,enfant,fleur', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Genre et nombre des noms - Grammaire' AND `sentence` = 'Un enfant, des ____ . Une fleur, des ____ .');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'nez,prix', '', 'Un nez, des ____ . Un prix, des ____ .', 'Genre et nombre des noms - Grammaire', 'nez,prix,nezs,prixs', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Genre et nombre des noms - Grammaire' AND `sentence` = 'Un nez, des ____ . Un prix, des ____ .');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'étudiante,chatte', '', 'Un étudiant, une ____ . Un chat, une ____ .', 'Genre et nombre des noms - Grammaire', 'étudiante,chatte,étudiant,chat', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Genre et nombre des noms - Grammaire' AND `sentence` = 'Un étudiant, une ____ . Un chat, une ____ .');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'grande,grands', '', 'Le garçon est grand. La fille est ____ . Les garçons sont ____ .', 'Genre et nombre des noms - Grammaire', 'grande,grands,grand,grandes', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Genre et nombre des noms - Grammaire' AND `sentence` = 'Le garçon est grand. La fille est ____ . Les garçons sont ____ .');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Où,Comment', '', '____ habitez-vous ? À Lyon. ____ vous appelez-vous ? Marie.', 'L''interrogation - Grammaire', 'Où,Comment,Quand,Pourquoi', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'L''interrogation - Grammaire' AND `sentence` = '____ habitez-vous ? À Lyon. ____ vous appelez-vous ? Marie.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Quand,Pourquoi', '', '____ arrivez-vous ? Demain matin. ____ partez-vous ? Parce que je suis fatigué.', 'L''interrogation - Grammaire', 'Quand,Pourquoi,Où,Combien', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'L''interrogation - Grammaire' AND `sentence` = '____ arrivez-vous ? Demain matin. ____ partez-vous ? Parce que je suis fatigué.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Combien,Qui', '', '____ coûte ce livre ? Dix euros. ____ est ton frère ? C''est le grand.', 'L''interrogation - Grammaire', 'Combien,Qui,Quand,Où', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'L''interrogation - Grammaire' AND `sentence` = '____ coûte ce livre ? Dix euros. ____ est ton frère ? C''est le grand.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Est-ce que,Que', '', '____ vous habitez ici ? Oui. ____ faites-vous dans la vie ? Je suis cuisinier.', 'L''interrogation - Grammaire', 'Est-ce que,Que,Où,Qui', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'L''interrogation - Grammaire' AND `sentence` = '____ vous habitez ici ? Oui. ____ faites-vous dans la vie ? Je suis cuisinier.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'quelle,Quel', '', 'À ____ heure commence le cours ? À huit heures. ____ jour est-on ? Lundi.', 'L''interrogation - Grammaire', 'quelle,Quel,quels,quelles', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'L''interrogation - Grammaire' AND `sentence` = 'À ____ heure commence le cours ? À huit heures. ____ jour est-on ? Lundi.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'ne,pas,n'',pas', '', 'Je ____ parle ____ chinois. Elle ____ aime ____ le poisson.', 'La négation simple - Grammaire', 'ne,pas,n'',plus', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'La négation simple - Grammaire' AND `sentence` = 'Je ____ parle ____ chinois. Elle ____ aime ____ le poisson.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'n'',pas,n'',pas', '', 'Nous ____ habitons ____ à Paris. Vous ____ êtes ____ en retard.', 'La négation simple - Grammaire', 'n'',pas,ne,plus', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'La négation simple - Grammaire' AND `sentence` = 'Nous ____ habitons ____ à Paris. Vous ____ êtes ____ en retard.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'ne,pas,n'',pas', '', 'Je ____ veux ____ de café. Il ____ y a ____ de lait.', 'La négation simple - Grammaire', 'ne,pas,n'',de', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'La négation simple - Grammaire' AND `sentence` = 'Je ____ veux ____ de café. Il ____ y a ____ de lait.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'ne,pas,ne,pas', '', 'Tu ____ travailles ____ le dimanche. Ils ____ jouent ____ au foot.', 'La négation simple - Grammaire', 'ne,pas,n'',plus', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'La négation simple - Grammaire' AND `sentence` = 'Tu ____ travailles ____ le dimanche. Ils ____ jouent ____ au foot.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'n'',pas,n'',pas', '', 'Elle ____ est ____ malade. Il ____ a ____ de voiture.', 'La négation simple - Grammaire', 'n'',pas,ne,de', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'La négation simple - Grammaire' AND `sentence` = 'Elle ____ est ____ malade. Il ____ a ____ de voiture.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'actrice,boulangère', '', 'Un acteur, une ____ . Un boulanger, une ____ .', 'Les noms : masculin et féminin - Grammaire', 'actrice,boulangère,acteure,boulangerie', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les noms : masculin et féminin - Grammaire' AND `sentence` = 'Un acteur, une ____ . Un boulanger, une ____ .');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'chanteuse,infirmière', '', 'Un chanteur, une ____ . Un infirmier, une ____ .', 'Les noms : masculin et féminin - Grammaire', 'chanteuse,infirmière,chanteur,infirmier', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les noms : masculin et féminin - Grammaire' AND `sentence` = 'Un chanteur, une ____ . Un infirmier, une ____ .');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'un,une', '', 'J''ai ____ ordinateur et ____ table.', 'Les noms : masculin et féminin - Grammaire', 'un,une,le,la', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les noms : masculin et féminin - Grammaire' AND `sentence` = 'J''ai ____ ordinateur et ____ table.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Le,La', '', '____ problème est difficile. ____ question est difficile.', 'Les noms : masculin et féminin - Grammaire', 'Le,La,L'',Les', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les noms : masculin et féminin - Grammaire' AND `sentence` = '____ problème est difficile. ____ question est difficile.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'féminin,masculin', '', 'Le soleil est masculin. La lune est ____ . Le livre est ____ .', 'Les noms : masculin et féminin - Grammaire', 'féminin,masculin,pluriel,neutre', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les noms : masculin et féminin - Grammaire' AND `sentence` = 'Le soleil est masculin. La lune est ____ . Le livre est ____ .');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'contente,contents,contentes', '', 'Marie est ____ . Paul et Marc sont ____ . Les filles sont ____ .', 'Les accords - Grammaire', 'contente,contents,contentes,content', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les accords - Grammaire' AND `sentence` = 'Marie est ____ . Paul et Marc sont ____ . Les filles sont ____ .');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'neuve,neuf,neuves', '', 'Une voiture ____ . Un appartement ____ . Des maisons ____ .', 'Les accords - Grammaire', 'neuve,neuf,neuves,neufs', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les accords - Grammaire' AND `sentence` = 'Une voiture ____ . Un appartement ____ . Des maisons ____ .');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'blondes,blond,blonde', '', 'Mes sœurs sont ____ . Mon frère est ____ . Ma mère est ____ .', 'Les accords - Grammaire', 'blondes,blond,blonde,blonds', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les accords - Grammaire' AND `sentence` = 'Mes sœurs sont ____ . Mon frère est ____ . Ma mère est ____ .');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'américaine,américain', '', 'Elle est ____ et il est ____ .', 'Les accords - Grammaire', 'américaine,américain,américains,américaines', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les accords - Grammaire' AND `sentence` = 'Elle est ____ et il est ____ .');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Ces,Cette', '', '____ enfants sont gentils. ____ voiture est chère.', 'Les accords - Grammaire', 'Ces,Cette,Ce,Cet', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les accords - Grammaire' AND `sentence` = '____ enfants sont gentils. ____ voiture est chère.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'COD,COI', '', 'Je regarde la télévision : « la télévision » est un ____ . Je parle à Paul : « à Paul » est un ____ .', 'Les compléments - Grammaire', 'COD,COI,COS,sujet', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les compléments - Grammaire' AND `sentence` = 'Je regarde la télévision : « la télévision » est un ____ . Je parle à Paul : « à Paul » est un ____ .');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'à midi,à Lyon', '', 'Nous mangeons ____ (quand ?). Nous habitons ____ (où ?).', 'Les compléments - Grammaire', 'à midi,à Lyon,lentement,une pomme', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les compléments - Grammaire' AND `sentence` = 'Nous mangeons ____ (quand ?). Nous habitons ____ (où ?).');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'une lettre,à sa mère', '', 'Elle écrit ____ (quoi ?). Elle téléphone ____ (à qui ?).', 'Les compléments - Grammaire', 'une lettre,à sa mère,doucement,demain', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les compléments - Grammaire' AND `sentence` = 'Elle écrit ____ (quoi ?). Elle téléphone ____ (à qui ?).');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'prudemment,la nuit', '', 'Il conduit ____ (comment ?). Il conduit ____ (quand ?).', 'Les compléments - Grammaire', 'prudemment,la nuit,une voiture,à Paris', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les compléments - Grammaire' AND `sentence` = 'Il conduit ____ (comment ?). Il conduit ____ (quand ?).');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'à,à', '', 'Je donne un cadeau ____ mon frère. J''obéis ____ mes parents.', 'Les compléments - Grammaire', 'à,de,sur,avec', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les compléments - Grammaire' AND `sentence` = 'Je donne un cadeau ____ mon frère. J''obéis ____ mes parents.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'allons,faites', '', 'Nous ____ au cinéma ce soir. Vous ____ du yoga le mardi.', 'Aller et Faire - Conjugaison', 'allons,faites,allez,faisons', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Aller et Faire - Conjugaison' AND `sentence` = 'Nous ____ au cinéma ce soir. Vous ____ du yoga le mardi.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'vont,font', '', 'Ils ____ à la plage. Elles ____ leurs devoirs.', 'Aller et Faire - Conjugaison', 'vont,font,va,fait', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Aller et Faire - Conjugaison' AND `sentence` = 'Ils ____ à la plage. Elles ____ leurs devoirs.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'vas,fais', '', 'Tu ____ à Paris en train. Tu ____ le ménage.', 'Aller et Faire - Conjugaison', 'vas,fais,va,fait', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Aller et Faire - Conjugaison' AND `sentence` = 'Tu ____ à Paris en train. Tu ____ le ménage.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'vais,fais', '', 'Je ne ____ pas à l''école aujourd''hui. Je ne ____ rien.', 'Aller et Faire - Conjugaison', 'vais,fais,vas,fait', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Aller et Faire - Conjugaison' AND `sentence` = 'Je ne ____ pas à l''école aujourd''hui. Je ne ____ rien.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'allez,faites', '', 'Où ____ -vous ? Que ____ -vous ?', 'Aller et Faire - Conjugaison', 'allez,faites,allons,faisons', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Aller et Faire - Conjugaison' AND `sentence` = 'Où ____ -vous ? Que ____ -vous ?');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'me,te,se', '', 'Je ____ lave. Tu ____ promènes. Il ____ repose.', 'Les verbes pronominaux - Conjugaison', 'me,te,se,nous', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les verbes pronominaux - Conjugaison' AND `sentence` = 'Je ____ lave. Tu ____ promènes. Il ____ repose.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'nous,vous,se', '', 'Nous ____ levons tôt. Vous ____ couchez tard. Elles ____ réveillent à six heures.', 'Les verbes pronominaux - Conjugaison', 'nous,vous,se,me', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les verbes pronominaux - Conjugaison' AND `sentence` = 'Nous ____ levons tôt. Vous ____ couchez tard. Elles ____ réveillent à six heures.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'se,s'',me', '', 'Ils ____ dépêchent. Elle ____ habille. Je ____ repose.', 'Les verbes pronominaux - Conjugaison', 'se,s'',me,te', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les verbes pronominaux - Conjugaison' AND `sentence` = 'Ils ____ dépêchent. Elle ____ habille. Je ____ repose.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'me réveille,nous levons', '', 'Je ____ à sept heures. Nous ____ à huit heures.', 'Les verbes pronominaux - Conjugaison', 'me réveille,nous levons,nous lève,te réveilles', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les verbes pronominaux - Conjugaison' AND `sentence` = 'Je ____ à sept heures. Nous ____ à huit heures.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'se lèvent,me couche', '', 'Ils ne ____ pas tôt. Je ne ____ jamais tard.', 'Les verbes pronominaux - Conjugaison', 'se lèvent,me couche,te lèves,nous couchons', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les verbes pronominaux - Conjugaison' AND `sentence` = 'Ils ne ____ pas tôt. Je ne ____ jamais tard.');
