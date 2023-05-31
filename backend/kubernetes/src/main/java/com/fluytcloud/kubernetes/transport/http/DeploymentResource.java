package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.interactors.DeploymentService;
import com.fluytcloud.kubernetes.interactors.NamespaceObjectsService;
import com.fluytcloud.kubernetes.transport.mapper.DeploymentMapper;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.response.DeploymentResponseList;
import io.kubernetes.client.openapi.models.V1Deployment;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;

@Path("/api/v1/kubernetes/deployment")
@Authenticated
public class DeploymentResource extends NamespaceObjectsResource<V1Deployment, DeploymentResponseList> {

    private static final DeploymentMapper DEPLOYMENT_MAPPER = new DeploymentMapper();

    @Inject
    protected DeploymentService deploymentService;

    @Override
    protected NamespaceObjectsService<V1Deployment> getService() {
        return deploymentService;
    }

    @Override
    protected Mapper<V1Deployment, DeploymentResponseList> getMapper() {
        return DEPLOYMENT_MAPPER;
    }
}
