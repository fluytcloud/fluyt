package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import com.fluytcloud.kubernetes.repositories.ServiceAccountRepository;
import io.kubernetes.client.openapi.models.V1ServiceAccount;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class ServiceAccountService extends NamespaceObjectsService<V1ServiceAccount> implements ObjectService<V1ServiceAccount> {

    private final ServiceAccountRepository serviceAccountRepository;

    public ServiceAccountService(ServiceAccountRepository serviceAccountRepository) {
        this.serviceAccountRepository = serviceAccountRepository;
    }

    @Override
    protected NamespaceObjectsRepository<V1ServiceAccount> repository() {
        return serviceAccountRepository;
    }
}
