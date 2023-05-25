package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.HorizontalPodAutoscalerService;
import com.fluytcloud.kubernetes.transport.mapper.HorizontalPodAutoscalerMapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.HorizontalPodAutoscalerResponseList;
import io.kubernetes.client.openapi.models.V2HorizontalPodAutoscaler;
import io.quarkus.security.Authenticated;

import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import java.util.List;

@Path("/api/v1/kubernetes/horizontal-pod-autoscaler")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class HorizontalPodAutoscalerResource {

    private final HorizontalPodAutoscalerService horizontalPodAutoscalerService;
    private final ClusterService clusterService;

    private static final HorizontalPodAutoscalerMapper HORIZONTAL_POD_AUTOSCALER_MAPPER = new HorizontalPodAutoscalerMapper();

    public HorizontalPodAutoscalerResource(HorizontalPodAutoscalerService horizontalPodAutoscalerService, ClusterService clusterService) {
        this.horizontalPodAutoscalerService = horizontalPodAutoscalerService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<HorizontalPodAutoscalerResponseList> find(@BeanParam @Valid NamespaceObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();
        var filter = new Filter(cluster).setNamespaces(requestFilter.getNamespaces()).setSearch(requestFilter.getName());
        var hpas = horizontalPodAutoscalerService.list(filter);
        return HORIZONTAL_POD_AUTOSCALER_MAPPER.mapResponseList(hpas);
    }

    @GET
    public V2HorizontalPodAutoscaler get(@BeanParam @Valid NamespaceObjectRequestFilter podFilter) {
        var cluster = clusterService.findById(podFilter.getClusterId())
                .orElseThrow();
        return horizontalPodAutoscalerService.read(cluster, podFilter.getNamespace(), podFilter.getName())
                .orElseThrow(() -> new NotFoundException("HorizontalPodAutoscaler not found"));
    }

}
