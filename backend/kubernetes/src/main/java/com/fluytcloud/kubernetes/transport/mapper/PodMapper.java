package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.PodContainerResponseList;
import com.fluytcloud.kubernetes.transport.response.PodResponseList;
import io.kubernetes.client.openapi.models.V1ContainerState;
import io.kubernetes.client.openapi.models.V1ContainerStatus;
import io.kubernetes.client.openapi.models.V1Pod;
import org.ocpsoft.prettytime.PrettyTime;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

public class PodMapper {

    public PodResponseList mapResponseList(V1Pod pod) {
        var containers = pod.getStatus().getContainerStatuses()
                .stream()
                .map(containerStatus -> new PodContainerResponseList(
                        containerStatus.getName(),
                        containerStatus.getReady(),
                        getContainerStatus(containerStatus.getState()),
                        getContainerReason(containerStatus.getState())
                ))
                .toList();

        PrettyTime prettyTime = new PrettyTime();
        var age = prettyTime.format(pod.getMetadata().getCreationTimestamp());

        return new PodResponseList(
                pod.getMetadata().getNamespace(),
                pod.getMetadata().getName(),
                getRestarts(pod.getStatus().getContainerStatuses()),
                pod.getSpec().getNodeName(),
                pod.getStatus().getQosClass(),
                age,
                pod.getStatus().getPhase(),
                containers
        );
    }

    private Integer getRestarts(List<V1ContainerStatus> containersStatus) {
        return containersStatus.stream()
                .mapToInt(V1ContainerStatus::getRestartCount)
                .sum();
    }

    private Optional<String> getContainerReason(V1ContainerState state) {
        if (Objects.isNull(state)) {
            return Optional.empty();
        }

        if (Objects.nonNull(state.getTerminated())) {
            return Optional.ofNullable(state.getTerminated().getReason());
        }

        if (Objects.nonNull(state.getWaiting())) {
            return Optional.ofNullable(state.getWaiting().getReason());
        }

        return Optional.empty();
    }

    private Optional<String> getContainerStatus(V1ContainerState state) {
        if (Objects.isNull(state)) {
            return Optional.empty();
        }

        if (Objects.nonNull(state.getRunning())) {
            return Optional.of("Running");
        }

        if (Objects.nonNull(state.getTerminated())) {
            return Optional.of("Terminated");
        }

        return Optional.of("Waiting");
    }

    public List<PodResponseList> mapResponseList(List<V1Pod> pods) {
        return pods.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
