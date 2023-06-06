package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.interactors.LimitRangeService;
import com.fluytcloud.kubernetes.interactors.NamespaceObjectsService;
import com.fluytcloud.kubernetes.transport.mapper.LimitRangeMapper;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.response.LimitRangeResponseList;
import io.kubernetes.client.openapi.models.V1LimitRange;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;

@Path("/api/v1/kubernetes/limit-range")
@Authenticated
public class LimitRangeResource extends NamespaceObjectsResource<V1LimitRange, LimitRangeResponseList> {

    private static final LimitRangeMapper LIMIT_RANGE_MAPPER = new LimitRangeMapper();

    @Inject
    protected LimitRangeService limitRangeService;

    @Override
    protected NamespaceObjectsService<V1LimitRange> getService() {
        return limitRangeService;
    }

    @Override
    protected Mapper<V1LimitRange, LimitRangeResponseList> getMapper() {
        return LIMIT_RANGE_MAPPER;
    }
}
