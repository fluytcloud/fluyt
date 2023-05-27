package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterRoleService;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.transport.mapper.ClusterRoleMapper;
import com.fluytcloud.kubernetes.transport.request.ClusterObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.ClusterObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.ClusterRoleResponseList;
import io.kubernetes.client.openapi.models.V1ClusterRole;
import io.quarkus.security.Authenticated;
import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

import java.util.List;

@Path("/api/v1/kubernetes/cluster-role")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class ClusterRoleResource {

    private final ClusterRoleService clusterRoleService;
    private final ClusterService clusterService;

    private static final ClusterRoleMapper CLUSTER_ROLE_MAPPER = new ClusterRoleMapper();

    public ClusterRoleResource(ClusterRoleService configMapService, ClusterService clusterService) {
        this.clusterRoleService = configMapService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<ClusterRoleResponseList> find(@BeanParam @Valid ClusterObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();
        var filter = new Filter(cluster).setSearch(requestFilter.getName());
        var clusterRoles = clusterRoleService.list(filter);
        return CLUSTER_ROLE_MAPPER.mapResponseList(clusterRoles);
    }

    @GET
    public V1ClusterRole get(@BeanParam @Valid ClusterObjectRequestFilter podFilter) {
        var cluster = clusterService.findById(podFilter.getClusterId())
                .orElseThrow();
        return clusterRoleService.read(cluster, podFilter.getName())
                .orElseThrow(() -> new NotFoundException("ClusterRole not found"));
    }
}
