package com.fluytcloud.kubernetes.repositories;

import io.kubernetes.client.openapi.models.V1ConfigMap;

public interface ConfigMapRepository extends NamespaceObjectsRepository<V1ConfigMap> {

}