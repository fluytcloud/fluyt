package com.fluytcloud.kubernetes.transport.http;

import com.fluycloud.support.entities.DuplicatedKeyException;
import com.fluytcloud.kubernetes.entities.TerminalRequest;
import com.fluytcloud.kubernetes.interactors.TerminalService;
import com.fluytcloud.rest.exception.DuplicatedRecordException;
import io.quarkus.security.Authenticated;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/api/v1/kubernetes/pod/terminal")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class TerminalResource {

    private final TerminalService terminalService;

    public TerminalResource(TerminalService terminalService) {
        this.terminalService = terminalService;
    }

    @POST
    public Response open(TerminalRequest terminalRequest) {
        terminalService.open(terminalRequest);
        return Response.noContent().build();
    }
}
