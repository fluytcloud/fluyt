package com.fluytcloud.kubernetes.entities;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

public class Search {

    private String namespace;
    private Boolean allowWatchBookmarks;
    private String _continue;
    private Map<String, String> fieldSelector = new HashMap<>();
    private Map<String, String> labelSelector = new HashMap<>();
    private Integer limit;
    private String pretty;
    private String resourceVersion;
    private String resourceVersionMatch;
    private Integer timeoutSeconds;
    private Boolean watch = Boolean.FALSE;

    public String getNamespace() {
        return namespace;
    }

    public Search setNamespace(String namespace) {
        this.namespace = namespace;
        return this;
    }

    public Boolean getAllowWatchBookmarks() {
        return allowWatchBookmarks;
    }

    public Search setAllowWatchBookmarks(Boolean allowWatchBookmarks) {
        this.allowWatchBookmarks = allowWatchBookmarks;
        return this;
    }

    public String get_continue() {
        return _continue;
    }

    public Search set_continue(String _continue) {
        this._continue = _continue;
        return this;
    }

    public Search putFieldSelector(String key, String value) {
        this.fieldSelector.put(key, value);
        return this;
    }

    public String getFieldSelector() {
        return fieldSelector.entrySet().stream()
                .map(field -> field.getKey() + "=" + field.getValue())
                .collect(Collectors.joining(","));
    }

    public Search setFieldSelector(Map<String, String> fieldSelector) {
        this.fieldSelector = fieldSelector;
        return this;
    }

    public Search putLabelSelector(String key, String value) {
        this.labelSelector.put(key, value);
        return this;
    }

    public String getLabelSelector() {
        return labelSelector.entrySet().stream()
                .map(field -> field.getKey() + "=" + field.getValue())
                .collect(Collectors.joining(","));
    }

    public Search setLabelSelector(Map<String, String> labelSelector) {
        this.labelSelector = labelSelector;
        return this;
    }

    public Integer getLimit() {
        return limit;
    }

    public Search setLimit(Integer limit) {
        this.limit = limit;
        return this;
    }

    public String getPretty() {
        return pretty;
    }

    public Search setPretty(String pretty) {
        this.pretty = pretty;
        return this;
    }

    public String getResourceVersion() {
        return resourceVersion;
    }

    public Search setResourceVersion(String resourceVersion) {
        this.resourceVersion = resourceVersion;
        return this;
    }

    public String getResourceVersionMatch() {
        return resourceVersionMatch;
    }

    public Search setResourceVersionMatch(String resourceVersionMatch) {
        this.resourceVersionMatch = resourceVersionMatch;
        return this;
    }

    public Integer getTimeoutSeconds() {
        return timeoutSeconds;
    }

    public Search setTimeoutSeconds(Integer timeoutSeconds) {
        this.timeoutSeconds = timeoutSeconds;
        return this;
    }

    public Boolean getWatch() {
        return watch;
    }

    public Search setWatch(Boolean watch) {
        this.watch = watch;
        return this;
    }
}
