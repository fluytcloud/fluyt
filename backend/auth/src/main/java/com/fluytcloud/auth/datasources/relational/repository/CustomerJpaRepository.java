package com.fluytcloud.auth.datasources.relational.repository;

import com.fluytcloud.auth.datasources.relational.model.CustomerModel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;
import java.util.Set;

public interface CustomerJpaRepository extends JpaRepository<CustomerModel, Integer> {

    List<CustomerModel> findBySchemaNameInAndActive(Set<String> schemasName, Boolean active);

    Optional<CustomerModel> getBySchemaNameAndActive(String schemaName, Boolean active);

}
