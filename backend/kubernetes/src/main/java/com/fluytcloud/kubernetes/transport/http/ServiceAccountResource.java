package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.interactors.NamespaceObjectsService;
import com.fluytcloud.kubernetes.interactors.ServiceAccountService;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.mapper.ServiceAccountMapper;
import com.fluytcloud.kubernetes.transport.response.ServiceAccountResponseList;
import io.kubernetes.client.openapi.models.V1ServiceAccount;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;

@Path("/api/v1/kubernetes/service-account")
@Authenticated
public class ServiceAccountResource extends NamespaceObjectsResource<V1ServiceAccount, ServiceAccountResponseList> {

    private static final ServiceAccountMapper SERVICE_ACCOUNT_MAPPER = new ServiceAccountMapper();

    @Inject
    protected ServiceAccountService serviceAccountService;

    @Override
    protected NamespaceObjectsService<V1ServiceAccount> getService() {
        return serviceAccountService;
    }

    @Override
    protected Mapper<V1ServiceAccount, ServiceAccountResponseList> getMapper() {
        return SERVICE_ACCOUNT_MAPPER;
    }
}
