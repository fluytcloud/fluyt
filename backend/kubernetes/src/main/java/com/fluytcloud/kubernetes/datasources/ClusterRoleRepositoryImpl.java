package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.ClusterRoleRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.models.V1ClusterRole;
import io.kubernetes.client.openapi.models.V1ClusterRoleList;
import jakarta.enterprise.context.ApplicationScoped;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class ClusterRoleRepositoryImpl extends ClusterObjectRepositoryImpl<V1ClusterRole> implements ClusterRoleRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger(ClusterRoleRepositoryImpl.class.getName());

    @Override
    protected List<V1ClusterRole> list(Cluster cluster, Search search) throws ApiException {
        var rbacAuthorizationApi = new Connection(cluster).getRbacAuthorizationApi();
        return Optional.ofNullable(
                        rbacAuthorizationApi.listClusterRole(
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
                .map(V1ClusterRoleList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected V1ClusterRole readObject(Cluster cluster, String name) throws ApiException {
        var rbacAuthorizationApi = new Connection(cluster).getRbacAuthorizationApi();
        return rbacAuthorizationApi.readClusterRole(name, null);
    }

    @Override
    public V1ClusterRole apply(Cluster cluster, V1ClusterRole object) {
        try {
            var rbacAuthorizationApi = new Connection(cluster).getRbacAuthorizationApi();
            return rbacAuthorizationApi.replaceClusterRole(
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
            rbacAuthorizationApi.deleteClusterRole(
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
