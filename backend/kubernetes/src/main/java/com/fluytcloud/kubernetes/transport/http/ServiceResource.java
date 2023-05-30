package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.interactors.NamespaceObjectsService;
import com.fluytcloud.kubernetes.interactors.ServiceService;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.mapper.ServiceMapper;
import com.fluytcloud.kubernetes.transport.response.ServiceResponseList;
import io.kubernetes.client.openapi.models.V1Service;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;

@Path("/api/v1/kubernetes/service")
@Authenticated
public class ServiceResource extends NamespaceObjectsResource<V1Service, ServiceResponseList> {

    private static final ServiceMapper SERVICE_MAPPER = new ServiceMapper();

    @Inject
    protected ServiceService serviceService;

    @Override
    protected NamespaceObjectsService<V1Service> getService() {
        return serviceService;
    }

    @Override
    protected Mapper<V1Service, ServiceResponseList> getMapper() {
        return SERVICE_MAPPER;
    }
}
