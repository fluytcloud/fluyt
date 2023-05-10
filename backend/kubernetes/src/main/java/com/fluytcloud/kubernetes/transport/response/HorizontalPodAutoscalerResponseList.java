package com.fluytcloud.kubernetes.transport.response;

import java.util.List;

public record HorizontalPodAutoscalerResponseList(
        String name,
        String namespace,
        List<String> metrics,
        Integer minPods,
        Integer maxPods,
        Integer replicas,
        List<String> status,
        String age
) {
}
