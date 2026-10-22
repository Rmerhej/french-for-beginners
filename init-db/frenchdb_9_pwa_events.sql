-- Table des événements de l'application installée (PWA).
-- Exécutée automatiquement à la première installation (ordre alphabétique après frenchdb_8.sql).
-- Pour une base existante, voir le guide : à lancer une seule fois avant de déployer la nouvelle image.

CREATE TABLE IF NOT EXISTS `pwa_events` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `event_type` varchar(20) NOT NULL,
  `platform` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pwa_events_type_date` (`event_type`, `created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
