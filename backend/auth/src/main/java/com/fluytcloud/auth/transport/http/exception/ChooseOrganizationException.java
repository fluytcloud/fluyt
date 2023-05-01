package com.fluytcloud.auth.transport.http.exception;

import com.fluytcloud.rest.exception.RestException;

public class ChooseOrganizationException extends RestException {

    public ChooseOrganizationException() {
        super(403, "Selecione uma empresa");
    }
}
