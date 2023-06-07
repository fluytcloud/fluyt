package com.fluytcloud.catalog.entities;

import java.util.List;

public record TemplateParameter(
        String name,
        String label,
        TemplateParameterType type,
        Boolean required,
        String value,
        List<TemplateParameterOption> options

) {
}
