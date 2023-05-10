package com.fluytcloud.kubernetes.transport.response;

public record EndpointResponseList(
        String name,
        String namespace,
        String endpoint,
        String age
) {
}
