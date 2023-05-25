package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.ServiceRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.models.V1Service;
import io.kubernetes.client.openapi.models.V1ServiceList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.enterprise.context.ApplicationScoped;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class ServiceRepositoryImpl extends NamespaceObjectRepositoryImpl<V1Service> implements ServiceRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger(ServiceRepositoryImpl.class.getName());

    @Override
    protected List<V1Service> listByNamespace(Cluster cluster, Search search) throws ApiException {
        var coreApi = new Connection(cluster).getCoreApi();
        return Optional.ofNullable(
                        coreApi.listNamespacedService(
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
                .map(V1ServiceList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected List<V1Service> listByAllNamespace(Cluster cluster, Search search) throws ApiException {
        var coreApi = new Connection(cluster).getCoreApi();
        return Optional.ofNullable(
                        coreApi.listServiceForAllNamespaces(
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
                .map(V1ServiceList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected V1Service readObject(Cluster cluster, String namespace, String name) throws ApiException {
        var coreApi = new Connection(cluster).getCoreApi();
        return coreApi.readNamespacedService(name, namespace, null);
    }

    @Override
    public V1Service apply(Cluster cluster, V1Service object) {
        try {
            var coreApi = new Connection(cluster).getCoreApi();
            return coreApi.replaceNamespacedService(
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
            coreApi.deleteNamespacedService(
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
