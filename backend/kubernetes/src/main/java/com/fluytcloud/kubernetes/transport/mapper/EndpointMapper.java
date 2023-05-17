package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.EndpointResponseList;
import io.kubernetes.client.openapi.models.V1Endpoint;
import io.kubernetes.client.openapi.models.V1Endpoints;
import org.ocpsoft.prettytime.PrettyTime;

import java.time.OffsetDateTime;
import java.util.List;

// TODO: talvez os métodos possam ser estáticos, visto que não tenho estado nenhum nesta classe.
public class EndpointMapper {

    public static EndpointResponseList mapResponseList(V1Endpoints endpoint) {
        // TODO: verificar os dados de fato
        return new EndpointResponseList(
                endpoint.getMetadata().getName(),
                endpoint.getMetadata().getNamespace(),
                endpoint.getMetadata().getSelfLink(),
                getPrettyTime(endpoint.getMetadata().getCreationTimestamp())
        );
    }
    private static String getPrettyTime(OffsetDateTime dateTime) {
        PrettyTime prettyTime = new PrettyTime();
        return prettyTime.format(dateTime);
    }

    public static List<EndpointResponseList> mapResponseList(List<V1Endpoints> endpoints) {
        return endpoints.stream()
                .map(EndpointMapper::mapResponseList)
                .toList();
    }

}
