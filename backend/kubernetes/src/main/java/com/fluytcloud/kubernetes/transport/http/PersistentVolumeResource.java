package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.interactors.ClusterObjectsService;
import com.fluytcloud.kubernetes.interactors.PersistentVolumeService;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.mapper.PersistentVolumeMapper;
import com.fluytcloud.kubernetes.transport.response.PersistentVolumeResponseList;
import io.kubernetes.client.openapi.models.V1PersistentVolume;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;

@Path("/api/v1/kubernetes/persistent-volume")
@Authenticated
public class PersistentVolumeResource extends ClusterObjectsResource<V1PersistentVolume, PersistentVolumeResponseList> {

    private static final PersistentVolumeMapper PERSISTENT_VOLUME_MAPPER = new PersistentVolumeMapper();

    @Inject
    protected PersistentVolumeService persistentVolumeService;

    @Override
    protected ClusterObjectsService<V1PersistentVolume> getService() {
        return persistentVolumeService;
    }

    @Override
    protected Mapper<V1PersistentVolume, PersistentVolumeResponseList> getMapper() {
        return PERSISTENT_VOLUME_MAPPER;
    }
}
