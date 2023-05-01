package com.fluycloud.support.datasources.relational.repository;

import com.fluycloud.support.datasources.relational.mapper.CompanyModelMapper;
import com.fluycloud.support.entities.Company;
import com.fluycloud.support.repositories.CompanyRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;

import javax.enterprise.context.ApplicationScoped;
import java.util.Optional;

@ApplicationScoped
public class CompanyRelationalRepositoryImpl implements CompanyRepository {
    private static final CompanyModelMapper COMPANY_MODEL_MAPPER = CompanyModelMapper.INSTANCE;
    private final CompanyJpaRepository jpaRepository;
    public CompanyRelationalRepositoryImpl(CompanyJpaRepository jpaRepository) {
        this.jpaRepository = jpaRepository;
    }

    @Override
    public Page<Company> findAll(Pageable pageable) {
        var page = jpaRepository.findAll(pageable);
        return new PageImpl<>(
                page.getContent()
                        .stream()
                        .map(COMPANY_MODEL_MAPPER::map)
                        .toList(),
                page.getPageable(),
                page.getTotalElements()
        );
    }

    @Override
    public Optional<Company> findById(Integer id) {
        return jpaRepository.findById(id)
                .map(COMPANY_MODEL_MAPPER::map);
    }

    @Override
    public Company persist(Company company) {
        return COMPANY_MODEL_MAPPER.map(jpaRepository.save(COMPANY_MODEL_MAPPER.map(company)));
    }

}
