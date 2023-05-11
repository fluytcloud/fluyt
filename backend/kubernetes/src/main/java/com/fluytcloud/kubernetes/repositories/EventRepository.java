package com.fluytcloud.kubernetes.repositories;

import io.kubernetes.client.openapi.models.CoreV1Event;

public interface EventRepository extends NamespaceObjectsRepository<CoreV1Event> {
}
