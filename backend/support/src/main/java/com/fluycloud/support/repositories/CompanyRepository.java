package com.fluycloud.support.repositories;

import com.fluycloud.support.entities.Company;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Optional;

public interface CompanyRepository {

    Page<Company> findAll(Pageable pageable);

    Optional<Company> findById(Integer id);

    Company persist(Company company);
}
