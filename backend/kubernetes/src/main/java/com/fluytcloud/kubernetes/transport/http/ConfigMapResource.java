package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.interactors.ConfigMapService;
import com.fluytcloud.kubernetes.interactors.NamespaceObjectsService;
import com.fluytcloud.kubernetes.transport.mapper.ConfigMapMapper;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.response.ConfigMapResponseList;
import io.kubernetes.client.openapi.models.V1ConfigMap;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;

@Path("/api/v1/kubernetes/config-map")
@Authenticated
public class ConfigMapResource extends NamespaceObjectsResource<V1ConfigMap, ConfigMapResponseList> {

    private static final ConfigMapMapper CONFIG_MAP_MAPPER = new ConfigMapMapper();

    @Inject
    protected ConfigMapService configMapService;

    @Override
    protected NamespaceObjectsService<V1ConfigMap> getService() {
        return configMapService;
    }

    @Override
    protected Mapper<V1ConfigMap, ConfigMapResponseList> getMapper() {
        return CONFIG_MAP_MAPPER;
    }
}
