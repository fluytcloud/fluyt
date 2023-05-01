package com.fluytcloud.kubernetes.transport.response;

import com.fluytcloud.kubernetes.entities.ConnectionType;

public record ClusterResponse(
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
