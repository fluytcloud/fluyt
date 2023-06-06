package com.fluytcloud.scm.transport.mapper;

import com.fluytcloud.scm.entities.Scm;
import com.fluytcloud.scm.transport.request.ScmRequest;
import com.fluytcloud.scm.transport.response.ScmResponse;

public class ScmMapper {

    public ScmResponse map(Scm scm) {
        return new ScmResponse(
                scm.id(),
                scm.name(),
                scm.type(),
                scm.url(),
                scm.username(),
                scm.organization()
        );
    }

    public Scm map(ScmRequest request, Integer id) {
        return new Scm(
                id,
                request.name(),
                request.type(),
                request.url(),
                request.username(),
                request.token(),
                request.organization()
        );
    }

    public Scm map(ScmRequest request) {
        return map(request, null);
    }

}
