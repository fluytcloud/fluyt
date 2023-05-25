package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.RoleRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.models.V1Role;
import io.kubernetes.client.openapi.models.V1RoleList;
import jakarta.enterprise.context.ApplicationScoped;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class RoleRepositoryImpl extends NamespaceObjectRepositoryImpl<V1Role> implements RoleRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger(RoleRepositoryImpl.class.getName());

    @Override
    protected List<V1Role> listByNamespace(Cluster cluster, Search search) throws ApiException {
        var rbacApi = new Connection(cluster).getRbacAuthorizationApi();
        return Optional.ofNullable(
                        rbacApi.listNamespacedRole(
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
                .map(V1RoleList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected List<V1Role> listByAllNamespace(Cluster cluster, Search search) throws ApiException {
        var rbacApi = new Connection(cluster).getRbacAuthorizationApi();
        return Optional.ofNullable(
                        rbacApi.listRoleForAllNamespaces(
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
                .map(V1RoleList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected V1Role readObject(Cluster cluster, String namespace, String name) throws ApiException {
        var rbacApi = new Connection(cluster).getRbacAuthorizationApi();
        return rbacApi.readNamespacedRole(name, namespace, null);
    }

    @Override
    public V1Role apply(Cluster cluster, V1Role object) {
        try {
            var rbacApi = new Connection(cluster).getRbacAuthorizationApi();
            return rbacApi.replaceNamespacedRole(
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
            var rbacApi = new Connection(cluster).getRbacAuthorizationApi();
            rbacApi.deleteNamespacedRole(
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