package com.fluytcloud.kubernetes.transport.response;

import java.util.List;

public record RoleBindingResponseList(
        String name,
        String namespace,
        List<String> bindings,
        String age
) {
}
