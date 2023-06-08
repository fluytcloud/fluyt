package com.fluytcloud.catalog.transport.mapper;

import com.fluytcloud.catalog.entities.Template;
import com.fluytcloud.catalog.entities.TemplateParameter;
import com.fluytcloud.catalog.entities.TemplateParameterOption;
import com.fluytcloud.catalog.transport.request.TemplateRequest;
import com.fluytcloud.catalog.transport.response.TemplateParameterOptionResponse;
import com.fluytcloud.catalog.transport.response.TemplateParameterResponse;
import com.fluytcloud.catalog.transport.response.TemplateResponse;
import com.fluytcloud.catalog.transport.response.TemplateResponseList;
import com.fluytcloud.scm.transport.mapper.ScmMapper;

import java.util.List;

public class TemplateMapper {

    private final ScmMapper scmMapper;

    public TemplateMapper(ScmMapper scmMapper) {
        this.scmMapper = scmMapper;
    }

    public TemplateResponse map(Template template) {
        return new TemplateResponse(
                template.id(),
                template.name(),
                scmMapper.map(template.templateScm()),
                template.templateRepository(),
                template.templateBranch(),
                scmMapper.map(template.targetScm()),
                template.targetBranch()
        );
    }

    public TemplateResponseList mapList(Template template) {
        return new TemplateResponseList(
                template.id(),
                template.name()
        );
    }

    public Template map(TemplateRequest request, Integer id) {
        return new Template(
                id,
                request.name(),
                scmMapper.map(request.templateScm(), request.templateScm().id()),
                request.templateRepository(),
                request.templateBranch(),
                scmMapper.map(request.targetScm(), request.targetScm().id()),
                request.targetBranch()
        );
    }

    public Template map(TemplateRequest request) {
        return map(request, null);
    }

    public List<TemplateParameterResponse> map(List<TemplateParameter> parameter) {
        return parameter.stream().map(e -> new TemplateParameterResponse(
                e.name(),
                e.label(),
                e.type(),
                e.required(),
                e.value(),
                mapOptions(e.options())
        )).toList();
    }

    public List<TemplateParameterOptionResponse> mapOptions(List<TemplateParameterOption> options) {
        if (options == null) {
            return null;
        }
        return options.stream().map(i -> new TemplateParameterOptionResponse(i.label(), i.value())).toList();
    }

}
