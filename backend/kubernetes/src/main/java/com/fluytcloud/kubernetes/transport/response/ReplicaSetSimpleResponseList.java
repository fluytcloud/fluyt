package com.fluytcloud.kubernetes.transport.response;

public record ReplicaSetSimpleResponseList(
        String uid,
        String name,
        String namespace,
        Integer pods,
        String age) {
}
