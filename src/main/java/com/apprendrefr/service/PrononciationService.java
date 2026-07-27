package com.apprendrefr.service;


import com.apprendrefr.entity.Prononciation;
import com.apprendrefr.repository.PrononciationRepository;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class PrononciationService {


    private final PrononciationRepository repository;


    public PrononciationService(PrononciationRepository repository) {
        this.repository = repository;
    }


    public List<Prononciation> findAll() {

        return repository.findAll();

    }

    public Prononciation findById(Long id) {

        return repository.findById(id)
                .orElseThrow();

    }

    public Prononciation save(Prononciation prononciation) {

        return repository.save(prononciation);

    }

    public void delete(Long id) {

        repository.deleteById(id);

    }

    public void deleteById(Long id) {

        repository.deleteById(id);

    }
    public long count() {
        return repository.count();
    }

}