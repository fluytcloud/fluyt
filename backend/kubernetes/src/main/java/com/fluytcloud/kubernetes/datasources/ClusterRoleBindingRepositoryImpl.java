package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.ClusterRoleBindingRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.models.V1ClusterRoleBinding;
import io.kubernetes.client.openapi.models.V1ClusterRoleBindingList;
import jakarta.enterprise.context.ApplicationScoped;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class ClusterRoleBindingRepositoryImpl extends ClusterObjectRepositoryImpl<V1ClusterRoleBinding> implements ClusterRoleBindingRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger(ClusterRoleRepositoryImpl.class.getName());

    @Override
    protected List<V1ClusterRoleBinding> list(Cluster cluster, Search search) throws ApiException {
        var rbacAuthorizationApi = new Connection(cluster).getRbacAuthorizationApi();
        return Optional.ofNullable(
                        rbacAuthorizationApi.listClusterRoleBinding(
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
                .map(V1ClusterRoleBindingList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected V1ClusterRoleBinding readObject(Cluster cluster, String name) throws ApiException {
        var rbacAuthorizationApi = new Connection(cluster).getRbacAuthorizationApi();
        return rbacAuthorizationApi.readClusterRoleBinding(name, null);
    }

    @Override
    public V1ClusterRoleBinding apply(Cluster cluster, V1ClusterRoleBinding object) {
        try {
            var rbacAuthorizationApi = new Connection(cluster).getRbacAuthorizationApi();
            return rbacAuthorizationApi.replaceClusterRoleBinding(
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
            var rbacAuthorizationApi = new Connection(cluster).getRbacAuthorizationApi();
            rbacAuthorizationApi.deleteClusterRoleBinding(
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
