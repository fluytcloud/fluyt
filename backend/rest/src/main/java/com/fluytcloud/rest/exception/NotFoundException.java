package com.fluytcloud.rest.exception;

import jakarta.ws.rs.core.Response;

public class NotFoundException extends RestException {

    public NotFoundException(String message) {
        super(Response.Status.NOT_FOUND.getStatusCode(), message);
    }

}
