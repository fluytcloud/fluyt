package com.fluytcloud.kubernetes.transport.response;

public record StorageClassResponseList(
        String name,
        String provisioner,
        String reclaimPolicy,
        String age
) {
}
