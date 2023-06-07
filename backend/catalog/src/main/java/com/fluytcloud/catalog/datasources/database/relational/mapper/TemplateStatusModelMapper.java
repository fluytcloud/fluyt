package com.fluytcloud.catalog.datasources.database.relational.mapper;

import com.fluycloud.support.core.CrudMapper;
import com.fluytcloud.catalog.datasources.database.relational.model.TemplateStatusModel;
import com.fluytcloud.catalog.entities.TemplateStatus;

public class TemplateStatusModelMapper implements CrudMapper<TemplateStatus, TemplateStatusModel> {

    @Override
    public TemplateStatus mapToEntity(TemplateStatusModel model) {
        return new TemplateStatus(
                model.getUuid(),
                model.getStep(),
                model.isError(),
                model.getMessage()
        );
    }

    @Override
    public TemplateStatusModel mapToModel(TemplateStatus object) {
        return new TemplateStatusModel()
                .setUuid(object.uuid())
                .setStep(object.step())
                .setError(object.error())
                .setMessage(object.message());
    }
}
