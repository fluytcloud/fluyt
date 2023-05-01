package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.transport.request.ClusterRequest;
import com.fluytcloud.kubernetes.transport.response.ClusterResponse;
import com.fluytcloud.kubernetes.transport.response.ClusterResponseList;

public class ClusterMapper {

    public ClusterResponseList mapResponseList(Cluster cluster) {
        return new ClusterResponseList(
                cluster.id(),
                cluster.name()
        );
    }

    public ClusterResponse mapResponse(Cluster cluster) {
        return new ClusterResponse(
                cluster.id(),
                cluster.name(),
                cluster.connectionType(),
                cluster.url(),
                cluster.token(),
                cluster.username(),
                cluster.password(),
                cluster.validateSSL()
        );
    }

    public Cluster map(ClusterRequest request, Integer id) {
        return new Cluster(
                id,
                request.name(),
                request.connectionType(),
                request.url(),
                request.token(),
                request.username(),
                request.password(),
                request.validateSSL()
        );
    }

    public Cluster map(ClusterRequest request) {
        return map(request, null);
    }

}
