package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.CronJobRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.models.V1CronJob;
import io.kubernetes.client.openapi.models.V1CronJobList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.enterprise.context.ApplicationScoped;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class CronJobRepositoryImpl extends NamespaceObjectRepositoryImpl<V1CronJob> implements CronJobRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger(CronJobRepositoryImpl.class.getName());

    @Override
    protected List<V1CronJob> listByNamespace(Cluster cluster, Search search) throws ApiException {
        var batchApi = new Connection(cluster).getBatchApi();
        return Optional.ofNullable(
                        batchApi.listNamespacedCronJob(
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
                .map(V1CronJobList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected List<V1CronJob> listByAllNamespace(Cluster cluster, Search search) throws ApiException {
        var batchApi = new Connection(cluster).getBatchApi();
        return Optional.ofNullable(
                        batchApi.listCronJobForAllNamespaces(
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
                .map(V1CronJobList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected V1CronJob readObject(Cluster cluster, String namespace, String name) throws ApiException {
        var batchApi = new Connection(cluster).getBatchApi();
        return batchApi.readNamespacedCronJob(name, namespace, null);
    }

    @Override
    public V1CronJob apply(Cluster cluster, V1CronJob object) {
        try {
            var batchApi = new Connection(cluster).getBatchApi();
            return batchApi.replaceNamespacedCronJob(
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
            batchApi.deleteNamespacedCronJob(
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