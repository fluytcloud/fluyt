package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.RoleBindingRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.models.V1RoleBinding;
import io.kubernetes.client.openapi.models.V1RoleBindingList;
import jakarta.enterprise.context.ApplicationScoped;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class RoleBindingRepositoryImpl extends NamespaceObjectRepositoryImpl<V1RoleBinding> implements RoleBindingRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger(RoleBindingRepositoryImpl.class.getName());

    @Override
    protected List<V1RoleBinding> listByNamespace(Cluster cluster, Search search) throws ApiException {
        var rbacAuthorizationApi = new Connection(cluster).getRbacAuthorizationApi();
        return Optional.ofNullable(
                        rbacAuthorizationApi.listNamespacedRoleBinding(
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
                .map(V1RoleBindingList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected List<V1RoleBinding> listByAllNamespace(Cluster cluster, Search search) throws ApiException {
        var rbacAuthorizationApi = new Connection(cluster).getRbacAuthorizationApi();
        return Optional.ofNullable(
                        rbacAuthorizationApi.listRoleBindingForAllNamespaces(
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
                .map(V1RoleBindingList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected V1RoleBinding readObject(Cluster cluster, String namespace, String name) throws ApiException {
        var rbacAuthorizationApi = new Connection(cluster).getRbacAuthorizationApi();
        return rbacAuthorizationApi.readNamespacedRoleBinding(name, namespace, null);
    }

    @Override
    public V1RoleBinding apply(Cluster cluster, V1RoleBinding object) {
        try {
            var rbacAuthorizationApi = new Connection(cluster).getRbacAuthorizationApi();
            return rbacAuthorizationApi.replaceNamespacedRoleBinding(
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
            var rbacAuthorizationApi = new Connection(cluster).getRbacAuthorizationApi();
            rbacAuthorizationApi.deleteNamespacedRoleBinding(
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
