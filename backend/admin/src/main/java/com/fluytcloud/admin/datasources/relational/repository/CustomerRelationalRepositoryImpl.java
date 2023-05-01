package com.fluytcloud.admin.datasources.relational.repository;

import com.fluytcloud.admin.datasources.relational.mapper.CustomerModelMapper;
import com.fluytcloud.admin.entities.Customer;
import com.fluytcloud.admin.repositories.CustomerRepository;
import com.fluytcloud.admin.entities.exception.NotFoundException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class CustomerRelationalRepositoryImpl implements CustomerRepository {

    private static final CustomerModelMapper CUSTOMER_MODEL_MAPPER = new CustomerModelMapper();
    private final CustomerJpaRepository customerJpaRepository;

    public CustomerRelationalRepositoryImpl(CustomerJpaRepository customerJpaRepository) {
        this.customerJpaRepository = customerJpaRepository;
    }

    @Override
    @Transactional
    public List<Customer> findAll() {
        return customerJpaRepository.findAll()
                .stream()
                .map(CUSTOMER_MODEL_MAPPER::map)
                .toList();
    }

    @Transactional
    public Page<Customer> findAll(Pageable pageable) {
        var page = customerJpaRepository.findAll(pageable);
        return new PageImpl<>(
                page.getContent()
                        .stream()
                        .map(CUSTOMER_MODEL_MAPPER::map)
                        .toList(),
                page.getPageable(),
                page.getTotalElements()
        );
    }

    @Override
    @Transactional
    public Optional<Customer> findById(Integer id) {
        return customerJpaRepository.findById(id)
                .map(CUSTOMER_MODEL_MAPPER::map);
    }

    @Override
    @Transactional
    public Customer create(Customer customer) {
        var model = CUSTOMER_MODEL_MAPPER.map(customer);
        model = customerJpaRepository.save(model);
        return CUSTOMER_MODEL_MAPPER.map(model);
    }

    @Override
    public void changeActive(Integer id) {
        if (!customerJpaRepository.existsById(id)) {
            throw new NotFoundException();
        }
        if (customerJpaRepository.isActive(id)) {
            customerJpaRepository.deactivate(id);
        } else {
            customerJpaRepository.activate(id);
        }
    }
}
