package com.fluytcloud.kubernetes.repositories;

import io.kubernetes.client.openapi.models.V1Endpoints;

public interface EndpointRepository extends NamespaceObjectsRepository<V1Endpoints> {
}
