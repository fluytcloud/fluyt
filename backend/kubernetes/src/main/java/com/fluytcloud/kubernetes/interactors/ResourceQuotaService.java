package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import com.fluytcloud.kubernetes.repositories.ResourceQuotaRepository;
import io.kubernetes.client.openapi.models.V1ResourceQuota;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class ResourceQuotaService extends NamespaceObjectsService<V1ResourceQuota> implements ObjectService<V1ResourceQuota> {

    private final ResourceQuotaRepository resourceQuotaRepository;

    public ResourceQuotaService(ResourceQuotaRepository resourceQuotaRepository) {
        this.resourceQuotaRepository = resourceQuotaRepository;
    }

    @Override
    protected NamespaceObjectsRepository<V1ResourceQuota> repository() {
        return resourceQuotaRepository;
    }
}

