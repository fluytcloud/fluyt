package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.StatefulSetService;
import com.fluytcloud.kubernetes.transport.mapper.StatefulSetMapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.StatefulSetResponseList;
import io.kubernetes.client.openapi.models.V1StatefulSet;
import io.quarkus.security.Authenticated;

import javax.validation.Valid;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("/api/v1/kubernetes/stateful-set")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class StatefulSetResource {

    private final StatefulSetService statefulSetService;
    private final ClusterService clusterService;

    private static final StatefulSetMapper STATEFUL_SET_MAPPER = new StatefulSetMapper();

    public StatefulSetResource(StatefulSetService statefulSetService, ClusterService clusterService) {
        this.statefulSetService = statefulSetService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<StatefulSetResponseList> find(@BeanParam @Valid NamespaceObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();
        var filter = new Filter(cluster).setNamespaces(requestFilter.getNamespaces()).setSearch(requestFilter.getName());
        var statefulSets = statefulSetService.list(filter);
        return STATEFUL_SET_MAPPER.mapResponseList(statefulSets);
    }

    @GET
    public V1StatefulSet get(@BeanParam @Valid NamespaceObjectRequestFilter podFilter) {
        var cluster = clusterService.findById(podFilter.getClusterId())
                .orElseThrow();
        return statefulSetService.read(cluster, podFilter.getNamespace(), podFilter.getName())
                .orElseThrow(() -> new NotFoundException("StatefulSet not found"));
    }

}
