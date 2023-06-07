package com.fluytcloud.scm.datasources.database.relational.mapper;

import com.fluycloud.support.core.CrudMapper;
import com.fluytcloud.scm.datasources.database.relational.model.ScmModel;
import com.fluytcloud.scm.entities.Scm;

public class ScmModelMapper implements CrudMapper<Scm, ScmModel> {

    @Override
    public Scm mapToEntity(ScmModel model) {
        return new Scm(
                model.getId(),
                model.getName(),
                model.getType(),
                model.getUrl(),
                model.getUsername(),
                model.getToken(),
                model.getOrganization()
        );
    }

    @Override
    public ScmModel mapToModel(Scm scm) {
        return new ScmModel()
                .setId(scm.id())
                .setName(scm.name())
                .setType(scm.type())
                .setUrl(scm.url())
                .setUsername(scm.username())
                .setToken(scm.token())
                .setOrganization(scm.organization());
    }
}
