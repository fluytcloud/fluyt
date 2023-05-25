package com.fluytcloud.kubernetes.repositories;

import io.kubernetes.client.openapi.models.V1Ingress;

public interface IngressRepository extends NamespaceObjectsRepository<V1Ingress> {
}
