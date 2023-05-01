package com.fluytcloud.kubernetes.transport.response;

import java.util.List;

public record PodResponseList(
        String namespace,
        String name,
        Integer restarts,
        String nodeName,
        String qosClass,
        String age,
        String status,
        List<PodContainerResponseList> containers) {
}
