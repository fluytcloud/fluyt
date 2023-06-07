package com.fluytcloud.scm.datasources.github.data;

import com.fasterxml.jackson.annotation.JsonProperty;

public record CreateRepositoryRequest(
        String name,
        String description,
        @JsonProperty("private")
        Boolean isPrivate
) {
}
