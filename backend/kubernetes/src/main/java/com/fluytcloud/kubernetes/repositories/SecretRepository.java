package com.fluytcloud.kubernetes.repositories;

import io.kubernetes.client.openapi.models.V1Secret;

public interface SecretRepository extends NamespaceObjectsRepository<V1Secret> {
}
