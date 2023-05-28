package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.PersistentVolumeClaimRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.models.V1PersistentVolumeClaim;
import io.kubernetes.client.openapi.models.V1PersistentVolumeClaimList;
import jakarta.enterprise.context.ApplicationScoped;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class PersistentVolumeClaimRepositoryImpl extends NamespaceObjectRepositoryImpl<V1PersistentVolumeClaim> implements PersistentVolumeClaimRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger(PersistentVolumeClaimRepositoryImpl.class.getName());

    @Override
    protected List<V1PersistentVolumeClaim> listByNamespace(Cluster cluster, Search search) throws ApiException {
        var coreApi = new Connection(cluster).getCoreApi();
        return Optional.ofNullable(
                        coreApi.listNamespacedPersistentVolumeClaim(
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
                .map(V1PersistentVolumeClaimList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected List<V1PersistentVolumeClaim> listByAllNamespace(Cluster cluster, Search search) throws ApiException {
        var coreApi = new Connection(cluster).getCoreApi();
        return Optional.ofNullable(
                        coreApi.listPersistentVolumeClaimForAllNamespaces(
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
                .map(V1PersistentVolumeClaimList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected V1PersistentVolumeClaim readObject(Cluster cluster, String namespace, String name) throws ApiException {
        var coreApi = new Connection(cluster).getCoreApi();
        return coreApi.readNamespacedPersistentVolumeClaim(name, namespace, null);
    }

    @Override
    public V1PersistentVolumeClaim apply(Cluster cluster, V1PersistentVolumeClaim object) {
        try {
            var coreApi = new Connection(cluster).getCoreApi();
            return coreApi.replaceNamespacedPersistentVolumeClaim(
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
            coreApi.deleteNamespacedPersistentVolumeClaim(
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
