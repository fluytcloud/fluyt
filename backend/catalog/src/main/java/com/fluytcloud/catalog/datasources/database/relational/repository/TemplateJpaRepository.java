package com.fluytcloud.catalog.datasources.database.relational.repository;

import com.fluytcloud.catalog.datasources.database.relational.model.TemplateModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TemplateJpaRepository extends JpaRepository<TemplateModel, Integer> {
}
