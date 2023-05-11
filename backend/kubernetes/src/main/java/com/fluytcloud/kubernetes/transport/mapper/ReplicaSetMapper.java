package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.ReplicaSetSimpleResponseList;
import com.fluytcloud.kubernetes.transport.response.ReplicaSetResponseList;
import io.kubernetes.client.openapi.models.V1ReplicaSet;
import org.ocpsoft.prettytime.PrettyTime;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.Objects;

public class ReplicaSetMapper {

    public ReplicaSetResponseList mapResponseList(V1ReplicaSet replicaSet) {
        if (Objects.nonNull(replicaSet.getStatus())) {
            return new ReplicaSetResponseList(
                    replicaSet.getMetadata().getName(),
                    replicaSet.getMetadata().getNamespace(),
                    replicaSet.getStatus().getReplicas(),
                    replicaSet.getStatus().getAvailableReplicas(),
                    replicaSet.getStatus().getReadyReplicas(),
                    getAge(replicaSet.getMetadata().getCreationTimestamp())
            );
        }
        return new ReplicaSetResponseList(
                replicaSet.getMetadata().getName(),
                replicaSet.getMetadata().getNamespace(),
                null,
                null,
                null,
                getAge(replicaSet.getMetadata().getCreationTimestamp())
        );
    }

    private String getAge(OffsetDateTime dateTime) {
        PrettyTime prettyTime = new PrettyTime();
        return prettyTime.format(dateTime);
    }

    public List<ReplicaSetResponseList> mapResponseList(List<V1ReplicaSet> replicaSets) {
        return replicaSets.stream()
                .map(this::mapResponseList)
                .toList();
    }

    public List<ReplicaSetSimpleResponseList> mapSimpleResponseList(List<V1ReplicaSet> replicaSets) {
        return replicaSets.stream()
                .map(replicaSet -> new ReplicaSetSimpleResponseList(
                        replicaSet.getMetadata().getName(),
                        replicaSet.getMetadata().getNamespace(),
                        replicaSet.getStatus().getFullyLabeledReplicas(),
                        getAge(replicaSet.getMetadata().getCreationTimestamp()))
                ).toList();
    }
}
