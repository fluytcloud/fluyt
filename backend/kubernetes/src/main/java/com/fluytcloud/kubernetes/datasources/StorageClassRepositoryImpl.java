package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.StorageClassRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.models.V1StorageClass;
import io.kubernetes.client.openapi.models.V1StorageClassList;
import jakarta.enterprise.context.ApplicationScoped;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class StorageClassRepositoryImpl extends ClusterObjectRepositoryImpl<V1StorageClass> implements StorageClassRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger(StorageClassRepositoryImpl.class.getName());

    @Override
    protected List<V1StorageClass> list(Cluster cluster, Search search) throws ApiException {
        var storageApi = new Connection(cluster).getStorageApi();
        return Optional.ofNullable(
                        storageApi.listStorageClass(
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
                .map(V1StorageClassList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected V1StorageClass readObject(Cluster cluster, String name) throws ApiException {
        var storageApi = new Connection(cluster).getStorageApi();
        return storageApi.readStorageClass(name, null);
    }

    @Override
    public V1StorageClass apply(Cluster cluster, V1StorageClass object) {
        try {
            var storageApi = new Connection(cluster).getStorageApi();
            return storageApi.replaceStorageClass(
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
            var storageApi = new Connection(cluster).getStorageApi();
            storageApi.deleteStorageClass(
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
