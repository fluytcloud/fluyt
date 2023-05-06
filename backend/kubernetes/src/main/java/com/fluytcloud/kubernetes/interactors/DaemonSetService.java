package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.DaemonSetRepository;
import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import io.kubernetes.client.openapi.models.V1DaemonSet;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class DaemonSetService extends NamespaceObjectsService<V1DaemonSet> implements ObjectService<V1DaemonSet>  {

    private final DaemonSetRepository daemonSetRepository;

    public DaemonSetService(DaemonSetRepository daemonSetRepository) {
        this.daemonSetRepository = daemonSetRepository;
    }

    @Override
    protected NamespaceObjectsRepository<V1DaemonSet> repository() {
        return daemonSetRepository;
    }

}

