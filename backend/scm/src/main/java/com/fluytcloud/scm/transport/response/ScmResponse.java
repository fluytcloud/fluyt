package com.fluytcloud.scm.transport.response;

import com.fluytcloud.scm.entities.ScmType;

public record ScmResponse(
        Integer id,
        String name,
        ScmType type,
        String url,
        String username,
        String organization
) {
}
