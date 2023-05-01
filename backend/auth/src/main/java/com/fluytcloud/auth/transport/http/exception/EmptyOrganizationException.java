package com.fluytcloud.auth.transport.http.exception;

import com.fluytcloud.rest.exception.RestException;

public class EmptyOrganizationException extends RestException {

    public EmptyOrganizationException() {
        super(403, "Nenhuma empresa vinculada ao usuário");
    }
}
