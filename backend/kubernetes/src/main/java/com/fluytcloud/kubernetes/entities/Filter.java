package com.fluytcloud.kubernetes.entities;

import java.util.List;
import java.util.Map;

public class Filter {
    private final Cluster cluster;
    private List<String> namespaces;
    private String search;
    private OwnerReference ownerReference;
    private Integer limit;
    private Map<String, String> selector;

    public Filter(Cluster cluster) {
        this.cluster = cluster;
    }

    public Cluster getCluster() {
        return cluster;
    }

    public List<String> getNamespaces() {
        return namespaces;
    }

    public Filter setNamespaces(List<String> namespaces) {
        this.namespaces = namespaces;
        return this;
    }

    public String getSearch() {
        return search;
    }

    public Filter setSearch(String search) {
        this.search = search;
        return this;
    }

    public OwnerReference getOwnerReference() {
        return ownerReference;
    }

    public Filter setOwnerReference(OwnerReference ownerReference) {
        this.ownerReference = ownerReference;
        return this;
    }

    public Integer getLimit() {
        return limit;
    }

    public Filter setLimit(Integer limit) {
        this.limit = limit;
        return this;
    }

    public Map<String, String> getSelector() {
        return selector;
    }

    public Filter setSelector(Map<String, String> selector) {
        this.selector = selector;
        return this;
    }
}
