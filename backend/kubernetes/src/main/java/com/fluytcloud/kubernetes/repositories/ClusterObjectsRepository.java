package com.fluytcloud.kubernetes.repositories;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Filter;
import io.kubernetes.client.common.KubernetesObject;

import java.util.List;
import java.util.Optional;

public interface ClusterObjectsRepository<T extends KubernetesObject> {

    List<T> list(Filter filter);

    Optional<T> read(Cluster cluster, String name);

    T apply(Cluster cluster, T object);

    void delete(Cluster cluster, String name);

}
