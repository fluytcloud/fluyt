package com.fluytcloud.kubernetes.transport.response;

import java.math.BigDecimal;
import java.util.List;

public record PersistentVolumeResponseList(
        String name,
        String storageClass,
        BigDecimal capacity,
        String claim,
        String status,
        String age
) {
}
