package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.CronJobResponseList;
import io.kubernetes.client.openapi.models.V1CronJob;
import io.kubernetes.client.openapi.models.V1CronJobStatus;

import java.util.List;
import java.util.Objects;

public class CronJobMapper implements Mapper<V1CronJob, CronJobResponseList> {

    @Override
    public CronJobResponseList mapResponseList(V1CronJob cronJob) {
        return new CronJobResponseList(
                cronJob.getMetadata().getName(),
                cronJob.getMetadata().getNamespace(),
                cronJob.getSpec().getSchedule(),
                cronJob.getSpec().getSuspend(),
                getActive(cronJob.getStatus()),
                getLastSchedule(cronJob.getStatus()),
                KubernetesMapper.formatAge(cronJob.getMetadata().getCreationTimestamp())
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
        return KubernetesMapper.formatAge(status.getLastScheduleTime());
    }

    @Override
    public List<CronJobResponseList> mapResponseList(List<V1CronJob> cronJobs) {
        return cronJobs.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
