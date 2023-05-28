package com.fluytcloud.kubernetes.repositories;

import io.kubernetes.client.openapi.models.V1StorageClass;

public interface StorageClassRepository extends ClusterObjectsRepository<V1StorageClass> {
}
