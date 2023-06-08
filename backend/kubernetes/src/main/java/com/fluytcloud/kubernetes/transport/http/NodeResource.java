package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.interactors.ClusterObjectsService;
import com.fluytcloud.kubernetes.interactors.NodeService;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.mapper.NodeMapper;
import com.fluytcloud.kubernetes.transport.response.NodeResponseList;
import io.kubernetes.client.openapi.models.V1Node;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;

@Path("/api/v1/kubernetes/node")
@Authenticated
public class NodeResource extends ClusterObjectsResource<V1Node, NodeResponseList> {

    private static final NodeMapper NODE_MAPPER = new NodeMapper();

    @Inject
    protected NodeService nodeService;

    @Override
    protected ClusterObjectsService<V1Node> getService() {
        return nodeService;
    }

    @Override
    protected Mapper<V1Node, NodeResponseList> getMapper() {
        return NODE_MAPPER;
    }
}
