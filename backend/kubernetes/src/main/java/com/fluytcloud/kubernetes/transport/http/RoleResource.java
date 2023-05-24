package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.RoleService;
import com.fluytcloud.kubernetes.transport.mapper.RoleMapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.RoleResponseList;
import io.kubernetes.client.openapi.models.V1Role;
import io.quarkus.security.Authenticated;
import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

import java.util.List;

@Path("/api/v1/kubernetes/role")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class RoleResource {

    private static final RoleMapper ROLE_MAPPER = new RoleMapper();

    private final RoleService roleService;
    private final ClusterService clusterService;

    public RoleResource(RoleService roleService, ClusterService clusterService) {
        this.roleService = roleService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<RoleResponseList> find(@BeanParam @Valid NamespaceObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();

        var filter = new Filter(cluster)
                .setNamespaces(requestFilter.getNamespaces())
                .setSearch(requestFilter.getName());

        var roles = roleService.list(filter);
        return ROLE_MAPPER.mapResponseList(roles);
    }

    @GET
    public V1Role get(@BeanParam @Valid NamespaceObjectRequestFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();

        return roleService.read(cluster,
                        requestFilter.getNamespace(),
                        requestFilter.getName())
                .orElseThrow(() -> new NotFoundException("Role not found"));
    }

}
