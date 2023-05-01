package com.fluytcloud.auth.datasources.relational.repository;

import com.fluytcloud.auth.datasources.relational.mapper.CustomerModelMapper;
import com.fluytcloud.auth.entities.Customer;
import com.fluytcloud.auth.repositories.CustomerRepository;

import javax.enterprise.context.ApplicationScoped;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@ApplicationScoped
public class CustomerRelationalRepositoryImpl implements CustomerRepository {

    private static final CustomerModelMapper CUSTOMER_MODEL_MAPPER = new CustomerModelMapper();
    private final CustomerJpaRepository customerJpaRepository;

    public CustomerRelationalRepositoryImpl(CustomerJpaRepository customerJpaRepository) {
        this.customerJpaRepository = customerJpaRepository;
    }

    @Override
    public Set<Customer> findBySchemasName(Set<String> schemasName) {
        return customerJpaRepository.findBySchemaNameInAndActive(schemasName, true)
                .stream()
                .map(CUSTOMER_MODEL_MAPPER::map)
                .collect(Collectors.toSet());
    }

    @Override
    public Optional<Customer> getBySchemaName(String schemaName) {
        return customerJpaRepository.getBySchemaNameAndActive(schemaName, true)
                .map(CUSTOMER_MODEL_MAPPER::map);
    }

}
