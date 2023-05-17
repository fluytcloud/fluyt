package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.EndpointRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.models.V1Endpoints;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.enterprise.context.ApplicationScoped;
import java.util.List;

@ApplicationScoped
public class EndpointRepositoryImpl extends NamespaceObjectRepositoryImpl<V1Endpoints> implements EndpointRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger((EndpointRepositoryImpl.class.getName()));

    @Override
    protected List<V1Endpoints> listByNamespace(Cluster cluster, Search search) throws ApiException {
        // TODO: implmentar
        return null;
    }

    @Override
    protected List<V1Endpoints> listByAllNamespace(Cluster cluster, Search search) throws ApiException {
        // TODO: implmentar
        return null;
    }

    @Override
    protected V1Endpoints readObject(Cluster cluster, String namespace, String name) throws ApiException {
        // TODO: implmentar
        return null;
    }

    @Override
    public V1Endpoints apply(Cluster cluster, V1Endpoints object) {
        // TODO: implmentar
        return null;
    }

    @Override
    public void delete(Cluster cluster, String namespace, String name) {
        // TODO: implmentar
    }
}
