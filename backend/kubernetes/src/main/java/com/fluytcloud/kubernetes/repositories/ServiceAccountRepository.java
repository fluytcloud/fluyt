package com.fluytcloud.kubernetes.repositories;

import io.kubernetes.client.openapi.models.V1ServiceAccount;

public interface ServiceAccountRepository extends NamespaceObjectsRepository<V1ServiceAccount> {
}
