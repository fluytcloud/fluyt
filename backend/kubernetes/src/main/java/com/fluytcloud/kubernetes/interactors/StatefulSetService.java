package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import com.fluytcloud.kubernetes.repositories.StatefulSetRepository;
import io.kubernetes.client.openapi.models.V1StatefulSet;

import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class StatefulSetService extends NamespaceObjectsService<V1StatefulSet> implements ObjectService<V1StatefulSet>  {

    private final StatefulSetRepository statefulSetRepository;

    public StatefulSetService(StatefulSetRepository statefulSetRepository) {
        this.statefulSetRepository = statefulSetRepository;
    }

    @Override
    protected NamespaceObjectsRepository<V1StatefulSet> repository() {
        return statefulSetRepository;
    }

}

