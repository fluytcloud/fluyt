package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.NodeResponseList;
import io.kubernetes.client.openapi.models.V1Node;
import io.kubernetes.client.openapi.models.V1NodeCondition;
import io.kubernetes.client.openapi.models.V1NodeSpec;
import io.kubernetes.client.openapi.models.V1NodeStatus;

import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

public class NodeMapper implements Mapper<V1Node, NodeResponseList> {

    @Override
    public NodeResponseList mapResponseList(V1Node node) {
        return new NodeResponseList(
                node.getMetadata().getName(),
                getTaints(node.getSpec()),
                getVersion(node.getStatus()),
                getConditions(node.getStatus()),
                KubernetesMapper.formatAge(node.getMetadata().getCreationTimestamp())
        );
    }

    private Integer getTaints(V1NodeSpec spec) {
        return Optional.ofNullable(spec)
                .filter(it -> Objects.nonNull(it.getTaints()))
                .map(it -> it.getTaints().size())
                .orElse(0);
    }

    private String getVersion(V1NodeStatus status) {
        return Optional.ofNullable(status)
                .filter(it -> Objects.nonNull(it.getNodeInfo()))
                .map(it -> it.getNodeInfo().getKubeletVersion())
                .orElse("");
    }

    private List<String> getConditions(V1NodeStatus status) {
        return Optional.ofNullable(status)
                .filter(it -> Objects.nonNull(it.getConditions()))
                .map(it -> it.getConditions().stream()
                        .filter(condition -> "True".equals(condition.getStatus()))
                        .map(V1NodeCondition::getType)
                        .toList()
                ).orElseGet(Collections::emptyList);
    }

    @Override
    public List<NodeResponseList> mapResponseList(List<V1Node> nodes) {
        return nodes.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
