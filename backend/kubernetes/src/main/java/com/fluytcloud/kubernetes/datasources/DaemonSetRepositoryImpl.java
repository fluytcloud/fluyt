package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.DaemonSetRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.models.V1DaemonSet;
import io.kubernetes.client.openapi.models.V1DaemonSetList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.enterprise.context.ApplicationScoped;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class DaemonSetRepositoryImpl extends NamespaceObjectRepositoryImpl<V1DaemonSet> implements DaemonSetRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger(DaemonSetRepositoryImpl.class.getName());

    @Override
    protected List<V1DaemonSet> listByNamespace(Cluster cluster, Search search) throws ApiException {
        var appsApi = new Connection(cluster).getAppsV1Api();
        return Optional.ofNullable(
                        appsApi.listNamespacedDaemonSet(
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
                .map(V1DaemonSetList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected List<V1DaemonSet> listByAllNamespace(Cluster cluster, Search search) throws ApiException {
        var appsApi = new Connection(cluster).getAppsV1Api();
        return Optional.ofNullable(
                        appsApi.listDaemonSetForAllNamespaces(
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
                .map(V1DaemonSetList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected V1DaemonSet readObject(Cluster cluster, String namespace, String name) throws ApiException {
        var appsApi = new Connection(cluster).getAppsV1Api();
        return appsApi.readNamespacedDaemonSet(name, namespace, null);
    }

    @Override
    public V1DaemonSet apply(Cluster cluster, V1DaemonSet object) {
        try {
            var appsApi = new Connection(cluster).getAppsV1Api();
            return appsApi.replaceNamespacedDaemonSet(
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
            var appsApi = new Connection(cluster).getAppsV1Api();
            appsApi.deleteNamespacedDaemonSet(
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