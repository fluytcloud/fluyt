package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.NamespaceObjectsService;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import io.kubernetes.client.common.KubernetesObject;
import jakarta.inject.Inject;
import jakarta.validation.Valid;
import jakarta.ws.rs.*;

import java.util.List;

import static jakarta.ws.rs.core.MediaType.APPLICATION_JSON;

@Consumes(APPLICATION_JSON)
@Produces(APPLICATION_JSON)
public abstract class NamespaceObjectsResource<T extends KubernetesObject, X> {

    protected static final String NAMESPACE_OBJECT_NOT_FOUND = "Namespace object not found";

    @Inject
    protected ClusterService clusterService;

    protected abstract NamespaceObjectsService<T> getService();

    protected abstract Mapper<T, X> getMapper();

    @GET
    @Path("list")
    public List<X> find(@BeanParam @Valid NamespaceObjectRequestListFilter listFilter) {
        var cluster = getCluster(listFilter.getClusterId());

        var filter = new Filter(cluster)
                .setNamespaces(listFilter.getNamespaces())
                .setSearch(listFilter.getName());

        List<T> objects = getService().list(filter);
        return getMapper().mapResponseList(objects);
    }

    @GET
    public T get(@BeanParam @Valid NamespaceObjectRequestFilter filter) {
        var cluster = getCluster(filter.getClusterId());

        return getService().read(cluster, filter.getNamespace(), filter.getName())
                .orElseThrow(() -> new NotFoundException(NAMESPACE_OBJECT_NOT_FOUND));
    }

    @Consumes("application/x-yaml")
    @Produces("application/x-yaml")
    @GET
    public T getYaml(@BeanParam @Valid NamespaceObjectRequestFilter filter) {
        var cluster = getCluster(filter.getClusterId());

        return getService().read(cluster, filter.getNamespace(), filter.getName())
                .orElseThrow(() -> new NotFoundException(NAMESPACE_OBJECT_NOT_FOUND));
    }

    @Consumes("application/x-yaml")
    @Produces("application/x-yaml")
    @PUT
    public T edit(@BeanParam @Valid NamespaceObjectRequestFilter filter, T object) {
        var cluster = getCluster(filter.getClusterId());
        return getService().apply(cluster, object);
    }

    protected Cluster getCluster(Integer clusterId) {
        return clusterService.findById(clusterId).orElseThrow();
    }
}
