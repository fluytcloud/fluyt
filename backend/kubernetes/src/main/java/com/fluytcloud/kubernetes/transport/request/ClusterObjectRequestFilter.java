package com.fluytcloud.kubernetes.transport.request;

import jakarta.validation.constraints.NotNull;
import jakarta.ws.rs.QueryParam;

public class ClusterObjectRequestFilter {

    @QueryParam("clusterId")
    @NotNull
    private Integer clusterId;

    @QueryParam("name")
    @NotNull
    private String name;

    public Integer getClusterId() {
        return clusterId;
    }

    public String getName() {
        return name;
    }
}
