package com.fluytcloud.kubernetes.transport.response;

public record StatefulSetResponseList(
        String name,
        String namespace,
        String pods,
        Integer replicas,
        String age) {
}
