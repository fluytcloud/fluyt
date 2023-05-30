package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.DaemonSetResponseList;
import io.kubernetes.client.openapi.models.V1DaemonSet;
import io.kubernetes.client.openapi.models.V1DaemonSetSpec;
import io.kubernetes.client.openapi.models.V1DaemonSetStatus;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

public class DaemonSetMapper implements Mapper<V1DaemonSet, DaemonSetResponseList> {

    @Override
    public DaemonSetResponseList mapResponseList(V1DaemonSet daemonSet) {
        return new DaemonSetResponseList(
                daemonSet.getMetadata().getName(),
                daemonSet.getMetadata().getNamespace(),
                getPods(daemonSet.getStatus()),
                getNodeSelector(daemonSet.getSpec()),
                KubernetesMapper.formatAge(daemonSet.getMetadata().getCreationTimestamp())
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

    @Override
    public List<DaemonSetResponseList> mapResponseList(List<V1DaemonSet> daemonSets) {
        return daemonSets.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
