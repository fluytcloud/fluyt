package com.fluytcloud.kubernetes.transport.response;

import java.math.BigDecimal;

public record PersistentVolumeClaimResponseList(
        String name,
        String namespace,
        String storageClass,
        BigDecimal size,
        String status,
        String age
) {
}
