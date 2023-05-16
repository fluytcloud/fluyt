package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.DaemonSetService;
import com.fluytcloud.kubernetes.transport.mapper.DaemonSetMapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.DaemonSetResponseList;
import io.kubernetes.client.openapi.models.V1DaemonSet;
import io.quarkus.security.Authenticated;

import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import java.util.List;

@Path("/api/v1/kubernetes/daemon-set")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class DaemonSetResource {

    private final DaemonSetService daemonSetService;
    private final ClusterService clusterService;

    private static final DaemonSetMapper DAEMON_SET_MAPPER = new DaemonSetMapper();

    public DaemonSetResource(DaemonSetService daemonSetService, ClusterService clusterService) {
        this.daemonSetService = daemonSetService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<DaemonSetResponseList> find(@BeanParam @Valid NamespaceObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();
        var filter = new Filter(cluster).setNamespaces(requestFilter.getNamespaces()).setSearch(requestFilter.getName());
        var daemonSets = daemonSetService.list(filter);
        return DAEMON_SET_MAPPER.mapResponseList(daemonSets);
    }

    @GET
    public V1DaemonSet get(@BeanParam @Valid NamespaceObjectRequestFilter podFilter) {
        var cluster = clusterService.findById(podFilter.getClusterId())
                .orElseThrow();
        return daemonSetService.read(cluster, podFilter.getNamespace(), podFilter.getName())
                .orElseThrow(() -> new NotFoundException("DaemonSet not found"));
    }

}
