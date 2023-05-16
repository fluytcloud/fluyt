package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.IngressRepository;
import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import io.kubernetes.client.openapi.models.V1Ingress;

import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class IngressService extends NamespaceObjectsService<V1Ingress> implements ObjectService<V1Ingress>  {

    private final IngressRepository ingressRepository;

    public IngressService(IngressRepository ingressRepository) {
        this.ingressRepository = ingressRepository;
    }

    @Override
    protected NamespaceObjectsRepository<V1Ingress> repository() {
        return ingressRepository;
    }

}
