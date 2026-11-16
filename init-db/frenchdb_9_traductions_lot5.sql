-- Traductions (zh, ko, pt, es) des mots et phrases du lot 5 : Les jours de la semaine, Les mois de l'année, Les directions et la position.
-- Traductions automatiques, non relues (reviewed = 0). Se relance sans danger (INSERT IGNORE).
-- À lancer APRÈS frenchdb_9_vocab_lot5.sql :
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_traductions_lot5.sql
SET NAMES utf8mb4;

INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '星期一', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'lundi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '월요일', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'lundi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'segunda-feira', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'lundi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'lunes', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'lundi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '星期一，我八点开始工作。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'lundi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '월요일에는 8시에 일을 시작해요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'lundi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Às segundas-feiras, começo a trabalhar às oito horas.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'lundi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Los lunes empiezo a trabajar a las ocho.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'lundi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '星期二', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mardi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '화요일', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mardi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'terça-feira', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mardi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'martes', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mardi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '星期二，我有法语课。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mardi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '화요일에는 프랑스어 수업이 있어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mardi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Na terça-feira, tenho aula de francês.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mardi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'El martes tengo clase de francés.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mardi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '星期三', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mercredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '수요일', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mercredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'quarta-feira', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mercredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'miércoles', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mercredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '星期三，孩子们不上学。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mercredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '수요일에는 아이들이 학교에 가지 않아요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mercredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Às quartas-feiras, as crianças não têm aula.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mercredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Los miércoles los niños no tienen escuela.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mercredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '星期四', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'jeudi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '목요일', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'jeudi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'quinta-feira', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'jeudi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'jueves', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'jeudi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '星期四，我去市场。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'jeudi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '목요일에 저는 시장에 가요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'jeudi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Na quinta-feira, vou ao mercado.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'jeudi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'El jueves voy al mercado.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'jeudi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '星期五', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'vendredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '금요일', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'vendredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'sexta-feira', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'vendredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'viernes', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'vendredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '星期五晚上，我们在餐厅吃晚饭。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'vendredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '금요일 저녁에 우리는 식당에서 저녁을 먹어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'vendredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Na sexta-feira à noite, jantamos no restaurante.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'vendredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'El viernes por la noche cenamos en el restaurante.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'vendredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '星期六', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'samedi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '토요일', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'samedi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'sábado', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'samedi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'sábado', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'samedi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '星期六，我去买东西。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'samedi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '토요일에 저는 장을 봐요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'samedi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'No sábado, faço compras.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'samedi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'El sábado hago la compra.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'samedi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '星期日', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'dimanche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '일요일', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'dimanche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'domingo', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'dimanche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'domingo', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'dimanche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '星期日，我在家休息。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'dimanche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '일요일에는 집에서 쉬어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'dimanche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Aos domingos, descanso em casa.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'dimanche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Los domingos descanso en casa.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'dimanche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '一周', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'la semaine';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '일주일', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'la semaine';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'a semana', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'la semaine';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'la semana', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'la semaine';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '一周有七天。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'la semaine';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '일주일은 7일이에요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'la semaine';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Uma semana tem sete dias.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'la semaine';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Una semana tiene siete días.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'la semaine';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '周末', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le week-end';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '주말', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le week-end';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'o fim de semana', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le week-end';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'el fin de semana', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le week-end';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '这个周末，我们参观巴黎。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le week-end';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '이번 주말에 우리는 파리를 구경해요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le week-end';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Neste fim de semana, visitamos Paris.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le week-end';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Este fin de semana visitamos París.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le week-end';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '一天', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '하루', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'um dia', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'un día', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '今天是星期几？', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '오늘 무슨 요일이에요?', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Que dia é hoje?', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', '¿Qué día es hoy?', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '今天', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'aujourd''hui';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '오늘', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'aujourd''hui';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'hoje', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'aujourd''hui';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'hoy', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'aujourd''hui';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '今天是星期二。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'aujourd''hui';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '오늘은 화요일이에요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'aujourd''hui';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Hoje é terça-feira.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'aujourd''hui';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Hoy es martes.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'aujourd''hui';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '明天', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '내일', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'amanhã', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'mañana', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '明天是星期三。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '내일은 수요일이에요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Amanhã é quarta-feira.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Mañana es miércoles.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '昨天', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'hier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '어제', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'hier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'ontem', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'hier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'ayer', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'hier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '昨天是星期一。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'hier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '어제는 월요일이었어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'hier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Ontem foi segunda-feira.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'hier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Ayer fue lunes.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'hier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '后天', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'après-demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '모레', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'après-demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'depois de amanhã', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'après-demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'pasado mañana', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'après-demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '后天是星期四。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'après-demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '모레는 목요일이에요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'après-demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Depois de amanhã é quinta-feira.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'après-demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Pasado mañana es jueves.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'après-demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '法定假日', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour férié';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '공휴일', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour férié';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'um feriado', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour férié';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'un día festivo', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour férié';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '7月14日是法定假日。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour férié';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '7월 14일은 공휴일이에요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour férié';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'O dia 14 de julho é feriado.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour férié';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'El 14 de julio es festivo.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour férié';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '日历', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le calendrier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '달력', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le calendrier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'o calendário', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le calendrier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'el calendario', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le calendrier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '我看日历确认日期。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le calendrier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '저는 달력을 보고 날짜를 확인해요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le calendrier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Olho o calendário para ver a data.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le calendrier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Miro el calendario para ver la fecha.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le calendrier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '一月', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'janvier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '1월', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'janvier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'janeiro', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'janvier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'enero', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'janvier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '一月是一年的第一个月。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'janvier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '1월은 한 해의 첫 번째 달이에요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'janvier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Janeiro é o primeiro mês do ano.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'janvier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Enero es el primer mes del año.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'janvier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '二月', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'février';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '2월', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'février';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'fevereiro', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'février';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'febrero', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'février';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '二月是最短的月份。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'février';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '2월은 가장 짧은 달이에요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'février';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Fevereiro é o mês mais curto.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'février';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Febrero es el mes más corto.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'février';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '三月', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mars';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '3월', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mars';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'março', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mars';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'marzo', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mars';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '三月，春天开始了。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mars';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '3월에 봄이 시작돼요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mars';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Em março, a primavera começa.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mars';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'En marzo empieza la primavera.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mars';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '四月', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'avril';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '4월', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'avril';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'abril', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'avril';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'abril', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'avril';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '四月常常下雨。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'avril';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '4월에는 비가 자주 와요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'avril';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Em abril, chove muito.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'avril';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'En abril llueve a menudo.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'avril';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '五月', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mai';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '5월', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mai';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'maio', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mai';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'mayo', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mai';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '五月一日，人们送铃兰花。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mai';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '5월 1일에는 은방울꽃을 선물해요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mai';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'No dia primeiro de maio, oferece-se lírio-do-vale.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mai';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'El uno de mayo se regalan lirios de los valles.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mai';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '六月', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juin';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '6월', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juin';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'junho', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juin';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'junio', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juin';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '六月白天很长。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juin';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '6월에는 낮이 길어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juin';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Em junho, os dias são longos.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juin';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'En junio los días son largos.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juin';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '七月', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juillet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '7월', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juillet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'julho', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juillet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'julio', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juillet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '七月十四日是国庆日。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juillet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '7월 14일은 국경일이에요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juillet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'O dia 14 de julho é a festa nacional.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juillet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'El 14 de julio es la fiesta nacional.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juillet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '八月', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'août';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '8월', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'août';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'agosto', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'août';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'agosto', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'août';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '八月，很多人去度假。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'août';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '8월에는 많은 사람들이 휴가를 떠나요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'août';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Em agosto, muita gente sai de férias.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'août';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'En agosto mucha gente se va de vacaciones.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'août';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '九月', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'septembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '9월', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'septembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'setembro', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'septembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'septiembre', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'septembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '九月，学校重新开学。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'septembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '9월에 학교가 다시 시작돼요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'septembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Em setembro, a escola recomeça.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'septembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'En septiembre vuelve la escuela.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'septembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '十月', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'octobre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '10월', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'octobre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'outubro', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'octobre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'octubre', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'octobre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '十月，树叶落下。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'octobre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '10월에는 나뭇잎이 떨어져요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'octobre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Em outubro, as folhas caem.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'octobre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'En octubre caen las hojas.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'octobre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '十一月', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'novembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '11월', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'novembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'novembro', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'novembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'noviembre', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'novembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '十一月，天气已经很冷了。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'novembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '11월에는 벌써 추워요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'novembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Em novembro, já faz frio.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'novembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'En noviembre ya hace frío.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'novembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '十二月', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'décembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '12월', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'décembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'dezembro', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'décembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'diciembre', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'décembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '圣诞节在十二月。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'décembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '크리스마스는 12월에 있어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'décembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'O Natal é em dezembro.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'décembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'La Navidad es en diciembre.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'décembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '一个月', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un mois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '한 달', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un mois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'um mês', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un mois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'un mes', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un mois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '一年有十二个月。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un mois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '일 년에는 열두 달이 있어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un mois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Há doze meses em um ano.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un mois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Hay doce meses en un año.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un mois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '一年', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une année';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '한 해', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une année';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'um ano', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une année';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'un año', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une année';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '一年有三百六十五天。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une année';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '일 년은 365일이에요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une année';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Um ano tem trezentos e sessenta e cinco dias.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une année';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Un año tiene trescientos sesenta y cinco días.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une année';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '日期', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une date';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '날짜', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une date';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'uma data', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une date';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'una fecha', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une date';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '你的生日是哪一天？', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une date';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '네 생일이 며칠이에요?', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une date';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Qual é a data do seu aniversário?', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une date';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', '¿Cuál es la fecha de tu cumpleaños?', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une date';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '生日', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un anniversaire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '생일', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un anniversaire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'um aniversário', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un anniversaire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'un cumpleaños', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un anniversaire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '我的生日在三月。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un anniversaire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '제 생일은 3월이에요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un anniversaire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Meu aniversário é em março.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un anniversaire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Mi cumpleaños es en marzo.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un anniversaire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '季节', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'les saisons';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '계절', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'les saisons';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'as estações', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'les saisons';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'las estaciones', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'les saisons';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '一年有四个季节。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'les saisons';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '일 년에는 네 계절이 있어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'les saisons';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Há quatro estações no ano.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'les saisons';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Hay cuatro estaciones en el año.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'les saisons';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '在……前面', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'devant';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '앞에', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'devant';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'na frente de', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'devant';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'delante de', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'devant';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '男孩在门前。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'devant';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '남자아이가 문 앞에 있어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'devant';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'O menino está na frente da porta.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'devant';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'El niño está delante de la puerta.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'devant';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '在……后面', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'derrière';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '뒤에', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'derrière';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'atrás de', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'derrière';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'detrás de', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'derrière';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '猫在沙发后面。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'derrière';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '고양이가 소파 뒤에 있어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'derrière';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'O gato está atrás do sofá.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'derrière';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'El gato está detrás del sofá.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'derrière';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '上面', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en haut';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '위쪽', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en haut';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'em cima', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en haut';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'arriba', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en haut';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '我的房间在楼上。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en haut';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '제 방은 위층에 있어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en haut';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Meu quarto é em cima.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en haut';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Mi habitación está arriba.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en haut';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '下面', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en bas';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '아래쪽', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en bas';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'embaixo', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en bas';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'abajo', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en bas';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '厨房在楼下。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en bas';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '부엌은 아래층에 있어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en bas';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'A cozinha é embaixo.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en bas';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'La cocina está abajo.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en bas';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '左边', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à gauche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '왼쪽', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à gauche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'à esquerda', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à gauche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'a la izquierda', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à gauche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '在红绿灯处向左转。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à gauche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '신호등에서 왼쪽으로 도세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à gauche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Vire à esquerda no semáforo.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à gauche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Gire a la izquierda en el semáforo.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à gauche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '右边', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à droite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '오른쪽', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à droite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'à direita', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à droite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'a la derecha', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à droite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '面包店在右边。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à droite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '빵집은 오른쪽에 있어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à droite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'A padaria fica à direita.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à droite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'La panadería está a la derecha.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à droite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '直走', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'tout droit';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '직진', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'tout droit';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'em frente', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'tout droit';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'todo recto', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'tout droit';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '一直走到火车站。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'tout droit';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '기차역까지 쭉 가세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'tout droit';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Siga em frente até a estação.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'tout droit';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Vaya todo recto hasta la estación.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'tout droit';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '在……里面', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'dans';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '안에', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'dans';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'dentro de', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'dans';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'dentro de', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'dans';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '书在包里。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'dans';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '책이 가방 안에 있어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'dans';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'O livro está dentro da bolsa.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'dans';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'El libro está dentro de la bolsa.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'dans';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '在……上面', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '위에', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'sobre', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'sobre', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '笔在桌子上。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '펜이 탁자 위에 있어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'A caneta está sobre a mesa.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'El bolígrafo está sobre la mesa.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '在……下面', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sous';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '밑에', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sous';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'debaixo de', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sous';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'debajo de', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sous';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '狗在桌子下面。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sous';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '개가 탁자 밑에 있어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sous';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'O cachorro está debaixo da mesa.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sous';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'El perro está debajo de la mesa.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sous';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '在……之间', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'entre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '사이에', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'entre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'entre', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'entre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'entre', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'entre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '银行在邮局和药店之间。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'entre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '은행은 우체국과 약국 사이에 있어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'entre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'O banco fica entre o correio e a farmácia.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'entre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'El banco está entre correos y la farmacia.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'entre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '在……旁边', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à côté de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '옆에', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à côté de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'ao lado de', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à côté de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'al lado de', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à côté de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '学校在市政府旁边。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à côté de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '학교는 시청 옆에 있어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à côté de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'A escola fica ao lado da prefeitura.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à côté de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'La escuela está al lado del ayuntamiento.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à côté de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '在……对面', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en face de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '맞은편에', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en face de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'em frente a', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en face de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'enfrente de', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en face de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '咖啡馆在火车站对面。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en face de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '카페는 기차역 맞은편에 있어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en face de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'O café fica em frente à estação.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en face de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'El café está enfrente de la estación.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en face de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '在……附近', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'près de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '근처에', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'près de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'perto de', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'près de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'cerca de', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'près de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '我住在火车站附近。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'près de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '저는 기차역 근처에 살아요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'près de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Moro perto da estação.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'près de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Vivo cerca de la estación.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'près de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '离……远', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'loin de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '멀리', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'loin de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'longe de', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'loin de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'lejos de', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'loin de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '我的工作离我家很远。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'loin de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '제 직장은 집에서 멀어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'loin de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Meu trabalho fica longe de casa.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'loin de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Mi trabajo está lejos de mi casa.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'loin de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '在中间', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'au milieu';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '가운데에', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'au milieu';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'no meio', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'au milieu';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'en el medio', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'au milieu';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '桌子在房间中间。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'au milieu';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '탁자는 방 가운데에 있어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'au milieu';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'A mesa está no meio da sala.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'au milieu';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'La mesa está en el medio de la habitación.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'au milieu';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '这里', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'ici';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '여기', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'ici';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'aqui', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'ici';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'aquí', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'ici';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '请到这里来。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'ici';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '여기로 와 주세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'ici';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Venha aqui, por favor.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'ici';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Venga aquí, por favor.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'ici';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '那边', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'là-bas';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '저기', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'là-bas';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'lá', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'là-bas';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'allí', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'là-bas';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '火车站在那边。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'là-bas';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '기차역은 저기에 있어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'là-bas';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'A estação fica lá.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'là-bas';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'La estación está allí.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'là-bas';
