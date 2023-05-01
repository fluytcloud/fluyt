package com.fluytcloud.kubernetes.datasources.database.relational.repository;

import com.fluytcloud.kubernetes.datasources.database.relational.model.ClusterModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClusterJpaRepository extends JpaRepository<ClusterModel, Integer> {
}
