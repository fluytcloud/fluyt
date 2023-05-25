package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import com.fluytcloud.kubernetes.repositories.RoleBindingRepository;
import io.kubernetes.client.openapi.models.V1RoleBinding;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class RoleBindingService extends NamespaceObjectsService<V1RoleBinding> implements ObjectService<V1RoleBinding> {

    private final RoleBindingRepository roleBindingRepository;

    public RoleBindingService(RoleBindingRepository roleBindingRepository) {
        this.roleBindingRepository = roleBindingRepository;
    }

    @Override
    protected NamespaceObjectsRepository<V1RoleBinding> repository() {
        return roleBindingRepository;
    }
}
