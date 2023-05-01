package com.fluytcloud.core.functions;

public class ThrowingWrapperFunctionalException extends RuntimeException {

    public ThrowingWrapperFunctionalException(Throwable cause) {
        super(cause);
    }

}
