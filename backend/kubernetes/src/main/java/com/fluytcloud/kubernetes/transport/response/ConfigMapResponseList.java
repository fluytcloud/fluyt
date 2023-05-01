package com.fluytcloud.kubernetes.transport.response;

public record ConfigMapResponseList(String name, String namespace, String keys, String age) {
}
