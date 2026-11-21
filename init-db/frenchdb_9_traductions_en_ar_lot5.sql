-- Traductions en anglais (en) et en arabe (ar) des mots et phrases du lot 5 : Les jours de la semaine, Les mois de l'année, Les directions et la position.
-- Traductions automatiques, non relues (reviewed = 0). Se relance sans danger (INSERT IGNORE).
-- À lancer APRÈS les scripts de vocabulaire et de traductions du même lot :
--   docker exec -i french-db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' < init-db/frenchdb_9_traductions_en_ar_lot5.sql
SET NAMES utf8mb4;

INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'Monday', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'lundi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'الاثنين', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'lundi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'On Mondays, I start work at eight o''clock.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'lundi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'يوم الاثنين أبدأ العمل في الثامنة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'lundi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'Tuesday', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mardi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'الثلاثاء', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mardi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'On Tuesday, I have a French class.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mardi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'يوم الثلاثاء لدي حصة فرنسية.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mardi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'Wednesday', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mercredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'الأربعاء', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mercredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'On Wednesdays, the children have no school.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mercredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'يوم الأربعاء لا يذهب الأطفال إلى المدرسة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'mercredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'Thursday', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'jeudi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'الخميس', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'jeudi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'On Thursday, I go to the market.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'jeudi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'يوم الخميس أذهب إلى السوق.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'jeudi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'Friday', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'vendredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'الجمعة', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'vendredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'On Friday evening, we have dinner at the restaurant.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'vendredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'مساء الجمعة نتناول العشاء في المطعم.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'vendredi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'Saturday', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'samedi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'السبت', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'samedi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'On Saturday, I do the shopping.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'samedi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'يوم السبت أقوم بالتسوّق.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'samedi';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'Sunday', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'dimanche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'الأحد', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'dimanche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'On Sundays, I rest at home.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'dimanche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'يوم الأحد أرتاح في المنزل.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'dimanche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'the week', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'la semaine';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'الأسبوع', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'la semaine';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'A week has seven days.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'la semaine';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'الأسبوع له سبعة أيام.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'la semaine';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'the weekend', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le week-end';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'عطلة نهاية الأسبوع', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le week-end';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'This weekend, we are visiting Paris.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le week-end';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'في عطلة نهاية الأسبوع هذه سنزور باريس.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le week-end';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a day', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يوم', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'What day is it today?', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'أي يوم نحن اليوم؟', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'today', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'aujourd''hui';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'اليوم', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'aujourd''hui';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Today is Tuesday.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'aujourd''hui';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'اليوم هو الثلاثاء.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'aujourd''hui';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'tomorrow', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'غدًا', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Tomorrow is Wednesday.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'غدًا هو الأربعاء.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'yesterday', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'hier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'أمس', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'hier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Yesterday was Monday.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'hier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'أمس كان الاثنين.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'hier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'the day after tomorrow', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'après-demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'بعد غد', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'après-demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'The day after tomorrow is Thursday.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'après-demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'بعد غد هو الخميس.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'après-demain';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a public holiday', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour férié';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'عطلة رسمية', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour férié';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'The 14th of July is a public holiday.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour férié';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'الرابع عشر من يوليو عطلة رسمية.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'un jour férié';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'the calendar', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le calendrier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'التقويم', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le calendrier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'I look at the calendar to check the date.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le calendrier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'أنظر إلى التقويم لأعرف التاريخ.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES JOURS DE LA SEMAINE') AND v.`french_word` = 'le calendrier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'January', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'janvier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يناير', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'janvier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'January is the first month of the year.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'janvier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'يناير هو الشهر الأول من السنة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'janvier';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'February', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'février';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'فبراير', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'février';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'February is the shortest month.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'février';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'فبراير هو أقصر شهر.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'février';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'March', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mars';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'مارس', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mars';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'In March, spring begins.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mars';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'في مارس يبدأ الربيع.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mars';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'April', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'avril';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'أبريل', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'avril';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'In April, it often rains.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'avril';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'في أبريل تمطر كثيرًا.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'avril';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'May', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mai';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'مايو', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mai';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'On the first of May, people give lily of the valley.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mai';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'في الأول من مايو يُهدى زهر المرجان.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'mai';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'June', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juin';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يونيو', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juin';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'In June, the days are long.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juin';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'في يونيو تكون الأيام طويلة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juin';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'July', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juillet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'يوليو', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juillet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'The 14th of July is the national holiday.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juillet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'الرابع عشر من يوليو هو العيد الوطني.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'juillet';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'August', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'août';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'أغسطس', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'août';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'In August, many people go on holiday.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'août';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'في أغسطس يسافر كثير من الناس في عطلة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'août';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'September', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'septembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'سبتمبر', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'septembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'In September, school starts again.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'septembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'في سبتمبر تبدأ المدرسة من جديد.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'septembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'October', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'octobre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'أكتوبر', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'octobre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'In October, the leaves fall.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'octobre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'في أكتوبر تتساقط الأوراق.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'octobre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'November', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'novembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'نوفمبر', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'novembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'In November, it is already cold.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'novembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'في نوفمبر يكون الجو باردًا بالفعل.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'novembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'December', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'décembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'ديسمبر', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'décembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Christmas is in December.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'décembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'عيد الميلاد في ديسمبر.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'décembre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a month', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un mois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'شهر', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un mois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'There are twelve months in a year.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un mois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'في السنة اثنا عشر شهرًا.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un mois';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a year', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une année';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'سنة', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une année';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'A year has three hundred and sixty-five days.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une année';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'للسنة ثلاثمئة وخمسة وستون يومًا.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une année';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a date', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une date';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'تاريخ', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une date';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'What is the date of your birthday?', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une date';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'ما هو تاريخ عيد ميلادك؟', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'une date';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'a birthday', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un anniversaire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'عيد ميلاد', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un anniversaire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'My birthday is in March.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un anniversaire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'عيد ميلادي في مارس.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'un anniversaire';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'the seasons', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'les saisons';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'الفصول', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'les saisons';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'There are four seasons in the year.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'les saisons';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'في السنة أربعة فصول.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES MOIS DE L''ANNÉE') AND v.`french_word` = 'les saisons';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'in front of', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'devant';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'أمام', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'devant';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'The boy is in front of the door.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'devant';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'الولد أمام الباب.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'devant';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'behind', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'derrière';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'خلف', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'derrière';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'The cat is behind the sofa.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'derrière';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'القطة خلف الأريكة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'derrière';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'up, at the top', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en haut';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'فوق (في الأعلى)', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en haut';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'My bedroom is upstairs.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en haut';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'غرفتي في الأعلى.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en haut';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'down, at the bottom', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en bas';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'تحت (في الأسفل)', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en bas';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'The kitchen is downstairs.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en bas';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'المطبخ في الأسفل.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en bas';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'on the left', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à gauche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'إلى اليسار', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à gauche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Turn left at the traffic light.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à gauche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'انعطف يسارًا عند إشارة المرور.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à gauche';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'on the right', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à droite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'إلى اليمين', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à droite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'The bakery is on the right.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à droite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'المخبز على اليمين.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à droite';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'straight ahead', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'tout droit';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'مباشرةً (إلى الأمام)', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'tout droit';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Go straight ahead to the station.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'tout droit';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'سر مباشرةً حتى المحطة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'tout droit';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'in, inside', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'dans';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'داخل', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'dans';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'The book is in the bag.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'dans';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'الكتاب داخل الحقيبة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'dans';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'on', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'على', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'The pen is on the table.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'القلم على الطاولة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sur';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'under', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sous';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'تحت', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sous';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'The dog is under the table.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sous';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'الكلب تحت الطاولة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'sous';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'between', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'entre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'بين', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'entre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'The bank is between the post office and the pharmacy.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'entre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'البنك بين مكتب البريد والصيدلية.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'entre';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'next to', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à côté de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'بجانب', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à côté de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'The school is next to the town hall.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à côté de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'المدرسة بجانب البلدية.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'à côté de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'opposite', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en face de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'مقابل', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en face de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'The café is opposite the station.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en face de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'المقهى مقابل المحطة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'en face de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'near', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'près de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'قرب', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'près de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'I live near the station.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'près de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'أسكن قرب المحطة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'près de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'far from', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'loin de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'بعيد عن', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'loin de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'My work is far from my home.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'loin de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'عملي بعيد عن بيتي.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'loin de';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'in the middle', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'au milieu';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'في الوسط', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'au milieu';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'The table is in the middle of the room.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'au milieu';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'الطاولة في وسط الغرفة.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'au milieu';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'here', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'ici';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'هنا', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'ici';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'Come here, please.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'ici';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'تعال إلى هنا من فضلك.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'ici';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'en', 'over there', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'là-bas';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_WORD', v.`id`, 'ar', 'هناك', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'là-bas';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'en', 'The station is over there.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'là-bas';
INSERT IGNORE INTO `translations` (`kind`, `entity_id`, `lang`, `content`, `reviewed`)
SELECT 'VOCAB_SENTENCE', v.`id`, 'ar', 'المحطة هناك.', 0 FROM `vocabularies` v
WHERE v.`lesson_id` = (SELECT MIN(`id`) FROM `lessons` WHERE `title` = 'LES DIRECTIONS ET LA POSITION') AND v.`french_word` = 'là-bas';
