package com.fluytcloud.kubernetes.repositories;

import io.kubernetes.client.openapi.models.V1ResourceQuota;

public interface ResourceQuotaRepository extends NamespaceObjectsRepository<V1ResourceQuota> {
}
