package com.fluytcloud.scm.transport.http;

import com.fluycloud.support.entities.DuplicatedKeyException;
import com.fluycloud.support.entities.EntityNotFoundException;
import com.fluytcloud.rest.exception.DuplicatedRecordException;
import com.fluytcloud.rest.exception.NoContentException;
import com.fluytcloud.scm.interactors.ScmCrudService;
import com.fluytcloud.scm.transport.mapper.ScmMapper;
import com.fluytcloud.scm.transport.request.ScmRequest;
import com.fluytcloud.scm.transport.response.ScmResponse;
import io.quarkus.security.Authenticated;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

@Path("/api/v1/scm")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class ScmResource {

    private static final ScmMapper SCM_MAPPER = new ScmMapper();
    private static final String SCM_NOT_FOUND = "SCM not found";

    private final ScmCrudService scmCrudService;

    public ScmResource(ScmCrudService scmCrudService) {
        this.scmCrudService = scmCrudService;
    }

    @GET
    public Response findAll(@QueryParam("page") Integer page, @QueryParam("size") Integer size) {
        var pageable = scmCrudService.findAll(PageRequest.of(page, size));
        var pagination = new PageImpl<>(
                pageable.getContent()
                        .stream()
                        .map(SCM_MAPPER::map)
                        .toList(),
                pageable.getPageable(),
                pageable.getTotalElements()
        );
        return Response.ok(pagination).build();
    }

    @GET
    @Path("{id}")
    public ScmResponse findById(@PathParam("id") Integer id) {
        return scmCrudService.findById(id)
                .map(SCM_MAPPER::map)
                .orElseThrow(() -> new NoContentException(SCM_NOT_FOUND));
    }

    @POST
    public Response create(ScmRequest request) {
        var scm = SCM_MAPPER.map(request);
        try {
            scm = scmCrudService.create(scm);
            return Response.ok(SCM_MAPPER.map(scm)).build();
        } catch (DuplicatedKeyException exception) {
            throw new DuplicatedRecordException(exception.getMessage());
        }
    }

    @PUT
    @Path("{id}")
    public Response update(@PathParam("id") Integer id, ScmRequest request) {
        var scm = SCM_MAPPER.map(request, id);
        try {
            scm = scmCrudService.update(id, scm);
            return Response.ok(SCM_MAPPER.map(scm)).build();
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
            scmCrudService.delete(id);
            return Response.noContent().build();
        } catch (EntityNotFoundException notFoundException) {
            throw new NotFoundException(notFoundException.getMessage());
        }
    }

    @GET
    @Path("search")
    public Response search(@QueryParam("search") String search) {
        var list = scmCrudService.search(search).stream().map(SCM_MAPPER::map).toList();
        return Response.ok(list).build();
    }
}