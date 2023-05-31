package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.interactors.EndpointService;
import com.fluytcloud.kubernetes.interactors.NamespaceObjectsService;
import com.fluytcloud.kubernetes.transport.mapper.EndpointMapper;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.response.EndpointResponseList;
import io.kubernetes.client.openapi.models.V1Endpoints;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;

@Path("/api/v1/kubernetes/endpoint")
@Authenticated
public class EndpointResource extends NamespaceObjectsResource<V1Endpoints, EndpointResponseList> {

    private static final EndpointMapper ENDPOINT_MAPPER = new EndpointMapper();

    @Inject
    protected EndpointService endpointService;

    @Override
    protected NamespaceObjectsService<V1Endpoints> getService() {
        return endpointService;
    }

    @Override
    protected Mapper<V1Endpoints, EndpointResponseList> getMapper() {
        return ENDPOINT_MAPPER;
    }
}
