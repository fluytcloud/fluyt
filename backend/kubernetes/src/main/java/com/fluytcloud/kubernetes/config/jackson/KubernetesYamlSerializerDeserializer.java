package com.fluytcloud.kubernetes.config.jackson;

import io.kubernetes.client.util.Yaml;

public class KubernetesYamlSerializerDeserializer {

    public static String serializeToYaml(Object object) {
        return Yaml.dump(object);
    }

    public static <T> T deserializeFromYaml(String content, Class<T> clazz) {
        return Yaml.loadAs(content, clazz);
    }
}
