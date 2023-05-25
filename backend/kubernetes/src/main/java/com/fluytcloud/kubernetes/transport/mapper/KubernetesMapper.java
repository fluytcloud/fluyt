package com.fluytcloud.kubernetes.transport.mapper;

import org.ocpsoft.prettytime.PrettyTime;

import java.time.OffsetDateTime;

public class KubernetesMapper {

    private static final PrettyTime PRETTY_TIME = new PrettyTime();

    private KubernetesMapper() {
    }

    static String formatAge(OffsetDateTime dateTime) {
        return PRETTY_TIME.format(dateTime);
    }

}
