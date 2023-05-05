package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.StatefulSetResponseList;
import io.kubernetes.client.openapi.models.V1StatefulSet;
import io.kubernetes.client.openapi.models.V1StatefulSetStatus;
import org.ocpsoft.prettytime.PrettyTime;

import java.time.OffsetDateTime;
import java.util.List;

public class StatefulSetMapper {

    public StatefulSetResponseList mapResponseList(V1StatefulSet replicaSet) {
        return new StatefulSetResponseList(
                replicaSet.getMetadata().getName(),
                replicaSet.getMetadata().getNamespace(),
                getPods(replicaSet.getStatus()),
                replicaSet.getSpec().getReplicas(),
                getAge(replicaSet.getMetadata().getCreationTimestamp())
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

    private String getAge(OffsetDateTime dateTime) {
        PrettyTime prettyTime = new PrettyTime();
        return prettyTime.format(dateTime);
    }

    public List<StatefulSetResponseList> mapResponseList(List<V1StatefulSet> statefulSets) {
        return statefulSets.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
