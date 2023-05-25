package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.EndpointService;
import com.fluytcloud.kubernetes.transport.mapper.EndpointMapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.EndpointResponseList;
import io.kubernetes.client.openapi.models.V1Endpoints;
import io.quarkus.security.Authenticated;
import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

import java.util.List;

@Path("/api/v1/kubernetes/endpoint")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class EndpointResource {

    private final EndpointService endpointService;
    private final ClusterService clusterService;

    public EndpointResource(EndpointService endpointService, ClusterService clusterService) {
        this.endpointService = endpointService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<EndpointResponseList> find(@BeanParam @Valid NamespaceObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();
        var filter = new Filter(cluster).setNamespaces(requestFilter.getNamespaces()).setSearch(requestFilter.getName());
        var endpoints = endpointService.list(filter);
        return EndpointMapper.mapResponseList(endpoints);
    }

    @GET
    public V1Endpoints get(@BeanParam @Valid NamespaceObjectRequestFilter podFilter) {
        var cluster = clusterService.findById(podFilter.getClusterId())
                .orElseThrow();
        return endpointService.read(cluster, podFilter.getNamespace(), podFilter.getName())
                .orElseThrow(() -> new NotFoundException("Endpoint not found"));
    }

}
