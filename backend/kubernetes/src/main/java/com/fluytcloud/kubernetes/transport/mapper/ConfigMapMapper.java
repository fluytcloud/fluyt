package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.ConfigMapResponseList;
import io.kubernetes.client.openapi.models.V1ConfigMap;
import org.ocpsoft.prettytime.PrettyTime;

import java.time.OffsetDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;

public class ConfigMapMapper {

    public ConfigMapResponseList mapResponseList(V1ConfigMap configMap) {
        return new ConfigMapResponseList(
                configMap.getMetadata().getName(),
                configMap.getMetadata().getNamespace(),
                getKeys(configMap),
                getAge(configMap.getMetadata().getCreationTimestamp())
        );
    }

    private String getKeys(V1ConfigMap configMap) {
        Set<String> keysMap = new HashSet<>();
        if (Objects.nonNull(configMap.getData())) {
            keysMap.addAll(configMap.getData().keySet());
        }
        if (Objects.nonNull(configMap.getBinaryData())) {
            keysMap.addAll(configMap.getBinaryData().keySet());
        }
        return String.join(",", keysMap);
    }

    private String getAge(OffsetDateTime dateTime) {
        PrettyTime prettyTime = new PrettyTime();
        return prettyTime.format(dateTime);
    }

    public List<ConfigMapResponseList> mapResponseList(List<V1ConfigMap> configMaps) {
        return configMaps.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
