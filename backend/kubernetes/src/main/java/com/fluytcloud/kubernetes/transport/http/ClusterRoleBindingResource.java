package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterRoleBindingService;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.transport.mapper.ClusterRoleBindingMapper;
import com.fluytcloud.kubernetes.transport.request.ClusterObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.ClusterObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.ClusterRoleBindingResponseList;
import io.kubernetes.client.openapi.models.V1ClusterRoleBinding;
import io.quarkus.security.Authenticated;
import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

import java.util.List;

@Path("/api/v1/kubernetes/cluster-role-binding")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class ClusterRoleBindingResource {

    private final ClusterRoleBindingService clusterRoleBindingService;
    private final ClusterService clusterService;

    private static final ClusterRoleBindingMapper CLUSTER_ROLE_BINDING_MAPPER = new ClusterRoleBindingMapper();

    public ClusterRoleBindingResource(ClusterRoleBindingService configMapService, ClusterService clusterService) {
        this.clusterRoleBindingService = configMapService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<ClusterRoleBindingResponseList> find(@BeanParam @Valid ClusterObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();
        var filter = new Filter(cluster).setSearch(requestFilter.getName());
        var clusterRoleBindings = clusterRoleBindingService.list(filter);
        return CLUSTER_ROLE_BINDING_MAPPER.mapResponseList(clusterRoleBindings);
    }

    @GET
    public V1ClusterRoleBinding get(@BeanParam @Valid ClusterObjectRequestFilter podFilter) {
        var cluster = clusterService.findById(podFilter.getClusterId())
                .orElseThrow();
        return clusterRoleBindingService.read(cluster, podFilter.getName())
                .orElseThrow(() -> new NotFoundException("ClusterRoleBinding not found"));
    }
}
