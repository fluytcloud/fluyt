package com.fluytcloud.kubernetes.transport.response;

public record PodSimpleResponseList(
        String namespace,
        String name,
        String nodeName,
        Integer containers,
        Integer runningContainers,
        String cpu,
        String memory,
        String status) {
}
