package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.ResourceQuotaService;
import com.fluytcloud.kubernetes.transport.mapper.ResourceQuotaMapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.ResourceQuotaResponseList;
import io.kubernetes.client.openapi.models.V1ResourceQuota;
import io.quarkus.security.Authenticated;
import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

import java.util.List;

@Path("/api/v1/kubernetes/resource-quota")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class ResourceQuotaResource {

    private static final ResourceQuotaMapper RESOURCE_QUOTA_MAPPER = new ResourceQuotaMapper();

    private final ResourceQuotaService resourceQuotaService;
    private final ClusterService clusterService;

    public ResourceQuotaResource(ResourceQuotaService roleService, ClusterService clusterService) {
        this.resourceQuotaService = roleService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<ResourceQuotaResponseList> find(@BeanParam @Valid NamespaceObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();

        var filter = new Filter(cluster)
                .setNamespaces(requestFilter.getNamespaces())
                .setSearch(requestFilter.getName());

        var resourceQuotas = resourceQuotaService.list(filter);
        return RESOURCE_QUOTA_MAPPER.mapResponseList(resourceQuotas);
    }

    @GET
    public V1ResourceQuota get(@BeanParam @Valid NamespaceObjectRequestFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();

        return resourceQuotaService.read(cluster,
                        requestFilter.getNamespace(),
                        requestFilter.getName())
                .orElseThrow(() -> new NotFoundException("ResourceQuota not found"));
    }
}
