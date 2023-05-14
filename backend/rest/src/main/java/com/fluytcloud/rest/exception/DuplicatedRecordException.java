package com.fluytcloud.rest.exception;

import jakarta.ws.rs.core.Response;

public class DuplicatedRecordException extends RestException {

    public DuplicatedRecordException(String message) {
        super(Response.Status.CONFLICT.getStatusCode(), message);
    }

}
