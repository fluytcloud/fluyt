package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.interactors.NamespaceObjectsService;
import com.fluytcloud.kubernetes.interactors.RoleService;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.mapper.RoleMapper;
import com.fluytcloud.kubernetes.transport.response.RoleResponseList;
import io.kubernetes.client.openapi.models.V1Role;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;

@Path("/api/v1/kubernetes/role")
@Authenticated
public class RoleResource extends NamespaceObjectsResource<V1Role, RoleResponseList> {

    private static final RoleMapper ROLE_MAPPER = new RoleMapper();

    @Inject
    protected RoleService roleService;

    @Override
    protected NamespaceObjectsService<V1Role> getService() {
        return roleService;
    }

    @Override
    protected Mapper<V1Role, RoleResponseList> getMapper() {
        return ROLE_MAPPER;
    }
}
