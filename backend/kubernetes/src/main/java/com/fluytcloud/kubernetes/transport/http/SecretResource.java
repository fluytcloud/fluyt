package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.SecretService;
import com.fluytcloud.kubernetes.transport.mapper.SecretMapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.SecretResponseList;
import io.kubernetes.client.openapi.models.V1Secret;
import io.quarkus.security.Authenticated;
import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

import java.util.List;

@Path("/api/v1/kubernetes/secret")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class SecretResource {

    private static final SecretMapper SECRET_MAPPER = new SecretMapper();

    private final SecretService secretService;
    private final ClusterService clusterService;

    public SecretResource(SecretService secretService, ClusterService clusterService) {
        this.secretService = secretService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<SecretResponseList> find(@BeanParam @Valid NamespaceObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();

        var filter = new Filter(cluster)
                .setNamespaces(requestFilter.getNamespaces())
                .setSearch(requestFilter.getName());

        var secrets = secretService.list(filter);
        return SECRET_MAPPER.mapResponseList(secrets);
    }

    @GET
    public V1Secret get(@BeanParam @Valid NamespaceObjectRequestFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();

        return secretService.read(cluster,
                        requestFilter.getNamespace(),
                        requestFilter.getName())
                .orElseThrow(() -> new NotFoundException("Secret not found"));
    }

}
