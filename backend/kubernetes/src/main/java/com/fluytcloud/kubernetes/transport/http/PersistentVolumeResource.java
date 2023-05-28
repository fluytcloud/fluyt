package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.PersistentVolumeService;
import com.fluytcloud.kubernetes.transport.mapper.PersistentVolumeMapper;
import com.fluytcloud.kubernetes.transport.request.ClusterObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.ClusterObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.PersistentVolumeResponseList;
import io.kubernetes.client.openapi.models.V1PersistentVolume;
import io.quarkus.security.Authenticated;
import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

import java.util.List;

@Path("/api/v1/kubernetes/persistent-volume")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class PersistentVolumeResource {

    private final PersistentVolumeService persistentVolumeService;
    private final ClusterService clusterService;

    private static final PersistentVolumeMapper PERSISTENT_VOLUME_MAPPER = new PersistentVolumeMapper();

    public PersistentVolumeResource(PersistentVolumeService configMapService, ClusterService clusterService) {
        this.persistentVolumeService = configMapService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<PersistentVolumeResponseList> find(@BeanParam @Valid ClusterObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();
        var filter = new Filter(cluster).setSearch(requestFilter.getName());
        var persistentVolumes = persistentVolumeService.list(filter);
        return PERSISTENT_VOLUME_MAPPER.mapResponseList(persistentVolumes);
    }

    @GET
    public V1PersistentVolume get(@BeanParam @Valid ClusterObjectRequestFilter podFilter) {
        var cluster = clusterService.findById(podFilter.getClusterId())
                .orElseThrow();
        return persistentVolumeService.read(cluster, podFilter.getName())
                .orElseThrow(() -> new NotFoundException("PersistentVolume not found"));
    }

}
