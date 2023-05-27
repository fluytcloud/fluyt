package com.fluytcloud.kubernetes.transport.response;

import java.util.List;

public record ClusterRoleBindingResponseList(
        String name,
        List<String> bindings,
        String age
) {
}
