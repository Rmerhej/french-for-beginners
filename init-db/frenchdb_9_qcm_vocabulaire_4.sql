-- QCM pour les leçons du lot 2 (Au restaurant, Au supermarché, La cuisine, La salle de bain, L'argent et les prix, À la poste et à la banque). Peut être exécuté plusieurs fois sans doublons.
-- À lancer APRÈS frenchdb_9_vocab_lot2.sql :
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_qcm_vocabulaire_4.sql
SET NAMES utf8mb4;

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE MENU', 'Le menu présente tous les plats.', 'AU RESTAURANT', 'LE MENU', 'L''ADDITION', 'UNE SERVIETTE', 'UN DESSERT', 'Quel document le serveur apporte-t-il pour choisir ses plats ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'AU RESTAURANT' AND `question` = 'Quel document le serveur apporte-t-il pour choisir ses plats ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'L''ADDITION', 'On demande l''addition pour payer.', 'AU RESTAURANT', 'LE MENU', 'L''ADDITION', 'LA RÉSERVATION', 'L''ENTRÉE', 'Que demande-t-on à la fin du repas pour payer ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'AU RESTAURANT' AND `question` = 'Que demande-t-on à la fin du repas pour payer ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE RÉSERVATION', 'On fait une réservation avant d''aller au restaurant.', 'AU RESTAURANT', 'UN POURBOIRE', 'UNE SERVIETTE', 'UNE RÉSERVATION', 'UN DESSERT', 'Que fait-on par téléphone pour être sûr d''avoir une table ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'AU RESTAURANT' AND `question` = 'Que fait-on par téléphone pour être sûr d''avoir une table ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE ENTRÉE', 'L''entrée est le premier plat.', 'AU RESTAURANT', 'UN DESSERT', 'L''ADDITION', 'UN COUTEAU', 'UNE ENTRÉE', 'Quel plat arrive en premier dans un repas ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'AU RESTAURANT' AND `question` = 'Quel plat arrive en premier dans un repas ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN DESSERT', 'Le dessert est sucré et termine le repas.', 'AU RESTAURANT', 'UN DESSERT', 'UNE ENTRÉE', 'UN PLAT PRINCIPAL', 'UNE ASSIETTE', 'Quel plat sucré termine le repas ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'AU RESTAURANT' AND `question` = 'Quel plat sucré termine le repas ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN COUTEAU', 'On coupe la viande avec un couteau.', 'AU RESTAURANT', 'UNE CUILLÈRE', 'UN COUTEAU', 'UNE SERVIETTE', 'UNE ASSIETTE', 'Avec quoi coupe-t-on la viande ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'AU RESTAURANT' AND `question` = 'Avec quoi coupe-t-on la viande ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE CUILLÈRE', 'On mange la soupe avec une cuillère.', 'AU RESTAURANT', 'UNE FOURCHETTE', 'UN COUTEAU', 'UNE CUILLÈRE', 'UNE SERVIETTE', 'Avec quoi mange-t-on la soupe ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'AU RESTAURANT' AND `question` = 'Avec quoi mange-t-on la soupe ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE POURBOIRE', 'Le pourboire est une petite somme laissée au serveur.', 'AU RESTAURANT', 'L''ADDITION', 'LE MENU', 'LA TABLE', 'LE POURBOIRE', 'Que laisse-t-on parfois au serveur pour le remercier ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'AU RESTAURANT' AND `question` = 'Que laisse-t-on parfois au serveur pour le remercier ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE SERVEUR', 'Le serveur apporte les plats.', 'AU RESTAURANT', 'LE SERVEUR', 'LE MENU', 'L''ADDITION', 'LE DESSERT', 'Qui apporte les plats à la table ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'AU RESTAURANT' AND `question` = 'Qui apporte les plats à la table ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'VÉGÉTARIEN', 'Une personne végétarienne ne mange pas de viande.', 'AU RESTAURANT', 'RÉSERVÉ', 'VÉGÉTARIEN', 'COMMANDÉ', 'SERVI', 'Comment est une personne qui ne mange pas de viande ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'AU RESTAURANT' AND `question` = 'Comment est une personne qui ne mange pas de viande ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'BON APPÉTIT', 'On dit « bon appétit » avant le repas.', 'AU RESTAURANT', 'BONNE NUIT', 'BON VOYAGE', 'BON APPÉTIT', 'À BIENTÔT', 'Que dit-on avant de commencer à manger ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'AU RESTAURANT' AND `question` = 'Que dit-on avant de commencer à manger ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN CADDIE', 'Le caddie porte les courses dans les rayons.', 'AU SUPERMARCHÉ', 'UNE CAISSE', 'UN RAYON', 'UN TICKET DE CAISSE', 'UN CADDIE', 'Qu''est-ce qui roule dans le magasin pour porter ses courses ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'AU SUPERMARCHÉ' AND `question` = 'Qu''est-ce qui roule dans le magasin pour porter ses courses ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'À LA CAISSE', 'On paie à la caisse.', 'AU SUPERMARCHÉ', 'À LA CAISSE', 'AU RAYON', 'DANS LE PANIER', 'SUR LA LISTE', 'Où paie-t-on à la fin des courses ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'AU SUPERMARCHÉ' AND `question` = 'Où paie-t-on à la fin des courses ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN TICKET DE CAISSE', 'Le ticket de caisse prouve votre achat.', 'AU SUPERMARCHÉ', 'UNE PROMOTION', 'UN TICKET DE CAISSE', 'UN RAYON', 'UN CADDIE', 'Que reçoit-on après avoir payé ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'AU SUPERMARCHÉ' AND `question` = 'Que reçoit-on après avoir payé ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE LISTE DE COURSES', 'La liste de courses aide à ne rien oublier.', 'AU SUPERMARCHÉ', 'UN TICKET DE CAISSE', 'UN RAYON', 'UNE LISTE DE COURSES', 'UN PAQUET', 'Que prépare-t-on avant d''aller au magasin pour ne rien oublier ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'AU SUPERMARCHÉ' AND `question` = 'Que prépare-t-on avant d''aller au magasin pour ne rien oublier ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE PROMOTION', 'Un produit en promotion est moins cher pour une durée limitée.', 'AU SUPERMARCHÉ', 'UN RAYON', 'UN KILO', 'UNE BARQUETTE', 'UNE PROMOTION', 'Comment appelle-t-on un produit moins cher pendant quelques jours ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'AU SUPERMARCHÉ' AND `question` = 'Comment appelle-t-on un produit moins cher pendant quelques jours ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'MILLE', 'Un kilo, c''est mille grammes.', 'AU SUPERMARCHÉ', 'MILLE', 'CENT', 'DIX', 'CINQ CENTS', 'Combien de grammes y a-t-il dans un kilo ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'AU SUPERMARCHÉ' AND `question` = 'Combien de grammes y a-t-il dans un kilo ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN LITRE', 'Le lait se vend au litre.', 'AU SUPERMARCHÉ', 'UN KILO', 'UN LITRE', 'UNE BARQUETTE', 'UN SAC', 'Dans quelle unité vend-on le lait ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'AU SUPERMARCHÉ' AND `question` = 'Dans quelle unité vend-on le lait ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'SURGELÉ', 'Un produit surgelé est conservé à très basse température.', 'AU SUPERMARCHÉ', 'FRAIS', 'CHER', 'SURGELÉ', 'VIDE', 'Quel mot décrit un produit conservé dans le congélateur ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'AU SUPERMARCHÉ' AND `question` = 'Quel mot décrit un produit conservé dans le congélateur ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA DATE LIMITE', 'La date limite indique jusqu''à quand on peut consommer le produit.', 'AU SUPERMARCHÉ', 'LE KILO', 'LE RAYON', 'LE CADDIE', 'LA DATE LIMITE', 'Que regarde-t-on pour savoir jusqu''à quand on peut manger un produit ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'AU SUPERMARCHÉ' AND `question` = 'Que regarde-t-on pour savoir jusqu''à quand on peut manger un produit ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN SAC RÉUTILISABLE', 'Un sac réutilisable sert plusieurs fois.', 'AU SUPERMARCHÉ', 'UN SAC RÉUTILISABLE', 'UNE CAISSE', 'UN RAYON', 'UN TICKET DE CAISSE', 'Que peut-on apporter de chez soi pour éviter les sacs en plastique ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'AU SUPERMARCHÉ' AND `question` = 'Que peut-on apporter de chez soi pour éviter les sacs en plastique ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE FRIGO', 'Le frigo garde les aliments au froid.', 'LA CUISINE', 'LE FOUR', 'LE FRIGO', 'L''ÉVIER', 'LE PLACARD', 'Quel appareil garde les aliments froids ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA CUISINE' AND `question` = 'Quel appareil garde les aliments froids ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DANS LE FOUR', 'Le four cuit les gâteaux.', 'LA CUISINE', 'DANS LE FRIGO', 'DANS L''ÉVIER', 'DANS LE FOUR', 'DANS LE TIROIR', 'Dans quel appareil fait-on cuire un gâteau ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA CUISINE' AND `question` = 'Dans quel appareil fait-on cuire un gâteau ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE POÊLE', 'On fait frire un œuf dans une poêle.', 'LA CUISINE', 'UN SALADIER', 'UN ÉVIER', 'UN PLACARD', 'UNE POÊLE', 'Dans quel objet fait-on frire un œuf ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA CUISINE' AND `question` = 'Dans quel objet fait-on frire un œuf ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE CASSEROLE', 'On fait bouillir l''eau dans une casserole.', 'LA CUISINE', 'UNE CASSEROLE', 'UN SALADIER', 'UNE PLANCHE À DÉCOUPER', 'UN TIROIR', 'Dans quoi fait-on bouillir de l''eau pour les pâtes ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA CUISINE' AND `question` = 'Dans quoi fait-on bouillir de l''eau pour les pâtes ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE PLANCHE À DÉCOUPER', 'On coupe les légumes sur une planche à découper.', 'LA CUISINE', 'UN ÉVIER', 'UNE PLANCHE À DÉCOUPER', 'UN FOUR', 'UN PLACARD', 'Sur quoi coupe-t-on les légumes ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA CUISINE' AND `question` = 'Sur quoi coupe-t-on les légumes ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DANS L''ÉVIER', 'On lave la vaisselle dans l''évier.', 'LA CUISINE', 'DANS LE FOUR', 'DANS LE FRIGO', 'DANS L''ÉVIER', 'DANS LE PLACARD', 'Où lave-t-on les assiettes à la main ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA CUISINE' AND `question` = 'Où lave-t-on les assiettes à la main ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE LAVE-VAISSELLE', 'Le lave-vaisselle lave la vaisselle tout seul.', 'LA CUISINE', 'LE FOUR', 'LE MICRO-ONDES', 'LE FRIGO', 'LE LAVE-VAISSELLE', 'Quel appareil lave les assiettes tout seul ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA CUISINE' AND `question` = 'Quel appareil lave les assiettes tout seul ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE MICRO-ONDES', 'Le micro-ondes réchauffe vite un plat.', 'LA CUISINE', 'LE MICRO-ONDES', 'LE FRIGO', 'L''ÉVIER', 'LE LAVE-VAISSELLE', 'Quel appareil réchauffe rapidement un plat déjà cuit ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA CUISINE' AND `question` = 'Quel appareil réchauffe rapidement un plat déjà cuit ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ÉPLUCHER', 'Éplucher, c''est enlever la peau.', 'LA CUISINE', 'MÉLANGER', 'ÉPLUCHER', 'FAIRE CUIRE', 'COUPER', 'Quel verbe veut dire enlever la peau d''un légume ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA CUISINE' AND `question` = 'Quel verbe veut dire enlever la peau d''un légume ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE RECETTE', 'Une recette explique comment préparer un plat.', 'LA CUISINE', 'UN TIROIR', 'UN PLACARD', 'UNE RECETTE', 'UN ÉVIER', 'Que suit-on pour préparer un plat pas à pas ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA CUISINE' AND `question` = 'Que suit-on pour préparer un plat pas à pas ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE DOUCHE', 'On prend une douche pour se laver.', 'LA SALLE DE BAIN', 'UN LAVABO', 'UN MIROIR', 'UN PEIGNE', 'UNE DOUCHE', 'Que prend-on pour se laver le corps sous l''eau ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA SALLE DE BAIN' AND `question` = 'Que prend-on pour se laver le corps sous l''eau ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DU SAVON', 'On se lave les mains avec du savon.', 'LA SALLE DE BAIN', 'DU SAVON', 'UN PEIGNE', 'UN RASOIR', 'UN MIROIR', 'Avec quoi se lave-t-on les mains ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA SALLE DE BAIN' AND `question` = 'Avec quoi se lave-t-on les mains ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE BROSSE À DENTS', 'On se brosse les dents avec une brosse à dents.', 'LA SALLE DE BAIN', 'UN PEIGNE', 'UNE BROSSE À DENTS', 'UN SAVON', 'UN RASOIR', 'Avec quoi se brosse-t-on les dents ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA SALLE DE BAIN' AND `question` = 'Avec quoi se brosse-t-on les dents ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DU SHAMPOING', 'Le shampoing sert à laver les cheveux.', 'LA SALLE DE BAIN', 'DU DENTIFRICE', 'DU PAPIER TOILETTE', 'DU SHAMPOING', 'UN PEIGNE', 'Avec quoi se lave-t-on les cheveux ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA SALLE DE BAIN' AND `question` = 'Avec quoi se lave-t-on les cheveux ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN MIROIR', 'Dans un miroir, on voit son visage.', 'LA SALLE DE BAIN', 'UN LAVABO', 'UNE DOUCHE', 'UN PEIGNE', 'UN MIROIR', 'Dans quoi se regarde-t-on le visage ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA SALLE DE BAIN' AND `question` = 'Dans quoi se regarde-t-on le visage ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN PEIGNE', 'On se coiffe avec un peigne.', 'LA SALLE DE BAIN', 'UN PEIGNE', 'UN RASOIR', 'UN SAVON', 'UN LAVABO', 'Qu''utilise-t-on pour se coiffer ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA SALLE DE BAIN' AND `question` = 'Qu''utilise-t-on pour se coiffer ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE SERVIETTE DE BAIN', 'La serviette de bain sert à se sécher.', 'LA SALLE DE BAIN', 'UN PEIGNE', 'UNE SERVIETTE DE BAIN', 'DU DENTIFRICE', 'UN MIROIR', 'Avec quoi se sèche-t-on après la douche ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA SALLE DE BAIN' AND `question` = 'Avec quoi se sèche-t-on après la douche ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'AUX TOILETTES', 'On va aux toilettes.', 'LA SALLE DE BAIN', 'À LA DOUCHE', 'AU LAVABO', 'AUX TOILETTES', 'À LA BAIGNOIRE', 'Où va-t-on pour faire ses besoins ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA SALLE DE BAIN' AND `question` = 'Où va-t-on pour faire ses besoins ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA MACHINE À LAVER', 'La machine à laver lave le linge.', 'LA SALLE DE BAIN', 'LE LAVABO', 'LA DOUCHE', 'LE MIROIR', 'LA MACHINE À LAVER', 'Quelle machine lave les vêtements ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA SALLE DE BAIN' AND `question` = 'Quelle machine lave les vêtements ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DU DENTIFRICE', 'Le dentifrice nettoie les dents.', 'LA SALLE DE BAIN', 'DU DENTIFRICE', 'DU SHAMPOING', 'DU SAVON', 'DU PAPIER TOILETTE', 'Que met-on sur sa brosse à dents ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'LA SALLE DE BAIN' AND `question` = 'Que met-on sur sa brosse à dents ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'L''EURO', 'En France, on paie en euros.', 'L''ARGENT ET LES PRIX', 'LE DOLLAR', 'L''EURO', 'LE YEN', 'LE PESO', 'Quelle est la monnaie utilisée en France ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'L''ARGENT ET LES PRIX' AND `question` = 'Quelle est la monnaie utilisée en France ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'CENT', 'Un euro, c''est cent centimes.', 'L''ARGENT ET LES PRIX', 'DIX', 'MILLE', 'CENT', 'CINQUANTE', 'Combien de centimes y a-t-il dans un euro ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'L''ARGENT ET LES PRIX' AND `question` = 'Combien de centimes y a-t-il dans un euro ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'CHER', 'Un produit cher coûte beaucoup.', 'L''ARGENT ET LES PRIX', 'BON MARCHÉ', 'GRATUIT', 'FRAIS', 'CHER', 'Quel mot décrit un produit qui coûte beaucoup d''argent ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'L''ARGENT ET LES PRIX' AND `question` = 'Quel mot décrit un produit qui coûte beaucoup d''argent ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'BON MARCHÉ', 'Un produit bon marché ne coûte pas cher.', 'L''ARGENT ET LES PRIX', 'BON MARCHÉ', 'CHER', 'UN BILLET', 'UNE PIÈCE', 'Comment dit-on d''un produit qui coûte peu ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'L''ARGENT ET LES PRIX' AND `question` = 'Comment dit-on d''un produit qui coûte peu ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'GRATUIT', 'Gratuit veut dire sans payer.', 'L''ARGENT ET LES PRIX', 'CHER', 'GRATUIT', 'BON MARCHÉ', 'EN ESPÈCES', 'Comment dit-on d''un produit qui ne coûte rien ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'L''ARGENT ET LES PRIX' AND `question` = 'Comment dit-on d''un produit qui ne coûte rien ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LA MONNAIE', 'Le vendeur rend la monnaie.', 'L''ARGENT ET LES PRIX', 'LE PRIX', 'LA RÉDUCTION', 'LA MONNAIE', 'LE PORTEFEUILLE', 'Qu''est-ce que le vendeur rend au client quand il a donné trop d''argent ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'L''ARGENT ET LES PRIX' AND `question` = 'Qu''est-ce que le vendeur rend au client quand il a donné trop d''argent ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN PORTEFEUILLE', 'On range ses billets dans un portefeuille.', 'L''ARGENT ET LES PRIX', 'UNE RÉDUCTION', 'UN CENTIME', 'LE PRIX', 'UN PORTEFEUILLE', 'Quel objet sert à ranger ses billets et ses pièces ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'L''ARGENT ET LES PRIX' AND `question` = 'Quel objet sert à ranger ses billets et ses pièces ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LES SOLDES', 'Pendant les soldes, les prix baissent.', 'L''ARGENT ET LES PRIX', 'LES SOLDES', 'UN BILLET', 'LA MONNAIE', 'UN PORTEFEUILLE', 'Comment appelle-t-on la période où les magasins vendent à prix réduit ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'L''ARGENT ET LES PRIX' AND `question` = 'Comment appelle-t-on la période où les magasins vendent à prix réduit ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'EN ESPÈCES', 'Payer en espèces, c''est payer avec des billets et des pièces.', 'L''ARGENT ET LES PRIX', 'PAR CARTE', 'EN ESPÈCES', 'PAR CHÈQUE', 'PAR VIREMENT', 'Comment paie-t-on avec des billets et des pièces ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'L''ARGENT ET LES PRIX' AND `question` = 'Comment paie-t-on avec des billets et des pièces ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'ÉCONOMISER', 'Économiser, c''est mettre de l''argent de côté.', 'L''ARGENT ET LES PRIX', 'ACHETER', 'PAYER', 'ÉCONOMISER', 'COÛTER', 'Quel verbe veut dire mettre de l''argent de côté ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'L''ARGENT ET LES PRIX' AND `question` = 'Quel verbe veut dire mettre de l''argent de côté ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'À LA POSTE', 'On envoie un colis à la poste.', 'À LA POSTE ET À LA BANQUE', 'À LA BANQUE', 'À LA PHARMACIE', 'À LA BOULANGERIE', 'À LA POSTE', 'Où va-t-on pour envoyer un colis ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'À LA POSTE ET À LA BANQUE' AND `question` = 'Où va-t-on pour envoyer un colis ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN TIMBRE', 'Le timbre paie l''envoi de la lettre.', 'À LA POSTE ET À LA BANQUE', 'UN TIMBRE', 'UN VIREMENT', 'UN COMPTE BANCAIRE', 'UN DISTRIBUTEUR', 'Que colle-t-on sur une lettre pour l''envoyer ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'À LA POSTE ET À LA BANQUE' AND `question` = 'Que colle-t-on sur une lettre pour l''envoyer ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UNE ENVELOPPE', 'On glisse la lettre dans une enveloppe.', 'À LA POSTE ET À LA BANQUE', 'UN RELEVÉ DE COMPTE', 'UNE ENVELOPPE', 'UNE CARTE BANCAIRE', 'UN VIREMENT', 'Dans quoi met-on une lettre avant de l''envoyer ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'À LA POSTE ET À LA BANQUE' AND `question` = 'Dans quoi met-on une lettre avant de l''envoyer ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'LE FACTEUR', 'Le facteur distribue le courrier.', 'À LA POSTE ET À LA BANQUE', 'LE SERVEUR', 'LE VOISIN', 'LE FACTEUR', 'LE PROPRIÉTAIRE', 'Qui apporte le courrier à la maison ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'À LA POSTE ET À LA BANQUE' AND `question` = 'Qui apporte le courrier à la maison ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'DANS LA BOÎTE AUX LETTRES', 'Les lettres sont dans la boîte aux lettres.', 'À LA POSTE ET À LA BANQUE', 'DANS LE FRIGO', 'DANS LE DISTRIBUTEUR', 'DANS LE PORTEFEUILLE', 'DANS LA BOÎTE AUX LETTRES', 'Où le facteur laisse-t-il les lettres devant chez vous ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'À LA POSTE ET À LA BANQUE' AND `question` = 'Où le facteur laisse-t-il les lettres devant chez vous ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN RECOMMANDÉ', 'Le recommandé permet de suivre l''envoi.', 'À LA POSTE ET À LA BANQUE', 'UN RECOMMANDÉ', 'UN TIMBRE', 'UNE ADRESSE', 'UN VIREMENT', 'Quelle lettre importante garantit que le destinataire la reçoit ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'À LA POSTE ET À LA BANQUE' AND `question` = 'Quelle lettre importante garantit que le destinataire la reçoit ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'À LA BANQUE', 'On ouvre un compte à la banque.', 'À LA POSTE ET À LA BANQUE', 'À LA BOULANGERIE', 'À LA BANQUE', 'À LA PHARMACIE', 'AU MARCHÉ', 'Où va-t-on pour ouvrir un compte bancaire ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'À LA POSTE ET À LA BANQUE' AND `question` = 'Où va-t-on pour ouvrir un compte bancaire ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN DISTRIBUTEUR', 'Le distributeur donne des billets avec une carte.', 'À LA POSTE ET À LA BANQUE', 'UN RELEVÉ DE COMPTE', 'UN VIREMENT', 'UN DISTRIBUTEUR', 'UN RECOMMANDÉ', 'Quelle machine permet de retirer de l''argent dans la rue ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'À LA POSTE ET À LA BANQUE' AND `question` = 'Quelle machine permet de retirer de l''argent dans la rue ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN VIREMENT', 'Un virement envoie de l''argent d''un compte à un autre.', 'À LA POSTE ET À LA BANQUE', 'UN TIMBRE', 'UN FACTEUR', 'UN CODE POSTAL', 'UN VIREMENT', 'Comment appelle-t-on un transfert d''argent d''un compte à un autre ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'À LA POSTE ET À LA BANQUE' AND `question` = 'Comment appelle-t-on un transfert d''argent d''un compte à un autre ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'UN RELEVÉ DE COMPTE', 'Le relevé de compte liste les opérations.', 'À LA POSTE ET À LA BANQUE', 'UN RELEVÉ DE COMPTE', 'UNE ENVELOPPE', 'UN TIMBRE', 'UN COLIS', 'Quel document montre l''argent entré et sorti du compte ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'À LA POSTE ET À LA BANQUE' AND `question` = 'Quel document montre l''argent entré et sorti du compte ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`)
SELECT 'L''ADRESSE', 'Sans adresse, la lettre ne peut pas arriver.', 'À LA POSTE ET À LA BANQUE', 'UN COMPTE', 'L''ADRESSE', 'UN DISTRIBUTEUR', 'UN FACTEUR', 'Que doit-on écrire sur l''enveloppe pour que la lettre arrive ?' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'À LA POSTE ET À LA BANQUE' AND `question` = 'Que doit-on écrire sur l''enveloppe pour que la lettre arrive ?');
