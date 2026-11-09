package com.apprendrefr.repository;

import com.apprendrefr.entity.Translation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

@Repository
public interface TranslationRepository extends JpaRepository<Translation, Long> {

    Optional<Translation> findByKindAndEntityIdAndLang(String kind, Long entityId, String lang);

    List<Translation> findByKindAndLangAndEntityIdIn(String kind, String lang, Collection<Long> entityIds);
}
