package com.fluytcloud.auth.transport.http.filter;

import com.fluytcloud.auth.interactors.CompanyService;
import com.fluytcloud.auth.interactors.UserInfoService;
import com.fluytcloud.auth.transport.http.exception.ChooseCompanyException;
import com.fluytcloud.auth.transport.http.exception.ChooseOrganizationException;
import com.fluytcloud.auth.transport.http.exception.EmptyCompanyException;
import com.fluytcloud.auth.transport.http.exception.EmptyOrganizationException;
import com.fluytcloud.core.entities.Company;
import com.fluytcloud.core.entities.Organization;
import com.fluytcloud.core.entities.UserInfoContext;

import javax.inject.Inject;
import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerRequestFilter;
import javax.ws.rs.ext.Provider;
import java.util.List;
import java.util.Set;
import java.util.function.Predicate;

@Provider
public class CompanyFilter implements ContainerRequestFilter {

    @Inject
    UserInfoService userInfoService;

    @Inject
    CompanyService companyService;

    private static final Predicate<ContainerRequestContext> ALLOWED_COMPANIES_ROUTE = value
            -> "/companies".equals(value.getUriInfo().getPath());

    private static final Predicate<ContainerRequestContext> ALLOWED_ORGANIZATIONS_ROUTE = value
            -> "/organizations".equals(value.getUriInfo().getPath());

    private static final Predicate<ContainerRequestContext> ALLOWED_FULL_AUTHENTICATION_ROUTE = value
            -> "/auth/full-authentication".equals(value.getUriInfo().getPath()) && "POST".equals(value.getMethod());

    private static final Predicate<ContainerRequestContext> ALLOW_CHANGE_COMPANY = value
            -> "/auth/change-company".equals(value.getUriInfo().getPath()) && "POST".equals(value.getMethod());

    private static final Predicate<ContainerRequestContext> ALLOWED_ROUTE = ALLOWED_ORGANIZATIONS_ROUTE
            .or(ALLOWED_COMPANIES_ROUTE)
            .or(ALLOWED_FULL_AUTHENTICATION_ROUTE)
            .or(ALLOW_CHANGE_COMPANY);

    @Override
    public void filter(ContainerRequestContext containerRequestContext) {
        if (ALLOWED_ROUTE.test(containerRequestContext)) {
            return;
        }

        var userInfoOpt = userInfoService.get();
        var userAuthenticated = userInfoOpt.isPresent();

        if (userAuthenticated) {
            var userInfo = userInfoOpt.get();
            UserInfoContext.setCurrentTenant(userInfo);

            if (userInfoService.isAdmin() || userInfo.company().isPresent()) {
                return;
            }

            var company = companyValidate();
            userInfoService.set(userInfo.organization().orElseThrow().identifier(), company);
            return;
        }

        if (userInfoService.isAdmin()) {
            userInfoService.set();
            return;
        }

        var organization = organizationValidate();
        var company = companyValidate();
        userInfoService.set(organization.identifier(), company);
    }

    private Organization organizationValidate() {
        var organizations = companyService.getUserOrganizations();

        if (organizations.isEmpty()) {
            throw new EmptyOrganizationException();
        }

        if (organizations.size() > 1) {
            throw new ChooseOrganizationException();
        }

        var org = organizations.iterator().next();
        userInfoService.set(org.identifier());
        return org;
    }

    private Company companyValidate() {
        var companies = companyService.getUserCompanies();

        if (companies.isEmpty()) {
            throw new EmptyCompanyException();
        }

        if (companies.size() > 1) {
            throw new ChooseCompanyException();
        }

        return companies.iterator().next();
    }

}