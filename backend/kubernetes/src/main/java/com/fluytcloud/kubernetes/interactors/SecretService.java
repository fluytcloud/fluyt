package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import com.fluytcloud.kubernetes.repositories.SecretRepository;
import io.kubernetes.client.openapi.models.V1Secret;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class SecretService extends NamespaceObjectsService<V1Secret> implements ObjectService<V1Secret> {

    private final SecretRepository secretRepository;

    public SecretService(SecretRepository secretRepository) {
        this.secretRepository = secretRepository;
    }

    @Override
    protected NamespaceObjectsRepository<V1Secret> repository() {
        return secretRepository;
    }
}
