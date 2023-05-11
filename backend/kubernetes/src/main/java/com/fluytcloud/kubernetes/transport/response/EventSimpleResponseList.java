package com.fluytcloud.kubernetes.transport.response;

import java.time.OffsetDateTime;

public record EventSimpleResponseList(
        String source,
        Integer count,
        String object,
        OffsetDateTime lastSeen
) {

}
