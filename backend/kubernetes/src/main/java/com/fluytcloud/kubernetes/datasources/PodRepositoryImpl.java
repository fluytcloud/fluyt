package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.PodRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.models.V1Pod;
import io.kubernetes.client.openapi.models.V1PodList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.enterprise.context.ApplicationScoped;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class PodRepositoryImpl extends NamespaceObjectRepositoryImpl<V1Pod> implements PodRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger(PodRepositoryImpl.class.getName());

    @Override
    protected List<V1Pod> listByNamespace(Cluster cluster, Search search) throws ApiException {
        var coreApi = new Connection(cluster).getCoreApi();
        return Optional.ofNullable(
                coreApi.listNamespacedPod(
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
                .map(V1PodList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected List<V1Pod> listByAllNamespace(Cluster cluster, Search search) throws ApiException {
        var coreApi = new Connection(cluster).getCoreApi();
        return Optional.ofNullable(
                        coreApi.listPodForAllNamespaces(
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
                .map(V1PodList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected V1Pod readObject(Cluster cluster, String namespace, String name) throws ApiException {
        var coreApi = new Connection(cluster).getCoreApi();
        return coreApi.readNamespacedPod(name, namespace, null);
    }

    @Override
    public V1Pod apply(Cluster cluster, V1Pod object) {
        try {
            var coreApi = new Connection(cluster).getCoreApi();
            return coreApi.replaceNamespacedPod(
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
            coreApi.deleteNamespacedPod(
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
