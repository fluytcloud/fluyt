package com.fluytcloud.kubernetes.interactors;

import com.fluycloud.support.core.CrudRepository;
import com.fluycloud.support.core.CrudServiceImpl;
import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.repositories.ClusterRepository;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class ClusterService extends CrudServiceImpl<Cluster, Integer> {

    private final ClusterRepository clusterRepository;

    public ClusterService(ClusterRepository clusterRepository) {
        this.clusterRepository = clusterRepository;
    }


    @Override
    protected CrudRepository<Cluster, Integer> getRepository() {
        return clusterRepository;
    }

}
