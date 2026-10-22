package com.apprendrefr.repository;

import com.apprendrefr.entity.PwaEvent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface PwaEventRepository extends JpaRepository<PwaEvent, Long> {

    long countByEventType(String eventType);

    long countByEventTypeAndCreatedAtAfter(String eventType, LocalDateTime since);

    /** Résultat : [plateforme, nombre] */
    @Query("select e.platform, count(e) from PwaEvent e where e.eventType = :type group by e.platform")
    List<Object[]> countByPlatform(@Param("type") String type);
}
