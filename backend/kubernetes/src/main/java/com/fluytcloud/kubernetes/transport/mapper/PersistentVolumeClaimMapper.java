package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.PersistentVolumeClaimResponseList;
import io.kubernetes.client.openapi.models.V1PersistentVolumeClaim;
import io.kubernetes.client.openapi.models.V1PersistentVolumeClaimSpec;
import io.kubernetes.client.openapi.models.V1PersistentVolumeClaimStatus;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

public class PersistentVolumeClaimMapper implements Mapper<V1PersistentVolumeClaim, PersistentVolumeClaimResponseList> {

    @Override
    public PersistentVolumeClaimResponseList mapResponseList(V1PersistentVolumeClaim pvc) {
        return new PersistentVolumeClaimResponseList(
                pvc.getMetadata().getName(),
                pvc.getMetadata().getNamespace(),
                pvc.getSpec().getStorageClassName(),
                getStorage(pvc.getSpec()),
                getStatus(pvc.getStatus()),
                KubernetesMapper.formatAge(pvc.getMetadata().getCreationTimestamp())
        );
    }

    private BigDecimal getStorage(V1PersistentVolumeClaimSpec spec) {
        return Optional.ofNullable(spec.getResources())
                .map(it -> it.getRequests().get("storage").getNumber())
                .orElse(null);
    }

    private String getStatus(V1PersistentVolumeClaimStatus status) {
        return Optional.ofNullable(status)
                .map(V1PersistentVolumeClaimStatus::getPhase)
                .orElse("");
    }

    @Override
    public List<PersistentVolumeClaimResponseList> mapResponseList(List<V1PersistentVolumeClaim> pvcs) {
        return pvcs.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
