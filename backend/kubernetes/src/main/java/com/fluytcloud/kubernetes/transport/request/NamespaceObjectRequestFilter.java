package com.fluytcloud.kubernetes.transport.request;

import jakarta.validation.constraints.NotNull;
import jakarta.ws.rs.QueryParam;

public class NamespaceObjectRequestFilter {

    @QueryParam("clusterId")
    @NotNull
    private Integer clusterId;

    @QueryParam("namespace")
    @NotNull
    private String namespace;

    @QueryParam("name")
    @NotNull
    private String name;

    public Integer getClusterId() {
        return clusterId;
    }

    public String getNamespace() {
        return namespace;
    }

    public String getName() {
        return name;
    }
}
