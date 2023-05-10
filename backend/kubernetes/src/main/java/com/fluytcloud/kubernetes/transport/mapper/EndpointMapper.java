package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.EndpointResponseList;
import io.kubernetes.client.openapi.models.V1Endpoint;
import io.kubernetes.client.openapi.models.V1Endpoints;
import org.ocpsoft.prettytime.PrettyTime;

import java.time.OffsetDateTime;
import java.util.List;

public class EndpointMapper {

    public EndpointResponseList mapResponseList(V1Endpoints endpoint) {
        // TODO: verificar os dados de fato
        return new EndpointResponseList(
                endpoint.getMetadata().getName(),
                endpoint.getMetadata().getNamespace(),
                endpoint.getMetadata().getSelfLink(),
                getPrettyTime(endpoint.getMetadata().getCreationTimestamp())
        );
    }
    private String getPrettyTime(OffsetDateTime dateTime) {
        PrettyTime prettyTime = new PrettyTime();
        return prettyTime.format(dateTime);
    }

    public List<EndpointResponseList> mapResponseList(List<V1Endpoints> endpoints) {
        return endpoints.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
