package com.fluytcloud.kubernetes.transport.request;

import javax.validation.constraints.NotNull;
import javax.ws.rs.QueryParam;
import java.util.List;

public class NamespaceObjectRequestListFilter {

    @QueryParam("clusterId")
    @NotNull
    private Integer clusterId;

    @QueryParam("namespaces")
    private List<String> namespaces;

    @QueryParam("name")
    private String name;

    public Integer getClusterId() {
        return clusterId;
    }

    public List<String> getNamespaces() {
        return namespaces;
    }

    public String getName() {
        return name;
    }
}
