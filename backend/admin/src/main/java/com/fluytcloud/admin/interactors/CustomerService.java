package com.fluytcloud.admin.interactors;

import com.fluytcloud.admin.entities.Customer;
import com.fluytcloud.admin.repositories.CustomerRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import javax.enterprise.context.ApplicationScoped;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@ApplicationScoped
public class CustomerService {

    private final CustomerRepository customerRepository;

    public CustomerService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    public Set<String> getSchemaNames() {
        return customerRepository.findAll()
                .stream()
                .map(Customer::getSchemaName)
                .collect(Collectors.toSet());
    }

    public Page<Customer> findAll(Pageable pageable) {
        return customerRepository.findAll(pageable);
    }

    public Optional<Customer> findById(Integer id) {
        return customerRepository.findById(id);
    }

    public void changeActive(Integer id) {
        customerRepository.changeActive(id);
    }

}
