package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import com.fluytcloud.kubernetes.repositories.PersistentVolumeClaimRepository;
import io.kubernetes.client.openapi.models.V1PersistentVolumeClaim;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class PersistentVolumeClaimService extends NamespaceObjectsService<V1PersistentVolumeClaim> implements ObjectService<V1PersistentVolumeClaim> {

    private final PersistentVolumeClaimRepository persistentVolumeClaimRepository;

    public PersistentVolumeClaimService(PersistentVolumeClaimRepository persistentVolumeClaimRepository) {
        this.persistentVolumeClaimRepository = persistentVolumeClaimRepository;
    }

    @Override
    protected NamespaceObjectsRepository<V1PersistentVolumeClaim> repository() {
        return persistentVolumeClaimRepository;
    }

}