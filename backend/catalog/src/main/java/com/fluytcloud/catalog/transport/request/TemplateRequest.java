package com.fluytcloud.catalog.transport.request;

import com.fluytcloud.scm.transport.request.ScmRequest;

public record TemplateRequest(
        Integer id,
        String name,
        ScmRequest templateScm,
        String templateRepository,
        String templateBranch,
        ScmRequest targetScm,
        String targetBranch
) {
}
