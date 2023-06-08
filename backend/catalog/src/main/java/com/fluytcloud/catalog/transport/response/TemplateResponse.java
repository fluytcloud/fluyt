package com.fluytcloud.catalog.transport.response;

import com.fluytcloud.scm.transport.response.ScmResponse;

public record TemplateResponse(
        Integer id,
        String name,
        ScmResponse templateScm,
        String templateRepository,
        String templateBranch,
        ScmResponse targetScm,
        String targetBranch
) {
}
