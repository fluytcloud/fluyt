package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.ClusterRoleBindingResponseList;
import io.kubernetes.client.openapi.models.V1ClusterRoleBinding;
import io.kubernetes.client.openapi.models.V1Subject;

import java.util.Collections;
import java.util.List;
import java.util.Objects;

public class ClusterRoleBindingMapper implements Mapper<V1ClusterRoleBinding, ClusterRoleBindingResponseList> {

    @Override
    public ClusterRoleBindingResponseList mapResponseList(V1ClusterRoleBinding clusterRoleBinding) {
        return new ClusterRoleBindingResponseList(
                clusterRoleBinding.getMetadata().getName(),
                bindings(clusterRoleBinding),
                KubernetesMapper.formatAge(clusterRoleBinding.getMetadata().getCreationTimestamp())
        );
    }

    private List<String> bindings(V1ClusterRoleBinding clusterRoleBinding) {
        if (Objects.isNull(clusterRoleBinding.getSubjects())) {
            return Collections.emptyList();
        }

        return clusterRoleBinding.getSubjects()
                .stream()
                .map(V1Subject::getName)
                .toList();
    }

    @Override
    public List<ClusterRoleBindingResponseList> mapResponseList(List<V1ClusterRoleBinding> clusterRoleBindings) {
        return clusterRoleBindings.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
