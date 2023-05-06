package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.DaemonSetResponseList;
import io.kubernetes.client.openapi.models.V1DaemonSet;
import io.kubernetes.client.openapi.models.V1DaemonSetSpec;
import io.kubernetes.client.openapi.models.V1DaemonSetStatus;
import org.ocpsoft.prettytime.PrettyTime;

import java.time.OffsetDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

public class DaemonSetMapper {

    public DaemonSetResponseList mapResponseList(V1DaemonSet daemonSet) {
        return new DaemonSetResponseList(
                daemonSet.getMetadata().getName(),
                daemonSet.getMetadata().getNamespace(),
                getPods(daemonSet.getStatus()),
                getNodeSelector(daemonSet.getSpec()),
                getAge(daemonSet.getMetadata().getCreationTimestamp())
        );
    }

    private Map<String, String> getNodeSelector(V1DaemonSetSpec spec) {
        if (Objects.isNull(spec) || Objects.isNull(spec.getTemplate().getSpec())) {
            return new HashMap<>();
        }
        return spec.getTemplate().getSpec().getNodeSelector();
    }

    private String getPods(V1DaemonSetStatus status) {
        if (status == null) {
            return null;
        }

        return String.format(
                "%d/%d",
                status.getNumberAvailable(),
                status.getNumberReady()
        );
    }

    private String getAge(OffsetDateTime dateTime) {
        PrettyTime prettyTime = new PrettyTime();
        return prettyTime.format(dateTime);
    }

    public List<DaemonSetResponseList> mapResponseList(List<V1DaemonSet> daemonSets) {
        return daemonSets.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
