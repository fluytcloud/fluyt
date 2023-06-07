package com.fluytcloud.scm.datasources.github.data;

import com.fasterxml.jackson.annotation.JsonProperty;

public record RepositoryContentResponse(
        String type,
        String encoding,
        Long size,
        String name,
        String path,
        String content,
        String sha,
        String url,
        @JsonProperty("git_url")
        String gitUrl,
        @JsonProperty("html_url")
        String htmlUrl,
        @JsonProperty("download_url")
        String downloadUrl
) {
}
