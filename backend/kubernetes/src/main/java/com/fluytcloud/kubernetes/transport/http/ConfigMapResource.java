package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.ConfigMapService;
import com.fluytcloud.kubernetes.transport.mapper.ConfigMapMapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestFilter;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.ConfigMapResponseList;
import io.kubernetes.client.openapi.models.V1ConfigMap;
import io.quarkus.security.Authenticated;

import javax.validation.Valid;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("/api/v1/kubernetes/config-map")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class ConfigMapResource {

    private final ConfigMapService configMapService;
    private final ClusterService clusterService;

    private static final ConfigMapMapper CONFIG_MAP_MAPPER = new ConfigMapMapper();

    public ConfigMapResource(ConfigMapService configMapService, ClusterService clusterService) {
        this.configMapService = configMapService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<ConfigMapResponseList> find(@BeanParam @Valid NamespaceObjectRequestListFilter podFilter) {
        var cluster = clusterService.findById(podFilter.getClusterId())
                .orElseThrow();
        var filter = new Filter(cluster).setNamespaces(podFilter.getNamespaces()).setSearch(podFilter.getName());
        var configMaps = configMapService.list(filter);
        return CONFIG_MAP_MAPPER.mapResponseList(configMaps);
    }

    @GET
    public V1ConfigMap get(@BeanParam @Valid NamespaceObjectRequestFilter podFilter) {
        var cluster = clusterService.findById(podFilter.getClusterId())
                .orElseThrow();
        return configMapService.read(cluster, podFilter.getNamespace(), podFilter.getName())
                .orElseThrow(() -> new NotFoundException("ConfigMap not found"));
    }

}
