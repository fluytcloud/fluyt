package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.interactors.HorizontalPodAutoscalerService;
import com.fluytcloud.kubernetes.interactors.NamespaceObjectsService;
import com.fluytcloud.kubernetes.transport.mapper.HorizontalPodAutoscalerMapper;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.response.HorizontalPodAutoscalerResponseList;
import io.kubernetes.client.openapi.models.V2HorizontalPodAutoscaler;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;

@Path("/api/v1/kubernetes/horizontal-pod-autoscaler")
@Authenticated
public class HorizontalPodAutoscalerResource extends NamespaceObjectsResource<V2HorizontalPodAutoscaler, HorizontalPodAutoscalerResponseList> {

    private static final HorizontalPodAutoscalerMapper HORIZONTAL_POD_AUTOSCALER_MAPPER = new HorizontalPodAutoscalerMapper();

    @Inject
    protected HorizontalPodAutoscalerService horizontalPodAutoscalerService;

    @Override
    protected NamespaceObjectsService<V2HorizontalPodAutoscaler> getService() {
        return horizontalPodAutoscalerService;
    }

    @Override
    protected Mapper<V2HorizontalPodAutoscaler, HorizontalPodAutoscalerResponseList> getMapper() {
        return HORIZONTAL_POD_AUTOSCALER_MAPPER;
    }
}
