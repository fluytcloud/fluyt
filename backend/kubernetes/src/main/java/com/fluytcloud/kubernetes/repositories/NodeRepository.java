package com.fluytcloud.kubernetes.repositories;

import io.kubernetes.client.openapi.models.V1Node;

public interface NodeRepository extends ClusterObjectsRepository<V1Node> {
}
