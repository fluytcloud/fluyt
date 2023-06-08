package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.repositories.ClusterObjectsRepository;
import io.kubernetes.client.common.KubernetesObject;

import java.util.List;
import java.util.Optional;

public abstract class ClusterObjectsService<T extends KubernetesObject> {

    protected abstract ClusterObjectsRepository<T> repository();

    public List<T> list(Filter filter) {
        return repository().list(filter);
    }

    public Optional<T> read(Cluster cluster, String name) {
        return repository().read(cluster, name);
    }

    public T apply(Cluster cluster, T object) {
        return repository().apply(cluster, object);
    }

    public void delete(Cluster cluster, String name) {
        repository().delete(cluster, name);
    }

}
