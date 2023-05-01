package com.fluycloud.support.interactors;

import com.fluycloud.support.entities.Company;
import com.fluycloud.support.entities.DuplicatedKeyException;
import com.fluycloud.support.repositories.CompanyRepository;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import javax.enterprise.context.ApplicationScoped;
import java.util.Optional;

@ApplicationScoped
public class CompanyService {

    private final CompanyRepository companyRepository;

    public CompanyService(CompanyRepository companyRepository) {
        this.companyRepository = companyRepository;
    }

    public Page<Company> findAll(Pageable pageable) {
        return companyRepository.findAll(pageable);
    }

    public Optional<Company> findById(Integer id) {
        return companyRepository.findById(id);
    }

    public Company create(Company company) {
        try {
            return companyRepository.persist(company);
        } catch (Exception exception) {
            if (ExceptionUtils.getStackTrace(exception)
                    .contains("ConstraintViolationException")) {
                throw new DuplicatedKeyException("Cnpj já cadastrado");
            }
            throw exception;
        }
    }

}
