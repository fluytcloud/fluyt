package com.fluytcloud.auth.transport.http.resource;

import com.fluytcloud.auth.interactors.CompanyService;
import com.fluytcloud.auth.transport.http.response.OrganizationResponse;

import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import java.util.List;

@Path("/organizations")
public class OrganizationResource {

    @Inject
    CompanyService companyService;

    @GET
    public List<OrganizationResponse> get() {
        return companyService.getUserOrganizations()
                .stream()
                .map(it -> new OrganizationResponse(it.name(), it.identifier()))
                .toList();
    }

}
