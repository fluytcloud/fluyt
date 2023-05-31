package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.PersistentVolumeResponseList;
import io.kubernetes.client.openapi.models.V1ObjectReference;
import io.kubernetes.client.openapi.models.V1PersistentVolume;
import io.kubernetes.client.openapi.models.V1PersistentVolumeSpec;
import io.kubernetes.client.openapi.models.V1PersistentVolumeStatus;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

public class PersistentVolumeMapper implements Mapper<V1PersistentVolume, PersistentVolumeResponseList> {

    @Override
    public PersistentVolumeResponseList mapResponseList(V1PersistentVolume persistentVolume) {
        return new PersistentVolumeResponseList(
                persistentVolume.getMetadata().getName(),
                persistentVolume.getSpec().getStorageClassName(),
                getStorage(persistentVolume.getSpec()),
                getClaim(persistentVolume.getSpec()),
                getStatus(persistentVolume.getStatus()),
                KubernetesMapper.formatAge(persistentVolume.getMetadata().getCreationTimestamp())
        );
    }

    private String getClaim(V1PersistentVolumeSpec spec) {
        return Optional.ofNullable(spec.getClaimRef())
                .map(V1ObjectReference::getName)
                .orElse(null);
    }

    private BigDecimal getStorage(V1PersistentVolumeSpec spec) {
        return Optional.ofNullable(spec.getCapacity())
                .map(it -> it.get("storage").getNumber())
                .orElse(null);
    }

    private String getStatus(V1PersistentVolumeStatus status) {
        return Optional.ofNullable(status)
                .map(V1PersistentVolumeStatus::getPhase)
                .orElse("");
    }

    @Override
    public List<PersistentVolumeResponseList> mapResponseList(List<V1PersistentVolume> persistentVolumes) {
        return persistentVolumes.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
