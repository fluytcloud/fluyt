package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.EndpointResponseList;
import io.kubernetes.client.openapi.models.CoreV1EndpointPort;
import io.kubernetes.client.openapi.models.V1EndpointSubset;
import io.kubernetes.client.openapi.models.V1Endpoints;

import java.util.*;
import java.util.stream.Collectors;

public class EndpointMapper implements Mapper<V1Endpoints, EndpointResponseList> {

    @Override
    public EndpointResponseList mapResponseList(V1Endpoints endpoint) {
        return new EndpointResponseList(
                endpoint.getMetadata().getName(),
                endpoint.getMetadata().getNamespace(),
                endpoints(endpoint.getSubsets()),
                KubernetesMapper.formatAge(endpoint.getMetadata().getCreationTimestamp())
        );
    }

    public Set<String> endpoints(List<V1EndpointSubset> subsets) {
        if (Objects.isNull(subsets)) {
            return Collections.emptySet();
        }

        return subsets.stream()
                .flatMap(it -> {
                    var ports = it.getPorts().stream()
                            .map(CoreV1EndpointPort::getPort)
                            .filter(Objects::nonNull)
                            .toList();

                   return it.getAddresses()
                            .stream()
                            .map(address -> Optional.ofNullable(address.getHostname())
                                    .orElseGet(address::getIp))
                            .flatMap(address -> ports.stream()
                                    .map(port -> address + ":" + port));
                })
                .collect(Collectors.toSet());
    }

    @Override
    public List<EndpointResponseList> mapResponseList(List<V1Endpoints> endpoints) {
        return endpoints.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
