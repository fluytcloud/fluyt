package com.fluytcloud.kubernetes.repositories;

import io.kubernetes.client.openapi.models.V1LimitRange;

public interface LimitRangeRepository extends NamespaceObjectsRepository<V1LimitRange> {
}
