package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import com.fluytcloud.kubernetes.repositories.ServiceRepository;
import io.kubernetes.client.openapi.models.V1Service;

import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class ServiceService extends NamespaceObjectsService<V1Service> implements ObjectService<V1Service> {

    private final ServiceRepository serviceRepository;

    public ServiceService(ServiceRepository serviceRepository) {
        this.serviceRepository = serviceRepository;
    }

    @Override
    protected NamespaceObjectsRepository<V1Service> repository() {
        return serviceRepository;
    }
}
