package com.fluytcloud.admin.transport.response;

public record CustomerResponse(Integer id, String companyName, String tradeName, String email, boolean active) {
}
