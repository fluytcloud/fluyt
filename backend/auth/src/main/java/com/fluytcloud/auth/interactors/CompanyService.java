package com.fluytcloud.auth.interactors;

import com.fluytcloud.core.entities.Company;
import com.fluytcloud.core.entities.Organization;
import com.fluytcloud.security.entities.Group;
import com.fluytcloud.security.interactors.GroupService;
import org.springframework.data.domain.Pageable;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import static javax.transaction.Transactional.TxType.REQUIRES_NEW;

@ApplicationScoped
public class CompanyService {

    private final CustomerService customerService;

    private final GroupService groupService;

    private final com.fluycloud.support.interactors.CompanyService customerCompanyService;

    public CompanyService(CustomerService customerService, GroupService groupService, com.fluycloud.support.interactors.CompanyService customerCompanyService) {
        this.customerService = customerService;
        this.groupService = groupService;
        this.customerCompanyService = customerCompanyService;
    }

    public Set<Organization> getUserOrganizations() {
        var identifiers= groupService.getUserOrganizations()
                .stream()
                .map(Group::name)
                .collect(Collectors.toSet());

        return customerService.findBySchemasName(identifiers)
                .stream()
                .map(it -> new Organization(it.id(), it.name(), it.identifier()))
                .collect(Collectors.toSet());
    }

    @Transactional(value = REQUIRES_NEW)
    public Set<Company> getUserCompanies() {
        return customerCompanyService.findAll(Pageable.unpaged())
                .map(it -> new Company(it.getId(), it.getCompanyName()))
                .stream()
                .collect(Collectors.toSet());
    }

    public Optional<Organization> getUserOrganizationBySchemaName(String schemaName) {
        var exists = groupService.getUserOrganizations()
                .stream()
                .anyMatch(it -> it.name().equals(schemaName));
        if (exists) {
            return getBySchemaName(schemaName);
        }

        return Optional.empty();
    }

    public Optional<Organization> getBySchemaName(String schemaName) {
        return customerService.getBySchemaName(schemaName)
                .map(it -> new Organization(it.id(), it.name(), it.identifier()));
    }

}
