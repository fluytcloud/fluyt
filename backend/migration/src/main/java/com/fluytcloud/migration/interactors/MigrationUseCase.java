package com.fluytcloud.migration.interactors;

import io.quarkus.runtime.Startup;
import org.flywaydb.core.Flyway;
import org.flywaydb.core.api.configuration.FluentConfiguration;

import javax.enterprise.context.ApplicationScoped;
import javax.sql.DataSource;

@Startup
@ApplicationScoped
public class MigrationUseCase {

    private final DataSource dataSource;

    public MigrationUseCase(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    /**
     * When closing a contract with a new customer, it is necessary to create your database schema
     * @param schema unique key per customer
     * @return successful migration
     */
    public boolean migration(String schema) {
        var configuration = new FluentConfiguration()
                .dataSource(dataSource)
                .locations("db/migration/app")
                .schemas(schema);

        return new Flyway(configuration).migrate().success;
    }

}
