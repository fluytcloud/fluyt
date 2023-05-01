package com.fluytcloud.auth.interactors;

import com.fluytcloud.auth.entities.Customer;
import com.fluytcloud.auth.repositories.CustomerRepository;

import javax.enterprise.context.ApplicationScoped;
import java.util.Optional;
import java.util.Set;

@ApplicationScoped
public class CustomerService {

    private final CustomerRepository customerRepository;

    public CustomerService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    public Set<Customer> findBySchemasName(Set<String> schemasName) {
        return customerRepository.findBySchemasName(schemasName);
    }

    public Optional<Customer> getBySchemaName(String schemaName) {
        return customerRepository.getBySchemaName(schemaName);
    }

}
