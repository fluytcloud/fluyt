package com.fluytcloud.kubernetes.config.jackson;

import io.kubernetes.client.common.KubernetesObject;
import io.kubernetes.client.util.Yaml;

public class KubernetesYamlSerializerDeserializer {

    public static String serializeToYaml(Object object) {

        try {
            var status = object.getClass().getDeclaredField("status");
            status.setAccessible(true);
            status.set(object, null);
        } catch (ReflectiveOperationException e) {
            throw new RuntimeException(e);
        }

        ((KubernetesObject) object).getMetadata().setManagedFields(null);
        return Yaml.dump(object);
    }

    public static <T> T deserializeFromYaml(String content, Class<T> clazz) {
        return Yaml.loadAs(content, clazz);
    }
}
