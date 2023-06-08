package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.LimitRangeRepository;
import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import io.kubernetes.client.openapi.models.V1LimitRange;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class LimitRangeService extends NamespaceObjectsService<V1LimitRange> implements ObjectService<V1LimitRange> {

    private final LimitRangeRepository limitRangeRepository;

    public LimitRangeService(LimitRangeRepository limitRangeRepository) {
        this.limitRangeRepository = limitRangeRepository;
    }

    @Override
    protected NamespaceObjectsRepository<V1LimitRange> repository() {
        return limitRangeRepository;
    }

}