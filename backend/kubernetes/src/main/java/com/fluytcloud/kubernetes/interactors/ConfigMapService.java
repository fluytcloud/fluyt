package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.ConfigMapRepository;
import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import io.kubernetes.client.openapi.models.V1ConfigMap;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class ConfigMapService extends NamespaceObjectsService<V1ConfigMap> implements ObjectService<V1ConfigMap>  {

    private final ConfigMapRepository configMapRepository;

    public ConfigMapService(ConfigMapRepository configMapRepository) {
        this.configMapRepository = configMapRepository;
    }

    @Override
    protected NamespaceObjectsRepository<V1ConfigMap> repository() {
        return configMapRepository;
    }

}

