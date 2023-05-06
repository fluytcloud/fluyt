package com.fluytcloud.kubernetes.transport.response;

public record CronJobResponseList(
        String name,
        String namespace,
        String schedule,
        Boolean suspend,
        Integer active,
        String lastSchedule,
        String age
) {
}
