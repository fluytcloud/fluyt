package com.fluytcloud.admin.datasources.relational.repository;

import com.fluytcloud.admin.datasources.relational.model.CustomerModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CustomerJpaRepository extends JpaRepository<CustomerModel, Integer> {

    @Modifying
    @Query("update CustomerModel c set c.active = false where c.id = :id")
    void deactivate(@Param("id") Integer id);

    @Modifying
    @Query("update CustomerModel c set c.active = true where c.id = :id")
    void activate(@Param("id") Integer id);

    @Query("select c.active from CustomerModel c where c.id = :id")
    Boolean isActive(@Param("id") Integer id);

}
