-- Traductions (zh, ko, pt, es) des mots et phrases du lot 6 (cuisine de restaurant). Traductions automatiques, non relues (reviewed = 0). Se relance sans danger (INSERT IGNORE).
-- À lancer APRÈS frenchdb_9_vocab_lot6.sql.
SET NAMES utf8mb4;

INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '刀', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un couteau';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '칼', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un couteau';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'a faca', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un couteau';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'el cuchillo', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un couteau';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '请把刀递给我。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un couteau';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '칼 좀 건네주세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un couteau';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Passe-me a faca, por favor.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un couteau';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Pásame el cuchillo, por favor.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un couteau';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '砧板', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une planche à découper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '도마', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une planche à découper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'a tábua de cortar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une planche à découper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'la tabla de cortar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une planche à découper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '把蔬菜放在砧板上。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une planche à découper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '채소를 도마 위에 놓으세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une planche à découper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Coloque os legumes na tábua de cortar.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une planche à découper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Pon las verduras sobre la tabla de cortar.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une planche à découper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '炖锅', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une casserole';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '냄비', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une casserole';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'a panela', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une casserole';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'la cacerola', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une casserole';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '把水倒进锅里。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une casserole';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '냄비에 물을 넣으세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une casserole';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Coloque a água na panela.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une casserole';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Pon el agua en la cacerola.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une casserole';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '平底锅', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une poêle';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '프라이팬', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une poêle';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'a frigideira', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une poêle';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'la sartén', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une poêle';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '把平底锅烧热。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une poêle';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '프라이팬을 달구세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une poêle';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Aqueça a frigideira.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une poêle';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Calienta la sartén.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une poêle';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '大汤锅', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une marmite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '큰 솥', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une marmite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'o caldeirão', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une marmite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'la olla', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une marmite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '大汤锅里装满了汤。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une marmite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '큰 솥에 수프가 가득 있어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une marmite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'O caldeirão está cheio de sopa.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une marmite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'La olla está llena de sopa.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une marmite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '汤勺', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une louche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '국자', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une louche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'a concha', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une louche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'el cucharón', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une louche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '用汤勺盛汤。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une louche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '국자로 수프를 푸세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une louche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Sirva a sopa com a concha.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une louche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Sirve la sopa con el cucharón.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une louche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '打蛋器', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un fouet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '거품기', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un fouet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'o batedor', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un fouet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'el batidor', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un fouet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '用打蛋器打鸡蛋。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un fouet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '거품기로 달걀을 풀어 주세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un fouet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Bata os ovos com o batedor.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un fouet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Bate los huevos con el batidor.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un fouet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '滤网', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une passoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '체', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une passoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'o escorredor', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une passoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'el colador', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une passoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '用滤网沥干意大利面。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une passoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '체에 파스타 물을 빼세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une passoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Escorra a massa no escorredor.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une passoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Escurre la pasta en el colador.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une passoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '漏勺', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une écumoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '건지개', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une écumoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'a escumadeira', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une écumoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'la espumadera', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une écumoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '用漏勺把蔬菜捞出来。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une écumoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '건지개로 채소를 건져 내세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une écumoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Retire os legumes com a escumadeira.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une écumoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Saca las verduras con la espumadera.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une écumoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '削皮器', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un éplucheur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '필러', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un éplucheur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'o descascador', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un éplucheur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'el pelador', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un éplucheur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '削皮器在抽屉里。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un éplucheur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '필러는 서랍에 있어요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un éplucheur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'O descascador está na gaveta.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un éplucheur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'El pelador está en el cajón.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un éplucheur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '木勺', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une cuillère en bois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '나무 숟가락', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une cuillère en bois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'a colher de pau', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une cuillère en bois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'la cuchara de madera', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une cuillère en bois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '用木勺搅拌酱汁。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une cuillère en bois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '나무 숟가락으로 소스를 저으세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une cuillère en bois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Mexa o molho com a colher de pau.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une cuillère en bois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Remueve la salsa con la cuchara de madera.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une cuillère en bois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '锅铲', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une spatule';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '뒤집개', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une spatule';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'a espátula', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une spatule';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'la espátula', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une spatule';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '用锅铲把肉翻面。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une spatule';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '뒤집개로 고기를 뒤집으세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une spatule';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Vire a carne com a espátula.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une spatule';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Da la vuelta a la carne con la espátula.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une spatule';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '擀面杖', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un rouleau à pâtisserie';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '밀대', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un rouleau à pâtisserie';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'o rolo de massa', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un rouleau à pâtisserie';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'el rodillo', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un rouleau à pâtisserie';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '用擀面杖把面团擀开。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un rouleau à pâtisserie';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '밀대로 반죽을 펴세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un rouleau à pâtisserie';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Abra a massa com o rolo.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un rouleau à pâtisserie';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Extiende la masa con el rodillo.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un rouleau à pâtisserie';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '擦丝器', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une râpe';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '강판', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une râpe';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'o ralador', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une râpe';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'el rallador', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une râpe';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '用擦丝器擦奶酪。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une râpe';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '강판으로 치즈를 갈아 주세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une râpe';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Use o ralador para o queijo.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une râpe';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Usa el rallador para el queso.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une râpe';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '沙拉碗', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un saladier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '샐러드 볼', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un saladier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'a saladeira', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un saladier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'la ensaladera', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un saladier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '把所有东西在沙拉碗里拌匀。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un saladier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '모든 재료를 샐러드 볼에 섞으세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un saladier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Misture tudo na saladeira.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un saladier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Mezcla todo en la ensaladera.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un saladier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '烤箱', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un four';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '오븐', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un four';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'o forno', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un four';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'el horno', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un four';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '烤箱是两百度。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un four';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '오븐은 200도예요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un four';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'O forno está a duzentos graus.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un four';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'El horno está a doscientos grados.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un four';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '隔热手套', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'des maniques';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '오븐 장갑', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'des maniques';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'as luvas térmicas', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'des maniques';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'las manoplas', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'des maniques';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '拿盘子之前先戴上隔热手套。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'des maniques';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '접시를 잡기 전에 오븐 장갑을 끼세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'des maniques';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Coloque as luvas térmicas antes de pegar o prato.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'des maniques';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Ponte las manoplas antes de coger la fuente.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'des maniques';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '围裙', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un tablier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '앞치마', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un tablier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'o avental', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un tablier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'el delantal', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un tablier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '做饭前先系上围裙。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un tablier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '요리하기 전에 앞치마를 두르세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un tablier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Coloque o avental antes de cozinhar.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un tablier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Ponte el delantal antes de cocinar.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un tablier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '厨房秤', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une balance';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '저울', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une balance';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'a balança', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une balance';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'la báscula', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une balance';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '在秤上称面粉。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une balance';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '저울로 밀가루를 재세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une balance';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Pese a farinha na balança.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une balance';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Pesa la harina en la báscula.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une balance';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '计时器', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un minuteur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '타이머', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un minuteur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'o temporizador', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un minuteur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'el temporizador', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un minuteur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '把计时器设为十分钟。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un minuteur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '타이머를 10분에 맞추세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un minuteur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Regule o temporizador para dez minutos.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un minuteur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Programa el temporizador a diez minutos.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un minuteur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '削皮', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'éplucher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '껍질을 벗기다', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'éplucher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'descascar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'éplucher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'pelar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'éplucher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '把土豆削皮。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'éplucher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '감자 껍질을 벗기세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'éplucher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Descasque as batatas.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'éplucher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Pela las patatas.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'éplucher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '切', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'couper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '자르다', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'couper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'cortar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'couper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'cortar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'couper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '把洋葱切成小块。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'couper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '양파를 작게 자르세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'couper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Corte as cebolas em pedaços pequenos.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'couper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Corta las cebollas en trozos pequeños.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'couper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '切碎', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'hacher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '다지다', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'hacher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'picar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'hacher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'picar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'hacher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '把欧芹切碎。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'hacher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '파슬리를 다지세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'hacher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Pique a salsa.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'hacher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Pica el perejil.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'hacher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '切薄片', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'émincer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '얇게 썰다', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'émincer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'fatiar finamente', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'émincer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'laminar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'émincer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '把蘑菇切成薄片。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'émincer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '버섯을 얇게 썰어 주세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'émincer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Fatie os cogumelos em fatias finas.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'émincer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Lamina los champiñones.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'émincer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '擦丝', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'râper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '강판에 갈다', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'râper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'ralar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'râper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'rallar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'râper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '把奶酪擦成丝。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'râper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '치즈를 갈아 주세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'râper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Rale o queijo.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'râper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Ralla el queso.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'râper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '称重', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'peser';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '무게를 재다', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'peser';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'pesar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'peser';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'pesar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'peser';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '称两百克面粉。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'peser';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '밀가루 200그램을 재세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'peser';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Pese duzentos gramas de farinha.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'peser';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Pesa doscientos gramos de harina.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'peser';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '洗', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'laver';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '씻다', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'laver';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'lavar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'laver';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'lavar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'laver';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '用冷水洗蔬菜。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'laver';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '채소를 찬물에 씻으세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'laver';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Lave os legumes com água fria.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'laver';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Lava las verduras con agua fría.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'laver';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '混合', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'mélanger';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '섞다', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'mélanger';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'misturar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'mélanger';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'mezclar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'mélanger';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '把面粉和鸡蛋混合。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'mélanger';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '밀가루와 달걀을 섞으세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'mélanger';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Misture a farinha e os ovos.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'mélanger';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Mezcla la harina y los huevos.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'mélanger';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '搅动', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'remuer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '젓다', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'remuer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'mexer', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'remuer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'remover', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'remuer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '不时搅动一下酱汁。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'remuer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '가끔 소스를 저어 주세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'remuer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Mexa o molho de vez em quando.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'remuer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Remueve la salsa de vez en cuando.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'remuer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '调味', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'assaisonner';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '간을 하다', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'assaisonner';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'temperar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'assaisonner';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'sazonar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'assaisonner';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '用油和醋给沙拉调味。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'assaisonner';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '샐러드에 기름과 식초로 간을 하세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'assaisonner';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Tempere a salada com óleo e vinagre.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'assaisonner';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Sazona la ensalada con aceite y vinagre.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'assaisonner';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '尝味', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'goûter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '맛보다', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'goûter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'provar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'goûter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'probar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'goûter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '上桌前先尝一下汤。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'goûter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '수프를 내기 전에 맛을 보세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'goûter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Prove a sopa antes de servir.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'goûter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Prueba la sopa antes de servirla.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'goûter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '煮沸', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire bouillir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '끓이다', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire bouillir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'ferver', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire bouillir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'hervir', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire bouillir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '烧开水煮面。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire bouillir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '파스타를 위해 물을 끓이세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire bouillir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Ferva a água para a massa.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire bouillir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Hierve el agua para la pasta.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire bouillir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '炒香', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire revenir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '볶다', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire revenir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'refogar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire revenir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'sofreír', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire revenir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '把洋葱放在油里炒香。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire revenir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '기름에 양파를 볶으세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire revenir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Refogue as cebolas no óleo.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire revenir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Sofríe las cebollas en el aceite.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire revenir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '慢炖', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire mijoter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '뭉근히 끓이다', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire mijoter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'cozinhar em fogo baixo', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire mijoter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'cocer a fuego lento', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire mijoter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '用小火慢炖酱汁。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire mijoter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '약한 불에서 소스를 뭉근히 끓이세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire mijoter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Cozinhe o molho em fogo baixo.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire mijoter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Cuece la salsa a fuego lento.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire mijoter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '煮熟', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire cuire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '익히다', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire cuire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'cozinhar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire cuire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'cocer', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire cuire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '把米饭煮十五分钟。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire cuire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '밥을 15분 동안 지으세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire cuire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Cozinhe o arroz por quinze minutos.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire cuire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Cuece el arroz durante quince minutos.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire cuire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '烧烤', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'griller';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '굽다', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'griller';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'grelhar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'griller';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'asar a la parrilla', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'griller';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '把肉两面都烤一下。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'griller';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '고기를 양쪽 다 구우세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'griller';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Grelhe a carne dos dois lados.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'griller';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Asa la carne por los dos lados.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'griller';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '烘烤', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'rôtir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '오븐에 굽다', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'rôtir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'assar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'rôtir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'asar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'rôtir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '把鸡放进烤箱烤。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'rôtir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '닭을 오븐에 구우세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'rôtir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Asse o frango no forno.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'rôtir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Asa el pollo en el horno.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'rôtir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '油炸', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire frire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '튀기다', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire frire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'fritar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire frire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'freír', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire frire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '把土豆放进热油里炸。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire frire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '감자를 뜨거운 기름에 튀기세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire frire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Frite as batatas no óleo quente.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire frire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Fríe las patatas en aceite caliente.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire frire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '沥干', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'égoutter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '물기를 빼다', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'égoutter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'escorrer', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'égoutter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'escurrir', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'égoutter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '用滤网把意大利面沥干。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'égoutter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '체에 파스타 물기를 빼세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'égoutter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Escorra a massa no escorredor.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'égoutter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Escurre la pasta en el colador.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'égoutter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'zh', '摆盘', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'dresser';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ko', '접시에 담다', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'dresser';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'pt', 'empratar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'dresser';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'es', 'emplatar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'dresser';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'zh', '认真地摆盘。', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'dresser';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ko', '접시를 정성껏 담으세요.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'dresser';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'pt', 'Monte o prato com cuidado.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'dresser';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'es', 'Emplata el plato con cuidado.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'dresser';
