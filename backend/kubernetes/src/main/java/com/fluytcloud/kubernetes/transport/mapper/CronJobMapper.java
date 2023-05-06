package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.CronJobResponseList;
import io.kubernetes.client.openapi.models.V1CronJob;
import io.kubernetes.client.openapi.models.V1CronJobStatus;
import org.ocpsoft.prettytime.PrettyTime;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.Objects;

public class CronJobMapper {

    public CronJobResponseList mapResponseList(V1CronJob cronJob) {
        return new CronJobResponseList(
                cronJob.getMetadata().getName(),
                cronJob.getMetadata().getNamespace(),
                cronJob.getSpec().getSchedule(),
                cronJob.getSpec().getSuspend(),
                getActive(cronJob.getStatus()),
                getLastSchedule(cronJob.getStatus()),
                getPrettyTime(cronJob.getMetadata().getCreationTimestamp())
        );
    }

    private Integer getActive(V1CronJobStatus status) {
        if (Objects.isNull(status) || Objects.isNull(status.getActive())) {
            return 0;
        }
        return status.getActive().size();
    }

    private String getLastSchedule(V1CronJobStatus status) {
        if (Objects.isNull(status) || Objects.isNull(status.getLastScheduleTime())) {
            return null;
        }
        return getPrettyTime(status.getLastScheduleTime());
    }


    private String getPrettyTime(OffsetDateTime dateTime) {
        PrettyTime prettyTime = new PrettyTime();
        return prettyTime.format(dateTime);
    }

    public List<CronJobResponseList> mapResponseList(List<V1CronJob> cronJobs) {
        return cronJobs.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
