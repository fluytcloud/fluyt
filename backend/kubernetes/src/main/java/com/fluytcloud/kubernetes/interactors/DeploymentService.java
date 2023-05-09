package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.DeploymentRepository;
import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import io.kubernetes.client.openapi.models.V1Deployment;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class DeploymentService extends NamespaceObjectsService<V1Deployment> implements ObjectService<V1Deployment> {

    private final DeploymentRepository deploymentRepository;

    public DeploymentService(DeploymentRepository deploymentRepository) {
        this.deploymentRepository = deploymentRepository;
    }

    @Override
    protected NamespaceObjectsRepository<V1Deployment> repository() {
        return deploymentRepository;
    }
}
