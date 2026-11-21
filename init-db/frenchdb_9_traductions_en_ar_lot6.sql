-- Traductions en anglais (en) et en arabe (ar) des mots et phrases du lot 6 : Les ustensiles de cuisine, Les gestes de cuisine.
-- Traductions automatiques, non relues (reviewed = 0). Se relance sans danger (INSERT IGNORE).
-- À lancer APRÈS les scripts de vocabulaire et de traductions du même lot :
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_traductions_en_ar_lot6.sql
SET NAMES utf8mb4;

INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a knife', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un couteau';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'سكين', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un couteau';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Pass me the knife, please.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un couteau';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'ناولني السكين من فضلك.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un couteau';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a cutting board', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une planche à découper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'لوح التقطيع', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une planche à découper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Put the vegetables on the cutting board.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une planche à découper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'ضع الخضار على لوح التقطيع.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une planche à découper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a saucepan', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une casserole';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'قدر', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une casserole';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Put the water in the saucepan.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une casserole';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'ضع الماء في القدر.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une casserole';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a frying pan', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une poêle';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'مقلاة', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une poêle';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Heat the frying pan.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une poêle';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'سخّن المقلاة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une poêle';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a large pot', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une marmite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'قدر كبير', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une marmite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'The large pot is full of soup.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une marmite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'القدر الكبير مليء بالحساء.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une marmite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a ladle', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une louche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'مغرفة', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une louche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Serve the soup with the ladle.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une louche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'اسكب الحساء بالمغرفة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une louche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a whisk', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un fouet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'مخفقة', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un fouet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Beat the eggs with the whisk.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un fouet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'اخفق البيض بالمخفقة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un fouet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a colander', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une passoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'مصفاة', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une passoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Drain the pasta in the colander.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une passoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'صفِّ المعكرونة في المصفاة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une passoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a skimmer', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une écumoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'مغرفة مثقبة', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une écumoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Take out the vegetables with the skimmer.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une écumoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'أخرج الخضار بالمغرفة المثقبة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une écumoire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a peeler', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un éplucheur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'مقشرة', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un éplucheur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'The peeler is in the drawer.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un éplucheur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'المقشرة في الدرج.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un éplucheur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a wooden spoon', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une cuillère en bois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'ملعقة خشبية', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une cuillère en bois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Stir the sauce with the wooden spoon.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une cuillère en bois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'حرّك الصلصة بالملعقة الخشبية.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une cuillère en bois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a spatula', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une spatule';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'مجرفة طبخ (سباتولا)', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une spatule';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Turn the meat over with the spatula.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une spatule';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'اقلب اللحم بالسباتولا.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une spatule';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a rolling pin', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un rouleau à pâtisserie';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'شوبك العجين', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un rouleau à pâtisserie';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Roll out the dough with the rolling pin.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un rouleau à pâtisserie';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'افرد العجين بالشوبك.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un rouleau à pâtisserie';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a grater', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une râpe';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'مبشرة', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une râpe';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Use the grater for the cheese.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une râpe';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'استعمل المبشرة للجبن.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une râpe';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a salad bowl', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un saladier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'وعاء السلطة', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un saladier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Mix everything in the salad bowl.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un saladier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'اخلط كل شيء في وعاء السلطة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un saladier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'an oven', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un four';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'فرن', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un four';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'The oven is at two hundred degrees.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un four';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'الفرن على مئتي درجة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un four';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'oven mitts', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'des maniques';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'قفازات الفرن', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'des maniques';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Put on the oven mitts before taking the dish.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'des maniques';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'ارتدِ قفازات الفرن قبل أن تأخذ الطبق.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'des maniques';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'an apron', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un tablier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'مئزر', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un tablier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Put on your apron before cooking.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un tablier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'ارتدِ مئزرك قبل الطبخ.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un tablier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a scale', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une balance';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'ميزان', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une balance';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Weigh the flour on the scale.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une balance';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'زن الدقيق على الميزان.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'une balance';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a timer', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un minuteur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'مؤقّت', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un minuteur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Set the timer for ten minutes.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un minuteur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'اضبط المؤقت على عشر دقائق.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES USTENSILES DE CUISINE') AND v.`french_word` = 'un minuteur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'to peel', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'éplucher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يقشّر', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'éplucher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Peel the potatoes.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'éplucher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'قشّر البطاطس.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'éplucher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'to cut', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'couper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يقطّع', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'couper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Cut the onions into small pieces.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'couper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'قطّع البصل إلى قطع صغيرة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'couper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'to chop finely', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'hacher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يفرم', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'hacher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Chop the parsley finely.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'hacher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'افرم البقدونس ناعمًا.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'hacher';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'to slice thinly', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'émincer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يقطّع شرائح رقيقة', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'émincer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Slice the mushrooms thinly.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'émincer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'قطّع الفطر إلى شرائح رقيقة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'émincer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'to grate', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'râper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يبشر', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'râper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Grate the cheese.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'râper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'ابشر الجبن.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'râper';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'to weigh', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'peser';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يزن', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'peser';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Weigh two hundred grams of flour.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'peser';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'زن مئتي غرام من الدقيق.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'peser';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'to wash', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'laver';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يغسل', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'laver';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Wash the vegetables in cold water.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'laver';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'اغسل الخضار بالماء البارد.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'laver';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'to mix', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'mélanger';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يخلط', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'mélanger';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Mix the flour and the eggs.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'mélanger';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'اخلط الدقيق والبيض.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'mélanger';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'to stir', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'remuer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يحرّك', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'remuer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Stir the sauce from time to time.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'remuer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'حرّك الصلصة من حين لآخر.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'remuer';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'to season', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'assaisonner';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يتبّل', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'assaisonner';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Season the salad with oil and vinegar.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'assaisonner';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'تبّل السلطة بالزيت والخل.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'assaisonner';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'to taste', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'goûter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يتذوّق', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'goûter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Taste the soup before serving it.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'goûter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'تذوّق الحساء قبل تقديمه.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'goûter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'to boil', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire bouillir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يغلي', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire bouillir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Boil the water for the pasta.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire bouillir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'اغلِ الماء للمعكرونة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire bouillir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'to sauté', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire revenir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يُحمّر (يقلّب في الزيت)', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire revenir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Sauté the onions in the oil.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire revenir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'حمّر البصل في الزيت.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire revenir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'to simmer', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire mijoter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يطهو على نار هادئة', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire mijoter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Simmer the sauce over low heat.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire mijoter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'اطبخ الصلصة على نار هادئة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire mijoter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'to cook', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire cuire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يطبخ', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire cuire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Cook the rice for fifteen minutes.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire cuire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'اطبخ الأرز لمدة خمس عشرة دقيقة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire cuire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'to grill', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'griller';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يشوي', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'griller';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Grill the meat on both sides.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'griller';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'اشوِ اللحم من الجهتين.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'griller';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'to roast', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'rôtir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يحمّص (في الفرن)', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'rôtir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Roast the chicken in the oven.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'rôtir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'اشوِ الدجاج في الفرن.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'rôtir';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'to fry', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire frire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يقلي', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire frire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Fry the potatoes in hot oil.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire frire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'اقلِ البطاطس في زيت ساخن.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'faire frire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'to drain', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'égoutter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يصفّي', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'égoutter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Drain the pasta in the colander.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'égoutter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'صفِّ المعكرونة في المصفاة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'égoutter';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'to plate up', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'dresser';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يزيّن الطبق', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'dresser';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Plate up carefully.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'dresser';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'رتّب الطبق بعناية.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES GESTES DE CUISINE') AND v.`french_word` = 'dresser';
