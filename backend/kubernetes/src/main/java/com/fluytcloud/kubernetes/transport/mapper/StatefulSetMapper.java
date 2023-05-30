package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.StatefulSetResponseList;
import io.kubernetes.client.openapi.models.V1StatefulSet;
import io.kubernetes.client.openapi.models.V1StatefulSetStatus;

import java.util.List;

public class StatefulSetMapper implements Mapper<V1StatefulSet, StatefulSetResponseList> {

    @Override
    public StatefulSetResponseList mapResponseList(V1StatefulSet statefulSet) {
        return new StatefulSetResponseList(
                statefulSet.getMetadata().getName(),
                statefulSet.getMetadata().getNamespace(),
                getPods(statefulSet.getStatus()),
                statefulSet.getSpec().getReplicas(),
                KubernetesMapper.formatAge(statefulSet.getMetadata().getCreationTimestamp())
        );
    }

    private String getPods(V1StatefulSetStatus status) {
        if (status == null) {
            return null;
        }

        return String.format(
                "%d/%d",
                status.getReadyReplicas(),
                status.getReplicas()
        );
    }

    @Override
    public List<StatefulSetResponseList> mapResponseList(List<V1StatefulSet> statefulSets) {
        return statefulSets.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
