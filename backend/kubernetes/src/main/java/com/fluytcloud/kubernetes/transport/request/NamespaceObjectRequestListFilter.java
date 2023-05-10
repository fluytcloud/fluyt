package com.fluytcloud.kubernetes.transport.request;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.apache.commons.lang3.StringUtils;

import javax.validation.constraints.NotNull;
import javax.ws.rs.QueryParam;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

public class NamespaceObjectRequestListFilter {

    @QueryParam("clusterId")
    @NotNull
    private Integer clusterId;

    @QueryParam("namespaces")
    private List<String> namespaces;

    @QueryParam("name")
    private String name;

    @QueryParam("labelSelector")
    private String labelSelector;

    public Integer getClusterId() {
        return clusterId;
    }

    public List<String> getNamespaces() {
        return namespaces;
    }

    public String getName() {
        return name;
    }

    public Map<String, String> getLabelSelector() {
        if (StringUtils.isNotBlank(labelSelector)) {
            var formattedLabel = "{" + labelSelector + "}";
            return new Gson().fromJson(formattedLabel, new TypeToken<Map<String, Object>>(){}.getType());
        }

        return null;
    }

}
