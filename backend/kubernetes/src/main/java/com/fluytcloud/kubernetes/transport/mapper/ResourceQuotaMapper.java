package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.ResourceQuotaResponseList;
import io.kubernetes.client.openapi.models.V1ResourceQuota;

import java.util.List;

public class ResourceQuotaMapper {

    public ResourceQuotaResponseList mapResponseList(V1ResourceQuota resourceQuota) {
        return new ResourceQuotaResponseList(
                resourceQuota.getMetadata().getName(),
                resourceQuota.getMetadata().getNamespace(),
                KubernetesMapper.formatAge(resourceQuota.getMetadata().getCreationTimestamp())
        );
    }

    public List<ResourceQuotaResponseList> mapResponseList(List<V1ResourceQuota> resourceQuotas) {
        return resourceQuotas.stream()
                .map(this::mapResponseList)
                .toList();
    }
}
