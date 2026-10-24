-- Niveau conseillé par le test de positionnement (A1, A2, B1 ou B2), facultatif.
-- À lancer sur une base existante AVANT de déployer la nouvelle image (ddl-auto = validate).
-- Sur une base neuve, ce script s'exécute automatiquement après frenchdb_8.sql.
ALTER TABLE `users` ADD COLUMN `placement_level` VARCHAR(2) NULL;
