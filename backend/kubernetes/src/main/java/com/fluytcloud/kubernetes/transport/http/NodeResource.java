package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.NodeService;
import com.fluytcloud.kubernetes.transport.mapper.NodeMapper;
import com.fluytcloud.kubernetes.transport.request.ClusterObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.ClusterObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.NodeResponseList;
import io.kubernetes.client.openapi.models.V1Node;
import io.quarkus.security.Authenticated;
import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

import java.util.List;

@Path("/api/v1/kubernetes/node")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class NodeResource {

    private final NodeService nodeService;
    private final ClusterService clusterService;

    private static final NodeMapper NODE_MAPPER = new NodeMapper();

    public NodeResource(NodeService configMapService, ClusterService clusterService) {
        this.nodeService = configMapService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<NodeResponseList> find(@BeanParam @Valid ClusterObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();
        var filter = new Filter(cluster).setSearch(requestFilter.getName());
        var nodes = nodeService.list(filter);
        return NODE_MAPPER.mapResponseList(nodes);
    }

    @GET
    public V1Node get(@BeanParam @Valid ClusterObjectRequestFilter podFilter) {
        var cluster = clusterService.findById(podFilter.getClusterId())
                .orElseThrow();
        return nodeService.read(cluster, podFilter.getName())
                .orElseThrow(() -> new NotFoundException("Node not found"));
    }

}
