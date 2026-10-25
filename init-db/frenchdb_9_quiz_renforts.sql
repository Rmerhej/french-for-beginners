-- Quiz supplémentaires : renforcement des étapes qui en avaient le moins (4 à 6 quiz chacune).
-- 42 quiz glisser-déposer. Peut être exécuté plusieurs fois sans créer de doublons.
-- Sur le serveur (aucune nouvelle image nécessaire) :
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_quiz_renforts.sql
SET NAMES utf8mb4;

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'la,le', '', 'J''aime ____ musique et ____ cinéma.', 'Les articles définis - Grammaire', 'le,les,la,l''', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les articles définis - Grammaire' AND `sentence` = 'J''aime ____ musique et ____ cinéma.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'la,l''', '', 'Nous mangeons ____ pomme et ____ orange.', 'Les articles définis - Grammaire', 'la,l'',les,le', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les articles définis - Grammaire' AND `sentence` = 'Nous mangeons ____ pomme et ____ orange.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Les,le', '', '____ enfants jouent dans ____ jardin.', 'Les articles définis - Grammaire', 'la,l'',le,Les', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les articles définis - Grammaire' AND `sentence` = '____ enfants jouent dans ____ jardin.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'l'',les', '', 'Je vais à ____ école avec ____ amis de ma sœur.', 'Les articles définis - Grammaire', 'l'',les,le,la', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les articles définis - Grammaire' AND `sentence` = 'Je vais à ____ école avec ____ amis de ma sœur.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'au,aux', '', 'Elle parle ____ professeur. Je téléphone ____ amies.', 'Les articles définis - Grammaire', 'aux,des,du,au', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les articles définis - Grammaire' AND `sentence` = 'Elle parle ____ professeur. Je téléphone ____ amies.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'du,des', '', 'Voici le livre ____ directeur et la voiture ____ voisins.', 'Les articles définis - Grammaire', 'du,aux,au,des', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Les articles définis - Grammaire' AND `sentence` = 'Voici le livre ____ directeur et la voiture ____ voisins.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'viens,vient', '', 'Je ____ de manger. Elle ____ de partir.', 'Le passé récent - Conjugaison', 'viens,venons,viennent,vient', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Le passé récent - Conjugaison' AND `sentence` = 'Je ____ de manger. Elle ____ de partir.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'venons,venez', '', 'Nous ____ d''arriver. Vous ____ de téléphoner.', 'Le passé récent - Conjugaison', 'venez,venons,viennent,vient', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Le passé récent - Conjugaison' AND `sentence` = 'Nous ____ d''arriver. Vous ____ de téléphoner.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'viennent,vient', '', 'Ils ____ de finir. Elle ____ de sortir.', 'Le passé récent - Conjugaison', 'venez,vient,viens,viennent', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Le passé récent - Conjugaison' AND `sentence` = 'Ils ____ de finir. Elle ____ de sortir.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'de,d''', '', 'Il vient ____ manger. Elle vient ____ arriver.', 'Le passé récent - Conjugaison', 'du,de,d'',à', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Le passé récent - Conjugaison' AND `sentence` = 'Il vient ____ manger. Elle vient ____ arriver.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'envoyer,fermer', '', 'Il vient de ____ un message. Nous venons de ____ la porte.', 'Le passé récent - Conjugaison', 'envoyer,fermé,envoyé,fermer', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Le passé récent - Conjugaison' AND `sentence` = 'Il vient de ____ un message. Nous venons de ____ la porte.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'viens,viennent', '', 'Attention ! Je ____ de laver le sol. Les enfants ____ de rentrer de l''école.', 'Le passé récent - Conjugaison', 'vient,viennent,venons,viens', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Le passé récent - Conjugaison' AND `sentence` = 'Attention ! Je ____ de laver le sol. Les enfants ____ de rentrer de l''école.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'offertes,magnifiques', '', 'Les fleurs que tu m''as ____ sont ____.', 'Accords approfondis - Grammaire', 'magnifiques,magnifique,offert,offertes', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Accords approfondis - Grammaire' AND `sentence` = 'Les fleurs que tu m''as ____ sont ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'lavé,levées', '', 'Elle s''est ____ les mains. Elles se sont ____ tôt.', 'Accords approfondis - Grammaire', 'levées,levé,lavée,lavé', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Accords approfondis - Grammaire' AND `sentence` = 'Elle s''est ____ les mains. Elles se sont ____ tôt.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'châtains,verts', '', 'Elle a les cheveux ____ et les yeux ____.', 'Accords approfondis - Grammaire', 'verts,vert,châtain,châtains', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Accords approfondis - Grammaire' AND `sentence` = 'Elle a les cheveux ____ et les yeux ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'arrivé,venu', '', 'Quelqu''un est ____. Personne n''est ____.', 'Accords approfondis - Grammaire', 'arrivé,venu,arrivés,venus', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Accords approfondis - Grammaire' AND `sentence` = 'Quelqu''un est ____. Personne n''est ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'allées,allés', '', 'Ma sœur et moi, nous sommes ____. Ton frère et toi, vous êtes ____.', 'Accords approfondis - Grammaire', 'allées,allé,allés,allée', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Accords approfondis - Grammaire' AND `sentence` = 'Ma sœur et moi, nous sommes ____. Ton frère et toi, vous êtes ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'acheté,achetés', '', 'Elle a ____ trois livres. Les livres qu''elle a ____ sont intéressants.', 'Accords approfondis - Grammaire', 'achetées,achetés,acheté,achetée', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Accords approfondis - Grammaire' AND `sentence` = 'Elle a ____ trois livres. Les livres qu''elle a ____ sont intéressants.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'depuis,pendant', '', 'Je travaille ici ____ 2020. Il a dormi ____ huit heures.', 'Repères de temps approfondis - Grammaire', 'pendant,en,depuis,dans', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Repères de temps approfondis - Grammaire' AND `sentence` = 'Je travaille ici ____ 2020. Il a dormi ____ huit heures.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'dans,en', '', 'Le train part ____ dix minutes. Il a fini le travail ____ une heure.', 'Repères de temps approfondis - Grammaire', 'dans,pendant,en,il y a', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Repères de temps approfondis - Grammaire' AND `sentence` = 'Le train part ____ dix minutes. Il a fini le travail ____ une heure.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'il y a,pendant', '', 'Nous avons déménagé ____ deux ans. Nous restons ici ____ deux ans.', 'Repères de temps approfondis - Grammaire', 'dans,depuis,pendant,il y a', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Repères de temps approfondis - Grammaire' AND `sentence` = 'Nous avons déménagé ____ deux ans. Nous restons ici ____ deux ans.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'en,au', '', 'Je pars en vacances ____ juillet et je reviens ____ printemps.', 'Repères de temps approfondis - Grammaire', 'en,au,dans,à', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Repères de temps approfondis - Grammaire' AND `sentence` = 'Je pars en vacances ____ juillet et je reviens ____ printemps.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'il y a,dans', '', 'Il est parti ____ une semaine et il revient ____ quelques jours.', 'Repères de temps approfondis - Grammaire', 'dans,depuis,pendant,il y a', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Repères de temps approfondis - Grammaire' AND `sentence` = 'Il est parti ____ une semaine et il revient ____ quelques jours.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'depuis,dans', '', 'Je n''ai pas vu Paul ____ deux mois. Je le verrai ____ deux mois.', 'Repères de temps approfondis - Grammaire', 'dans,il y a,pendant,depuis', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Repères de temps approfondis - Grammaire' AND `sentence` = 'Je n''ai pas vu Paul ____ deux mois. Je le verrai ____ deux mois.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'finis,finissons', '', 'Je ____ mon repas. Nous ____ à midi.', 'Verbes en -ir, -re et -yer - Grammaire', 'finissez,finit,finis,finissons', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Verbes en -ir, -re et -yer - Grammaire' AND `sentence` = 'Je ____ mon repas. Nous ____ à midi.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'attends,attendez', '', 'Tu ____ la réponse. Vous ____ vos amis.', 'Verbes en -ir, -re et -yer - Grammaire', 'attendez,attendons,attends,attend', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Verbes en -ir, -re et -yer - Grammaire' AND `sentence` = 'Tu ____ la réponse. Vous ____ vos amis.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'perd,vendent', '', 'Elle ____ ses clés. Ils ____ des livres.', 'Verbes en -ir, -re et -yer - Grammaire', 'perd,perdent,vendent,vend', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Verbes en -ir, -re et -yer - Grammaire' AND `sentence` = 'Elle ____ ses clés. Ils ____ des livres.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'nettoie,nettoyons', '', 'Je ____ la table. Nous ____ la cuisine.', 'Verbes en -ir, -re et -yer - Grammaire', 'nettoie,nettoyez,nettoyons,nettoye', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Verbes en -ir, -re et -yer - Grammaire' AND `sentence` = 'Je ____ la table. Nous ____ la cuisine.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'paies,envoyez', '', 'Tu ____ la facture. Vous ____ le colis.', 'Verbes en -ir, -re et -yer - Grammaire', 'paies,payons,envoyez,envoyons', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Verbes en -ir, -re et -yer - Grammaire' AND `sentence` = 'Tu ____ la facture. Vous ____ le colis.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'grandissent,répond', '', 'Les enfants ____ vite. Elle ____ à ma question.', 'Verbes en -ir, -re et -yer - Grammaire', 'grandissent,grandit,répond,répondent', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Verbes en -ir, -re et -yer - Grammaire' AND `sentence` = 'Les enfants ____ vite. Elle ____ à ma question.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'est,avons', '', 'Elle ____ arrivée à huit heures. Nous ____ mangé ensemble.', 'Choisir l''auxiliaire - Grammaire', 'sommes,a,avons,est', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Choisir l''auxiliaire - Grammaire' AND `sentence` = 'Elle ____ arrivée à huit heures. Nous ____ mangé ensemble.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'sont,ont', '', 'Ils ____ partis en vacances. Ils ____ pris le train.', 'Choisir l''auxiliaire - Grammaire', 'ont,a,sont,est', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Choisir l''auxiliaire - Grammaire' AND `sentence` = 'Ils ____ partis en vacances. Ils ____ pris le train.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'suis,as', '', 'Je ____ tombé dans la rue. Tu ____ perdu ton sac.', 'Choisir l''auxiliaire - Grammaire', 'ai,as,es,suis', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Choisir l''auxiliaire - Grammaire' AND `sentence` = 'Je ____ tombé dans la rue. Tu ____ perdu ton sac.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'est,a', '', 'Elle s''____ levée tôt. Elle ____ levé la main.', 'Choisir l''auxiliaire - Grammaire', 'sont,a,as,est', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Choisir l''auxiliaire - Grammaire' AND `sentence` = 'Elle s''____ levée tôt. Elle ____ levé la main.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'sommes,avons', '', 'Nous ____ sortis hier soir. Nous ____ sorti la voiture du garage.', 'Choisir l''auxiliaire - Grammaire', 'avons,sont,avez,sommes', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Choisir l''auxiliaire - Grammaire' AND `sentence` = 'Nous ____ sortis hier soir. Nous ____ sorti la voiture du garage.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'êtes,avez', '', 'Vous ____ rentrés tard. Vous ____ rentré les chaises.', 'Choisir l''auxiliaire - Grammaire', 'sont,avons,avez,êtes', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Choisir l''auxiliaire - Grammaire' AND `sentence` = 'Vous ____ rentrés tard. Vous ____ rentré les chaises.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'poliment,gentiment', '', 'Il parle ____ et elle répond ____.', 'Adverbes en -ment et place - Grammaire', 'gentiment,gentilment,poliment,politement', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Adverbes en -ment et place - Grammaire' AND `sentence` = 'Il parle ____ et elle répond ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'très,vraiment', '', 'C''est ____ difficile. Il est ____ content.', 'Adverbes en -ment et place - Grammaire', 'vraiment,très,vrai,beaucoup', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Adverbes en -ment et place - Grammaire' AND `sentence` = 'C''est ____ difficile. Il est ____ content.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'jamais,rien', '', 'Je ne mange ____ de viande. Il n''a ____ vu.', 'Adverbes en -ment et place - Grammaire', 'tout,rien,jamais,toujours', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Adverbes en -ment et place - Grammaire' AND `sentence` = 'Je ne mange ____ de viande. Il n''a ____ vu.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'bien,déjà', '', 'Elle a ____ mangé. Il a ____ compris.', 'Adverbes en -ment et place - Grammaire', 'déjà,hier,bientôt,bien', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Adverbes en -ment et place - Grammaire' AND `sentence` = 'Elle a ____ mangé. Il a ____ compris.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'merveilleusement,rapidement', '', 'Elle chante ____. Ils courent ____.', 'Adverbes en -ment et place - Grammaire', 'rapide,merveilleusement,merveilleux,rapidement', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Adverbes en -ment et place - Grammaire' AND `sentence` = 'Elle chante ____. Ils courent ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'encore,déjà', '', 'Il n''est pas ____ là. Elle est ____ arrivée.', 'Adverbes en -ment et place - Grammaire', 'déjà,beaucoup,très,encore', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Adverbes en -ment et place - Grammaire' AND `sentence` = 'Il n''est pas ____ là. Elle est ____ arrivée.');
