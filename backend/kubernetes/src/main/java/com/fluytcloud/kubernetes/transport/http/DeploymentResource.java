package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.DeploymentService;
import com.fluytcloud.kubernetes.transport.mapper.DeploymentMapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.DeploymentResponseList;
import io.kubernetes.client.openapi.models.V1Deployment;
import io.quarkus.security.Authenticated;

import javax.validation.Valid;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("/api/v1/kubernetes/deployment")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class DeploymentResource {

    private final DeploymentService deploymentService;

    private final ClusterService clusterService;

    private static final DeploymentMapper DEPLOYMENT_MAPPER = new DeploymentMapper();

    public DeploymentResource(DeploymentService deploymentService, ClusterService clusterService) {
        this.deploymentService = deploymentService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<DeploymentResponseList> find(@BeanParam @Valid NamespaceObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();
        var filter = new Filter(cluster).setNamespaces(requestFilter.getNamespaces()).setSearch(requestFilter.getName());
        var replicaSets = deploymentService.list(filter);
        return DEPLOYMENT_MAPPER.mapResponseList(replicaSets);
    }

    @GET
    public V1Deployment get(@BeanParam @Valid NamespaceObjectRequestFilter deploymentFilter) {
        var cluster = clusterService.findById(deploymentFilter.getClusterId())
                .orElseThrow();
        return deploymentService.read(cluster, deploymentFilter.getNamespace(), deploymentFilter.getName())
                .orElseThrow(() -> new NotFoundException("Deployment not found"));
    }
}
