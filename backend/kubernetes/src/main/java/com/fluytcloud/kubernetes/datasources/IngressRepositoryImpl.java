package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.Search;
import com.fluytcloud.kubernetes.repositories.IngressRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.models.V1Ingress;
import io.kubernetes.client.openapi.models.V1IngressList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.enterprise.context.ApplicationScoped;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class IngressRepositoryImpl extends NamespaceObjectRepositoryImpl<V1Ingress> implements IngressRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger(IngressRepositoryImpl.class.getName());

    @Override
    protected List<V1Ingress> listByNamespace(Cluster cluster, Search search) throws ApiException {
        var networkingApi = new Connection(cluster).getNetworkingApi();
        return Optional.ofNullable(
                        networkingApi.listNamespacedIngress(
                                search.getNamespace(),
                                search.getPretty(),
                                search.getAllowWatchBookmarks(),
                                search.get_continue(),
                                search.getFieldSelector(),
                                search.getLabelSelector(),
                                search.getLimit(),
                                search.getResourceVersion(),
                                search.getResourceVersionMatch(),
                                search.getTimeoutSeconds(),
                                search.getWatch()
                        ))
                .map(V1IngressList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected List<V1Ingress> listByAllNamespace(Cluster cluster, Search search) throws ApiException {
        var networkingApi = new Connection(cluster).getNetworkingApi();
        return Optional.ofNullable(
                        networkingApi.listIngressForAllNamespaces(
                                search.getAllowWatchBookmarks(),
                                search.get_continue(),
                                search.getFieldSelector(),
                                search.getLabelSelector(),
                                search.getLimit(),
                                search.getPretty(),
                                search.getResourceVersion(),
                                search.getResourceVersionMatch(),
                                search.getTimeoutSeconds(),
                                search.getWatch()
                        ))
                .map(V1IngressList::getItems)
                .orElse(Collections.emptyList());
    }

    @Override
    protected V1Ingress readObject(Cluster cluster, String namespace, String name) throws ApiException {
        var networkingApi = new Connection(cluster).getNetworkingApi();
        return networkingApi.readNamespacedIngress(name, namespace, null);
    }

    @Override
    public V1Ingress apply(Cluster cluster, V1Ingress object) {
        try {
            var networkingApi = new Connection(cluster).getNetworkingApi();
            return networkingApi.replaceNamespacedIngress(
                    object.getMetadata().getName(),
                    object.getMetadata().getNamespace(),
                    object,
                    null,
                    null,
                    null,
                    null
            );
        } catch (Exception e) {
            LOGGER.error("error...", e);
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(Cluster cluster, String namespace, String name) {
        try {
            var networkingApi = new Connection(cluster).getNetworkingApi();
            networkingApi.deleteNamespacedIngress(
                    name,
                    namespace,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null
            );
        } catch (Exception e) {
            LOGGER.error("error...", e);
            throw new RuntimeException(e);
        }
    }

}