package com.fluytcloud.rest.exception;

public class RestException extends RuntimeException {

    private final int statusCode;

    public RestException(int statusCode, String message) {
        super(message);
        this.statusCode = statusCode;
    }

    public int getStatusCode() {
        return statusCode;
    }

}
