package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.ReplicaSetRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.models.V1ReplicaSet;
import io.kubernetes.client.openapi.models.V1ReplicaSetList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.enterprise.context.ApplicationScoped;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class ReplicaSetRepositoryImpl extends NamespaceObjectRepositoryImpl<V1ReplicaSet> implements ReplicaSetRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger(ReplicaSetRepositoryImpl.class.getName());

    @Override
    protected List<V1ReplicaSet> listByNamespace(Cluster cluster, Search search) throws ApiException {
        var appsApi = new Connection(cluster).getAppsV1Api();
        return Optional.ofNullable(
                        appsApi.listNamespacedReplicaSet(
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
                .map(V1ReplicaSetList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected List<V1ReplicaSet> listByAllNamespace(Cluster cluster, Search search) throws ApiException {
        var appsApi = new Connection(cluster).getAppsV1Api();
        return Optional.ofNullable(
                        appsApi.listReplicaSetForAllNamespaces(
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
                .map(V1ReplicaSetList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected V1ReplicaSet readObject(Cluster cluster, String namespace, String name) throws ApiException {
        var appsApi = new Connection(cluster).getAppsV1Api();
        return appsApi.readNamespacedReplicaSet(name, namespace, null);
    }

    @Override
    public V1ReplicaSet apply(Cluster cluster, V1ReplicaSet object) {
        try {
            var appsApi = new Connection(cluster).getAppsV1Api();
            return appsApi.replaceNamespacedReplicaSet(
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
            appsApi.deleteNamespacedReplicaSet(
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
