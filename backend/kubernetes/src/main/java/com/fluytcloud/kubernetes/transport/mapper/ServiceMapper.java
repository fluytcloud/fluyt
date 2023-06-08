package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.ServiceResponseList;
import io.kubernetes.client.openapi.models.V1Condition;
import io.kubernetes.client.openapi.models.V1Service;
import io.kubernetes.client.openapi.models.V1ServiceSpec;
import io.kubernetes.client.openapi.models.V1ServiceStatus;

import java.util.List;

import static java.lang.String.format;
import static java.util.Collections.emptyList;
import static java.util.Objects.nonNull;
import static java.util.Optional.ofNullable;

public class ServiceMapper implements Mapper<V1Service, ServiceResponseList> {

    @Override
    public ServiceResponseList mapResponseList(V1Service service) {

        if (nonNull(service)
                && nonNull(service.getMetadata())
                && nonNull(service.getSpec())) {

            return new ServiceResponseList(
                    service.getMetadata().getNamespace(),
                    service.getMetadata().getName(),
                    service.getSpec().getType(),
                    service.getSpec().getClusterIP(),
                    ports(service.getSpec()),
                    getExternalIps(service.getSpec()),
                    selectors(service.getSpec()),
                    status(service.getStatus()),
                    KubernetesMapper.formatAge(service.getMetadata().getCreationTimestamp())
            );
        }

        return null;
    }

    @Override
    public List<ServiceResponseList> mapResponseList(List<V1Service> services) {
        return services.stream()
                .map(this::mapResponseList)
                .toList();
    }

    private List<String> ports(V1ServiceSpec spec) {
        return ofNullable(spec.getPorts())
                .map(ports -> ports.stream()
                        .map(p -> format("%s/%s", p.getPort(), p.getProtocol()))
                        .toList())
                .orElse(emptyList());
    }

    private List<String> getExternalIps(V1ServiceSpec spec) {
        return ofNullable(spec.getExternalIPs()).orElse(emptyList());
    }

    private List<String> selectors(V1ServiceSpec spec) {
        return ofNullable(spec.getSelector())
                .map(selectors -> selectors.entrySet().stream()
                        .map(s -> format("%s=%s", s.getKey(), s.getValue()))
                        .toList())
                .orElse(emptyList());
    }

    private List<String> status(V1ServiceStatus status) {
        return ofNullable(status)
                .map(V1ServiceStatus::getConditions)
                .map(conditions -> conditions.stream()
                        .map(V1Condition::getType)
                        .toList())
                .orElse(emptyList());
    }

}
