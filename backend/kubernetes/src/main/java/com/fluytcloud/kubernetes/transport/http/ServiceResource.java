package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.ServiceService;
import com.fluytcloud.kubernetes.transport.mapper.ServiceMapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.ServiceResponseList;
import io.kubernetes.client.openapi.models.V1Service;
import io.quarkus.security.Authenticated;

import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import java.util.List;

@Path("/api/v1/kubernetes/service")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class ServiceResource {

    private static final ServiceMapper SERVICE_MAPPER = new ServiceMapper();

    private final ServiceService serviceService;
    private final ClusterService clusterService;

    public ServiceResource(ServiceService serviceService, ClusterService clusterService) {
        this.serviceService = serviceService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<ServiceResponseList> find(@BeanParam @Valid NamespaceObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();

        var filter = new Filter(cluster)
                .setNamespaces(requestFilter.getNamespaces())
                .setSearch(requestFilter.getName());

        var services = serviceService.list(filter);
        return SERVICE_MAPPER.mapResponseList(services);
    }

    @GET
    public V1Service get(@BeanParam @Valid NamespaceObjectRequestFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();

        return serviceService.read(cluster,
                        requestFilter.getNamespace(),
                        requestFilter.getName())
                .orElseThrow(() -> new NotFoundException("Service not found"));
    }
}
