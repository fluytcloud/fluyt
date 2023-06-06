package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.interactors.NamespaceObjectsService;
import com.fluytcloud.kubernetes.interactors.PersistentVolumeClaimService;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.mapper.PersistentVolumeClaimMapper;
import com.fluytcloud.kubernetes.transport.response.PersistentVolumeClaimResponseList;
import io.kubernetes.client.openapi.models.V1PersistentVolumeClaim;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;

@Path("/api/v1/kubernetes/persistent-volume-claim")
@Authenticated
public class PersistentVolumeClaimResource extends NamespaceObjectsResource<V1PersistentVolumeClaim, PersistentVolumeClaimResponseList> {

    private static final PersistentVolumeClaimMapper PERSISTENT_VOLUME_CLAIM_MAPPER = new PersistentVolumeClaimMapper();

    @Inject
    protected PersistentVolumeClaimService persistentVolumeClaimService;

    @Override
    protected NamespaceObjectsService<V1PersistentVolumeClaim> getService() {
        return persistentVolumeClaimService;
    }

    @Override
    protected Mapper<V1PersistentVolumeClaim, PersistentVolumeClaimResponseList> getMapper() {
        return PERSISTENT_VOLUME_CLAIM_MAPPER;
    }
}
