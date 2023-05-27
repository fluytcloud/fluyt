package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.ClusterObjectsRepository;
import com.fluytcloud.kubernetes.repositories.ClusterRoleBindingRepository;
import io.kubernetes.client.openapi.models.V1ClusterRoleBinding;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class ClusterRoleBindingService extends ClusterObjectsService<V1ClusterRoleBinding> {

    private final ClusterRoleBindingRepository clusterRoleBindingRepository;

    public ClusterRoleBindingService(ClusterRoleBindingRepository clusterRoleBindingRepository) {
        this.clusterRoleBindingRepository = clusterRoleBindingRepository;
    }

    @Override
    protected ClusterObjectsRepository<V1ClusterRoleBinding> repository() {
        return clusterRoleBindingRepository;
    }

}
