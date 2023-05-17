package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.entities.OwnerReference;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.EventService;
import com.fluytcloud.kubernetes.transport.mapper.EventMapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.EventSimpleResponseList;
import com.fluytcloud.kubernetes.transport.response.EventResponseList;
import io.kubernetes.client.openapi.models.CoreV1Event;
import io.quarkus.security.Authenticated;
import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Path("/api/v1/kubernetes/events")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class EventResource {

    private final EventService eventService;

    private final ClusterService clusterService;

    private static final EventMapper EVENT_MAPPER = new EventMapper();

    public EventResource(EventService eventService, ClusterService clusterService) {
        this.eventService = eventService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<EventResponseList> find(@BeanParam @Valid NamespaceObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();
        var filter = new Filter(cluster).setNamespaces(requestFilter.getNamespaces()).setSearch(requestFilter.getName());
        var events = eventService.list(filter);
        return EVENT_MAPPER.mapResponseList(events);
    }

    @GET
    public CoreV1Event get(@BeanParam @Valid NamespaceObjectRequestFilter eventFilter) {
        var cluster = clusterService.findById(eventFilter.getClusterId())
                .orElseThrow();
        return eventService.read(cluster, eventFilter.getNamespace(), eventFilter.getName())
                .orElseThrow(() -> new NotFoundException("Event not found"));
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
