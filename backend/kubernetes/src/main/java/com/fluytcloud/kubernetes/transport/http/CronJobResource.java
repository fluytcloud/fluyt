package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.CronJobService;
import com.fluytcloud.kubernetes.transport.mapper.CronJobMapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.CronJobResponseList;
import io.kubernetes.client.openapi.models.V1CronJob;
import io.quarkus.security.Authenticated;

import javax.validation.Valid;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("/api/v1/kubernetes/cron-job")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class CronJobResource {

    private final CronJobService cronJobService;
    private final ClusterService clusterService;

    private static final CronJobMapper CRON_JOB_MAPPER = new CronJobMapper();

    public CronJobResource(CronJobService cronJobService, ClusterService clusterService) {
        this.cronJobService = cronJobService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<CronJobResponseList> find(@BeanParam @Valid NamespaceObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();
        var filter = new Filter(cluster).setNamespaces(requestFilter.getNamespaces()).setSearch(requestFilter.getName());
        var cronJobs = cronJobService.list(filter);
        return CRON_JOB_MAPPER.mapResponseList(cronJobs);
    }

    @GET
    public V1CronJob get(@BeanParam @Valid NamespaceObjectRequestFilter podFilter) {
        var cluster = clusterService.findById(podFilter.getClusterId())
                .orElseThrow();
        return cronJobService.read(cluster, podFilter.getNamespace(), podFilter.getName())
                .orElseThrow(() -> new NotFoundException("CronJob not found"));
    }

}
