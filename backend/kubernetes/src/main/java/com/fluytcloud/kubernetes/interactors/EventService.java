package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.EventRepository;
import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import io.kubernetes.client.openapi.models.CoreV1Event;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class EventService extends NamespaceObjectsService<CoreV1Event> implements ObjectService<CoreV1Event> {

    private final EventRepository eventRepository;

    public EventService(EventRepository eventRepository) {
        this.eventRepository = eventRepository;
    }

    @Override
    protected NamespaceObjectsRepository<CoreV1Event> repository() {
        return eventRepository;
    }
}
