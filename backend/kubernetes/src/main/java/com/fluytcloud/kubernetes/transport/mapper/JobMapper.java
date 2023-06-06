package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.JobResponseList;
import io.kubernetes.client.openapi.models.V1Job;
import io.kubernetes.client.openapi.models.V1JobStatus;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

public class JobMapper implements Mapper<V1Job, JobResponseList> {

    @Override
    public JobResponseList mapResponseList(V1Job cronJob) {
        var status = Optional.ofNullable(cronJob.getStatus());

        return new JobResponseList(
                cronJob.getMetadata().getName(),
                cronJob.getMetadata().getNamespace(),
                status.map(V1JobStatus::getActive).orElse(0),
                status.map(V1JobStatus::getFailed).orElse(0),
                status.map(V1JobStatus::getReady).orElse(0),
                status.map(V1JobStatus::getSucceeded).orElse(0),
                conditions(cronJob.getStatus()),
                KubernetesMapper.formatAge(cronJob.getMetadata().getCreationTimestamp())
        );
    }

    private List<String> conditions(V1JobStatus jobStatus) {
        return Optional.ofNullable(jobStatus)
                .map(it -> it.getConditions()
                        .stream()
                        .map(condition -> condition.getType())
                        .toList()
                )
                .orElse(Collections.emptyList());
    }

    @Override
    public List<JobResponseList> mapResponseList(List<V1Job> jobs) {
        return jobs.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
