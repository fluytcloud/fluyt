package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.interactors.CronJobService;
import com.fluytcloud.kubernetes.interactors.NamespaceObjectsService;
import com.fluytcloud.kubernetes.transport.mapper.CronJobMapper;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.response.CronJobResponseList;
import io.kubernetes.client.openapi.models.V1CronJob;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;

@Path("/api/v1/kubernetes/cron-job")
@Authenticated
public class CronJobResource extends NamespaceObjectsResource<V1CronJob, CronJobResponseList> {

    private static final CronJobMapper CRON_JOB_MAPPER = new CronJobMapper();

    @Inject
    protected CronJobService cronJobService;

    @Override
    protected NamespaceObjectsService<V1CronJob> getService() {
        return cronJobService;
    }

    @Override
    protected Mapper<V1CronJob, CronJobResponseList> getMapper() {
        return CRON_JOB_MAPPER;
    }
}
