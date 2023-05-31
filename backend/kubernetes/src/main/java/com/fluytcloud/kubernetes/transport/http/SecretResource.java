package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.interactors.NamespaceObjectsService;
import com.fluytcloud.kubernetes.interactors.SecretService;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.mapper.SecretMapper;
import com.fluytcloud.kubernetes.transport.response.SecretResponseList;
import io.kubernetes.client.openapi.models.V1Secret;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;

@Path("/api/v1/kubernetes/secret")
@Authenticated
public class SecretResource extends NamespaceObjectsResource<V1Secret, SecretResponseList> {

    private static final SecretMapper SECRET_MAPPER = new SecretMapper();

    @Inject
    protected SecretService secretService;

    @Override
    protected NamespaceObjectsService<V1Secret> getService() {
        return secretService;
    }

    @Override
    protected Mapper<V1Secret, SecretResponseList> getMapper() {
        return SECRET_MAPPER;
    }
}
