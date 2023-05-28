package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.StorageClassService;
import com.fluytcloud.kubernetes.transport.mapper.StorageClassMapper;
import com.fluytcloud.kubernetes.transport.request.ClusterObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.ClusterObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.StorageClassResponseList;
import io.kubernetes.client.openapi.models.V1StorageClass;
import io.quarkus.security.Authenticated;
import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

import java.util.List;

@Path("/api/v1/kubernetes/storage-class")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class StorageClassResource {

    private final StorageClassService storageClassService;
    private final ClusterService clusterService;

    private static final StorageClassMapper STORAGE_CLASS_MAPPER = new StorageClassMapper();

    public StorageClassResource(StorageClassService configMapService, ClusterService clusterService) {
        this.storageClassService = configMapService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<StorageClassResponseList> find(@BeanParam @Valid ClusterObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();
        var filter = new Filter(cluster).setSearch(requestFilter.getName());
        var storageClasses = storageClassService.list(filter);
        return STORAGE_CLASS_MAPPER.mapResponseList(storageClasses);
    }

    @GET
    public V1StorageClass get(@BeanParam @Valid ClusterObjectRequestFilter podFilter) {
        var cluster = clusterService.findById(podFilter.getClusterId())
                .orElseThrow();
        return storageClassService.read(cluster, podFilter.getName())
                .orElseThrow(() -> new NotFoundException("StorageClass not found"));
    }

}
