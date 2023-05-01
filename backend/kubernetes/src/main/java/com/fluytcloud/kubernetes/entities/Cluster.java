package com.fluytcloud.kubernetes.entities;

public record Cluster(
        Integer id,
        String name,
        ConnectionType connectionType,
        String url,
        String token,
        String username,
        String password,
        boolean validateSSL
) {
}
