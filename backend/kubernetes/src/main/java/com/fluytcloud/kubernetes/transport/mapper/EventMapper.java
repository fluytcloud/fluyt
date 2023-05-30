package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.EventResponseList;
import com.fluytcloud.kubernetes.transport.response.EventSimpleResponseList;
import io.kubernetes.client.openapi.models.CoreV1Event;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

import static com.fluytcloud.kubernetes.transport.mapper.KubernetesMapper.formatAge;

public class EventMapper {

    public List<EventResponseList> mapResponseList(List<CoreV1Event> events) {
        return events.stream()
                .map(it -> new EventResponseList(
                        it.getType(),
                        it.getMessage(),
                        it.getMetadata().getNamespace(),
                        getInvolvedObject(it),
                        getSource(it),
                        it.getCount(),
                        formatAge(it.getMetadata().getCreationTimestamp()),
                        formatAge(it.getLastTimestamp()),
                        it.getMetadata().getName()
                ))
                .toList();
    }

    private String getInvolvedObject(CoreV1Event event) {
        return Optional.ofNullable(event.getInvolvedObject())
                .map(it -> event.getInvolvedObject().getKind() + ": " + event.getInvolvedObject().getName())
                .orElse(null);
    }
    public List<EventSimpleResponseList> mapSimpleResponseList(List<CoreV1Event> events) {
        return events.stream()
                .map(event -> new EventSimpleResponseList(
                        getSource(event),
                        event.getCount(),
                        event.getInvolvedObject().getFieldPath(),
                        event.getLastTimestamp(),
                        event.getMessage()
                ))
                .toList();
    }

    private String getSource(CoreV1Event event) {
        if (Objects.nonNull(event.getSource()) && Objects.nonNull(event.getSource().getHost())) {
            return event.getSource().getComponent() + " " + event.getSource().getHost();
        }

        return event.getSource().getComponent();
    }
}
