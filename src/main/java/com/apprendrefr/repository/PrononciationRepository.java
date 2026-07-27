package com.apprendrefr.repository;

import com.apprendrefr.entity.Prononciation;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PrononciationRepository
        extends JpaRepository<Prononciation, Long> {

}
