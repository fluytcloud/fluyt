package com.fluytcloud.kubernetes.transport.response;

import java.util.List;

public record JobResponseList(
        String name,
        String namespace,
        Integer active,
        Integer failed,
        Integer ready,
        Integer succeeded,
        List<String> conditions,
        String age
) {
}
