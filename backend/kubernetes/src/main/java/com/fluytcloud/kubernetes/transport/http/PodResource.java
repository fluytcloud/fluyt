package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.PodService;
import com.fluytcloud.kubernetes.transport.mapper.PodMapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.PodResponseList;
import io.kubernetes.client.openapi.models.V1Pod;
import io.quarkus.security.Authenticated;

import javax.validation.Valid;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("/api/v1/kubernetes/pod")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class PodResource {

    private final PodService podService;
    private final ClusterService clusterService;

    private static final PodMapper POD_MAPPER = new PodMapper();

    public PodResource(PodService podService, ClusterService clusterService) {
        this.podService = podService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<PodResponseList> find(@BeanParam @Valid NamespaceObjectRequestListFilter podFilter) {
        var cluster = clusterService.findById(podFilter.getClusterId())
                .orElseThrow();
        var filter = new Filter(cluster).setNamespaces(podFilter.getNamespaces()).setSearch(podFilter.getName());
        var pods = podService.list(filter);
        return POD_MAPPER.mapResponseList(pods);
    }

    @GET
    public V1Pod get(@BeanParam @Valid NamespaceObjectRequestFilter podFilter) {
        var cluster = clusterService.findById(podFilter.getClusterId())
                .orElseThrow();
        return podService.read(cluster, podFilter.getNamespace(), podFilter.getName())
                .orElseThrow(() -> new NotFoundException("Pod not found"));
    }

}
