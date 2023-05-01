package com.fluytcloud.kubernetes.datasources.database.relational.repository;

import com.fluycloud.support.core.CrudMapper;
import com.fluycloud.support.core.CrudRepositoryImpl;
import com.fluytcloud.kubernetes.datasources.database.relational.mapper.ClusterModelMapper;
import com.fluytcloud.kubernetes.datasources.database.relational.model.ClusterModel;
import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.repositories.ClusterRepository;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class ClusterRepositoryImpl extends CrudRepositoryImpl<Cluster, ClusterModel, Integer> implements ClusterRepository {

    private final ClusterJpaRepository clusterJpaRepository;

    public ClusterRepositoryImpl(ClusterJpaRepository clusterJpaRepository) {
        this.clusterJpaRepository = clusterJpaRepository;
    }

    @Override
    protected JpaRepository<ClusterModel, Integer> getJpaRepository() {
        return clusterJpaRepository;
    }

    @Override
    protected CrudMapper<Cluster, ClusterModel> getMapper() {
        return new ClusterModelMapper();
    }
}
