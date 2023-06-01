package com.fluytcloud.kubernetes.transport.response;

import java.time.OffsetDateTime;

public record EventResponseList(String type,
                                String message,
                                String namespace,
                                String object,
                                String source,
                                Integer count,
                                String age,
                                String lastSeen,
                                String name) {
}
