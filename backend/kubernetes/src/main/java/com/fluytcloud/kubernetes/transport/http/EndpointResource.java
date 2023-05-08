package com.fluytcloud.kubernetes.transport.http;

import io.quarkus.security.Authenticated;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/api/v1/kubernetes/endpoint")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class EndpointResource {

    @GET
    @Path("list")
    public String olaMundo() {
        return "Olá, mundo!";
    }
}
