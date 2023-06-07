package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.EndpointRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.models.V1Endpoints;
import io.kubernetes.client.openapi.models.V1EndpointsList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.enterprise.context.ApplicationScoped;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class EndpointRepositoryImpl extends NamespaceObjectRepositoryImpl<V1Endpoints> implements EndpointRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger(EndpointRepositoryImpl.class.getName());

    @Override
    protected List<V1Endpoints> listByNamespace(Cluster cluster, Search search) throws ApiException {
        var coreApi = new Connection(cluster).getCoreApi();
        return Optional.ofNullable(
                        coreApi.listNamespacedEndpoints(
                                search.getNamespace(),
                                search.getPretty(),
                                search.getAllowWatchBookmarks(),
                                search.get_continue(),
                                search.getFieldSelector(),
                                search.getLabelSelector(),
                                search.getLimit(),
                                search.getResourceVersion(),
                                search.getResourceVersionMatch(),
                                search.getTimeoutSeconds(),
                                search.getWatch()
                        ))
                .map(V1EndpointsList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected List<V1Endpoints> listByAllNamespace(Cluster cluster, Search search) throws ApiException {
        var coreApi = new Connection(cluster).getCoreApi();
        return Optional.ofNullable(
                        coreApi.listEndpointsForAllNamespaces(
                                search.getAllowWatchBookmarks(),
                                search.get_continue(),
                                search.getFieldSelector(),
                                search.getLabelSelector(),
                                search.getLimit(),
                                search.getPretty(),
                                search.getResourceVersion(),
                                search.getResourceVersionMatch(),
                                search.getTimeoutSeconds(),
                                search.getWatch()
                        ))
                .map(V1EndpointsList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected V1Endpoints readObject(Cluster cluster, String namespace, String name) throws ApiException {
        var coreApi = new Connection(cluster).getCoreApi();
        return coreApi.readNamespacedEndpoints(name, namespace, null);
    }

    @Override
    public V1Endpoints apply(Cluster cluster, V1Endpoints object) {
        try {
            var coreApi = new Connection(cluster).getCoreApi();
            return coreApi.replaceNamespacedEndpoints(
                    object.getMetadata().getName(),
                    object.getMetadata().getNamespace(),
                    object,
                    null,
                    null,
                    null,
                    null
            );
        } catch (Exception e) {
            LOGGER.error("error...", e);
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(Cluster cluster, String namespace, String name) {
        try {
            var coreApi = new Connection(cluster).getCoreApi();
            coreApi.deleteNamespacedEndpoints(
                    name,
                    namespace,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null
            );
        } catch (Exception e) {
            LOGGER.error("error...", e);
            throw new RuntimeException(e);
        }
    }

}