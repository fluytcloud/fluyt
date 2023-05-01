package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Filter;
import io.kubernetes.client.common.KubernetesObject;
import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;
import java.util.function.Predicate;
import java.util.stream.Stream;

public class Util {

    private static final int BUFFER_SIZE = 4096;

    private Util() {
    }

    public static <T extends KubernetesObject> List<T> filter(List<T> list, Filter filter) {
        if (StringUtils.isBlank(filter.getSearch()) && Objects.isNull(filter.getOwnerReference())) {
            return list;
        }

        List<Predicate<KubernetesObject>> filters = new LinkedList<>();
        filters.add(kubernetesObject -> Objects.nonNull(kubernetesObject.getMetadata()));
        filters.add(kubernetesObject -> Objects.nonNull(kubernetesObject.getMetadata().getName()));

        if (StringUtils.isNoneBlank(filter.getSearch())) {
            filters.add(kubernetesObject -> filter.getSearch().contains(kubernetesObject.getMetadata().getName()));
        }

        if (Objects.nonNull(filter.getOwnerReference())) {
            var ownerFilter = (Predicate<KubernetesObject>) k8sObject -> k8sObject.getMetadata().getOwnerReferences()
                    .stream()
                    .anyMatch(it ->
                            it.getKind().equals(filter.getOwnerReference().workdloadType().getLabel())
                                    && it.getName().equalsIgnoreCase(filter.getOwnerReference().owner())
                    );
            filters.add(ownerFilter);
        }

        Stream<T> stream = list.stream();
        for (Predicate<KubernetesObject> kubernetesObjectPredicate : filters) {
            stream = stream.filter(kubernetesObjectPredicate);
        }

        return stream.toList();
    }

    public static void copy(InputStream in, OutputStream... out) throws IOException {
        byte[] buffer = new byte[BUFFER_SIZE];
        int bytesRead;
        while ((bytesRead = in.read(buffer)) != -1) {
            for (OutputStream outputStream : out) {
                if (outputStream != null) {
                    outputStream.write(buffer, 0, bytesRead);
                }
            }
        }
        for (OutputStream outputStream : out) {
            if (outputStream != null)
                outputStream.flush();
        }
    }
}
