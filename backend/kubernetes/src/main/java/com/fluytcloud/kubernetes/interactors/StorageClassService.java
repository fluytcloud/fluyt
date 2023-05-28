package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.ClusterObjectsRepository;
import com.fluytcloud.kubernetes.repositories.StorageClassRepository;
import io.kubernetes.client.openapi.models.V1StorageClass;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class StorageClassService extends ClusterObjectsService<V1StorageClass> {

    private final StorageClassRepository storageClassRepository;

    public StorageClassService(StorageClassRepository storageClassRepository) {
        this.storageClassRepository = storageClassRepository;
    }

    @Override
    protected ClusterObjectsRepository<V1StorageClass> repository() {
        return storageClassRepository;
    }

}
