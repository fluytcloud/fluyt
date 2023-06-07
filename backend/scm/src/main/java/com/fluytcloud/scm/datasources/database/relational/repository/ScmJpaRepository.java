package com.fluytcloud.scm.datasources.database.relational.repository;

import com.fluytcloud.scm.datasources.database.relational.model.ScmModel;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ScmJpaRepository extends JpaRepository<ScmModel, Integer> {

    List<ScmModel> findByNameLikeIgnoreCase(String name, Pageable pageable);
}
