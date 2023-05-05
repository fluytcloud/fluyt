package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.StatefulSetRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.models.V1StatefulSet;
import io.kubernetes.client.openapi.models.V1StatefulSetList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.enterprise.context.ApplicationScoped;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class StatefulSetRepositoryImpl extends NamespaceObjectRepositoryImpl<V1StatefulSet> implements StatefulSetRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger(StatefulSetRepositoryImpl.class.getName());

    @Override
    protected List<V1StatefulSet> listByNamespace(Cluster cluster, Search search) throws ApiException {
        var appsApi = new Connection(cluster).getAppsV1Api();
        return Optional.ofNullable(
                        appsApi.listNamespacedStatefulSet(
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
                .map(V1StatefulSetList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected List<V1StatefulSet> listByAllNamespace(Cluster cluster, Search search) throws ApiException {
        var appsApi = new Connection(cluster).getAppsV1Api();
        return Optional.ofNullable(
                        appsApi.listStatefulSetForAllNamespaces(
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
                .map(V1StatefulSetList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected V1StatefulSet readObject(Cluster cluster, String namespace, String name) throws ApiException {
        var appsApi = new Connection(cluster).getAppsV1Api();
        return appsApi.readNamespacedStatefulSet(name, namespace, null);
    }

    @Override
    public V1StatefulSet apply(Cluster cluster, V1StatefulSet object) {
        try {
            var appsApi = new Connection(cluster).getAppsV1Api();
            return appsApi.replaceNamespacedStatefulSet(
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
            appsApi.deleteNamespacedStatefulSet(
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