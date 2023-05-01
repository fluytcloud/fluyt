package com.fluycloud.support.datasources.relational.repository;

import com.fluycloud.support.datasources.relational.model.CompanyModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CompanyJpaRepository extends JpaRepository<CompanyModel,Integer> {
}
