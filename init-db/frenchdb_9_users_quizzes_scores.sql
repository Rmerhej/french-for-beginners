-- Scores des quiz glisser-déposer (un enregistrement par tentative).
-- À exécuter sur la base de production AVANT de déployer la version qui l'utilise
-- (ddl-auto = validate : l'application refuse de démarrer si la table manque).
CREATE TABLE IF NOT EXISTS `users_quizzes_scores` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `quiz_id` bigint(20) NOT NULL,
  `score` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `completed_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uqs_user` (`user_id`),
  KEY `idx_uqs_quiz` (`quiz_id`),
  CONSTRAINT `fk_uqs_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uqs_quizzes` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
