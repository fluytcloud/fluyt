package com.fluytcloud.rest.exception;

import javax.ws.rs.core.Response;

public class NoContentException extends RestException {

    public NoContentException(String message) {
        super(Response.Status.NO_CONTENT.getStatusCode(), message);
    }
}
