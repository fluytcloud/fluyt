package com.fluytcloud.kubernetes.repositories;

import com.fluytcloud.kubernetes.entities.TerminalRequest;
import com.fluytcloud.kubernetes.entities.TerminalResponse;

import java.util.function.Consumer;

public interface TerminalRepository {

    void open(TerminalRequest request);

    void subscribe(TerminalRequest request, Consumer<TerminalResponse> consumer);

    void exec(TerminalRequest request);

    void close(String context);

    boolean isSubscribe(String context);
}
