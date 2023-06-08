package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.interactors.NamespaceObjectsService;
import com.fluytcloud.kubernetes.interactors.ResourceQuotaService;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.mapper.ResourceQuotaMapper;
import com.fluytcloud.kubernetes.transport.response.ResourceQuotaResponseList;
import io.kubernetes.client.openapi.models.V1ResourceQuota;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;

@Path("/api/v1/kubernetes/resource-quota")
@Authenticated
public class ResourceQuotaResource extends NamespaceObjectsResource<V1ResourceQuota, ResourceQuotaResponseList> {

    private static final ResourceQuotaMapper RESOURCE_QUOTA_MAPPER = new ResourceQuotaMapper();

    @Inject
    protected ResourceQuotaService resourceQuotaService;

    @Override
    protected NamespaceObjectsService<V1ResourceQuota> getService() {
        return resourceQuotaService;
    }

    @Override
    protected Mapper<V1ResourceQuota, ResourceQuotaResponseList> getMapper() {
        return RESOURCE_QUOTA_MAPPER;
    }
}
