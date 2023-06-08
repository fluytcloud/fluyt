package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.HorizontalPodAutoscalerResponseList;
import io.kubernetes.client.openapi.models.V2HorizontalPodAutoscaler;
import io.kubernetes.client.openapi.models.V2HorizontalPodAutoscalerCondition;
import io.kubernetes.client.openapi.models.V2HorizontalPodAutoscalerStatus;
import io.kubernetes.client.openapi.models.V2ResourceMetricSource;

import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.function.Function;

public class HorizontalPodAutoscalerMapper implements Mapper<V2HorizontalPodAutoscaler, HorizontalPodAutoscalerResponseList> {

    @Override
    public HorizontalPodAutoscalerResponseList mapResponseList(V2HorizontalPodAutoscaler hpa) {
        var status = Optional.ofNullable(hpa.getStatus());

        return new HorizontalPodAutoscalerResponseList(
                hpa.getMetadata().getName(),
                hpa.getMetadata().getNamespace(),
                metrics(hpa),
                hpa.getSpec().getMinReplicas(),
                hpa.getSpec().getMaxReplicas(),
                status.map(V2HorizontalPodAutoscalerStatus::getCurrentReplicas).orElse(0),
                status(hpa.getStatus()),
                KubernetesMapper.formatAge(hpa.getMetadata().getCreationTimestamp())
        );
    }

    private List<String> metrics(V2HorizontalPodAutoscaler hpa) {
        Function<String, Integer> getCurrentMetric = metricName -> {
            if (Objects.isNull(hpa.getStatus()) || Objects.isNull(hpa.getStatus().getCurrentMetrics())) {
                return null;
            }

            return hpa.getStatus().getCurrentMetrics().stream()
                    .filter(current -> current.getResource().getName().equals(metricName))
                    .findFirst()
                    .map(current -> {
                        return Optional.ofNullable(current.getResource().getCurrent().getAverageUtilization())
                                .orElseGet(() -> current.getResource().getCurrent().getAverageValue().getNumber().intValue());
                    }).get();
        };

        Function<V2ResourceMetricSource, Integer> getSpecMetric = resource -> {
            return Optional.ofNullable(resource.getTarget().getAverageUtilization())
                    .orElseGet(() -> resource.getTarget().getAverageValue().getNumber().intValue());
        };

        return hpa.getSpec().getMetrics().stream()
                .map(it -> {
                    var specMetric = getSpecMetric.apply(it.getResource());
                    var currentMetric = getCurrentMetric.apply(it.getResource().getName());
                    return currentMetric + " / " + specMetric + "%";
                })
                .toList();
    }

    private List<String> status(V2HorizontalPodAutoscalerStatus status) {
        return Optional.ofNullable(status)
                .map(it -> it.getConditions()
                        .stream()
                        .filter(condition -> "True".equals(condition.getStatus()))
                        .map(V2HorizontalPodAutoscalerCondition::getType)
                        .toList()
                )
                .orElse(Collections.emptyList());
    }

    @Override
    public List<HorizontalPodAutoscalerResponseList> mapResponseList(List<V2HorizontalPodAutoscaler> hpas) {
        return hpas.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
