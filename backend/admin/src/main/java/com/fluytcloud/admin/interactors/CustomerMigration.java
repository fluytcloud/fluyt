package com.fluytcloud.admin.interactors;

import com.fluytcloud.migration.interactors.MigrationUseCase;
import io.quarkus.runtime.Startup;

import javax.enterprise.context.ApplicationScoped;

@Startup
@ApplicationScoped
public class CustomerMigration {

    private final CustomerService customerService;
    private final MigrationUseCase migrationUseCase;

    public CustomerMigration(CustomerService customerService, MigrationUseCase migrationUseCase) {
        this.customerService = customerService;
        this.migrationUseCase = migrationUseCase;
        migrationAllCustomers();
    }

    public void migrationAllCustomers() {
        customerService.getSchemaNames().forEach(migrationUseCase::migration);
    }
}
