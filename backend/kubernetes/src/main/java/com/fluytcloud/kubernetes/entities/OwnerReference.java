package com.fluytcloud.kubernetes.entities;

import java.util.List;

public record OwnerReference(List<String> owners) {

}
