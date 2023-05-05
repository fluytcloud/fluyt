package com.fluytcloud.kubernetes.repositories;

import io.kubernetes.client.openapi.models.V1StatefulSet;

public interface StatefulSetRepository extends NamespaceObjectsRepository<V1StatefulSet> {
}
