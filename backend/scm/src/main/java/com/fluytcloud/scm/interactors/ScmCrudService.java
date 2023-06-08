package com.fluytcloud.scm.interactors;

import com.fluycloud.support.core.CrudRepository;
import com.fluycloud.support.core.CrudServiceImpl;
import com.fluytcloud.scm.entities.Scm;
import com.fluytcloud.scm.repositories.ScmCrudRepository;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class ScmCrudService extends CrudServiceImpl<Scm, Integer> {

    private final ScmCrudRepository scmCrudRepository;

    public ScmCrudService(ScmCrudRepository scmCrudRepository) {
        this.scmCrudRepository = scmCrudRepository;
    }

    @Override
    protected CrudRepository<Scm, Integer> getRepository() {
        return scmCrudRepository;
    }
}
