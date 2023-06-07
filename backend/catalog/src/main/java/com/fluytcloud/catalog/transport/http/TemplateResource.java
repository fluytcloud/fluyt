package com.fluytcloud.catalog.transport.http;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fluycloud.support.entities.DuplicatedKeyException;
import com.fluycloud.support.entities.EntityNotFoundException;
import com.fluytcloud.catalog.interactors.TemplateCrudService;
import com.fluytcloud.catalog.interactors.TemplateService;
import com.fluytcloud.catalog.interactors.TemplateStatusService;
import com.fluytcloud.catalog.transport.mapper.TemplateMapper;
import com.fluytcloud.catalog.transport.request.TemplateRequest;
import com.fluytcloud.catalog.transport.response.TemplateParameterResponse;
import com.fluytcloud.catalog.transport.response.TemplateResponse;
import com.fluytcloud.rest.exception.DuplicatedRecordException;
import com.fluytcloud.rest.exception.NoContentException;
import com.fluytcloud.scm.transport.mapper.ScmMapper;
import io.quarkus.security.Authenticated;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.sse.Sse;
import jakarta.ws.rs.sse.SseEventSink;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@Path("/api/v1/catalog/template")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class TemplateResource {

    private static final TemplateMapper SERVICE_TEMPLATE_MAPPER = new TemplateMapper(new ScmMapper());
    private static final String TEMPLATE_NOT_FOUND = "Template not found";

    private final TemplateCrudService templateCrudService;
    private final TemplateService templateService;
    private final TemplateStatusService templateStatusService;
    private final ObjectMapper objectMapper;
    private final Sse sse;

    public TemplateResource(TemplateCrudService templateCrudService,
                            TemplateService templateService,
                            TemplateStatusService templateStatusService,
                            ObjectMapper objectMapper,
                            Sse sse) {
        this.templateCrudService = templateCrudService;
        this.templateService = templateService;
        this.templateStatusService = templateStatusService;
        this.objectMapper = objectMapper;
        this.sse = sse;
    }

    @GET
    public Response findAll(@QueryParam("page") Integer page, @QueryParam("size") Integer size) {
        var pageable = templateCrudService.findAll(PageRequest.of(page, size));
        var pagination = new PageImpl<>(
                pageable.getContent()
                        .stream()
                        .map(SERVICE_TEMPLATE_MAPPER::mapList)
                        .toList(),
                pageable.getPageable(),
                pageable.getTotalElements()
        );
        return Response.ok(pagination).build();
    }

    @GET
    @Path("{id}")
    public TemplateResponse findById(@PathParam("id") Integer id) {
        return templateCrudService.findById(id)
                .map(SERVICE_TEMPLATE_MAPPER::map)
                .orElseThrow(() -> new NoContentException(TEMPLATE_NOT_FOUND));
    }

    @POST
    public Response create(TemplateRequest request) {
        var serviceTemplate = SERVICE_TEMPLATE_MAPPER.map(request);
        try {
            serviceTemplate = templateCrudService.create(serviceTemplate);
            return Response.ok(SERVICE_TEMPLATE_MAPPER.map(serviceTemplate)).build();
        } catch (DuplicatedKeyException exception) {
            throw new DuplicatedRecordException(exception.getMessage());
        }
    }

    @PUT
    @Path("{id}")
    public Response update(@PathParam("id") Integer id, TemplateRequest request) {
        var serviceTemplate = SERVICE_TEMPLATE_MAPPER.map(request, id);
        try {
            serviceTemplate = templateCrudService.update(id, serviceTemplate);
            return Response.ok(SERVICE_TEMPLATE_MAPPER.map(serviceTemplate)).build();
        } catch (DuplicatedKeyException exception) {
            throw new DuplicatedRecordException(exception.getMessage());
        } catch (EntityNotFoundException notFoundException) {
            throw new NotFoundException(notFoundException.getMessage());
        }
    }

    @DELETE
    @Path("{id}")
    public Response delete(@PathParam("id") Integer id) {
        try {
            templateCrudService.delete(id);
            return Response.noContent().build();
        } catch (EntityNotFoundException notFoundException) {
            throw new NotFoundException(notFoundException.getMessage());
        }
    }

    @GET
    @Path("{id}/parameters")
    public List<TemplateParameterResponse> getTemplateParameters(@PathParam("id") Integer id) {
        var serviceTemplate = templateCrudService.findById(id)
                .orElseThrow(() -> new NoContentException(TEMPLATE_NOT_FOUND));
        return SERVICE_TEMPLATE_MAPPER.map(templateService.getParameters(serviceTemplate));
    }

    @POST
    @Path("{id}/generate")
    public Response generate(@PathParam("id") Integer id, @QueryParam("repository") String repository, Map<String, Object> parameters) {
        var serviceTemplate = templateCrudService.findById(id)
                .orElseThrow(() -> new NoContentException(TEMPLATE_NOT_FOUND));
        var uuid = templateService.generate(serviceTemplate, repository, parameters);
        return Response.ok(uuid).build();
    }

    @GET
    @Path("{id}/generate/{uuid}/status")
    @Produces(MediaType.SERVER_SENT_EVENTS)
    public void getGenerateStatus(@Context SseEventSink sseEventSink, @PathParam("id") Integer id, @PathParam("uuid") UUID uuid) {
        templateStatusService.getGenerateStatus(uuid, templateStatus -> {
            try {
                sseEventSink.send(sse.newEvent(objectMapper.writeValueAsString(templateStatus)));
            } catch (JsonProcessingException e) {
                throw new RuntimeException(e);
            }
        });
    }
}
