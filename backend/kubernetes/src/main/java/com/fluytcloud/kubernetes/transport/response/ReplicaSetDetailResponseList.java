package com.fluytcloud.kubernetes.transport.response;

public record ReplicaSetDetailResponseList(
        String name,
        String namespace,
        Integer pods,
        String age) {
}
