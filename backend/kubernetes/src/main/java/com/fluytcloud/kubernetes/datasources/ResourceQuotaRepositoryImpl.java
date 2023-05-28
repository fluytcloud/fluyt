package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.ResourceQuotaRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.models.V1ResourceQuota;
import io.kubernetes.client.openapi.models.V1ResourceQuotaList;
import jakarta.enterprise.context.ApplicationScoped;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class ResourceQuotaRepositoryImpl extends NamespaceObjectRepositoryImpl<V1ResourceQuota> implements ResourceQuotaRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger(ResourceQuotaRepositoryImpl.class.getName());

    @Override
    protected List<V1ResourceQuota> listByNamespace(Cluster cluster, Search search) throws ApiException {
        var coreApi = new Connection(cluster).getCoreApi();
        return Optional.ofNullable(
                        coreApi.listNamespacedResourceQuota(
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
                .map(V1ResourceQuotaList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected List<V1ResourceQuota> listByAllNamespace(Cluster cluster, Search search) throws ApiException {
        var coreApi = new Connection(cluster).getCoreApi();
        return Optional.ofNullable(
                        coreApi.listResourceQuotaForAllNamespaces(
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
                .map(V1ResourceQuotaList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected V1ResourceQuota readObject(Cluster cluster, String namespace, String name) throws ApiException {
        var coreApi = new Connection(cluster).getCoreApi();
        return coreApi.readNamespacedResourceQuota(name, namespace, null);
    }

    @Override
    public V1ResourceQuota apply(Cluster cluster, V1ResourceQuota object) {
        try {
            var coreApi = new Connection(cluster).getCoreApi();
            return coreApi.replaceNamespacedResourceQuota(
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
            coreApi.deleteNamespacedResourceQuota(
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

