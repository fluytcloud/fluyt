package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.ClusterObjectsRepository;
import com.fluytcloud.kubernetes.repositories.NodeRepository;
import io.kubernetes.client.openapi.models.V1Node;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class NodeService  extends ClusterObjectsService<V1Node> {

    private final NodeRepository nodeRepository;

    public NodeService(NodeRepository nodeRepository) {
        this.nodeRepository = nodeRepository;
    }

    @Override
    protected ClusterObjectsRepository<V1Node> repository() {
        return nodeRepository;
    }

}

