package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.JobRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.models.V1Job;
import io.kubernetes.client.openapi.models.V1JobList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.enterprise.context.ApplicationScoped;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class JobRepositoryImpl extends NamespaceObjectRepositoryImpl<V1Job> implements JobRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger(JobRepositoryImpl.class.getName());

    @Override
    protected List<V1Job> listByNamespace(Cluster cluster, Search search) throws ApiException {
        var batchApi = new Connection(cluster).getBatchApi();
        return Optional.ofNullable(
                        batchApi.listNamespacedJob(
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
                .map(V1JobList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected List<V1Job> listByAllNamespace(Cluster cluster, Search search) throws ApiException {
        var batchApi = new Connection(cluster).getBatchApi();
        return Optional.ofNullable(
                        batchApi.listJobForAllNamespaces(
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
                .map(V1JobList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected V1Job readObject(Cluster cluster, String namespace, String name) throws ApiException {
        var batchApi = new Connection(cluster).getBatchApi();
        return batchApi.readNamespacedJob(name, namespace, null);
    }

    @Override
    public V1Job apply(Cluster cluster, V1Job object) {
        try {
            var batchApi = new Connection(cluster).getBatchApi();
            return batchApi.replaceNamespacedJob(
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
            var batchApi = new Connection(cluster).getBatchApi();
            batchApi.deleteNamespacedJob(
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