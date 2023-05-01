package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import com.fluytcloud.kubernetes.repositories.PodRepository;
import io.kubernetes.client.openapi.models.V1Pod;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class PodService extends NamespaceObjectsService<V1Pod> implements ObjectService<V1Pod>  {

    private final PodRepository podRepository;

    public PodService(PodRepository podRepository) {
        this.podRepository = podRepository;
    }

    @Override
    protected NamespaceObjectsRepository<V1Pod> repository() {
        return podRepository;
    }
}
