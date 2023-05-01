package com.fluytcloud.kubernetes.repositories;

import io.kubernetes.client.openapi.models.V1Pod;

public interface PodRepository extends NamespaceObjectsRepository<V1Pod> {

}
