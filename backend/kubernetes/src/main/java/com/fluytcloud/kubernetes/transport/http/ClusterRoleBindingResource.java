package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.interactors.ClusterObjectsService;
import com.fluytcloud.kubernetes.interactors.ClusterRoleBindingService;
import com.fluytcloud.kubernetes.transport.mapper.ClusterRoleBindingMapper;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.response.ClusterRoleBindingResponseList;
import io.kubernetes.client.openapi.models.V1ClusterRoleBinding;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;

@Path("/api/v1/kubernetes/cluster-role-binding")
@Authenticated
public class ClusterRoleBindingResource extends ClusterObjectsResource<V1ClusterRoleBinding, ClusterRoleBindingResponseList> {

    private static final ClusterRoleBindingMapper CLUSTER_ROLE_BINDING_MAPPER = new ClusterRoleBindingMapper();

    @Inject
    protected ClusterRoleBindingService clusterRoleBindingService;

    @Override
    protected ClusterObjectsService<V1ClusterRoleBinding> getService() {
        return clusterRoleBindingService;
    }

    @Override
    protected Mapper<V1ClusterRoleBinding, ClusterRoleBindingResponseList> getMapper() {
        return CLUSTER_ROLE_BINDING_MAPPER;
    }
}
