package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.HorizontalPodAutoscalerResponseList;
import io.kubernetes.client.openapi.models.V2HorizontalPodAutoscaler;
import io.kubernetes.client.openapi.models.V2HorizontalPodAutoscalerStatus;
import org.ocpsoft.prettytime.PrettyTime;

import java.time.OffsetDateTime;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

public class HorizontalPodAutoscalerMapper {

    public HorizontalPodAutoscalerResponseList mapResponseList(V2HorizontalPodAutoscaler hpa) {
        var status = Optional.ofNullable(hpa.getStatus());

        return new HorizontalPodAutoscalerResponseList(
                hpa.getMetadata().getName(),
                hpa.getMetadata().getNamespace(),
                metrics(hpa.getStatus()),
                hpa.getSpec().getMinReplicas(),
                hpa.getSpec().getMaxReplicas(),
                status.map(V2HorizontalPodAutoscalerStatus::getCurrentReplicas).orElse(0),
                status(hpa.getStatus()),
                getPrettyTime(hpa.getMetadata().getCreationTimestamp())
        );
    }

    private List<String> metrics(V2HorizontalPodAutoscalerStatus status) {
        return Optional.ofNullable(status)
                .map(it -> it.getCurrentMetrics()
                        .stream()
                        .map(metric -> metric.getContainerResource().getCurrent()
                                + " / "
                                + metric.getResource().getCurrent()
                        )
                        .toList()
                )
                .orElse(Collections.emptyList());
    }

    private List<String> status(V2HorizontalPodAutoscalerStatus status) {
        return Optional.ofNullable(status)
                .map(it -> it.getConditions()
                        .stream()
                        .map(condition -> condition.getType())
                        .toList()
                )
                .orElse(Collections.emptyList());
    }

    private String getPrettyTime(OffsetDateTime dateTime) {
        PrettyTime prettyTime = new PrettyTime();
        return prettyTime.format(dateTime);
    }

    public List<HorizontalPodAutoscalerResponseList> mapResponseList(List<V2HorizontalPodAutoscaler> hpas) {
        return hpas.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
