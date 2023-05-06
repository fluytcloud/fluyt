package com.fluytcloud.kubernetes.repositories;

import io.kubernetes.client.openapi.models.V1DaemonSet;

public interface DaemonSetRepository extends NamespaceObjectsRepository<V1DaemonSet> {
}
