package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.ClusterObjectsRepository;
import com.fluytcloud.kubernetes.repositories.PersistentVolumeRepository;
import io.kubernetes.client.openapi.models.V1PersistentVolume;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class PersistentVolumeService extends ClusterObjectsService<V1PersistentVolume> {

    private final PersistentVolumeRepository persistentVolumeRepository;

    public PersistentVolumeService(PersistentVolumeRepository replicaSetRepository) {
        this.persistentVolumeRepository = replicaSetRepository;
    }

    @Override
    protected ClusterObjectsRepository<V1PersistentVolume> repository() {
        return persistentVolumeRepository;
    }

}
