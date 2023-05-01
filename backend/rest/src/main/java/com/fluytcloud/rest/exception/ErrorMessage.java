package com.fluytcloud.rest.exception;

public record ErrorMessage(String message, int statusCode, String type) {
}
