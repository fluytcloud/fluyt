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
import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

import java.util.List;

@Path("/api/v1/kubernetes/config-map")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class ConfigMapResource {

    private static final ConfigMapMapper CONFIG_MAP_MAPPER = new ConfigMapMapper();
    private final ConfigMapService configMapService;
    private final ClusterService clusterService;

    public ConfigMapResource(ConfigMapService configMapService, ClusterService clusterService) {
        this.configMapService = configMapService;
        this.clusterService = clusterService;
    }

    @GET
    @Path("list")
    public List<ConfigMapResponseList> find(@BeanParam @Valid NamespaceObjectRequestListFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();
        var filter = new Filter(cluster).setNamespaces(requestFilter.getNamespaces()).setSearch(requestFilter.getName());
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

    @Produces("application/x-yaml")
    @Consumes("application/x-yaml")
    @GET
    public V1ConfigMap getYaml(@BeanParam @Valid NamespaceObjectRequestFilter podFilter) {
        var cluster = clusterService.findById(podFilter.getClusterId())
                .orElseThrow();
        return configMapService.read(cluster, podFilter.getNamespace(), podFilter.getName())
                .orElseThrow(() -> new NotFoundException("ConfigMap not found"));
    }

    @Produces("application/x-yaml")
    @Consumes("application/x-yaml")
    @PUT
    public V1ConfigMap edit(@BeanParam @Valid NamespaceObjectRequestFilter podFilter,
                            V1ConfigMap configMap) {
        var cluster = clusterService.findById(podFilter.getClusterId()).orElseThrow();
        return configMapService.apply(cluster, configMap);
    }
}
