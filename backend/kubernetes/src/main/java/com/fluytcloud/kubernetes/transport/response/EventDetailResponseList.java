package com.fluytcloud.kubernetes.transport.response;

import java.time.OffsetDateTime;

public record EventDetailResponseList(
        String source,
        Integer count,
        String object,
        OffsetDateTime lastSeen
) {

}
