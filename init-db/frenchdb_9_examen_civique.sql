-- Examen civique : QCM général (40 questions) et quiz général (15 phrases à compléter).
-- Les cinq modules de « La France » sont regroupés, comme à l'examen civique réel (40 questions, 45 minutes, 32 bonnes réponses pour réussir).
-- Source des faits : Livret du citoyen, édition mai 2026 (Ministère de l'Intérieur), voir static/LIVRET-CITOYEN.pdf.
-- Peut être exécuté plusieurs fois sans créer de doublons.
-- Sur le serveur (aucune nouvelle image nécessaire) :
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_examen_civique.sql
SET NAMES utf8mb4;

-- ===== QCM général : 40 questions (8 par module) =====

-- Module 1 : Principes et valeurs de la République

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'A', 'C''est la formule de l''article 1er de la Constitution du 4 octobre 1958.', 'Examen civique - QCM général', 'indivisible, laïque, démocratique et sociale', 'fédérale, religieuse, monarchique et libérale', 'divisible, laïque, démocratique et libérale', 'unitaire, impériale, militaire et sociale', 'Selon l''article 1er de la Constitution de 1958, la France est une République…', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Selon l''article 1er de la Constitution de 1958, la France est une République…');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'C', 'Depuis 1880, le 14 juillet rappelle la prise de la Bastille (1789) et la Fête de la Fédération (1790).', 'Examen civique - QCM général', 'Depuis 1789', 'Depuis 1905', 'Depuis 1880', 'Depuis 1958', 'Depuis quand le 14 juillet est-il le jour de la fête nationale ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Depuis quand le 14 juillet est-il le jour de la fête nationale ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'C', 'La Marseillaise a été écrite en 1792 par Rouget de Lisle. Les enfants l''étudient à l''école primaire.', 'Examen civique - QCM général', 'Victor Hugo', 'Molière', 'Rouget de Lisle', 'Maximilien Robespierre', 'Qui a écrit « La Marseillaise », l''hymne national, en 1792 ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Qui a écrit « La Marseillaise », l''hymne national, en 1792 ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'A', 'Les agents publics doivent rester neutres : ils ne montrent pas leurs opinions ou croyances pendant leur service.', 'Examen civique - QCM général', 'Il doit rester neutre et ne pas montrer sa religion', 'Il peut porter tous les signes religieux qu''il veut', 'Il peut les porter seulement le vendredi', 'Il peut les porter si le maire est d''accord', 'Un agent de mairie reçoit le public. Que dit la laïcité sur ses signes religieux pendant son service ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Un agent de mairie reçoit le public. Que dit la laïcité sur ses signes religieux pendant son service ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'D', 'La neutralité s''impose aux agents, pas aux usagers. Mais on ne peut pas exiger que le service s''adapte à une religion.', 'Examen civique - QCM général', 'Non, c''est toujours interdit dans un bâtiment public', 'Oui, et le service doit s''adapter à votre religion', 'Non, sauf si l''agent est d''accord', 'Oui, un usager peut le porter s''il respecte les règles du service', 'Vous venez à la mairie pour faire une démarche et vous portez un signe religieux. Est-ce permis ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Vous venez à la mairie pour faire une démarche et vous portez un signe religieux. Est-ce permis ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'C', 'Les signes ou vêtements qui montrent la religion de manière ostensible sont interdits à l''école publique. Les signes discrets sont autorisés.', 'Examen civique - QCM général', 'Tous les signes religieux sont autorisés', 'Seuls les signes discrets sont interdits', 'Les signes religieux ostensibles sont interdits', 'Les élèves doivent choisir une religion', 'Que prévoit la loi du 15 mars 2004 pour l''école publique ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Que prévoit la loi du 15 mars 2004 pour l''école publique ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'A', 'Le 9 décembre rappelle la loi de 1905 sur la séparation des Églises et de l''État.', 'Examen civique - QCM général', 'Le 9 décembre', 'Le 14 juillet', 'Le 11 novembre', 'Le 1er mai', 'Quel jour la laïcité est-elle officiellement célébrée en France ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Quel jour la laïcité est-elle officiellement célébrée en France ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'B', 'Toute décision de l''employeur doit reposer sur des raisons professionnelles. Les discriminations sont punies par la loi.', 'Examen civique - QCM général', 'D''un choix libre de l''employeur', 'D''une discrimination punie par la loi', 'D''une règle normale de l''entreprise', 'D''une simple opinion sans conséquence', 'Un employeur refuse d''embaucher une candidate parce qu''elle est une femme. De quoi s''agit-il ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Un employeur refuse d''embaucher une candidate parce qu''elle est une femme. De quoi s''agit-il ?');

-- Module 2 : Système institutionnel et politique

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'B', 'L''Assemblée nationale compte 577 députés, élus tous les cinq ans. Le Sénat compte 348 sénateurs.', 'Examen civique - QCM général', '348', '577', '101', '925', 'Combien de députés siègent à l''Assemblée nationale ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Combien de députés siègent à l''Assemblée nationale ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'B', 'Il est élu au suffrage universel direct pour cinq ans, renouvelables une fois.', 'Examen civique - QCM général', 'Quatre ans, renouvelable deux fois', 'Cinq ans, renouvelable une fois', 'Sept ans, non renouvelable', 'Six ans, renouvelable sans limite', 'Pour combien de temps le Président de la République est-il élu ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Pour combien de temps le Président de la République est-il élu ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'A', 'Le Président nomme le Gouvernement, sur proposition du Premier ministre qui en dirige l''action.', 'Examen civique - QCM général', 'Le Président de la République, sur proposition du Premier ministre', 'Le Conseil constitutionnel', 'Le maire de Paris', 'Les sénateurs', 'Qui nomme les ministres du Gouvernement ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Qui nomme les ministres du Gouvernement ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'C', 'Le Conseil constitutionnel veille à la conformité des lois avec la Constitution et contrôle la régularité des élections nationales.', 'Examen civique - QCM général', 'Le Sénat', 'La préfecture', 'Le Conseil constitutionnel', 'Le conseil municipal', 'Quelle institution vérifie que les lois respectent la Constitution ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Quelle institution vérifie que les lois respectent la Constitution ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'B', 'Pour voter : nationalité française, 18 ans au moins, ne pas être privé de ses droits civiques et être inscrit sur les listes électorales.', 'Examen civique - QCM général', 'Oui, la nationalité suffit', 'Non, il faut être inscrit sur les listes électorales', 'Oui, avec votre carte Vitale', 'Non, il faut avoir au moins 25 ans', 'Vous avez 20 ans, vous êtes Français, mais vous n''êtes pas inscrit sur les listes électorales. Pouvez-vous voter ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Vous avez 20 ans, vous êtes Français, mais vous n''êtes pas inscrit sur les listes électorales. Pouvez-vous voter ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'B', 'La France compte 101 départements : 96 en métropole et 5 en outre-mer. Le plus récent est Mayotte (2011).', 'Examen civique - QCM général', '96', '101', '13', '18', 'Combien la France compte-t-elle de départements ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Combien la France compte-t-elle de départements ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'D', 'Elle compte 27 États membres depuis la sortie du Royaume-Uni (Brexit) en 2020.', 'Examen civique - QCM général', '6', '15', '35', '27', 'Combien d''États membres compte aujourd''hui l''Union européenne ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Combien d''États membres compte aujourd''hui l''Union européenne ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'D', 'L''Ode à la joie, extraite de la Neuvième symphonie de Beethoven, symbolise la liberté, la paix et la solidarité.', 'Examen civique - QCM général', 'La Marseillaise', 'L''Hymne à l''amour', 'Le Chant des partisans', 'L''Ode à la joie de Beethoven', 'Quel est l''hymne de l''Union européenne ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Quel est l''hymne de l''Union européenne ?');

-- Module 3 : Droits et devoirs des citoyens

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'A', 'La liberté s''arrête là où elle nuit aux autres. Les limites sont fixées par la loi.', 'Examen civique - QCM général', 'La liberté consiste à pouvoir faire tout ce qui ne nuit pas à autrui', 'La liberté consiste à faire tout ce que l''on veut', 'La liberté appartient seulement aux propriétaires', 'La liberté est accordée par le roi', 'Que dit l''article 4 de la Déclaration des droits de l''homme et du citoyen de 1789 ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Que dit l''article 4 de la Déclaration des droits de l''homme et du citoyen de 1789 ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'A', 'Le vote n''est pas obligatoire, mais c''est un devoir civique qui assure la légitimité des représentants élus.', 'Examen civique - QCM général', 'Non, mais c''est un devoir civique important', 'Oui, avec une amende en cas d''absence', 'Oui, mais seulement pour les élections locales', 'Non, et ce n''est pas un devoir civique', 'En France, le vote est-il obligatoire ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'En France, le vote est-il obligatoire ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'D', 'Porter secours à une personne en danger est un devoir. La non-assistance à personne en danger est un délit.', 'Examen civique - QCM général', 'Partir vite pour ne pas être mêlé à l''affaire', 'Attendre que quelqu''un d''autre intervienne', 'Filmer la scène avec votre téléphone', 'Porter secours ou alerter les secours, sans vous mettre en danger', 'Vous êtes témoin d''un accident grave. Que devez-vous faire ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Vous êtes témoin d''un accident grave. Que devez-vous faire ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'C', 'Les contraventions sont les infractions les moins graves : une amende, jugée par le tribunal de police.', 'Examen civique - QCM général', 'des crimes', 'des délits graves', 'des contraventions', 'des peines de réclusion', 'Un excès de vitesse léger ou le tapage nocturne sont des infractions classées comme…', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Un excès de vitesse léger ou le tapage nocturne sont des infractions classées comme…');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'D', 'Tous les résidents, et pas seulement les Français, contribuent au financement des services publics selon leurs moyens.', 'Examen civique - QCM général', 'Uniquement les Français', 'Uniquement les salariés des grandes entreprises', 'Uniquement les personnes de plus de 60 ans', 'Toute personne majeure résidant en France, non rattachée au foyer fiscal de ses parents', 'Qui doit déclarer ses revenus et payer ses impôts chaque année ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Qui doit déclarer ses revenus et payer ses impôts chaque année ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'B', 'La déclaration préalable précise notamment le parcours et les organisateurs, pour éviter les troubles à l''ordre public.', 'Examen civique - QCM général', 'Rien : aucune formalité n''existe', 'La déclarer à l''administration avant la manifestation', 'Demander l''accord de tous les habitants', 'La déclarer seulement après', 'Une association organise une manifestation dans la rue. Que doit-elle faire ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Une association organise une manifestation dans la rue. Que doit-elle faire ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'B', 'Dès 16 ans, les jeunes Français se font recenser à la mairie pour participer à la Journée Défense et Citoyenneté (JDC).', 'Examen civique - QCM général', '12 ans', '16 ans', '18 ans', '21 ans', 'À partir de quel âge les jeunes Français doivent-ils se faire recenser à la mairie pour la Journée Défense et Citoyenneté ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'À partir de quel âge les jeunes Français doivent-ils se faire recenser à la mairie pour la Journée Défense et Citoyenneté ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'C', 'La présomption d''innocence s''applique tant qu''aucune condamnation définitive n''a été prononcée. La personne a droit à un avocat.', 'Examen civique - QCM général', 'Elle est considérée coupable dès son arrestation', 'Elle ne peut pas avoir d''avocat', 'Elle est considérée innocente tant qu''aucune condamnation définitive n''est prononcée', 'Elle doit prouver qu''elle est innocente', 'Une personne est arrêtée par la police. Que signifie la présomption d''innocence ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Une personne est arrêtée par la police. Que signifie la présomption d''innocence ?');

-- Module 4 : Histoire, géographie et culture

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'B', 'Charles de Gaulle est le premier Président de la Ve République, dont la Constitution date de 1958.', 'Examen civique - QCM général', 'Georges Pompidou', 'Charles de Gaulle', 'Napoléon Bonaparte', 'Valéry Giscard d''Estaing', 'Qui est le premier Président de la Ve République ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Qui est le premier Président de la Ve République ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'B', 'Le 11 novembre rend hommage à tous les morts pour la France et rappelle l''armistice de 1918.', 'Examen civique - QCM général', 'La fin de la Seconde Guerre mondiale', 'L''armistice de 1918, fin de la Première Guerre mondiale', 'La prise de la Bastille', 'L''abolition de la peine de mort', 'Que commémore le 11 novembre, jour férié ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Que commémore le 11 novembre, jour férié ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'D', 'L''Allemagne capitule le 8 mai 1945. Le débarquement en Normandie a eu lieu le 6 juin 1944.', 'Examen civique - QCM général', 'La fête du Travail', 'La fin de la Première Guerre mondiale', 'Le débarquement en Normandie', 'La fin de la Seconde Guerre mondiale en Europe en 1945', 'Que commémore le 8 mai, jour férié ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Que commémore le 8 mai, jour férié ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'C', 'Le sommet du Mont-Blanc, dans les Alpes, mesure 4 810 mètres.', 'Examen civique - QCM général', 'Le Piton de la Fournaise', 'Le Puy de Dôme', 'Le Mont-Blanc', 'Le Mont-Saint-Michel', 'Quelle est la plus haute montagne de France ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Quelle est la plus haute montagne de France ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'D', 'Robert Badinter, ministre de François Mitterrand, a soutenu l''abolition totale de la peine de mort.', 'Examen civique - QCM général', 'Simone Veil', 'Christiane Taubira', 'Jules Ferry', 'Robert Badinter', 'Quel ministre de la Justice a fait abolir la peine de mort en 1981 ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Quel ministre de la Justice a fait abolir la peine de mort en 1981 ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'A', 'Les lois de Jules Ferry (1881-1882), sous la IIIe République, ont généralisé l''école gratuite, laïque et obligatoire.', 'Examen civique - QCM général', 'Jules Ferry', 'Napoléon Bonaparte', 'Louis XIV', 'Charles de Gaulle', 'Qui a rendu l''école publique gratuite, laïque et obligatoire dans les années 1880 ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Qui a rendu l''école publique gratuite, laïque et obligatoire dans les années 1880 ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'D', 'En 1848, seuls les hommes votent. Les femmes obtiennent le droit de vote en avril 1944 et votent en avril 1945.', 'Examen civique - QCM général', 'En 1789, avec la Révolution', 'En 1848, avec le suffrage universel', 'En 1974, avec la majorité à 18 ans', 'En avril 1944, et elles ont voté pour la première fois en 1945', 'Quand les Françaises ont-elles obtenu le droit de vote ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Quand les Françaises ont-elles obtenu le droit de vote ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'A', 'Le Louvre, ancien palais royal, abrite « La Joconde » de Léonard de Vinci. Le musée d''Orsay est consacré aux impressionnistes.', 'Examen civique - QCM général', 'Au musée du Louvre', 'Au musée d''Orsay', 'À la tour Eiffel', 'Au château de Versailles', 'Dans quel musée parisien peut-on voir « La Joconde » ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Dans quel musée parisien peut-on voir « La Joconde » ?');

-- Module 5 : Vivre dans la société française

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'D', 'Le 15 est le SAMU. Le 17 est la police, le 18 les pompiers et le 112 le numéro d''urgence européen. Les appels sont gratuits.', 'Examen civique - QCM général', 'Le 17 (police secours)', 'Le 115 (hébergement d''urgence)', 'Le 119 (enfance maltraitée)', 'Le 15 (SAMU)', 'Une personne fait un malaise grave devant vous. Quel numéro d''urgence médicale appelez-vous ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Une personne fait un malaise grave devant vous. Quel numéro d''urgence médicale appelez-vous ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'C', 'Le 3919 est le numéro pour les violences conjugales. Le 3018 est pour le harcèlement scolaire et le 196 pour le secours en mer.', 'Examen civique - QCM général', 'Le 3018', 'Le 196', 'Le 3919', 'Le 114', 'Une femme est victime de violences conjugales. Quel numéro peut-elle appeler ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Une femme est victime de violences conjugales. Quel numéro peut-elle appeler ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'C', 'La carte Vitale justifie les droits à l''Assurance Maladie. Les frais de santé sont remboursés par la CPAM.', 'Examen civique - QCM général', 'À voter aux élections', 'À prendre les transports gratuitement', 'À justifier ses droits à l''Assurance Maladie', 'À prouver sa nationalité française', 'À quoi sert la carte Vitale ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'À quoi sert la carte Vitale ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'C', 'Le Code du travail fixe la durée légale du temps de travail à 35 heures par semaine.', 'Examen civique - QCM général', '25 heures', '39 heures', '35 heures', '48 heures', 'Quelle est la durée légale du travail par semaine en France ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Quelle est la durée légale du travail par semaine en France ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'B', 'Le contrat de travail est obligatoire. Les plus courants sont le CDD (travail temporaire) et le CDI (emploi permanent).', 'Examen civique - QCM général', 'Un bail', 'Un contrat de travail', 'Un acte de naissance', 'Un livret de famille', 'Vous êtes embauché après un entretien. Quel document doit être signé avec l''employeur ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Vous êtes embauché après un entretien. Quel document doit être signé avec l''employeur ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'A', 'Le mariage est possible à 18 ans. À 16 ans, il faut l''autorisation du procureur de la République et l''accord des parents.', 'Examen civique - QCM général', '18 ans', '15 ans', '16 ans, sans aucune condition', '21 ans', 'À partir de quel âge peut-on se marier en France, en principe ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'À partir de quel âge peut-on se marier en France, en principe ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'A', 'L''instruction est obligatoire de 3 à 16 ans. Les parents qui ne scolarisent pas leur enfant risquent des poursuites.', 'Examen civique - QCM général', '16 ans', '12 ans', '14 ans', '18 ans', 'Jusqu''à quel âge l''instruction est-elle obligatoire en France ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Jusqu''à quel âge l''instruction est-elle obligatoire en France ?');

INSERT INTO `exercises` (`correct_answer`, `explanation`, `lesson_title`, `optiona`, `optionb`, `optionc`, `optiond`, `question`, `exercise_type`)
SELECT 'D', 'Conduire avec un taux d''alcool supérieur à 0,8 g/l de sang est un délit très sévèrement sanctionné.', 'Examen civique - QCM général', 'Un simple avertissement', 'Une amende de 68 € seulement', 'Rien, si vous conduisez lentement', 'Jusqu''à 3 ans de prison, 9 000 € d''amende et l''annulation du permis', 'Vous conduisez avec plus de 0,8 g d''alcool par litre de sang. Que risquez-vous ?', 'QCM' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `exercises` WHERE `lesson_title` = 'Examen civique - QCM général' AND `question` = 'Vous conduisez avec plus de 0,8 g d''alcool par litre de sang. Que risquez-vous ?');

-- ===== Quiz général : 15 phrases à compléter (3 par module) =====

-- Module 1 : Principes et valeurs de la République

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Liberté,Égalité', '', 'La devise de la République est « ____, ____, Fraternité ».', 'Examen civique - Quiz général', 'Liberté,Égalité,Solidarité,Unité', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Examen civique - Quiz général' AND `sentence` = 'La devise de la République est « ____, ____, Fraternité ».');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'laïque,sociale', '', 'La France est une République indivisible, ____, démocratique et ____.', 'Examen civique - Quiz général', 'laïque,sociale,fédérale,religieuse', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Examen civique - Quiz général' AND `sentence` = 'La France est une République indivisible, ____, démocratique et ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT '14,Marseillaise', '', 'La fête nationale est célébrée le ____ juillet et l''hymne national s''appelle « La ____ ».', 'Examen civique - Quiz général', '14,1er,Marseillaise,Internationale', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Examen civique - Quiz général' AND `sentence` = 'La fête nationale est célébrée le ____ juillet et l''hymne national s''appelle « La ____ ».');

-- Module 2 : Système institutionnel et politique

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'députés,Sénat', '', 'Les ____ sont élus tous les cinq ans. Le Parlement est composé de l''Assemblée nationale et du ____.', 'Examen civique - Quiz général', 'députés,sénateurs,Sénat,Conseil constitutionnel', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Examen civique - Quiz général' AND `sentence` = 'Les ____ sont élus tous les cinq ans. Le Parlement est composé de l''Assemblée nationale et du ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT '18,listes', '', 'Pour voter en France, il faut avoir la nationalité française, avoir au moins ____ ans et être inscrit sur les ____ électorales.', 'Examen civique - Quiz général', '18,16,listes,cartes', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Examen civique - Quiz général' AND `sentence` = 'Pour voter en France, il faut avoir la nationalité française, avoir au moins ____ ans et être inscrit sur les ____ électorales.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT '27,euro', '', 'L''Union européenne compte ____ États membres. Sa monnaie unique est l''____.', 'Examen civique - Quiz général', '27,28,euro,franc', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Examen civique - Quiz général' AND `sentence` = 'L''Union européenne compte ____ États membres. Sa monnaie unique est l''____.');

-- Module 3 : Droits et devoirs des citoyens

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'nuit,autrui', '', '« La liberté consiste à pouvoir faire tout ce qui ne ____ pas à ____ » (article 4 de la Déclaration de 1789).', 'Examen civique - Quiz général', 'nuit,autrui,plaît,soi', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Examen civique - Quiz général' AND `sentence` = '« La liberté consiste à pouvoir faire tout ce qui ne ____ pas à ____ » (article 4 de la Déclaration de 1789).');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'délits,crimes', '', 'Il existe trois catégories d''infractions : les contraventions, les ____ et les ____.', 'Examen civique - Quiz général', 'délits,crimes,fautes,erreurs', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Examen civique - Quiz général' AND `sentence` = 'Il existe trois catégories d''infractions : les contraventions, les ____ et les ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'revenus,impôts', '', 'Chaque année, toute personne majeure doit déclarer ses ____ et payer ses ____.', 'Examen civique - Quiz général', 'revenus,impôts,dettes,cadeaux', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Examen civique - Quiz général' AND `sentence` = 'Chaque année, toute personne majeure doit déclarer ses ____ et payer ses ____.');

-- Module 4 : Histoire, géographie et culture

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Gaulle,République', '', 'Le général de ____ lance l''appel du 18 juin 1940 et devient le premier Président de la Ve ____.', 'Examen civique - Quiz général', 'Gaulle,République,Napoléon,Empire', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Examen civique - Quiz général' AND `sentence` = 'Le général de ____ lance l''appel du 18 juin 1940 et devient le premier Président de la Ve ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT '1789,Bastille', '', 'La Révolution française commence en ____ avec la prise de la ____.', 'Examen civique - Quiz général', '1789,1870,Bastille,Sorbonne', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Examen civique - Quiz général' AND `sentence` = 'La Révolution française commence en ____ avec la prise de la ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'Loire,4 810', '', 'Le plus long fleuve de France est la ____. Le sommet du Mont-Blanc mesure ____ mètres.', 'Examen civique - Quiz général', 'Loire,Seine,4 810,3 000', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Examen civique - Quiz général' AND `sentence` = 'Le plus long fleuve de France est la ____. Le sommet du Mont-Blanc mesure ____ mètres.');

-- Module 5 : Vivre dans la société française

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT '15,18', '', 'Pour une urgence médicale, j''appelle le ____. Pour les pompiers, j''appelle le ____.', 'Examen civique - Quiz général', '15,17,18,3919', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Examen civique - Quiz général' AND `sentence` = 'Pour une urgence médicale, j''appelle le ____. Pour les pompiers, j''appelle le ____.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT 'CDI,35', '', 'Pour un emploi permanent, on signe un ____. La durée légale du travail est de ____ heures par semaine.', 'Examen civique - Quiz général', 'CDI,CDD,35,39', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Examen civique - Quiz général' AND `sentence` = 'Pour un emploi permanent, on signe un ____. La durée légale du travail est de ____ heures par semaine.');

INSERT INTO `quizzes` (`correct_answers`, `image_url`, `sentence`, `title`, `words`, `quiz_type`)
SELECT '3,16', '', 'L''école est obligatoire de ____ à ____ ans.', 'Examen civique - Quiz général', '3,6,16,18', NULL FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quizzes` WHERE `title` = 'Examen civique - Quiz général' AND `sentence` = 'L''école est obligatoire de ____ à ____ ans.');
