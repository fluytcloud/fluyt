package com.fluytcloud.auth.transport.http.resource;

import com.fluytcloud.auth.interactors.CompanyService;
import com.fluytcloud.auth.interactors.UserInfoService;
import com.fluytcloud.auth.transport.http.response.CompanyResponse;
import com.fluytcloud.core.entities.UserInfoContext;

import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import java.util.List;

@Path("/companies")
public class CompanyResource {

    @Inject
    CompanyService companyService;

    @Inject
    UserInfoService userInfoService;

    @GET
    public List<CompanyResponse> get() {
        if (userInfoService.get().isPresent()) {
            UserInfoContext.setCurrentTenant(userInfoService.get().get());
            return companyService.getUserCompanies()
                    .stream()
                    .map(it -> new CompanyResponse(it.id(), it.name()))
                    .toList();
        }
        return List.of();
    }

}
