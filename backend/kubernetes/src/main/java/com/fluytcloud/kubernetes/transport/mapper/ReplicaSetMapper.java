package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.ReplicaSetResponseList;
import com.fluytcloud.kubernetes.transport.response.ReplicaSetSimpleResponseList;
import io.kubernetes.client.openapi.models.V1ReplicaSet;

import java.util.List;
import java.util.Objects;

public class ReplicaSetMapper implements Mapper<V1ReplicaSet, ReplicaSetResponseList> {

    @Override
    public ReplicaSetResponseList mapResponseList(V1ReplicaSet replicaSet) {
        if (Objects.nonNull(replicaSet.getStatus())) {
            return new ReplicaSetResponseList(
                    replicaSet.getMetadata().getName(),
                    replicaSet.getMetadata().getNamespace(),
                    replicaSet.getStatus().getReplicas(),
                    replicaSet.getStatus().getAvailableReplicas(),
                    replicaSet.getStatus().getReadyReplicas(),
                    KubernetesMapper.formatAge(replicaSet.getMetadata().getCreationTimestamp())
            );
        }
        return new ReplicaSetResponseList(
                replicaSet.getMetadata().getName(),
                replicaSet.getMetadata().getNamespace(),
                null,
                null,
                null,
                KubernetesMapper.formatAge(replicaSet.getMetadata().getCreationTimestamp())
        );
    }

    @Override
    public List<ReplicaSetResponseList> mapResponseList(List<V1ReplicaSet> replicaSets) {
        return replicaSets.stream()
                .map(this::mapResponseList)
                .toList();
    }

    public List<ReplicaSetSimpleResponseList> mapSimpleResponseList(List<V1ReplicaSet> replicaSets) {
        return replicaSets.stream()
                .map(replicaSet -> new ReplicaSetSimpleResponseList(
                        replicaSet.getMetadata().getUid(),
                        replicaSet.getMetadata().getName(),
                        replicaSet.getMetadata().getNamespace(),
                        replicaSet.getStatus().getFullyLabeledReplicas(),
                        KubernetesMapper.formatAge(replicaSet.getMetadata().getCreationTimestamp()))
                ).toList();
    }
}
