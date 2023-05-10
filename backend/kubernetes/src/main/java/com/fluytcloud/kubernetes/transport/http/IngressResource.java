package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.IngressService;
import com.fluytcloud.kubernetes.transport.mapper.IngressMapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.IngressResponseLIst;
import io.kubernetes.client.openapi.models.V1Ingress;
import io.quarkus.security.Authenticated;

import javax.validation.Valid;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("/api/v1/kubernetes/ingress")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class IngressResource {

    private final IngressService ingressService;
    private final ClusterService clusterService;

    private static final IngressMapper INGRESS_MAPPER = new IngressMapper();

    public IngressResource(IngressService ingressService, ClusterService clusterService) {
        this.ingressService = ingressService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<IngressResponseLIst> find(@BeanParam @Valid NamespaceObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();
        var filter = new Filter(cluster).setNamespaces(requestFilter.getNamespaces()).setSearch(requestFilter.getName());
        var ingresses = ingressService.list(filter);
        return INGRESS_MAPPER.mapResponseList(ingresses);
    }

    @GET
    public V1Ingress get(@BeanParam @Valid NamespaceObjectRequestFilter podFilter) {
        var cluster = clusterService.findById(podFilter.getClusterId())
                .orElseThrow();
        return ingressService.read(cluster, podFilter.getNamespace(), podFilter.getName())
                .orElseThrow(() -> new NotFoundException("Ingress not found"));
    }

}
