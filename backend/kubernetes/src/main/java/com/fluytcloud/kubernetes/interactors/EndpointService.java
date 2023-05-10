package com.fluytcloud.kubernetes.interactors;

import com.fluycloud.support.core.CrudRepository;
import com.fluycloud.support.core.CrudServiceImpl;
import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.repositories.ClusterRepository;
import com.fluytcloud.kubernetes.repositories.DaemonSetRepository;
import com.fluytcloud.kubernetes.repositories.EndpointRepository;
import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import io.kubernetes.client.openapi.models.V1DaemonSet;
import io.kubernetes.client.openapi.models.V1Endpoints;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class EndpointService extends NamespaceObjectsService<V1Endpoints> implements ObjectService<V1Endpoints>  {

    private final EndpointRepository endpointRepository;

    public EndpointService(EndpointRepository endpointRepository) {
        this.endpointRepository = endpointRepository;
    }

    @Override
    protected NamespaceObjectsRepository<V1Endpoints> repository() {
        return endpointRepository;
    }

}

