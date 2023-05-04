package com.fluytcloud.kubernetes.transport.response;

public record ReplicaSetResponseList(
        String name,
        String namespace,
        Integer desired,
        Integer current,
        Integer ready,
        String age) {
}
