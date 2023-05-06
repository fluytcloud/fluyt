package com.fluytcloud.kubernetes.transport.response;

import java.util.Map;

public record DaemonSetResponseList(
        String name,
        String namespace,
        String pods,
        Map<String, String> nodeSelector,
        String age
) {
}
