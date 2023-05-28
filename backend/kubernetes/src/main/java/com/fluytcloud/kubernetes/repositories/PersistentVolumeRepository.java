package com.fluytcloud.kubernetes.repositories;

import io.kubernetes.client.openapi.models.V1PersistentVolume;

public interface PersistentVolumeRepository extends ClusterObjectsRepository<V1PersistentVolume> {
}
