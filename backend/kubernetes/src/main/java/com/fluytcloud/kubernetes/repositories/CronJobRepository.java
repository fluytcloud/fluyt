package com.fluytcloud.kubernetes.repositories;

import io.kubernetes.client.openapi.models.V1CronJob;

public interface CronJobRepository extends NamespaceObjectsRepository<V1CronJob> {
}
