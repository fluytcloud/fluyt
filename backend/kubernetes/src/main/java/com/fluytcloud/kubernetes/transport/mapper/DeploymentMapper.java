package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.DeploymentResponseList;
import io.kubernetes.client.openapi.models.V1Deployment;
import org.ocpsoft.prettytime.PrettyTime;

import java.time.OffsetDateTime;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

public class DeploymentMapper implements Mapper<V1Deployment, DeploymentResponseList> {

    @Override
    public DeploymentResponseList mapResponseList(V1Deployment deployment) {
        if (Objects.nonNull(deployment.getStatus())) {
            return new DeploymentResponseList(
                    deployment.getMetadata().getName(),
                    deployment.getMetadata().getNamespace(),
                    deployment.getStatus().getReplicas(),
                    deployment.getStatus().getAvailableReplicas(),
                    deployment.getStatus().getReadyReplicas(),
                    getAge(deployment.getMetadata().getCreationTimestamp()),
                    Optional.ofNullable(deployment.getStatus().getConditions())
                            .orElse(Collections.emptyList())
                            .stream()
                            .map(it -> new DeploymentResponseList.Condition(
                                    it.getReason(),
                                    it.getStatus(),
                                    it.getType(),
                                    it.getMessage()
                            ))
                            .toList()
            );
        }
        return new DeploymentResponseList(
                deployment.getMetadata().getName(),
                deployment.getMetadata().getNamespace(),
                null,
                null,
                null,
                getAge(deployment.getMetadata().getCreationTimestamp()),
                null
        );
    }

    private String getAge(OffsetDateTime dateTime) {
        PrettyTime prettyTime = new PrettyTime();
        return prettyTime.format(dateTime);
    }

    @Override
    public List<DeploymentResponseList> mapResponseList(List<V1Deployment> deployments) {
        return deployments.stream()
                .map(this::mapResponseList)
                .toList();
    }
}
