package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.RoleResponseList;
import io.kubernetes.client.openapi.models.V1Role;

import java.util.List;

public class RoleMapper {

    public RoleResponseList mapResponseList(V1Role role) {
        return new RoleResponseList(
                role.getMetadata().getName(),
                role.getMetadata().getNamespace(),
                KubernetesMapper.formatAge(role.getMetadata().getCreationTimestamp())
        );
    }

    public List<RoleResponseList> mapResponseList(List<V1Role> roles) {
        return roles.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
