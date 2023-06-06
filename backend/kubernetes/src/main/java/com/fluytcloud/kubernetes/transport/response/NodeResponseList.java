package com.fluytcloud.kubernetes.transport.response;

import java.util.List;

public record NodeResponseList(
        String name,
        Integer taints,
        String version,
        List<String> conditions,
        String age
) {
}
