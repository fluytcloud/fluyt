package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.DeploymentRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.models.V1Deployment;
import io.kubernetes.client.openapi.models.V1DeploymentList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.enterprise.context.ApplicationScoped;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class DeploymentRepositoryImpl extends NamespaceObjectRepositoryImpl<V1Deployment> implements DeploymentRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger(ReplicaSetRepositoryImpl.class.getName());
    @Override
    protected List<V1Deployment> listByNamespace(Cluster cluster, Search search) throws ApiException {
        var appsApi = new Connection(cluster).getAppsV1Api();
        return Optional.ofNullable(
                        appsApi.listNamespacedDeployment(
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
                .map(V1DeploymentList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected List<V1Deployment> listByAllNamespace(Cluster cluster, Search search) throws ApiException {
        var appsApi = new Connection(cluster).getAppsV1Api();
        return Optional.ofNullable(
                        appsApi.listDeploymentForAllNamespaces(
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
                .map(V1DeploymentList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected V1Deployment readObject(Cluster cluster, String namespace, String name) throws ApiException {
        var appsApi = new Connection(cluster).getAppsV1Api();
        return appsApi.readNamespacedDeployment(name, namespace, null);
    }

    @Override
    public V1Deployment apply(Cluster cluster, V1Deployment object) {
        try {
            var appsApi = new Connection(cluster).getAppsV1Api();
            return appsApi.replaceNamespacedDeployment(
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
            var appsApi = new Connection(cluster).getAppsV1Api();
            appsApi.deleteNamespacedDeployment(
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
