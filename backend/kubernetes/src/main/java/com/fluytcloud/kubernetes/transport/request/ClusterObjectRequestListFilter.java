package com.fluytcloud.kubernetes.transport.request;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import jakarta.validation.constraints.NotNull;
import jakarta.ws.rs.QueryParam;
import org.apache.commons.lang3.StringUtils;

import java.util.*;

public class ClusterObjectRequestListFilter {

    @QueryParam("clusterId")
    @NotNull
    private Integer clusterId;

    @QueryParam("name")
    private String name;

    @QueryParam("labelSelector")
    private String labelSelector;

    @QueryParam("owner")
    private String owner;

    public Integer getClusterId() {
        return clusterId;
    }

    public String getName() {
        return name;
    }

    public Map<String, String> getLabelSelector() {
        if (StringUtils.isNotBlank(labelSelector)) {
            String start = "";
            String end = "";
            if (!labelSelector.startsWith("{")) {
                start = "{";
            }

            if (!labelSelector.endsWith("}")) {
                end = "}";
            }

            var formattedLabel = start + labelSelector + end;
            return new Gson().fromJson(formattedLabel, new TypeToken<Map<String, Object>>(){}.getType());
        }

        return null;
    }

    public List<String> getOwners() {
        if (Objects.nonNull(owner) && !owner.isEmpty()) {
            return Arrays.stream(owner.split(",")).toList();
        }
        return Collections.emptyList();
    }
}
