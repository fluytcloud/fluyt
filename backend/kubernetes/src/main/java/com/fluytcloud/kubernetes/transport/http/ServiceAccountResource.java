package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.ServiceAccountService;
import com.fluytcloud.kubernetes.transport.mapper.ServiceAccountMapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.ServiceAccountResponseList;
import io.kubernetes.client.openapi.models.V1ServiceAccount;
import io.quarkus.security.Authenticated;
import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

import java.util.List;

@Path("/api/v1/kubernetes/service-account")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class ServiceAccountResource {

    private static final ServiceAccountMapper SERVICE_ACCOUNT_MAPPER = new ServiceAccountMapper();

    private final ServiceAccountService serviceAccountService;
    private final ClusterService clusterService;

    public ServiceAccountResource(ServiceAccountService serviceAccountService, ClusterService clusterService) {
        this.serviceAccountService = serviceAccountService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<ServiceAccountResponseList> find(@BeanParam @Valid NamespaceObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();

        var filter = new Filter(cluster)
                .setNamespaces(requestFilter.getNamespaces())
                .setSearch(requestFilter.getName());

        var serviceAccounts = serviceAccountService.list(filter);
        return SERVICE_ACCOUNT_MAPPER.mapResponseList(serviceAccounts);
    }

    @GET
    public V1ServiceAccount get(@BeanParam @Valid NamespaceObjectRequestFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();

        return serviceAccountService.read(cluster,
                        requestFilter.getNamespace(),
                        requestFilter.getName())
                .orElseThrow(() -> new NotFoundException("ServiceAccount not found"));
    }
}
