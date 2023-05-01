package com.fluytcloud.auth.transport.http.exception;

import com.fluytcloud.rest.exception.RestException;

public class AccessDeniedException extends RestException {

    public AccessDeniedException() {
        super(403, "Acesso negado");
    }

}