package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterObjectsService;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.request.ClusterObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.ClusterObjectRequestListFilter;
import io.kubernetes.client.common.KubernetesObject;
import jakarta.inject.Inject;
import jakarta.validation.Valid;
import jakarta.ws.rs.*;

import java.util.List;

import static jakarta.ws.rs.core.MediaType.APPLICATION_JSON;

@Consumes(APPLICATION_JSON)
@Produces(APPLICATION_JSON)
public abstract class ClusterObjectsResource<T extends KubernetesObject, X> {

    protected static final String CLUSTER_OBJECT_NOT_FOUND = "Cluster object not found";

    @Inject
    protected ClusterService clusterService;

    protected abstract ClusterObjectsService<T> getService();

    protected abstract Mapper<T, X> getMapper();

    @GET
    @Path("list")
    public List<X> find(@BeanParam @Valid ClusterObjectRequestListFilter listFilter) {
        var cluster = getCluster(listFilter.getClusterId());

        var filter = new Filter(cluster)
                .setSearch(listFilter.getName());

        List<T> objects = getService().list(filter);
        return getMapper().mapResponseList(objects);
    }

    @GET
    public T get(@BeanParam @Valid ClusterObjectRequestFilter filter) {
        var cluster = getCluster(filter.getClusterId());

        return getService().read(cluster, filter.getName())
                .orElseThrow(() -> new NotFoundException(CLUSTER_OBJECT_NOT_FOUND));
    }

    @Consumes("application/x-yaml")
    @Produces("application/x-yaml")
    @GET
    public T getYaml(@BeanParam @Valid ClusterObjectRequestFilter filter) {
        var cluster = getCluster(filter.getClusterId());

        return getService().read(cluster, filter.getName())
                .orElseThrow(() -> new NotFoundException(CLUSTER_OBJECT_NOT_FOUND));
    }

    @Consumes("application/x-yaml")
    @Produces("application/x-yaml")
    @PUT
    public T edit(@BeanParam @Valid ClusterObjectRequestFilter filter, T object) {
        var cluster = getCluster(filter.getClusterId());
        return getService().apply(cluster, object);
    }

    protected Cluster getCluster(Integer clusterId) {
        return clusterService.findById(clusterId).orElseThrow();
    }
}
