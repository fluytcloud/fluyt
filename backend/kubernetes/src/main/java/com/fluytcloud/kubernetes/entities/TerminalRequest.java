package com.fluytcloud.kubernetes.entities;

import java.util.Objects;

public record TerminalRequest(
        String context,
        Integer cluster,
        String namespace,
        String pod,
        String container,
        String command,
        Integer lines,
        Integer columns) {

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TerminalRequest that = (TerminalRequest) o;
        return Objects.equals(context, that.context);
    }

    @Override
    public int hashCode() {
        return Objects.hash(context);
    }
}
