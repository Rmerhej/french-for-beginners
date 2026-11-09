-- Traductions des textes de leçons (dialogues, mots de vocabulaire, phrases d'exemple).
-- Une ligne = un texte traduit dans une langue. reviewed = 1 quand un bénévole a relu la traduction.
CREATE TABLE IF NOT EXISTS translations (
    id        BIGINT       NOT NULL AUTO_INCREMENT,
    kind      VARCHAR(30)  NOT NULL,
    entity_id BIGINT       NOT NULL,
    lang      VARCHAR(5)   NOT NULL,
    content   MEDIUMTEXT   NOT NULL,
    reviewed  TINYINT(1)   NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE KEY uk_translation (kind, entity_id, lang)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
