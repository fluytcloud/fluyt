package com.fluytcloud.catalog.interactors;

import com.fluycloud.support.core.CrudRepository;
import com.fluycloud.support.core.CrudServiceImpl;
import com.fluytcloud.catalog.entities.Template;
import com.fluytcloud.catalog.repositories.TemplateCrudRepository;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class TemplateCrudService extends CrudServiceImpl<Template, Integer> {

    private final TemplateCrudRepository repository;

    public TemplateCrudService(TemplateCrudRepository repository) {
        this.repository = repository;
    }

    @Override
    protected CrudRepository<Template, Integer> getRepository() {
        return repository;
    }
}
