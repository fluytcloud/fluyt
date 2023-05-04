package com.fluytcloud.kubernetes.repositories;

import io.kubernetes.client.openapi.models.V1ReplicaSet;

public interface ReplicaSetRepository extends NamespaceObjectsRepository<V1ReplicaSet> {

}