-- Test de positionnement : indique le niveau de chaque question (15 par niveau, dans l'ordre des numéros 424 à 483).
-- La page /testEval s'en sert pour calculer le niveau bloc par bloc.
-- À lancer APRÈS frenchdb_9_test_positionnement.sql. Peut être exécuté plusieurs fois.
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_test_positionnement_niveaux.sql
-- Sur une base neuve, ce script s'exécute automatiquement.
UPDATE `exercises` SET `lesson_level` = 'A1' WHERE `id` BETWEEN 424 AND 438 AND `lesson_title` LIKE 'Test%';
UPDATE `exercises` SET `lesson_level` = 'A2' WHERE `id` BETWEEN 439 AND 453 AND `lesson_title` LIKE 'Test%';
UPDATE `exercises` SET `lesson_level` = 'B1' WHERE `id` BETWEEN 454 AND 468 AND `lesson_title` LIKE 'Test%';
UPDATE `exercises` SET `lesson_level` = 'B2' WHERE `id` BETWEEN 469 AND 483 AND `lesson_title` LIKE 'Test%';

-- Contrôle : doit afficher 15 pour chacun des quatre niveaux
SELECT `lesson_level`, COUNT(*) AS questions FROM `exercises` WHERE `lesson_title` = 'Test' GROUP BY `lesson_level` ORDER BY `lesson_level`;
