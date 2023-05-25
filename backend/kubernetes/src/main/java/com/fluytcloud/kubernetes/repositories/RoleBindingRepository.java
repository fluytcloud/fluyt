package com.fluytcloud.kubernetes.repositories;

import io.kubernetes.client.openapi.models.V1RoleBinding;

public interface RoleBindingRepository extends NamespaceObjectsRepository<V1RoleBinding> {
}
