package com.fluytcloud.kubernetes.transport.response;

public record ServiceAccountResponseList(
        String namespace,
        String name,
        String age
) {
}
