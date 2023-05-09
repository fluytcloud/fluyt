package com.fluytcloud.kubernetes.repositories;

import io.kubernetes.client.openapi.models.V1Deployment;

public interface DeploymentRepository extends NamespaceObjectsRepository<V1Deployment> {
}
