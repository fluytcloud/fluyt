package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.Cluster;
import com.fluytcloud.kubernetes.entities.ConnectionType;
import io.kubernetes.client.Metrics;
import io.kubernetes.client.openapi.ApiClient;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.openapi.apis.*;
import io.kubernetes.client.openapi.models.V1Pod;
import io.kubernetes.client.util.Config;

import javax.annotation.Nonnull;
import java.io.IOException;
import java.util.Objects;

public class Connection {

    private final ApiClient apiClient;

    public Connection(@Nonnull Cluster cluster) {
        Objects.requireNonNull(cluster);

        if (ConnectionType.TOKEN.equals(cluster.connectionType())) {
            apiClient = Config.fromToken(
                    cluster.url(),
                    cluster.token(),
                    cluster.validateSSL()
            );
        } else if (ConnectionType.BASIC.equals(cluster.connectionType())) {
            apiClient = Config.fromUserPassword(
                    cluster.url(),
                    cluster.username(),
                    cluster.password()
            );
        } else {
            try {
                apiClient = Config.defaultClient();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public AppsV1Api getAppsV1Api() {
        return new AppsV1Api(apiClient);
    }

    public CoreV1Api getCoreApi() {
        return new CoreV1Api(apiClient);
    }

    public RbacAuthorizationV1Api getRbacAuthorizationApi() {
        return new RbacAuthorizationV1Api(apiClient);
    }

    public BatchV1Api getBatchApi() {
        return new BatchV1Api(apiClient);
    }

    public AutoscalingV2Api getAutoscalingApi() {
        return new AutoscalingV2Api(apiClient);
    }

    public Metrics getMetrics() {
        return new Metrics(apiClient);
    }

    public NetworkingV1Api getNetworkingApi() {
        return new NetworkingV1Api(apiClient);
    }

    public StorageV1Api getStorageApi() {
        return new StorageV1Api(apiClient);
    }

    public ApiextensionsV1Api getApiextensionsApi() {
        return new ApiextensionsV1Api(apiClient);
    }

    public CustomObjectsApi getCustomObjectsApi() {
        return new CustomObjectsApi(apiClient);
    }

    public static void main(String[] args) throws IOException, ApiException {
        var cluster = new Cluster(
                1,
                "Local",
                ConnectionType.DEFAULT,
                null,
                null,
                null,
                null,
                false
        );

        var connection = new Connection(cluster);
        var pods = connection.getCoreApi().listNamespacedPod(
                "default",
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null
        );
        for (V1Pod item : pods.getItems()) {
            System.out.println(item.getMetadata().getName());
        }
    }

}
