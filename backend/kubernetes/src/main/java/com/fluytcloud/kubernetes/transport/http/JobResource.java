package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.interactors.JobService;
import com.fluytcloud.kubernetes.interactors.NamespaceObjectsService;
import com.fluytcloud.kubernetes.transport.mapper.JobMapper;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.response.JobResponseList;
import io.kubernetes.client.openapi.models.V1Job;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;

@Path("/api/v1/kubernetes/job")
@Authenticated
public class JobResource extends NamespaceObjectsResource<V1Job, JobResponseList> {

    private static final JobMapper JOB_MAPPER = new JobMapper();

    @Inject
    protected JobService jobService;

    @Override
    protected NamespaceObjectsService<V1Job> getService() {
        return jobService;
    }

    @Override
    protected Mapper<V1Job, JobResponseList> getMapper() {
        return JOB_MAPPER;
    }
}
