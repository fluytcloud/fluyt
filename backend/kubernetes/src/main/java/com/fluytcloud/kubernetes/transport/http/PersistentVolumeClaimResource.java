package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.PersistentVolumeClaimService;
import com.fluytcloud.kubernetes.transport.mapper.PersistentVolumeClaimMapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.PersistentVolumeClaimResponseList;
import io.kubernetes.client.openapi.models.V1PersistentVolumeClaim;
import io.quarkus.security.Authenticated;
import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

import java.util.List;

@Path("/api/v1/kubernetes/persistent-volume-claim")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class PersistentVolumeClaimResource {

    private final PersistentVolumeClaimService persistentVolumeClaimService;
    private final ClusterService clusterService;

    private static final PersistentVolumeClaimMapper PERSISTENT_VOLUME_CLAIM_MAPPER = new PersistentVolumeClaimMapper();

    public PersistentVolumeClaimResource(PersistentVolumeClaimService persistentVolumeClaimService, ClusterService clusterService) {
        this.persistentVolumeClaimService = persistentVolumeClaimService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<PersistentVolumeClaimResponseList> find(@BeanParam @Valid NamespaceObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();
        var filter = new Filter(cluster).setNamespaces(requestFilter.getNamespaces()).setSearch(requestFilter.getName());
        var pvcs = persistentVolumeClaimService.list(filter);
        return PERSISTENT_VOLUME_CLAIM_MAPPER.mapResponseList(pvcs);
    }

    @GET
    public V1PersistentVolumeClaim get(@BeanParam @Valid NamespaceObjectRequestFilter podFilter) {
        var cluster = clusterService.findById(podFilter.getClusterId())
                .orElseThrow();
        return persistentVolumeClaimService.read(cluster, podFilter.getNamespace(), podFilter.getName())
                .orElseThrow(() -> new NotFoundException("PersistentVolumeClaim not found"));
    }

}
