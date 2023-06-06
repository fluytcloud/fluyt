package com.fluytcloud.catalog.datasources.database.relational.repository;

import com.fluycloud.support.core.CrudMapper;
import com.fluycloud.support.core.CrudRepositoryImpl;
import com.fluytcloud.catalog.datasources.database.relational.mapper.TemplateStatusModelMapper;
import com.fluytcloud.catalog.datasources.database.relational.model.TemplateStatusModel;
import com.fluytcloud.catalog.entities.TemplateStatus;
import com.fluytcloud.catalog.repositories.TemplateStatusRepository;
import jakarta.enterprise.context.ApplicationScoped;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

@ApplicationScoped
public class TemplateStatusRepositoryImpl extends CrudRepositoryImpl<TemplateStatus, TemplateStatusModel, Integer> implements TemplateStatusRepository {

    private final TemplateStatusJpaRepository templateStatusJpaRepository;

    public TemplateStatusRepositoryImpl(TemplateStatusJpaRepository templateStatusJpaRepository) {
        this.templateStatusJpaRepository = templateStatusJpaRepository;
    }

    @Override
    protected JpaRepository<TemplateStatusModel, Integer> getJpaRepository() {
        return templateStatusJpaRepository;
    }

    @Override
    protected CrudMapper<TemplateStatus, TemplateStatusModel> getMapper() {
        return new TemplateStatusModelMapper();
    }

    @Override
    public List<TemplateStatus> findByUuid(UUID uuid) {
        var list = templateStatusJpaRepository.findByUuid(uuid);
        return list.stream().map(e -> getMapper().mapToEntity(e)).toList();
    }
}
