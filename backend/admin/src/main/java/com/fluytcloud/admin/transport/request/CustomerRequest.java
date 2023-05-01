package com.fluytcloud.admin.transport.request;

public record CustomerRequest(String companyName, String tradeName, String email, boolean active) {
}
