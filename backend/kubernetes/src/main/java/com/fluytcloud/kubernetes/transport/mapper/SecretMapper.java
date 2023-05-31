package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.SecretResponseList;
import io.kubernetes.client.openapi.models.V1Secret;

import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;

public class SecretMapper implements Mapper<V1Secret, SecretResponseList> {

    @Override
    public SecretResponseList mapResponseList(V1Secret secret) {
        return new SecretResponseList(
                secret.getMetadata().getNamespace(),
                secret.getMetadata().getName(),
                getKeys(secret),
                secret.getType(),
                KubernetesMapper.formatAge(secret.getMetadata().getCreationTimestamp())
        );
    }

    private String getKeys(V1Secret secret) {
        Set<String> keysMap = new HashSet<>();
        if (Objects.nonNull(secret.getData())) {
            keysMap.addAll(secret.getData().keySet());
        }
        if (Objects.nonNull(secret.getStringData())) {
            keysMap.addAll(secret.getStringData().keySet());
        }
        return String.join(",", keysMap);
    }

    @Override
    public List<SecretResponseList> mapResponseList(List<V1Secret> secrets) {
        return secrets.stream()
                .map(this::mapResponseList)
                .toList();
    }
}
