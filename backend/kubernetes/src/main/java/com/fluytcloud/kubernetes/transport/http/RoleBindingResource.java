package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.interactors.NamespaceObjectsService;
import com.fluytcloud.kubernetes.interactors.RoleBindingService;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.mapper.RoleBindingMapper;
import com.fluytcloud.kubernetes.transport.response.RoleBindingResponseList;
import io.kubernetes.client.openapi.models.V1RoleBinding;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;

@Path("/api/v1/kubernetes/role-binding")
@Authenticated
public class RoleBindingResource extends NamespaceObjectsResource<V1RoleBinding, RoleBindingResponseList> {

    private static final RoleBindingMapper ROLE_BINDING_MAPPER = new RoleBindingMapper();

    @Inject
    protected RoleBindingService roleBindingService;

    @Override
    protected NamespaceObjectsService<V1RoleBinding> getService() {
        return roleBindingService;
    }

    @Override
    protected Mapper<V1RoleBinding, RoleBindingResponseList> getMapper() {
        return ROLE_BINDING_MAPPER;
    }
}
