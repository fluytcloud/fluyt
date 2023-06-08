package com.fluytcloud.kubernetes.transport.request;

import jakarta.validation.constraints.NotNull;
import jakarta.ws.rs.QueryParam;

import java.util.List;

public class OverviewRequestFilter {

    @QueryParam("clusterId")
    @NotNull
    private Integer clusterId;

    @QueryParam("namespaces")
    @NotNull
    private List<String> namespaces;

    public Integer getClusterId() {
        return clusterId;
    }

    public List<String> getNamespaces() {
        return namespaces;
    }

}
