package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import com.fluytcloud.kubernetes.repositories.RoleRepository;
import io.kubernetes.client.openapi.models.V1Role;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class RoleService extends NamespaceObjectsService<V1Role> implements ObjectService<V1Role> {

    private final RoleRepository roleRepostiroy;

    public RoleService(RoleRepository roleRepostiroy) {
        this.roleRepostiroy = roleRepostiroy;
    }

    @Override
    protected NamespaceObjectsRepository<V1Role> repository() {
        return roleRepostiroy;
    }
}

