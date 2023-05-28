package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.LimitRangeService;
import com.fluytcloud.kubernetes.transport.mapper.LimitRangeMapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.LimitRangeResponseList;
import io.kubernetes.client.openapi.models.V1LimitRange;
import io.quarkus.security.Authenticated;
import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

import java.util.List;

@Path("/api/v1/kubernetes/limit-range")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class LimitRangeResource {

    private static final LimitRangeMapper LIMIT_RANGE_MAPPER = new LimitRangeMapper();

    private final LimitRangeService limitRangeService;
    private final ClusterService clusterService;

    public LimitRangeResource(LimitRangeService limitRangeService, ClusterService clusterService) {
        this.limitRangeService = limitRangeService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<LimitRangeResponseList> find(@BeanParam @Valid NamespaceObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();

        var filter = new Filter(cluster)
                .setNamespaces(requestFilter.getNamespaces())
                .setSearch(requestFilter.getName());

        var limitRanges = limitRangeService.list(filter);
        return LIMIT_RANGE_MAPPER.mapResponseList(limitRanges);
    }

    @GET
    public V1LimitRange get(@BeanParam @Valid NamespaceObjectRequestFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();

        return limitRangeService.read(cluster,
                        requestFilter.getNamespace(),
                        requestFilter.getName())
                .orElseThrow(() -> new NotFoundException("LimitRange not found"));
    }

}
