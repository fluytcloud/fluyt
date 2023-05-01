package com.fluytcloud.kubernetes.datasources.database.relational.mapper;

import com.fluycloud.support.core.CrudMapper;
import com.fluytcloud.kubernetes.datasources.database.relational.model.ClusterModel;
import com.fluytcloud.kubernetes.entities.Cluster;

public class ClusterModelMapper implements CrudMapper<Cluster, ClusterModel> {

    @Override
    public Cluster mapToEntity(ClusterModel model) {
        return new Cluster(
                model.getId(),
                model.getName(),
                model.getConnectionType(),
                model.getUrl(),
                model.getToken(),
                model.getUsername(),
                model.getPassword(),
                model.isValidateSSL()
        );
    }

    @Override
    public ClusterModel mapToModel(Cluster cluster) {
        return new ClusterModel()
                .setId(cluster.id())
                .setName(cluster.name())
                .setConnectionType(cluster.connectionType())
                .setUrl(cluster.url())
                .setToken(cluster.token())
                .setUsername(cluster.username())
                .setPassword(cluster.password())
                .setValidateSSL(cluster.validateSSL());
    }

}
