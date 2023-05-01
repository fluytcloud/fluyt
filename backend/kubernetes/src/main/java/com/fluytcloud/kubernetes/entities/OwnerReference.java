package com.fluytcloud.kubernetes.entities;

public record OwnerReference(String owner, WorkdloadType workdloadType) {
}
