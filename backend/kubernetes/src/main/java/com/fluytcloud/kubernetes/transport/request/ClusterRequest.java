package com.fluytcloud.kubernetes.transport.request;

import com.fluytcloud.kubernetes.entities.ConnectionType;

public record ClusterRequest(
        String name,
        ConnectionType connectionType,
        String url,
        String token,
        String username,
        String password,
        boolean validateSSL
) {
}
