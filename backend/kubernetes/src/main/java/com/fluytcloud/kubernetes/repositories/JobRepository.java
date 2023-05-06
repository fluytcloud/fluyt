package com.fluytcloud.kubernetes.repositories;

import io.kubernetes.client.openapi.models.V1Job;

public interface JobRepository extends NamespaceObjectsRepository<V1Job> {
}
