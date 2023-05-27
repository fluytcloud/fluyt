package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.ClusterObjectsRepository;
import io.kubernetes.client.common.KubernetesObject;
import io.kubernetes.client.openapi.ApiException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

public abstract class ClusterObjectRepositoryImpl<T extends KubernetesObject> implements ClusterObjectsRepository<T> {

    private static final Logger LOGGER = LoggerFactory.getLogger(ClusterObjectRepositoryImpl.class.getName());

    @Override
    public List<T> list(Filter filter) {
        if (Objects.isNull(filter) || Objects.isNull(filter.getCluster())) {
            return Collections.emptyList();
        }

        try {
            return filter(
                    list(filter.getCluster(), parameters(filter)),
                    filter
            );
        } catch (ApiException e) {
            LOGGER.error("error fetching objects from cluster {}", filter.getCluster().name(), e);
            return Collections.emptyList();
        }
    }

    protected Search parameters(Filter filter) {
        var parameters = new Search();
        parameters.setLimit(filter.getLimit());
        if (Objects.nonNull(filter.getSelector())) {
            parameters.setLabelSelector(filter.getSelector());
        }
        if (Objects.nonNull(filter.getFieldSelector())) {
            parameters.setFieldSelector(filter.getFieldSelector());
        }
        return parameters;
    }

    protected List<T> filter(List<T> list, Filter filter) {
        return Util.filter(list, filter);
    }

    protected abstract List<T> list(Cluster cluster, Search search) throws ApiException;

    @Override
    public Optional<T> read(Cluster cluster, String name) {
        if (Objects.isNull(name)) {
            return Optional.empty();
        }
        try {
            return Optional.ofNullable(readObject(cluster, name));
        } catch (ApiException e) {
            LOGGER.error("error to read objects from cluster {}", cluster.name(), e);
            return Optional.empty();
        }
    }

    protected abstract T readObject(Cluster cluster, String name) throws ApiException;

}
