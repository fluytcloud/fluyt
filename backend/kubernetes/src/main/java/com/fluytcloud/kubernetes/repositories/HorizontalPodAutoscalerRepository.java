package com.fluytcloud.kubernetes.repositories;

import io.kubernetes.client.openapi.models.V2HorizontalPodAutoscaler;

public interface HorizontalPodAutoscalerRepository extends NamespaceObjectsRepository<V2HorizontalPodAutoscaler> {
}
