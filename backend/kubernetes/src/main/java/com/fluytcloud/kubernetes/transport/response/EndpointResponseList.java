package com.fluytcloud.kubernetes.transport.response;

import java.util.Set;

public record EndpointResponseList(
        String name,
        String namespace,
        Set<String> endpoints,
        String age
) {
}
