package com.fluytcloud.auth.transport.http.exception;

import com.fluytcloud.rest.exception.RestException;

public class EmptyCompanyException extends RestException {

    public EmptyCompanyException() {
        super(403, "Nenhuma filial cadastrada");
    }

}
