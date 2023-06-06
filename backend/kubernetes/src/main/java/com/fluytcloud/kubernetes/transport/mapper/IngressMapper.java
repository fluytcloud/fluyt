package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.IngressResponseLIst;
import io.kubernetes.client.openapi.models.V1Ingress;
import io.kubernetes.client.openapi.models.V1IngressSpec;
import io.kubernetes.client.openapi.models.V1IngressStatus;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static java.util.Objects.isNull;
import static java.util.Objects.nonNull;

public class IngressMapper implements Mapper<V1Ingress, IngressResponseLIst> {

    @Override
    public IngressResponseLIst mapResponseList(V1Ingress ingress) {
        return new IngressResponseLIst(
                ingress.getMetadata().getName(),
                ingress.getMetadata().getNamespace(),
                loadBalancers(ingress.getStatus()),
                rules(ingress.getSpec()),
                KubernetesMapper.formatAge(ingress.getMetadata().getCreationTimestamp())
        );
    }

    private List<String> loadBalancers(V1IngressStatus status) {
        if (isNull(status) || isNull(status.getLoadBalancer()) || isNull(status.getLoadBalancer().getIngress())) {
            return Collections.emptyList();
        }

        return status.getLoadBalancer().getIngress().stream()
                .map(it -> {
                    var endpoint = Optional.ofNullable(it.getHostname()).orElseGet(it::getIp);

                    var ports = Optional.ofNullable(it.getPorts())
                            .orElseGet(Collections::emptyList)
                            .stream()
                            .map(port -> port.getPort() + "/" + port.getProtocol())
                            .collect(Collectors.joining());

                    return endpoint + " " + ports;
                })
                .toList();
    }

    private List<String> rules(V1IngressSpec spec) {
        if (isNull(spec) || isNull(spec.getRules())) {
            return Collections.emptyList();
        }

        return spec.getRules().stream()
                .filter(it -> nonNull(it.getHttp()) && nonNull(it.getHttp().getPaths()))
                .map(it -> it.getHttp().getPaths().stream()
                        .map(path -> {
                            StringBuilder endpoint = new StringBuilder("http://")
                                    .append(Optional.ofNullable(it.getHost()).orElse(""))
                                    .append(path.getPath())
                                    .append("->");

                            if (nonNull(path.getBackend().getService())) {
                                var service = path.getBackend().getService();

                                var port = Optional.ofNullable(service.getPort())
                                        .map(servicePort -> Optional.ofNullable(servicePort.getNumber())
                                                .map(Object::toString)
                                                .orElseGet(servicePort::getName)
                                        ).orElse("");

                                endpoint.append(service.getName())
                                        .append(":")
                                        .append(port);
                            } else if (nonNull(path.getBackend().getResource())) {
                                var resource = path.getBackend().getResource();
                                endpoint.append(resource.getKind())
                                        .append(":")
                                        .append(resource.getName());
                            }

                            return endpoint.toString();
                        }).collect(Collectors.joining())
                ).toList();
    }

    @Override
    public List<IngressResponseLIst> mapResponseList(List<V1Ingress> ingresses) {
        return ingresses.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
