package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.ClusterObjectsRepository;
import com.fluytcloud.kubernetes.repositories.ClusterRoleRepository;
import io.kubernetes.client.openapi.models.V1ClusterRole;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class ClusterRoleService extends ClusterObjectsService<V1ClusterRole>  {

    private final ClusterRoleRepository clusterRoleRepository;

    public ClusterRoleService(ClusterRoleRepository clusterRoleRepository) {
        this.clusterRoleRepository = clusterRoleRepository;
    }

    @Override
    protected ClusterObjectsRepository<V1ClusterRole> repository() {
        return clusterRoleRepository;
    }

}
