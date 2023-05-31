package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.RoleBindingResponseList;
import io.kubernetes.client.openapi.models.V1RoleBinding;
import io.kubernetes.client.openapi.models.V1Subject;

import java.util.Collections;
import java.util.List;
import java.util.Objects;

public class RoleBindingMapper implements Mapper<V1RoleBinding, RoleBindingResponseList> {

    @Override
    public RoleBindingResponseList mapResponseList(V1RoleBinding roleBinding) {
        return new RoleBindingResponseList(
                roleBinding.getMetadata().getName(),
                roleBinding.getMetadata().getNamespace(),
                bindings(roleBinding),
                KubernetesMapper.formatAge(roleBinding.getMetadata().getCreationTimestamp())
        );
    }

    private List<String> bindings(V1RoleBinding roleBinding) {
        if (Objects.isNull(roleBinding.getSubjects())) {
            return Collections.emptyList();
        }

        return roleBinding.getSubjects()
                .stream()
                .map(V1Subject::getName)
                .toList();
    }

    @Override
    public List<RoleBindingResponseList> mapResponseList(List<V1RoleBinding> roleBindings) {
        return roleBindings.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
