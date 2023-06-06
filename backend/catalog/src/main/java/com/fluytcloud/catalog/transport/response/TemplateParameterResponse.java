package com.fluytcloud.catalog.transport.response;

import com.fluytcloud.catalog.entities.TemplateParameterType;

import java.util.List;

public record TemplateParameterResponse(
        String name,
        String label,
        TemplateParameterType type,
        Boolean required,
        String value,
        List<TemplateParameterOptionResponse> options
) {

    @Override
    public Boolean required() {
        return required == null || required;
    }

    @Override
    public String label() {
        return label == null ? name : label;
    }
}
