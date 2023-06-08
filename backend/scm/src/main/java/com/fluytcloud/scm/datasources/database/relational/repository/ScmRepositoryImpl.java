package com.fluytcloud.scm.datasources.database.relational.repository;

import com.fluycloud.support.core.CrudMapper;
import com.fluycloud.support.core.CrudRepositoryImpl;
import com.fluytcloud.scm.datasources.database.relational.mapper.ScmModelMapper;
import com.fluytcloud.scm.datasources.database.relational.model.ScmModel;
import com.fluytcloud.scm.entities.Scm;
import com.fluytcloud.scm.repositories.ScmCrudRepository;
import jakarta.enterprise.context.ApplicationScoped;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

@ApplicationScoped
public class ScmRepositoryImpl extends CrudRepositoryImpl<Scm, ScmModel, Integer> implements ScmCrudRepository {

    private final ScmJpaRepository scmJpaRepository;

    public ScmRepositoryImpl(ScmJpaRepository scmJpaRepository) {
        this.scmJpaRepository = scmJpaRepository;
    }

    @Override
    protected JpaRepository<ScmModel, Integer> getJpaRepository() {
        return scmJpaRepository;
    }

    @Override
    protected CrudMapper<Scm, ScmModel> getMapper() {
        return new ScmModelMapper();
    }

    @Override
    protected ScmModel beforeUpdate(Integer id, ScmModel model) {
        if (StringUtils.isBlank(model.getToken())) {
            findById(id).ifPresent(e -> model.setToken(e.token()));
        }
        return model;
    }

    @Override
    public List<Scm> search(String search) {
        search = "%" + (search != null ? search.toUpperCase() : "") + "%";
        return scmJpaRepository.findByNameLikeIgnoreCase(search, PageRequest.of(0, 10)).stream()
                .map(e -> getMapper().mapToEntity(e)).toList();
    }
}
