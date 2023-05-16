package com.fluytcloud.kubernetes.transport.response;

import java.util.List;

public record ServiceResponseList(
        String namespace,
        String name,
        String type,
        String clusterIp,
        List<String> ports,
        List<String> externalIps,
        List<String> selectors,
        List<String> status,
        String age) {
}
