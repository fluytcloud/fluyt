package com.fluytcloud.kubernetes.repositories;

import io.kubernetes.client.openapi.models.V1Service;

public interface ServiceRepository extends NamespaceObjectsRepository<V1Service> {
}
