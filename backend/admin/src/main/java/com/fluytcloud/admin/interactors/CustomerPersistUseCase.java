package com.fluytcloud.admin.interactors;

import com.fluycloud.support.entities.Company;
import com.fluycloud.support.interactors.CompanyService;
import com.fluytcloud.admin.entities.Customer;
import com.fluytcloud.admin.repositories.CustomerRepository;
import com.fluytcloud.admin.util.StringUtil;
import com.fluytcloud.auth.entities.Group;
import com.fluytcloud.auth.entities.User;
import com.fluytcloud.auth.interactors.GroupService;
import com.fluytcloud.auth.interactors.UserService;
import com.fluytcloud.core.entities.Organization;
import com.fluytcloud.core.entities.UserInfo;
import com.fluytcloud.core.entities.UserInfoContext;
import com.fluytcloud.migration.interactors.MigrationUseCase;

import javax.enterprise.context.ApplicationScoped;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class CustomerPersistUseCase {

    private final CustomerRepository customerRepository;
    private final UserService userService;
    private final GroupService groupService;
    private final MigrationUseCase migrationUseCase;
    private final CompanyService companyService;

    public CustomerPersistUseCase(
            CustomerRepository customerRepository,
            UserService userService,
            GroupService groupService,
            MigrationUseCase migrationUseCase,
            CompanyService companyService) {
        this.customerRepository = customerRepository;
        this.userService = userService;
        this.groupService = groupService;
        this.migrationUseCase = migrationUseCase;
        this.companyService = companyService;
    }

    public Customer create(Customer customer) {
        customer = customerRepository.create(customer);
        var groupPersist = new GroupPersist(customer);
        createUser(customer, groupPersist);
        migrationUseCase.migration(customer.getSchemaName());

        var user = UserInfoContext.getCurrentUserInfo();
        var organization = new Organization(customer.getId(), customer.getCompanyName(), customer.getSchemaName());
        var newCompanyUser = new UserInfo(
                user.name(),
                user.username(),
                Optional.of(organization),
                Optional.empty()
        );
        UserInfoContext.setCurrentTenant(newCompanyUser);

        companyService.create(mapper(customer));
        return customer;
    }

    private Company mapper(Customer customer) {
        return Company.builder()
                .companyName(customer.getCompanyName())
                .tradeName(customer.getTradeName())
                .email(customer.getEmail())
                .build();
    }

    private void createUser(Customer customer, GroupPersist groupPersist) {
        var userExists = userService.existsByUsername(customer.getEmail());
        if (userExists) {
            var groupPath = groupPersist.getGroupPath();
            userService.addGroups(customer.getEmail(), groupPath);
        } else {
            userService.create(new User(
                    customer.getEmail(),
                    customer.getTradeName(),
                    List.of(groupPersist.getGroup())
            ));
        }
    }

    private class GroupPersist {

        private final Customer customer;

        public GroupPersist(Customer customer) {
            this.customer = customer;
            persist();
        }

        private String getGroupName() {
            return customer.getSchemaName();
        }

        private String getSubGroupName() {
            return StringUtil.stripAccents(customer.getTradeName());
        }

        private String getGroupPath() {
            var groupName = getGroupName();
            var subGroupName = getSubGroupName();
            return groupName + "/" + subGroupName;
        }

        private Group getGroup() {
            var groupName = getGroupName();
            var subGroupName = getSubGroupName();
            var subGroup = new Group(subGroupName, Collections.emptyList());
            return new Group(groupName, List.of(subGroup));
        }

        private void persist() {
            var subGroupName = getSubGroupName();
            var groupName = getGroupName();

            if (!groupService.exists(groupName, subGroupName)) {
                if (groupService.exists(groupName)) {
                    groupService.addSubGroup(groupName, subGroupName);
                } else {
                    var group = getGroup();
                    groupService.create(group);
                }
            }
        }

    }

}
