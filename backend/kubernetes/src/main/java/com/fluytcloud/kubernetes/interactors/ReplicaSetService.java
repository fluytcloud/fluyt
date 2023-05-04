package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import com.fluytcloud.kubernetes.repositories.ReplicaSetRepository;
import io.kubernetes.client.openapi.models.V1ReplicaSet;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class ReplicaSetService extends NamespaceObjectsService<V1ReplicaSet> implements ObjectService<V1ReplicaSet>  {

    private final ReplicaSetRepository replicaSetRepository;

    public ReplicaSetService(ReplicaSetRepository replicaSetRepository) {
        this.replicaSetRepository = replicaSetRepository;
    }

    @Override
    protected NamespaceObjectsRepository<V1ReplicaSet> repository() {
        return replicaSetRepository;
    }

}
