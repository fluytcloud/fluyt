package com.fluytcloud.kubernetes.transport.response;

public record SecretResponseList(
        String namespace,
        String name,
        String keys,
        String type,
        String age
) {
}
