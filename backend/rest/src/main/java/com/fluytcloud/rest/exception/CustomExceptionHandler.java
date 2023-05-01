package com.fluytcloud.rest.exception;

import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

@Provider
public class CustomExceptionHandler implements ExceptionMapper<RestException> {

    @Override
    public Response toResponse(RestException e) {
        return Response
                .status(e.getStatusCode())
                .entity(new ErrorMessage(e.getMessage(), e.getStatusCode(), e.getClass().getSimpleName()))
                .build();
    }

}