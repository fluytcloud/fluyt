package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.NodeRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.models.V1Node;
import io.kubernetes.client.openapi.models.V1NodeList;
import jakarta.enterprise.context.ApplicationScoped;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class NodeRepositoryImpl extends ClusterObjectRepositoryImpl<V1Node> implements NodeRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger(NodeRepositoryImpl.class.getName());

    @Override
    protected List<V1Node> list(Cluster cluster, Search search) throws ApiException {
        var coreApi = new Connection(cluster).getCoreApi();
        return Optional.ofNullable(
                        coreApi.listNode(
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
                .map(V1NodeList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected V1Node readObject(Cluster cluster, String name) throws ApiException {
        var coreApi = new Connection(cluster).getCoreApi();
        return coreApi.readNode(name, null);
    }

    @Override
    public V1Node apply(Cluster cluster, V1Node object) {
        try {
            var coreApi = new Connection(cluster).getCoreApi();
            return coreApi.replaceNode(
                    object.getMetadata().getName(),
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
    public void delete(Cluster cluster, String name) {
        try {
            var coreApi = new Connection(cluster).getCoreApi();
            coreApi.deleteNode(
                    name,
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