package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.EventResponseList;
import com.fluytcloud.kubernetes.transport.response.EventSimpleResponseList;
import io.kubernetes.client.openapi.models.CoreV1Event;

import java.util.List;
import java.util.Objects;

public class EventMapper implements Mapper<CoreV1Event, EventResponseList> {

    @Override
    public EventResponseList mapResponseList(CoreV1Event event) {
        return new EventResponseList();
    }

    @Override
    public List<EventResponseList> mapResponseList(List<CoreV1Event> events) {
        return events.stream().map(this::mapResponseList)
                .toList();
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
