package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import io.kubernetes.client.common.KubernetesObject;

import java.util.List;
import java.util.Optional;

public abstract class NamespaceObjectsService<T extends KubernetesObject> implements ObjectService<T> {

    protected abstract NamespaceObjectsRepository<T> repository();

    @Override
    public List<T> list(Filter filter) {
        return repository().list(filter);
    }

    @Override
    public Optional<T> read(Cluster cluster, String namespace, String name) {
        return repository().read(cluster, namespace, name);
    }

    @Override
    public T apply(Cluster cluster, T object) {
        return repository().apply(cluster, object);
    }

    @Override
    public void delete(Cluster cluster, String namespace, String name) {
        repository().delete(cluster, namespace, name);
    }

}
