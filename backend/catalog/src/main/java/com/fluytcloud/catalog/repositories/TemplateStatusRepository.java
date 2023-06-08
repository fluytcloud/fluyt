package com.fluytcloud.catalog.repositories;

import com.fluycloud.support.core.CrudRepository;
import com.fluytcloud.catalog.entities.TemplateStatus;

import java.util.List;
import java.util.UUID;

public interface TemplateStatusRepository extends CrudRepository<TemplateStatus, Integer> {

    List<TemplateStatus> findByUuid(UUID uuid);
}
