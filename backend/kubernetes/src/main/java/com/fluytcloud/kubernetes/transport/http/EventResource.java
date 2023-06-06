package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.EventService;
import com.fluytcloud.kubernetes.interactors.NamespaceObjectsService;
import com.fluytcloud.kubernetes.transport.mapper.EventMapper;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.EventResponseList;
import com.fluytcloud.kubernetes.transport.response.EventSimpleResponseList;
import io.kubernetes.client.openapi.models.CoreV1Event;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.validation.Valid;
import jakarta.ws.rs.BeanParam;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Path("/api/v1/kubernetes/events")
@Authenticated
public class EventResource extends NamespaceObjectsResource<CoreV1Event, EventResponseList> {

    private static final EventMapper EVENT_MAPPER = new EventMapper();

    @Inject
    protected EventService eventService;

    @Override
    protected NamespaceObjectsService<CoreV1Event> getService() {
        return eventService;
    }

    @Override
    protected Mapper<CoreV1Event, EventResponseList> getMapper() {
        return EVENT_MAPPER;
    }

    @GET
    @Path("simple/list")
    public List<EventSimpleResponseList> getSimpleList(@BeanParam @Valid NamespaceObjectRequestListFilter requestFilter) {
        Optional.ofNullable(requestFilter.getName()).orElseThrow(() -> new IllegalArgumentException("Param Name is required"));

        var cluster = clusterService.findById(requestFilter.getClusterId()).orElseThrow();
        var filter = new Filter(cluster).setNamespaces(requestFilter.getNamespaces())
                .setFieldSelector(Map.of("involvedObject.name", requestFilter.getName()));
        var events = eventService.list(filter);
        return EVENT_MAPPER.mapSimpleResponseList(events);
    }
}
