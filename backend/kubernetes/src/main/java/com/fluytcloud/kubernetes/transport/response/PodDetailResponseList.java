package com.fluytcloud.kubernetes.transport.response;

import java.util.List;

public record PodDetailResponseList(
        String namespace,
        String name,
        String nodeName,
        Integer containers,
        Integer runningContainers,
        String cpu,
        String memory,
        String status) {
}
