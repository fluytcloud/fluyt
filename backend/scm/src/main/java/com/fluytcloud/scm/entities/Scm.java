package com.fluytcloud.scm.entities;

public record Scm(
        Integer id,
        String name,
        ScmType type,
        String url,
        String username,
        String token,
        String organization
) {

    public String getBearer() {
        return "Bearer " + token;
    }
}
