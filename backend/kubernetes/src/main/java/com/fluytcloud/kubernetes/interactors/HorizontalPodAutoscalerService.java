package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.HorizontalPodAutoscalerRepository;
import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import io.kubernetes.client.openapi.models.V2HorizontalPodAutoscaler;

import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class HorizontalPodAutoscalerService extends NamespaceObjectsService<V2HorizontalPodAutoscaler> implements ObjectService<V2HorizontalPodAutoscaler>  {

    private final HorizontalPodAutoscalerRepository horizontalPodAutoscalerRepository;

    public HorizontalPodAutoscalerService(HorizontalPodAutoscalerRepository horizontalPodAutoscalerRepository) {
        this.horizontalPodAutoscalerRepository = horizontalPodAutoscalerRepository;
    }

    @Override
    protected NamespaceObjectsRepository<V2HorizontalPodAutoscaler> repository() {
        return horizontalPodAutoscalerRepository;
    }

}

