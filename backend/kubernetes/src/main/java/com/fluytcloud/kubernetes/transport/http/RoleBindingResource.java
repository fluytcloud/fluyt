package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.RoleBindingService;
import com.fluytcloud.kubernetes.transport.mapper.RoleBindingMapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.RoleBindingResponseList;
import io.kubernetes.client.openapi.models.V1RoleBinding;
import io.quarkus.security.Authenticated;
import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

import java.util.List;

@Path("/api/v1/kubernetes/role-binding")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class RoleBindingResource {

    private final RoleBindingService roleBindingService;
    private final ClusterService clusterService;

    private static final RoleBindingMapper ROLE_BINDING_MAPPER = new RoleBindingMapper();

    public RoleBindingResource(RoleBindingService roleBindingService, ClusterService clusterService) {
        this.roleBindingService = roleBindingService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<RoleBindingResponseList> find(@BeanParam @Valid NamespaceObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();
        var filter = new Filter(cluster).setNamespaces(requestFilter.getNamespaces()).setSearch(requestFilter.getName());
        var jobs = roleBindingService.list(filter);
        return ROLE_BINDING_MAPPER.mapResponseList(jobs);
    }

    @GET
    public V1RoleBinding get(@BeanParam @Valid NamespaceObjectRequestFilter podFilter) {
        var cluster = clusterService.findById(podFilter.getClusterId())
                .orElseThrow();
        return roleBindingService.read(cluster, podFilter.getNamespace(), podFilter.getName())
                .orElseThrow(() -> new NotFoundException("RoleBinding not found"));
    }

}
