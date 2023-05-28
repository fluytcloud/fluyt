package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.entities.TerminalRequest;
import com.fluytcloud.kubernetes.entities.TerminalResponse;
import com.fluytcloud.kubernetes.repositories.TerminalRepository;
import jakarta.enterprise.context.ApplicationScoped;

import java.util.function.Consumer;

@ApplicationScoped
public class TerminalService {

    private final TerminalRepository terminalRepository;

    public TerminalService(TerminalRepository terminalRepository) {
        this.terminalRepository = terminalRepository;
    }

    public void subscribe(TerminalRequest request, Consumer<TerminalResponse> consumer) {
        terminalRepository.subscribe(request, consumer);
    }

    public void exec(TerminalRequest request) {
        terminalRepository.exec(request);
    }

    public void close(String context) {
        terminalRepository.close(context);
    }

    public boolean isSubscribe(String context) {
        return terminalRepository.isSubscribe(context);
    }
}
