package com.fluytcloud.catalog.datasources.database.relational.repository;

import com.fluytcloud.catalog.datasources.database.relational.model.TemplateStatusModel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface TemplateStatusJpaRepository extends JpaRepository<TemplateStatusModel, Integer> {

    List<TemplateStatusModel> findByUuid(UUID uuid);
}
