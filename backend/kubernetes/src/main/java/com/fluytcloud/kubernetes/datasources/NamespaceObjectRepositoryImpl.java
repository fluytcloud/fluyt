package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.core.functions.ThrowingFunction;
import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import io.kubernetes.client.common.KubernetesObject;
import io.kubernetes.client.openapi.ApiException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

public abstract class NamespaceObjectRepositoryImpl<T extends KubernetesObject> implements NamespaceObjectsRepository<T> {

    private static final Logger LOGGER = LoggerFactory.getLogger(NamespaceObjectRepositoryImpl.class.getName());

    @Override
    public List<T> list(Filter filter) {
        if (Objects.isNull(filter) || Objects.isNull(filter.getCluster())) {
            return Collections.emptyList();
        }

        try {
            if (Objects.nonNull(filter.getNamespaces()) && !filter.getNamespaces().isEmpty()) {
                var list = filter.getNamespaces()
                        .stream()
                        .flatMap(ThrowingFunction.handlingFunctionWrapper(namespace ->
                            this.listByNamespace(filter.getCluster(), parameters(filter, namespace)).stream(), ApiException.class))
                        .toList();

                return filter(list, filter);
            } else {
                return filter(listByAllNamespace(filter.getCluster(), parameters(filter, null)), filter);
            }
        } catch (ApiException e) {
            LOGGER.error("error fetching objects from cluster {}", filter.getCluster().name(), e);
            return Collections.emptyList();
        }
    }

    protected Search parameters(Filter filter, String namespace) {
        var parameters = new Search();
        parameters.setNamespace(namespace);
        parameters.setLimit(filter.getLimit());
        if (Objects.nonNull(filter.getSelector())) {
            parameters.setLabelSelector(filter.getSelector());
        }
        return parameters;
    }

    protected List<T> filter(List<T> list, Filter filter) {
        return Util.filter(list, filter);
    }

    protected abstract List<T> listByNamespace(Cluster cluster, Search search) throws ApiException;

    protected abstract List<T> listByAllNamespace(Cluster cluster, Search search) throws ApiException;

    @Override
    public Optional<T> read(Cluster cluster, String namespace, String name) {
        if (Objects.isNull(name)) {
            return Optional.empty();
        }
        try {
            return Optional.ofNullable(readObject(cluster, namespace, name));
        } catch (ApiException e) {
            LOGGER.error("error to read objects from cluster {}", cluster.name(), e);
            return Optional.empty();
        }
    }

    protected abstract T readObject(Cluster cluster, String namespace, String name) throws ApiException;

}
