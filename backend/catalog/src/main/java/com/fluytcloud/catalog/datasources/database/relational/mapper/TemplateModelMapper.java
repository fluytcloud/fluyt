package com.fluytcloud.catalog.datasources.database.relational.mapper;

import com.fluycloud.support.core.CrudMapper;
import com.fluytcloud.catalog.datasources.database.relational.model.TemplateModel;
import com.fluytcloud.catalog.entities.Template;
import com.fluytcloud.scm.datasources.database.relational.mapper.ScmModelMapper;

public class TemplateModelMapper implements CrudMapper<Template, TemplateModel> {

    private final ScmModelMapper scmModelMapper;

    public TemplateModelMapper(ScmModelMapper scmModelMapper) {
        this.scmModelMapper = scmModelMapper;
    }

    @Override
    public Template mapToEntity(TemplateModel model) {
        return new Template(
                model.getId(),
                model.getName(),
                scmModelMapper.mapToEntity(model.getTemplateScm()),
                model.getTemplateRepository(),
                model.getTemplateBranch(),
                scmModelMapper.mapToEntity(model.getTargetScm()),
                model.getTargetBranch()
        );
    }

    @Override
    public TemplateModel mapToModel(Template object) {
        return new TemplateModel()
                .setId(object.id())
                .setName(object.name())
                .setTemplateScm(scmModelMapper.mapToModel(object.templateScm()))
                .setTemplateRepository(object.templateRepository())
                .setTemplateBranch(object.templateBranch())
                .setTargetScm(scmModelMapper.mapToModel(object.targetScm()))
                .setTargetBranch(object.targetBranch());
    }
}
