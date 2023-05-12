package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.HorizontalPodAutoscalerRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.models.V2HorizontalPodAutoscaler;
import io.kubernetes.client.openapi.models.V2HorizontalPodAutoscalerList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.enterprise.context.ApplicationScoped;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class HorizontalPodAutoscalerRepositoryImpl extends NamespaceObjectRepositoryImpl<V2HorizontalPodAutoscaler> implements HorizontalPodAutoscalerRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger(HorizontalPodAutoscalerRepositoryImpl.class.getName());

    @Override
    protected List<V2HorizontalPodAutoscaler> listByNamespace(Cluster cluster, Search search) throws ApiException {
        var autoscalingApi = new Connection(cluster).getAutoscalingApi();
        return Optional.ofNullable(
                        autoscalingApi.listNamespacedHorizontalPodAutoscaler(
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
                .map(V2HorizontalPodAutoscalerList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected List<V2HorizontalPodAutoscaler> listByAllNamespace(Cluster cluster, Search search) throws ApiException {
        var autoscalingApi = new Connection(cluster).getAutoscalingApi();
        return Optional.ofNullable(
                        autoscalingApi.listHorizontalPodAutoscalerForAllNamespaces(
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
                .map(V2HorizontalPodAutoscalerList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected V2HorizontalPodAutoscaler readObject(Cluster cluster, String namespace, String name) throws ApiException {
        var autoscalingApi = new Connection(cluster).getAutoscalingApi();
        return autoscalingApi.readNamespacedHorizontalPodAutoscaler(name, namespace, null);
    }

    @Override
    public V2HorizontalPodAutoscaler apply(Cluster cluster, V2HorizontalPodAutoscaler object) {
        try {
            var autoscalingApi = new Connection(cluster).getAutoscalingApi();
            return autoscalingApi.replaceNamespacedHorizontalPodAutoscaler(
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
            var autoscalingApi = new Connection(cluster).getAutoscalingApi();
            autoscalingApi.deleteNamespacedHorizontalPodAutoscaler(
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
