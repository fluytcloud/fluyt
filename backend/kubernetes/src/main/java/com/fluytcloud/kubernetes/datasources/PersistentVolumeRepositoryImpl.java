package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.PersistentVolumeRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.models.V1PersistentVolume;
import io.kubernetes.client.openapi.models.V1PersistentVolumeList;
import jakarta.enterprise.context.ApplicationScoped;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class PersistentVolumeRepositoryImpl extends ClusterObjectRepositoryImpl<V1PersistentVolume> implements PersistentVolumeRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger(PersistentVolumeRepositoryImpl.class.getName());

    @Override
    protected List<V1PersistentVolume> list(Cluster cluster, Search search) throws ApiException {
        var coreApi = new Connection(cluster).getCoreApi();
        return Optional.ofNullable(
                        coreApi.listPersistentVolume(
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
                .map(V1PersistentVolumeList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected V1PersistentVolume readObject(Cluster cluster, String name) throws ApiException {
        var coreApi = new Connection(cluster).getCoreApi();
        return coreApi.readPersistentVolume(name, null);
    }

    @Override
    public V1PersistentVolume apply(Cluster cluster, V1PersistentVolume object) {
        try {
            var coreApi = new Connection(cluster).getCoreApi();
            return coreApi.replacePersistentVolume(
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
            coreApi.deletePersistentVolume(
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
