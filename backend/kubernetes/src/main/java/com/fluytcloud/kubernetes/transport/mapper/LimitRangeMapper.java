package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.LimitRangeResponseList;
import io.kubernetes.client.openapi.models.V1LimitRange;

import java.util.List;

public class LimitRangeMapper implements Mapper<V1LimitRange, LimitRangeResponseList> {

    @Override
    public LimitRangeResponseList mapResponseList(V1LimitRange limitRange) {
        return new LimitRangeResponseList(
                limitRange.getMetadata().getName(),
                limitRange.getMetadata().getNamespace(),
                KubernetesMapper.formatAge(limitRange.getMetadata().getCreationTimestamp())
        );
    }

    @Override
    public List<LimitRangeResponseList> mapResponseList(List<V1LimitRange> limitRanges) {
        return limitRanges.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
