package com.fluytcloud.rest.exception;

import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.ext.ExceptionMapper;
import jakarta.ws.rs.ext.Provider;

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