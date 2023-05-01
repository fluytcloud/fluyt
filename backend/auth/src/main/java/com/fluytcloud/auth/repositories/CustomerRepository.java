package com.fluytcloud.auth.repositories;

import com.fluytcloud.auth.entities.Customer;

import java.util.Optional;
import java.util.Set;

public interface CustomerRepository {

    Set<Customer> findBySchemasName(Set<String> schemasName);

    Optional<Customer> getBySchemaName(String schemaName);

}
