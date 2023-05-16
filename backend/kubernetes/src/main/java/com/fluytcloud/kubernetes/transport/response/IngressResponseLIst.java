package com.fluytcloud.kubernetes.transport.response;

import java.util.List;

public record IngressResponseLIst(
        String name,
        String namespace,
        List<String> loadBalancers,
        List<String> rules,
        String age
) {
}
