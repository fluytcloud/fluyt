package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.interactors.IngressService;
import com.fluytcloud.kubernetes.interactors.NamespaceObjectsService;
import com.fluytcloud.kubernetes.transport.mapper.IngressMapper;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.response.IngressResponseLIst;
import io.kubernetes.client.openapi.models.V1Ingress;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;

@Path("/api/v1/kubernetes/ingress")
@Authenticated
public class IngressResource extends NamespaceObjectsResource<V1Ingress, IngressResponseLIst> {

    private static final IngressMapper INGRESS_MAPPER = new IngressMapper();

    @Inject
    protected IngressService ingressService;

    @Override
    protected NamespaceObjectsService<V1Ingress> getService() {
        return ingressService;
    }

    @Override
    protected Mapper<V1Ingress, IngressResponseLIst> getMapper() {
        return INGRESS_MAPPER;
    }
}
