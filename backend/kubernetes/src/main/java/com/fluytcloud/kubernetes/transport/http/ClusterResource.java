package com.fluytcloud.kubernetes.transport.http;

import com.fluycloud.support.entities.DuplicatedKeyException;
import com.fluycloud.support.entities.EntityNotFoundException;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.transport.mapper.ClusterMapper;
import com.fluytcloud.kubernetes.transport.request.ClusterRequest;
import com.fluytcloud.kubernetes.transport.response.ClusterResponse;
import com.fluytcloud.rest.exception.DuplicatedRecordException;
import com.fluytcloud.rest.exception.NoContentException;
import io.quarkus.security.Authenticated;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import javax.annotation.security.RolesAllowed;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/api/v1/kubernetes/cluster")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class ClusterResource {

    private static final ClusterMapper CLUSTER_MAPPER = new ClusterMapper();
    private static final String CLUSTER_NOT_FOUND = "Cluster not found";

    private final ClusterService clusterService;

    public ClusterResource(ClusterService clusterService) {
        this.clusterService = clusterService;
    }

    @GET
    @RolesAllowed({"administrator", "manager"})
    public Response findAll(@QueryParam("page") Integer page, @QueryParam("size") Integer size) {
        var pageable = clusterService.findAll(PageRequest.of(page, size));
        var pagination = new PageImpl<>(
                pageable.getContent()
                        .stream()
                        .map(CLUSTER_MAPPER::mapResponseList)
                        .toList(),
                pageable.getPageable(),
                pageable.getTotalElements()
        );
        return Response.ok(pagination).build();
    }

    @GET
    @Path("{id}")
    @RolesAllowed({"administrator", "manager"})
    public ClusterResponse findById(@PathParam("id") Integer id) {
        return clusterService.findById(id)
                .map(CLUSTER_MAPPER::mapResponse)
                .orElseThrow(() -> new NoContentException(CLUSTER_NOT_FOUND));
    }

    @POST
    @RolesAllowed({"administrator", "manager"})
    public Response create(ClusterRequest clusterRequest) {
        var cluster = CLUSTER_MAPPER.map(clusterRequest);
        try {
            cluster = clusterService.create(cluster);
            return Response.ok(CLUSTER_MAPPER.mapResponse(cluster)).build();
        } catch (DuplicatedKeyException exception) {
            throw new DuplicatedRecordException(exception.getMessage());
        }
    }

    @PUT
    @Path("{id}")
    @RolesAllowed({"administrator", "manager"})
    public Response update(@PathParam("id") Integer id, ClusterRequest clusterRequest) {
        var cluster = CLUSTER_MAPPER.map(clusterRequest, id);
        try {
            cluster = clusterService.update(id, cluster);
            return Response.ok(CLUSTER_MAPPER.mapResponse(cluster)).build();
        } catch (DuplicatedKeyException exception) {
            throw new DuplicatedRecordException(exception.getMessage());
        } catch (EntityNotFoundException notFoundException) {
            throw new NotFoundException(notFoundException.getMessage());
        }
    }

    @DELETE
    @Path("{id}")
    @RolesAllowed({"administrator", "manager"})
    public Response delete(@PathParam("id") Integer id) {
        try {
            clusterService.delete(id);
            return Response.noContent().build();
        } catch (EntityNotFoundException notFoundException) {
            throw new NotFoundException(notFoundException.getMessage());
        }
    }

}