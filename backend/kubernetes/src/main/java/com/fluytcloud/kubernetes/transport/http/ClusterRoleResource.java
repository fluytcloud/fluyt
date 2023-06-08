package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.interactors.ClusterObjectsService;
import com.fluytcloud.kubernetes.interactors.ClusterRoleService;
import com.fluytcloud.kubernetes.transport.mapper.ClusterRoleMapper;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.response.ClusterRoleResponseList;
import io.kubernetes.client.openapi.models.V1ClusterRole;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;

@Path("/api/v1/kubernetes/cluster-role")
@Authenticated
public class ClusterRoleResource extends ClusterObjectsResource<V1ClusterRole, ClusterRoleResponseList> {

    private static final ClusterRoleMapper CLUSTER_ROLE_MAPPER = new ClusterRoleMapper();

    @Inject
    protected ClusterRoleService clusterRoleService;

    @Override
    protected ClusterObjectsService<V1ClusterRole> getService() {
        return clusterRoleService;
    }

    @Override
    protected Mapper<V1ClusterRole, ClusterRoleResponseList> getMapper() {
        return CLUSTER_ROLE_MAPPER;
    }
}
