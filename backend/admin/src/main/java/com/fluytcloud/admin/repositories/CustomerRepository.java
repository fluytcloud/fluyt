package com.fluytcloud.admin.repositories;


import com.fluytcloud.admin.entities.Customer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface CustomerRepository {

    List<Customer> findAll();

    Page<Customer> findAll(Pageable pageable);

    Optional<Customer> findById(Integer id);

    Customer create(Customer customer);

    void changeActive(Integer id);

}
