package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.IngressResponseLIst;
import io.kubernetes.client.openapi.models.V1Ingress;
import io.kubernetes.client.openapi.models.V1IngressSpec;
import io.kubernetes.client.openapi.models.V1IngressStatus;
import org.ocpsoft.prettytime.PrettyTime;

import java.time.OffsetDateTime;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static java.util.Objects.isNull;

public class IngressMapper {

    public IngressResponseLIst mapResponseList(V1Ingress ingress) {
        return new IngressResponseLIst(
                ingress.getMetadata().getName(),
                ingress.getMetadata().getNamespace(),
                loadBalancers(ingress.getStatus()),
                rules(ingress.getSpec()),
                getPrettyTime(ingress.getMetadata().getCreationTimestamp())
        );
    }

    private List<String> loadBalancers(V1IngressStatus status) {
        if (isNull(status) || isNull(status.getLoadBalancer()) || isNull(status.getLoadBalancer().getIngress())) {
            return Collections.emptyList();
        }

        return status.getLoadBalancer().getIngress().stream()
                .map(it -> {
                    var endpoint = Optional.ofNullable(it.getHostname()).orElseGet(it::getIp);
                    var ports = it.getPorts().stream()
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
                .map(it -> it.getHttp().getPaths().stream()
                        .map(path -> "http://*"
                                + path.getPath()
                                + "->"
                                + path.getBackend().getService().getName()
                                + ":"
                                + path.getBackend().getService().getPort().getNumber()
                        ).collect(Collectors.joining())
                ).toList();
    }

    private String getPrettyTime(OffsetDateTime dateTime) {
        PrettyTime prettyTime = new PrettyTime();
        return prettyTime.format(dateTime);
    }

    public List<IngressResponseLIst> mapResponseList(List<V1Ingress> ingresses) {
        return ingresses.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
