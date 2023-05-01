package com.fluytcloud.auth.transport.http.exception;

import com.fluytcloud.rest.exception.RestException;

public class ChooseCompanyException extends RestException {

    public ChooseCompanyException() {
        super(403, "Selecione uma empresa");
    }

}