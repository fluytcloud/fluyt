package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.EventRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.models.CoreV1Event;
import io.kubernetes.client.openapi.models.CoreV1EventList;
import jakarta.enterprise.context.ApplicationScoped;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class EventRepositoryImpl extends NamespaceObjectRepositoryImpl<CoreV1Event> implements EventRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger(EventRepositoryImpl.class.getName());

    @Override
    protected List<CoreV1Event> listByNamespace(Cluster cluster, Search search) throws ApiException {
        var coreApi = new Connection(cluster).getCoreApi();
        return Optional.ofNullable(
                        coreApi.listNamespacedEvent(
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
                .map(CoreV1EventList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected List<CoreV1Event> listByAllNamespace(Cluster cluster, Search search) throws ApiException {
        var coreApi = new Connection(cluster).getCoreApi();
        return Optional.ofNullable(
                        coreApi.listEventForAllNamespaces(
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
                .map(CoreV1EventList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected CoreV1Event readObject(Cluster cluster, String namespace, String name) throws ApiException {
        var coreApi = new Connection(cluster).getCoreApi();
        return coreApi.readNamespacedEvent(name, namespace, null);
    }

    @Override
    public CoreV1Event apply(Cluster cluster, CoreV1Event object) {
        try {
            var coreApi = new Connection(cluster).getCoreApi();
            return coreApi.replaceNamespacedEvent(
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
            coreApi.deleteNamespacedEvent(
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
