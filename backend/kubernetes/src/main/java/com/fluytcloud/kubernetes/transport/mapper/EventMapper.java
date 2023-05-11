package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.EventDetailResponseList;
import com.fluytcloud.kubernetes.transport.response.EventResponseList;
import io.kubernetes.client.openapi.models.CoreV1Event;

import java.util.List;

public class EventMapper {

    public List<EventResponseList> mapResponseList(List<CoreV1Event> events) {
        return events.stream().map(it -> new EventResponseList())
                .toList();
    }

    public List<EventDetailResponseList> mapDetailResponseList(List<CoreV1Event> events) {
        return events.stream()
                .map(event -> new EventDetailResponseList(
                        event.getSource().getComponent() + " " + event.getSource().getHost(),
                        event.getCount(),
                        event.getInvolvedObject().getFieldPath(),
                        event.getLastTimestamp()
                ))
                .toList();
    }
}
