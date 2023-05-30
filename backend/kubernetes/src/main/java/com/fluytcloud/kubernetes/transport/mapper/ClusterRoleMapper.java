package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.ClusterRoleResponseList;
import io.kubernetes.client.openapi.models.V1ClusterRole;

import java.util.List;

public class ClusterRoleMapper implements Mapper<V1ClusterRole, ClusterRoleResponseList> {

    @Override
    public ClusterRoleResponseList mapResponseList(V1ClusterRole clusterRole) {
        return new ClusterRoleResponseList(
                clusterRole.getMetadata().getName(),
                KubernetesMapper.formatAge(clusterRole.getMetadata().getCreationTimestamp())
        );
    }

    @Override
    public List<ClusterRoleResponseList> mapResponseList(List<V1ClusterRole> clusterRoles) {
        return clusterRoles.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
