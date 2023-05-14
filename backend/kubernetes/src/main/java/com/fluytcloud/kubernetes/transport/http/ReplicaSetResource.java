package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.ReplicaSetService;
import com.fluytcloud.kubernetes.transport.mapper.ReplicaSetMapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.ReplicaSetResponseList;
import io.kubernetes.client.openapi.models.V1ReplicaSet;
import io.quarkus.security.Authenticated;

import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import java.util.List;

@Path("/api/v1/kubernetes/replica-set")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class ReplicaSetResource {

    private final ReplicaSetService replicaSetService;
    private final ClusterService clusterService;

    private static final ReplicaSetMapper REPLICA_SET_MAPPER = new ReplicaSetMapper();

    public ReplicaSetResource(ReplicaSetService replicaSetService, ClusterService clusterService) {
        this.replicaSetService = replicaSetService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<ReplicaSetResponseList> find(@BeanParam @Valid NamespaceObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();
        var filter = new Filter(cluster).setNamespaces(requestFilter.getNamespaces()).setSearch(requestFilter.getName());
        var replicaSets = replicaSetService.list(filter);
        return REPLICA_SET_MAPPER.mapResponseList(replicaSets);
    }

    @GET
    public V1ReplicaSet get(@BeanParam @Valid NamespaceObjectRequestFilter podFilter) {
        var cluster = clusterService.findById(podFilter.getClusterId())
                .orElseThrow();
        return replicaSetService.read(cluster, podFilter.getNamespace(), podFilter.getName())
                .orElseThrow(() -> new NotFoundException("ReplicaSet not found"));
    }

}
