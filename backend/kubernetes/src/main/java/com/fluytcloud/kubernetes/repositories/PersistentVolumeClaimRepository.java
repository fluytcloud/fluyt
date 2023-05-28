package com.fluytcloud.kubernetes.repositories;

import io.kubernetes.client.openapi.models.V1PersistentVolumeClaim;

public interface PersistentVolumeClaimRepository extends NamespaceObjectsRepository<V1PersistentVolumeClaim> {
}
