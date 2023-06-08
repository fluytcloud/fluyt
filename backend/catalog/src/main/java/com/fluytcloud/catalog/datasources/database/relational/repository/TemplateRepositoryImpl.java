package com.fluytcloud.catalog.datasources.database.relational.repository;

import com.fluycloud.support.core.CrudMapper;
import com.fluycloud.support.core.CrudRepositoryImpl;
import com.fluytcloud.catalog.datasources.database.relational.mapper.TemplateModelMapper;
import com.fluytcloud.catalog.datasources.database.relational.model.TemplateModel;
import com.fluytcloud.catalog.entities.Template;
import com.fluytcloud.catalog.repositories.TemplateCrudRepository;
import com.fluytcloud.scm.datasources.database.relational.mapper.ScmModelMapper;
import jakarta.enterprise.context.ApplicationScoped;
import org.springframework.data.jpa.repository.JpaRepository;

@ApplicationScoped
public class TemplateRepositoryImpl extends CrudRepositoryImpl<Template, TemplateModel, Integer> implements TemplateCrudRepository {

    private final TemplateJpaRepository templateJpaRepository;

    public TemplateRepositoryImpl(TemplateJpaRepository templateJpaRepository) {
        this.templateJpaRepository = templateJpaRepository;
    }

    @Override
    protected JpaRepository<TemplateModel, Integer> getJpaRepository() {
        return templateJpaRepository;
    }

    @Override
    protected CrudMapper<Template, TemplateModel> getMapper() {
        return new TemplateModelMapper(new ScmModelMapper());
    }
}
