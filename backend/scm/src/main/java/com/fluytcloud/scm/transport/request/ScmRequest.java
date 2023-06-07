package com.fluytcloud.scm.transport.request;

import com.fluytcloud.scm.entities.ScmType;

public record ScmRequest(
        Integer id,
        String name,
        ScmType type,
        String url,
        String username,
        String token,
        String organization
) {
}
