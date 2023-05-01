package com.fluytcloud.kubernetes.transport.response;

import java.util.Optional;

public record PodContainerResponseList(
        String name,
        boolean ready,
        Optional<String> status,
        Optional<String> reason
) {
}
