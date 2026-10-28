-- Test de positionnement : remplace les 60 questions de la page /testEval (15 de niveau débutant,
-- 15 élémentaire, 15 intermédiaire et 15 avancé, dans cet ordre) par la nouvelle série corrigée et expliquée.
-- Les questions gardent leurs numéros (424 à 483) : seules leurs données changent. Peut être exécuté plusieurs fois.
-- Sur une base existante :
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_test_positionnement.sql
-- Sur une base neuve, ce script s'exécute automatiquement après frenchdb_8.sql.
-- Les bonnes réponses sont réparties à égalité entre A, B, C et D (15 chacune).
SET NAMES utf8mb4;

-- 1. (A1)
UPDATE `exercises` SET `correct_answer` = 'D', `explanation` = '« Enchanté de vous rencontrer » est une formule naturelle pour faire connaissance. Les autres propositions ne conviennent pas à cette situation : elles évoquent le passé, une hypothèse ou un avis sans rapport.', `lesson_title` = 'Test', `optiona` = 'Je vous ai rencontré hier.', `optionb` = 'Je serais venu demain.', `optionc` = 'Cela dépend de ce que vous en pensez.', `optiond` = 'Enchanté de vous rencontrer.', `question` = 'Vous rencontrez une personne pour la première fois. Que dites-vous ?' WHERE `id` = 424 AND `lesson_title` LIKE 'Test%';

-- 2. (A1)
UPDATE `exercises` SET `correct_answer` = 'C', `explanation` = '« Combien coûte… ? » sert à demander un prix. « Depuis quand » interroge une durée, tandis que les autres formulations ne sont pas grammaticalement adaptées.', `lesson_title` = 'Test', `optiona` = 'Depuis quand coûte le café ?', `optionb` = 'Qui coûte le café ?', `optionc` = 'Combien coûte le café ?', `optiond` = 'À qui le café coûte ?', `question` = 'Vous voulez connaître le prix d’un café. Quelle question posez-vous ?' WHERE `id` = 425 AND `lesson_title` LIKE 'Test%';

-- 3. (A1)
UPDATE `exercises` SET `correct_answer` = 'A', `explanation` = 'Avec le sujet « je », le verbe être se conjugue « je suis ». « Es » accompagne « tu », « est » accompagne « il/elle/on » et « sommes » accompagne « nous ».', `lesson_title` = 'Test', `optiona` = 'suis', `optionb` = 'es', `optionc` = 'est', `optiond` = 'sommes', `question` = 'Complétez : « Je ___ français et j’habite à Lyon. »' WHERE `id` = 426 AND `lesson_title` LIKE 'Test%';

-- 4. (A1)
UPDATE `exercises` SET `correct_answer` = 'C', `explanation` = '« Sœur » est un nom féminin : on dit « une sœur ». « Frère » est masculin : on dit « un frère ».', `lesson_title` = 'Test', `optiona` = 'un / une', `optionb` = 'des / une', `optionc` = 'une / un', `optiond` = 'la / les', `question` = 'Complétez : « Elle a ___ sœur et ___ frère. »' WHERE `id` = 427 AND `lesson_title` LIKE 'Test%';

-- 5. (A1)
UPDATE `exercises` SET `correct_answer` = 'B', `explanation` = 'Le texte précise explicitement « sauf le dimanche » : c’est donc le jour de fermeture hebdomadaire mentionné.', `lesson_title` = 'Test', `optiona` = 'Le lundi', `optionb` = 'Le dimanche', `optionc` = 'À 9 h', `optiond` = 'À 18 h', `question` = 'Lisez : « La bibliothèque ouvre à 9 h et ferme à 18 h, sauf le dimanche. » Quand est-elle fermée chaque semaine ?' WHERE `id` = 428 AND `lesson_title` LIKE 'Test%';

-- 6. (A1)
UPDATE `exercises` SET `correct_answer` = 'B', `explanation` = 'Au présent, les verbes réguliers en -er prennent généralement la terminaison -ons avec « nous » : nous habitons.', `lesson_title` = 'Test', `optiona` = 'Nous habite à Paris.', `optionb` = 'Nous habitons à Paris.', `optionc` = 'Nous habitez à Paris.', `optiond` = 'Nous habites à Paris.', `question` = 'Choisissez la phrase correcte.' WHERE `id` = 429 AND `lesson_title` LIKE 'Test%';

-- 7. (A1)
UPDATE `exercises` SET `correct_answer` = 'C', `explanation` = 'La boulangerie est le commerce où l’on achète du pain. La pharmacie vend notamment des médicaments, la mairie accueille les services municipaux et la gare sert aux transports.', `lesson_title` = 'Test', `optiona` = 'Une pharmacie', `optionb` = 'Une mairie', `optionc` = 'Une boulangerie', `optiond` = 'Une gare', `question` = 'Quel mot désigne un endroit où l’on achète du pain ?' WHERE `id` = 430 AND `lesson_title` LIKE 'Test%';

-- 8. (A1)
UPDATE `exercises` SET `correct_answer` = 'D', `explanation` = '« De rien » est une réponse courante pour accueillir un remerciement. « Avec plaisir » ou « Je vous en prie » seraient également possibles.', `lesson_title` = 'Test', `optiona` = 'Je m’appelle Paul.', `optionb` = 'Il est huit heures.', `optionc` = 'Je viens de Marseille.', `optiond` = 'De rien.', `question` = 'Un collègue vous dit : « Merci pour votre aide ! » Que répondez-vous ?' WHERE `id` = 431 AND `lesson_title` LIKE 'Test%';

-- 9. (A1)
UPDATE `exercises` SET `correct_answer` = 'A', `explanation` = 'Le sujet « je » commande la forme « bois » au présent : je bois. Dans la négation, « ne… pas » encadre le verbe : je ne bois pas.', `lesson_title` = 'Test', `optiona` = 'bois', `optionb` = 'boit', `optionc` = 'boivent', `optiond` = 'buvons', `question` = 'Complétez : « Je ne ___ pas de café. »' WHERE `id` = 432 AND `lesson_title` LIKE 'Test%';

-- 10. (A1)
UPDATE `exercises` SET `correct_answer` = 'A', `explanation` = 'L’instruction dit explicitement « devant la gare ». Il faut distinguer « devant » de « dans » ou « à l’intérieur ».', `lesson_title` = 'Test', `optiona` = 'Devant la gare', `optionb` = 'Dans le train', `optionc` = 'Au bureau', `optiond` = 'Chez soi', `question` = 'Message : « Bonjour, je suis en retard de dix minutes. Attendez-moi devant la gare. » Où faut-il attendre ?' WHERE `id` = 433 AND `lesson_title` LIKE 'Test%';

-- 11. (A1)
UPDATE `exercises` SET `correct_answer` = 'D', `explanation` = 'Le verbe aller au présent se conjugue « nous allons ». « Vais » correspond à « je », « va » à « il/elle/on » et « allez » à « vous ».', `lesson_title` = 'Test', `optiona` = 'vais', `optionb` = 'va', `optionc` = 'allez', `optiond` = 'allons', `question` = 'Complétez : « Nous ___ à l’école à pied. »' WHERE `id` = 434 AND `lesson_title` LIKE 'Test%';

-- 12. (A1)
UPDATE `exercises` SET `correct_answer` = 'B', `explanation` = 'L’ordre des jours est lundi, mardi, mercredi, jeudi, vendredi, samedi et dimanche. Jeudi vient donc après mercredi.', `lesson_title` = 'Test', `optiona` = 'Mardi', `optionb` = 'Jeudi', `optionc` = 'Vendredi', `optiond` = 'Dimanche', `question` = 'Quel jour vient après mercredi ?' WHERE `id` = 435 AND `lesson_title` LIKE 'Test%';

-- 13. (A1)
UPDATE `exercises` SET `correct_answer` = 'A', `explanation` = 'Le nom « pommes » prend un -s au pluriel, et l’adjectif « rouges » s’accorde aussi avec le nom : deux pommes rouges.', `lesson_title` = 'Test', `optiona` = 'Deux pommes rouges.', `optionb` = 'Deux pomme rouge.', `optionc` = 'Deux pommes rouge.', `optiond` = 'Deux pomme rouges.', `question` = 'Choisissez la phrase correctement accordée.' WHERE `id` = 436 AND `lesson_title` LIKE 'Test%';

-- 14. (A1)
UPDATE `exercises` SET `correct_answer` = 'B', `explanation` = 'Demander de répéter poliment est une stratégie essentielle de communication. La formulation associe une demande claire à une marque de politesse.', `lesson_title` = 'Test', `optiona` = 'Vous avez tort.', `optionb` = 'Pouvez-vous répéter, s’il vous plaît ?', `optionc` = 'Je répète demain.', `optiond` = 'Je suis d’accord avec tout.', `question` = 'Vous n’avez pas compris. Quelle phrase est la plus adaptée ?' WHERE `id` = 437 AND `lesson_title` LIKE 'Test%';

-- 15. (A1)
UPDATE `exercises` SET `correct_answer` = 'C', `explanation` = '« Hier » situe l’action dans un passé terminé. Pour exprimer un déplacement accompli, on emploie couramment le passé composé : « je suis allé(e) ».', `lesson_title` = 'Test', `optiona` = 'vais', `optionb` = 'irai', `optionc` = 'suis allé(e)', `optiond` = 'allais toujours', `question` = 'Complétez : « Hier, je ___ au marché. »' WHERE `id` = 438 AND `lesson_title` LIKE 'Test%';

-- 16. (A2)
UPDATE `exercises` SET `correct_answer` = 'B', `explanation` = '« Déplacé à jeudi » signifie que le cours n’aura plus lieu mardi, mais jeudi. L’heure reste 18 h ; « salle 4 » est le numéro de salle, pas l’heure.', `lesson_title` = 'Test', `optiona` = 'Mardi à 18 h', `optionb` = 'Jeudi à 18 h', `optionc` = 'Jeudi à 4 h', `optiond` = 'Vendredi à 18 h', `question` = 'Annonce : « Le cours de mardi est déplacé à jeudi, à 18 h, dans la salle 4. » Quand a lieu le cours ?' WHERE `id` = 439 AND `lesson_title` LIKE 'Test%';

-- 17. (A2)
UPDATE `exercises` SET `correct_answer` = 'C', `explanation` = 'Le plus-que-parfait (« avaient commencé ») marque une action déjà accomplie avant un autre moment passé (« je suis arrivé »).', `lesson_title` = 'Test', `optiona` = 'ont', `optionb` = 'auront', `optionc` = 'avaient', `optiond` = 'sont', `question` = 'Complétez : « Quand je suis arrivé, ils ___ déjà commencé le repas. »' WHERE `id` = 440 AND `lesson_title` LIKE 'Test%';

-- 18. (A2)
UPDATE `exercises` SET `correct_answer` = 'B', `explanation` = 'Le dentiste est le professionnel de santé spécialisé dans les dents. Les autres métiers n’ont pas cette fonction.', `lesson_title` = 'Test', `optiona` = 'Un boulanger', `optionb` = 'Un dentiste', `optionc` = 'Un mécanicien', `optiond` = 'Un facteur', `question` = 'Vous avez mal à une dent. Quel professionnel contactez-vous ?' WHERE `id` = 441 AND `lesson_title` LIKE 'Test%';

-- 19. (A2)
UPDATE `exercises` SET `correct_answer` = 'C', `explanation` = '« Demain » renvoie au futur. « Nous allons visiter » est le futur proche : aller au présent suivi de l’infinitif.', `lesson_title` = 'Test', `optiona` = 'sommes', `optionb` = 'avons', `optionc` = 'allons', `optiond` = 'étions', `question` = 'Complétez : « Demain, nous ___ visiter le musée. »' WHERE `id` = 442 AND `lesson_title` LIKE 'Test%';

-- 20. (A2)
UPDATE `exercises` SET `correct_answer` = 'D', `explanation` = 'La ligne est interrompue et un service de remplacement est annoncé. Le texte ne précise pas que le train est obligatoire ni que les voyageurs doivent se rendre au dépôt.', `lesson_title` = 'Test', `optiona` = 'Prendre obligatoirement le train', `optionb` = 'Attendre jusqu’au mois prochain', `optionc` = 'Se rendre au dépôt de bus', `optiond` = 'Utiliser le service de remplacement s’ils en ont besoin', `question` = '« En raison de travaux, la ligne de bus est interrompue jusqu’à vendredi. Un service de remplacement est prévu. » Que doivent faire les voyageurs ?' WHERE `id` = 443 AND `lesson_title` LIKE 'Test%';

-- 21. (A2)
UPDATE `exercises` SET `correct_answer` = 'D', `explanation` = '« Connaître quelqu’un » se construit avec un complément d’objet direct. Le pronom COD qui remplace « Marie » est « la » : je la connais.', `lesson_title` = 'Test', `optiona` = 'lui', `optionb` = 'leur', `optionc` = 'y', `optiond` = 'la', `question` = 'Choisissez le pronom correct : « Tu connais Marie ? Oui, je ___ connais. »' WHERE `id` = 444 AND `lesson_title` LIKE 'Test%';

-- 22. (A2)
UPDATE `exercises` SET `correct_answer` = 'A', `explanation` = '« Pourriez-vous… ? » est une demande polie construite avec le conditionnel. Elle convient à une interaction avec un voisin.', `lesson_title` = 'Test', `optiona` = 'Pourriez-vous baisser un peu la musique, s’il vous plaît ?', `optionb` = 'Baisse ça immédiatement !', `optionc` = 'Vous baissez la musique hier.', `optiond` = 'La musique est baissée par moi.', `question` = 'Vous souhaitez demander poliment à un voisin de baisser la musique. Que dites-vous ?' WHERE `id` = 445 AND `lesson_title` LIKE 'Test%';

-- 23. (A2)
UPDATE `exercises` SET `correct_answer` = 'B', `explanation` = '« Donc » introduit la conséquence : il pleuvait, donc nous avons pris un parapluie. « Pourtant » introduirait plutôt une opposition.', `lesson_title` = 'Test', `optiona` = 'pourtant', `optionb` = 'donc', `optionc` = 'parce que', `optiond` = 'bien que', `question` = '« Il pleuvait, ___ nous avons pris un parapluie. »' WHERE `id` = 446 AND `lesson_title` LIKE 'Test%';

-- 24. (A2)
UPDATE `exercises` SET `correct_answer` = 'A', `explanation` = 'Reporter un rendez-vous signifie le remettre à une date ou une heure ultérieure, pas nécessairement l’annuler.', `lesson_title` = 'Test', `optiona` = 'déplacé à un autre moment', `optionb` = 'annulé définitivement', `optionc` = 'déjà terminé', `optiond` = 'plus court que prévu', `question` = '« Un rendez-vous est reporté » signifie qu’il est…' WHERE `id` = 447 AND `lesson_title` LIKE 'Test%';

-- 25. (A2)
UPDATE `exercises` SET `correct_answer` = 'B', `explanation` = '« Depuis trois semaines » indique une durée qui a commencé dans le passé et qui continue au moment où l’on parle.', `lesson_title` = 'Test', `optiona` = 'pendant que', `optionb` = 'depuis', `optionc` = 'dans que', `optiond` = 'il y a depuis', `question` = 'Complétez : « J’habite ici ___ trois semaines. »' WHERE `id` = 448 AND `lesson_title` LIKE 'Test%';

-- 26. (A2)
UPDATE `exercises` SET `correct_answer` = 'D', `explanation` = 'La cause est donnée explicitement après les deux-points : son fils est malade. La proposition de samedi matin montre qu’elle souhaite reporter la rencontre.', `lesson_title` = 'Test', `optiona` = 'Elle travaille samedi.', `optionb` = 'Elle part en vacances.', `optionc` = 'Elle a oublié l’adresse.', `optiond` = 'Son fils est malade.', `question` = 'Courriel : « Je ne pourrai pas venir ce soir : mon fils est malade. Peut-on se voir samedi matin ? » Pourquoi la personne annule-t-elle ?' WHERE `id` = 449 AND `lesson_title` LIKE 'Test%';

-- 27. (A2)
UPDATE `exercises` SET `correct_answer` = 'C', `explanation` = 'L’expression « il faut que » est suivie du subjonctif. Le subjonctif présent de venir avec « tu » est « que tu viennes ».', `lesson_title` = 'Test', `optiona` = 'Il faut que tu viens.', `optionb` = 'Il faut que tu viendras.', `optionc` = 'Il faut que tu viennes.', `optiond` = 'Il faut que tu venu.', `question` = 'Choisissez la phrase correcte.' WHERE `id` = 450 AND `lesson_title` LIKE 'Test%';

-- 28. (A2)
UPDATE `exercises` SET `correct_answer` = 'D', `explanation` = 'La phrase signale le problème avec tact et précision. « Excusez-moi » et « je crois qu’il y a une erreur » permettent de demander une vérification sans agressivité.', `lesson_title` = 'Test', `optiona` = 'Je n’ai jamais de billet hier.', `optionb` = 'Donnez-moi le train.', `optionc` = 'Je suis le billet.', `optiond` = 'Excusez-moi, je crois qu’il y a une erreur sur mon billet.', `question` = 'Au guichet, vous n’avez pas reçu le bon billet. Que dites-vous ?' WHERE `id` = 451 AND `lesson_title` LIKE 'Test%';

-- 29. (A2)
UPDATE `exercises` SET `correct_answer` = 'C', `explanation` = 'Le verbe pronominal « se lever » utilise être au passé composé, mais « préparer » est ici un verbe non pronominal qui se conjugue avec avoir : elle a préparé.', `lesson_title` = 'Test', `optiona` = 'est', `optionb` = 'avait de', `optionc` = 'a', `optiond` = 'sera', `question` = 'Complétez : « Elle s’est levée tôt, puis elle ___ préparé le petit-déjeuner. »' WHERE `id` = 452 AND `lesson_title` LIKE 'Test%';

-- 30. (A2)
UPDATE `exercises` SET `correct_answer` = 'A', `explanation` = '« Il vaut mieux » exprime un conseil ou une préférence. La phrase recommande de réserver avant la limite indiquée.', `lesson_title` = 'Test', `optiona` = 'réserver au plus tard avant vendredi', `optionb` = 'réserver après vendredi', `optionc` = 'ne jamais réserver', `optiond` = 'annuler vendredi', `question` = '« Il vaut mieux réserver avant vendredi » signifie qu’il est préférable de…' WHERE `id` = 453 AND `lesson_title` LIKE 'Test%';

-- 31. (B1)
UPDATE `exercises` SET `correct_answer` = 'C', `explanation` = 'Le texte indique un avantage (moins de temps dans les transports) et une difficulté (mieux organiser ses journées et garder le contact). « En revanche » signale le contraste.', `lesson_title` = 'Test', `optiona` = 'Plus de réunions, mais moins de travail.', `optionb` = 'Un salaire plus élevé, mais un déménagement.', `optionc` = 'Moins de transport, mais davantage d’organisation.', `optiond` = 'Moins de responsabilités, mais plus de trajets.', `question` = '« Depuis qu’elle travaille à distance deux jours par semaine, Nora passe moins de temps dans les transports. En revanche, elle doit mieux organiser ses journées pour garder le contact avec son équipe. » Quel avantage et quelle difficulté sont mentionnés ?' WHERE `id` = 454 AND `lesson_title` LIKE 'Test%';

-- 32. (B1)
UPDATE `exercises` SET `correct_answer` = 'B', `explanation` = 'Dans une hypothèse présente ou future peu probable, on emploie généralement l’imparfait après « si » et le conditionnel présent dans la proposition principale : si j’avais…, je suivrais…', `lesson_title` = 'Test', `optiona` = 'suivrai', `optionb` = 'suivrais', `optionc` = 'avais suivi', `optiond` = 'suis suivi', `question` = 'Complétez : « Si j’avais davantage de temps, je ___ un cours de théâtre. »' WHERE `id` = 455 AND `lesson_title` LIKE 'Test%';

-- 33. (B1)
UPDATE `exercises` SET `correct_answer` = 'D', `explanation` = '« Pourtant » marque une opposition entre la difficulté attendue (un trajet long) et le résultat (arriver à l’heure).', `lesson_title` = 'Test', `optiona` = 'Parce que', `optionb` = 'Donc que', `optionc` = 'Puisque de', `optiond` = 'Pourtant', `question` = '« Le trajet était long. ___, nous sommes arrivés à l’heure. »' WHERE `id` = 456 AND `lesson_title` LIKE 'Test%';

-- 34. (B1)
UPDATE `exercises` SET `correct_answer` = 'D', `explanation` = 'La première phrase énonce l’objectif, et les actions citées sont des moyens d’y parvenir.', `lesson_title` = 'Test', `optiona` = 'Augmenter les achats neufs', `optionb` = 'Interdire toutes les réparations', `optionc` = 'Fermer les commerces', `optiond` = 'Réduire la quantité de déchets', `question` = '« La mairie souhaite réduire les déchets. Elle encourage les habitants à réparer les objets, à acheter d’occasion et à mieux trier. » Quel est l’objectif principal ?' WHERE `id` = 457 AND `lesson_title` LIKE 'Test%';

-- 35. (B1)
UPDATE `exercises` SET `correct_answer` = 'B', `explanation` = 'Le plus-que-parfait « avait commencé » exprime une action antérieure à une autre action passée : le film avait commencé avant mon arrivée.', `lesson_title` = 'Test', `optiona` = 'Quand je suis arrivé, le film commencera.', `optionb` = 'Quand je suis arrivé, le film avait déjà commencé.', `optionc` = 'Quand je suis arrivé, le film commence demain.', `optiond` = 'Quand je suis arrivé, le film aurait commencer.', `question` = 'Choisissez la phrase qui exprime correctement une antériorité dans le passé.' WHERE `id` = 458 AND `lesson_title` LIKE 'Test%';

-- 36. (B1)
UPDATE `exercises` SET `correct_answer` = 'C', `explanation` = 'Une mesure pertinente est appropriée au problème traité et répond utilement à la situation.', `lesson_title` = 'Test', `optiona` = 'très ancienne', `optionb` = 'impossible à comprendre', `optionc` = 'adaptée au sujet et utile', `optiond` = 'obligatoirement coûteuse', `question` = 'Dans « Cette mesure est pertinente », « pertinente » signifie…' WHERE `id` = 459 AND `lesson_title` LIKE 'Test%';

-- 37. (B1)
UPDATE `exercises` SET `correct_answer` = 'A', `explanation` = 'Cette réponse reconnaît le point de vue de l’autre tout en exprimant un désaccord. C’est une stratégie de discussion constructive.', `lesson_title` = 'Test', `optiona` = 'Je vois ton point de vue, mais j’ai une autre interprétation.', `optionb` = 'Tu n’as rien compris.', `optionc` = 'La conversation est interdite.', `optiond` = 'Je ne t’écouterai jamais.', `question` = 'Un ami n’est pas d’accord avec vous. Quelle réponse favorise une discussion constructive ?' WHERE `id` = 460 AND `lesson_title` LIKE 'Test%';

-- 38. (B1)
UPDATE `exercises` SET `correct_answer` = 'A', `explanation` = 'Le sujet « le dossier » subit l’action : on utilise la voix passive au passé composé, « a été vérifié ».', `lesson_title` = 'Test', `optiona` = 'a été vérifié', `optionb` = 'a vérifié', `optionc` = 'est vérifier', `optiond` = 'avait vérifier', `question` = 'Complétez : « Le dossier ___ par la responsable hier. »' WHERE `id` = 461 AND `lesson_title` LIKE 'Test%';

-- 39. (B1)
UPDATE `exercises` SET `correct_answer` = 'B', `explanation` = 'L’expression « grâce à » introduit la cause positive qui a permis le résultat : la réorganisation de l’équipe.', `lesson_title` = 'Test', `optiona` = 'L’abandon du projet', `optionb` = 'La réorganisation de l’équipe', `optionc` = 'La suppression de tous les tests', `optiond` = 'L’absence de retard', `question` = '« Malgré plusieurs retards, le projet a été livré dans les délais grâce à une réorganisation de l’équipe. » Qu’est-ce qui a permis de respecter le délai ?' WHERE `id` = 462 AND `lesson_title` LIKE 'Test%';

-- 40. (B1)
UPDATE `exercises` SET `correct_answer` = 'D', `explanation` = 'Dans le discours indirect avec un verbe introducteur au passé, le futur devient généralement un conditionnel présent : « elle reviendrait le lendemain ».', `lesson_title` = 'Test', `optiona` = 'reviendra', `optionb` = 'revient demain', `optionc` = 'est revenue demain', `optiond` = 'reviendrait', `question` = 'Complétez : « Elle m’a expliqué qu’elle ___ le lendemain. »' WHERE `id` = 463 AND `lesson_title` LIKE 'Test%';

-- 41. (B1)
UPDATE `exercises` SET `correct_answer` = 'D', `explanation` = '« Par conséquent » introduit une conséquence. « Bien que » exprime la concession, « en revanche » l’opposition et « à condition que » une condition.', `lesson_title` = 'Test', `optiona` = 'Bien que', `optionb` = 'En revanche', `optionc` = 'À condition que', `optiond` = 'Par conséquent', `question` = 'Quel connecteur introduit le mieux une conséquence ?' WHERE `id` = 464 AND `lesson_title` LIKE 'Test%';

-- 42. (B1)
UPDATE `exercises` SET `correct_answer` = 'A', `explanation` = 'La phrase oppose l’avantage de la flexibilité à un inconvénient : les échanges spontanés sont moins présents.', `lesson_title` = 'Test', `optiona` = 'Flexibilité et manque d’échanges spontanés', `optionb` = 'Prix élevé et absence d’Internet', `optionc` = 'Cours courts et examens faciles', `optiond` = 'Présence obligatoire et horaires fixes', `question` = '« Les cours en ligne offrent de la flexibilité, mais certains apprenants regrettent les échanges spontanés d’une salle de classe. » Quelle opposition est exprimée ?' WHERE `id` = 465 AND `lesson_title` LIKE 'Test%';

-- 43. (B1)
UPDATE `exercises` SET `correct_answer` = 'A', `explanation` = '« Bien que » est suivi du subjonctif. La forme attendue est « bien qu’il soit fatigué ».', `lesson_title` = 'Test', `optiona` = 'soit', `optionb` = 'est', `optionc` = 'sera', `optiond` = 'était de', `question` = 'Complétez : « Bien qu’il ___ fatigué, il a terminé son travail. »' WHERE `id` = 466 AND `lesson_title` LIKE 'Test%';

-- 44. (B1)
UPDATE `exercises` SET `correct_answer` = 'C', `explanation` = '« Finir par » indique qu’une action se produit finalement, souvent après un délai ou une hésitation.', `lesson_title` = 'Test', `optiona` = 'a refusé immédiatement', `optionb` = 'n’a pas compris la demande', `optionc` = 'a accepté finalement', `optiond` = 'a oublié de répondre', `question` = '« Elle a fini par accepter » signifie qu’elle…' WHERE `id` = 467 AND `lesson_title` LIKE 'Test%';

-- 45. (B1)
UPDATE `exercises` SET `correct_answer` = 'C', `explanation` = 'La phrase exprime clairement une opinion (« À mon avis ») et la justifie avec « parce que ».', `lesson_title` = 'Test', `optiona` = 'Les transports. Hier. Peut-être.', `optionb` = 'Voiture bleu aller.', `optionc` = 'À mon avis, les transports en commun sont utiles parce qu’ils réduisent le nombre de voitures.', `optiond` = 'Je transports en commun.', `question` = 'Quelle phrase donne un avis avec une justification ?' WHERE `id` = 468 AND `lesson_title` LIKE 'Test%';

-- 46. (B2)
UPDATE `exercises` SET `correct_answer` = 'A', `explanation` = '« Bien que » introduit une concession : malgré le délai court, l’action sera réalisée. Le subjonctif « soit » est correctement employé.', `lesson_title` = 'Test', `optiona` = 'Bien que le délai soit court, nous présenterons une proposition complète.', `optionb` = 'Puisque le délai est court, nous avons commencé.', `optionc` = 'Le délai est court, donc nous avons commencé.', `optiond` = 'Le délai est court parce que nous avons commencé.', `question` = 'Quelle phrase exprime une concession ?' WHERE `id` = 469 AND `lesson_title` LIKE 'Test%';

-- 47. (B2)
UPDATE `exercises` SET `correct_answer` = 'C', `explanation` = 'Il s’agit d’une hypothèse irréelle dans le passé : « si » + plus-que-parfait, puis conditionnel passé (« aurions pris »).', `lesson_title` = 'Test', `optiona` = 'prendrons', `optionb` = 'prenions', `optionc` = 'aurions pris', `optiond` = 'avons pris', `question` = 'Complétez : « Si le rapport avait été transmis plus tôt, nous ___ la décision hier. »' WHERE `id` = 470 AND `lesson_title` LIKE 'Test%';

-- 48. (B2)
UPDATE `exercises` SET `correct_answer` = 'B', `explanation` = '« Pour peu que » signifie « à condition que ». Les conditions sont la clarté des objectifs et le maintien des échanges collectifs.', `lesson_title` = 'Test', `optiona` = 'Tous les salariés doivent travailler seuls.', `optionb` = 'Les objectifs doivent être clairs et les échanges maintenus.', `optionc` = 'Les réunions doivent être supprimées.', `optiond` = 'Le télétravail doit être interdit.', `question` = '« Le télétravail peut améliorer l’autonomie, pour peu que les objectifs soient clairement définis et que les échanges collectifs ne soient pas négligés. » Quelle condition est formulée ?' WHERE `id` = 471 AND `lesson_title` LIKE 'Test%';

-- 49. (B2)
UPDATE `exercises` SET `correct_answer` = 'B', `explanation` = 'Le conditionnel et la formulation indirecte rendent la demande polie et adaptée à un contexte professionnel formel.', `lesson_title` = 'Test', `optiona` = 'File-moi plus de temps.', `optionb` = 'Serait-il possible de bénéficier d’un délai supplémentaire ?', `optionc` = 'Tu dois me donner du temps, point.', `optiond` = 'Je veux ça maintenant, merci.', `question` = 'Dans un courriel professionnel, quelle formulation est la plus appropriée pour demander un délai supplémentaire ?' WHERE `id` = 472 AND `lesson_title` LIKE 'Test%';

-- 50. (B2)
UPDATE `exercises` SET `correct_answer` = 'C', `explanation` = '« Il est indispensable que » appelle le subjonctif. « Respecte » est ici la forme du subjonctif présent, identique à l’indicatif pour « il/elle » dans ce verbe.', `lesson_title` = 'Test', `optiona` = 'Il est indispensable que chacun respecte les consignes hier.', `optionb` = 'Il est indispensable que chacun respectera les consignes.', `optionc` = 'Il est indispensable que chacun respecte les consignes.', `optiond` = 'Il est indispensable que chacun respecter les consignes.', `question` = 'Choisissez la formulation correcte.' WHERE `id` = 473 AND `lesson_title` LIKE 'Test%';

-- 51. (B2)
UPDATE `exercises` SET `correct_answer` = 'D', `explanation` = 'L’auteur reconnaît l’objectif de simplification, mais signale un risque pour les personnes qui maîtrisent peu les outils numériques.', `lesson_title` = 'Test', `optiona` = 'La réforme ne simplifie aucune démarche et n’a aucun objectif.', `optionb` = 'Tous les usagers maîtrisent parfaitement le numérique.', `optionc` = 'La réforme concerne uniquement les enfants.', `optiond` = 'La réforme pourrait pénaliser certains usagers malgré son objectif.', `question` = '« Si la réforme vise à simplifier les démarches, sa mise en œuvre risque toutefois d’accentuer les difficultés des personnes peu à l’aise avec le numérique. » Quelle réserve l’auteur formule-t-il ?' WHERE `id` = 474 AND `lesson_title` LIKE 'Test%';

-- 52. (B2)
UPDATE `exercises` SET `correct_answer` = 'B', `explanation` = 'Une conclusion « hâtive » est formulée trop vite, sans prendre suffisamment le temps d’examiner les faits ou les arguments.', `lesson_title` = 'Test', `optiona` = 'longue et détaillée', `optionb` = 'tirée trop rapidement, sans examen suffisant', `optionc` = 'officiellement obligatoire', `optiond` = 'impossible à exprimer', `question` = '« Cette conclusion est hâtive » signifie que la conclusion est…' WHERE `id` = 475 AND `lesson_title` LIKE 'Test%';

-- 53. (B2)
UPDATE `exercises` SET `correct_answer` = 'A', `explanation` = 'Avec « a déclaré » au passé, le futur simple devient généralement le conditionnel présent (« terminerait ») et « demain » devient « le lendemain ».', `lesson_title` = 'Test', `optiona` = 'Elle a déclaré qu’elle terminerait ce dossier le lendemain.', `optionb` = 'Elle a déclaré qu’elle terminera ce dossier hier.', `optionc` = 'Elle a déclaré qu’elle termine ce dossier demain, hier.', `optiond` = 'Elle a déclaré de terminer ce dossier.', `question` = 'Transformez au discours indirect : « Elle a déclaré : “Je terminerai ce dossier demain.” »' WHERE `id` = 476 AND `lesson_title` LIKE 'Test%';

-- 54. (B2)
UPDATE `exercises` SET `correct_answer` = 'A', `explanation` = '« Néanmoins » introduit une réserve ou une opposition qui limite ce qui vient d’être dit. « En effet » explique, « par conséquent » conclut et « de surcroît » ajoute.', `lesson_title` = 'Test', `optiona` = 'Néanmoins', `optionb` = 'En effet', `optionc` = 'Par conséquent', `optiond` = 'De surcroît', `question` = 'Quel connecteur convient pour introduire une restriction ?' WHERE `id` = 477 AND `lesson_title` LIKE 'Test%';

-- 55. (B2)
UPDATE `exercises` SET `correct_answer` = 'C', `explanation` = 'L’auteur ne condamne pas l’innovation ; il demande de ne pas l’adopter trop vite sans évaluer ses effets à long terme.', `lesson_title` = 'Test', `optiona` = 'Il refuse toute innovation.', `optionb` = 'Il considère que toute innovation est sans risque.', `optionc` = 'Il accepte l’innovation, mais demande d’évaluer ses conséquences.', `optiond` = 'Il ne formule aucune réserve.', `question` = '« L’auteur ne rejette pas l’innovation en soi ; il met plutôt en garde contre son adoption précipitée, sans évaluation de ses effets à long terme. » Quelle est la position de l’auteur ?' WHERE `id` = 478 AND `lesson_title` LIKE 'Test%';

-- 56. (B2)
UPDATE `exercises` SET `correct_answer` = 'D', `explanation` = '« Il aurait fallu que » appelle le subjonctif. « Anticipent » est le subjonctif présent de « anticiper » à la troisième personne du pluriel.', `lesson_title` = 'Test', `optiona` = 'anticiperont', `optionb` = 'ont anticipé', `optionc` = 'anticipaient hier obligatoirement', `optiond` = 'anticipent', `question` = 'Complétez : « Encore aurait-il fallu que les responsables ___ les conséquences. »' WHERE `id` = 479 AND `lesson_title` LIKE 'Test%';

-- 57. (B2)
UPDATE `exercises` SET `correct_answer` = 'A', `explanation` = '« Certes » introduit une concession ou une objection reconnue ; « toutefois » apporte la nuance qui rééquilibre l’argumentation.', `lesson_title` = 'Test', `optiona` = 'Certes, cette solution coûte cher ; toutefois, elle réduit les dépenses à long terme.', `optionb` = 'Cette solution coûte cher. La table est ronde.', `optionc` = 'Cette solution coûte cher donc elle est gratuite.', `optiond` = 'La solution est une solution.', `question` = 'Quelle phrase formule une objection puis y répond ?' WHERE `id` = 480 AND `lesson_title` LIKE 'Test%';

-- 58. (B2)
UPDATE `exercises` SET `correct_answer` = 'D', `explanation` = 'Pour une hypothèse irréelle passée, la structure attendue est « si » + plus-que-parfait (« avions anticipé ») et conditionnel passé (« aurions évité »).', `lesson_title` = 'Test', `optiona` = 'Si nous aurions mieux anticipé, nous évitons ce problème.', `optionb` = 'Si nous anticipons hier, nous éviterons ce problème.', `optionc` = 'Si nous avions mieux anticipé, nous évitons demain ce problème.', `optiond` = 'Si nous avions mieux anticipé, nous aurions évité ce problème.', `question` = 'Quelle phrase exprime correctement une hypothèse irréelle dans le passé ?' WHERE `id` = 481 AND `lesson_title` LIKE 'Test%';

-- 59. (B2)
UPDATE `exercises` SET `correct_answer` = 'D', `explanation` = 'Le texte affirme qu’il ne faut pas juger une politique uniquement sur ses résultats immédiats : il faut aussi considérer ses effets durables et indirects.', `lesson_title` = 'Test', `optiona` = 'Uniquement la rapidité de lancement', `optionb` = 'Le nombre de communiqués de presse', `optionc` = 'La popularité immédiate uniquement', `optiond` = 'Les effets à long terme et les conséquences indirectes', `question` = '« L’efficacité d’une politique publique ne saurait être appréciée à l’aune de ses seuls résultats immédiats ; elle doit également être examinée au regard de ses effets durables et de ses conséquences indirectes. » Quel critère supplémentaire est défendu ?' WHERE `id` = 482 AND `lesson_title` LIKE 'Test%';

-- 60. (B2)
UPDATE `exercises` SET `correct_answer` = 'B', `explanation` = 'Cette proposition reconnaît des avantages tout en formulant une condition et en attirant l’attention sur les coûts et les effets sociaux : elle est nuancée et équilibrée.', `lesson_title` = 'Test', `optiona` = 'La mesure est parfaite parce que je le dis.', `optionb` = 'La mesure présente des avantages réels, à condition que ses coûts et ses effets sur les publics fragiles soient suivis.', `optionc` = 'La mesure est mauvaise dans tous les cas, sans exception.', `optiond` = 'La mesure est un mot dans une phrase.', `question` = 'Quelle phrase synthétise le mieux une argumentation équilibrée ?' WHERE `id` = 483 AND `lesson_title` LIKE 'Test%';

-- Contrôle : doit afficher 60
SELECT COUNT(*) AS questions_du_test FROM `exercises` WHERE `lesson_title` = 'Test';
