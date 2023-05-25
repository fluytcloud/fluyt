package com.fluytcloud.kubernetes.transport.response;

public record ResourceQuotaResponseList(
        String name,
        String namespace,
        String age
) {
}
