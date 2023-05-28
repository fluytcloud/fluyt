package com.fluytcloud.kubernetes.datasources;

import com.fluytcloud.kubernetes.entities.TerminalRequest;
import com.fluytcloud.kubernetes.entities.TerminalResponse;
import com.fluytcloud.kubernetes.repositories.ClusterRepository;
import com.fluytcloud.kubernetes.repositories.TerminalRepository;
import io.kubernetes.client.openapi.ApiException;
import io.kubernetes.client.util.Streams;
import jakarta.enterprise.context.ApplicationScoped;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.function.Consumer;

@ApplicationScoped
public class TerminalRepositoryImpl implements TerminalRepository {

    private final ClusterRepository clusterRepository;
    private final ExecutorService executorService = Executors.newFixedThreadPool(100);
    private final Map<TerminalRequest, TerminalProcessConsumer> consumers = new ConcurrentHashMap<>();

    public TerminalRepositoryImpl(ClusterRepository clusterRepository) {
        this.clusterRepository = clusterRepository;
    }

    @Override
    public void subscribe(TerminalRequest request, Consumer<TerminalResponse> consumer) {
        try {
            var cluster = clusterRepository.findById(request.cluster()).orElseThrow();
            var exec = new Connection(cluster).getExec();

            var process = exec.exec(request.namespace(), request.pod(), new String[]{request.command()}, request.container(), true, true);

            var processConsumer = new TerminalProcessConsumer(process, message -> {
                var response = new TerminalResponse(request.context(), message);
                consumer.accept(response);
            });

            consumers.put(request, processConsumer);

            executorService.execute(processConsumer);
        } catch (ApiException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void exec(TerminalRequest request) {
        var processConsumer = consumers.get(request);
        var inputStream = new ByteArrayInputStream(request.command().getBytes(StandardCharsets.UTF_8));
        var outputStream = processConsumer.getProcess().getOutputStream();
        try {
            Streams.copy(inputStream, outputStream);
        } catch (IOException e) {
            processConsumer.getConsumer().accept(e.getMessage());
            close(request.context());
        }
    }

    @Override
    public void close(String context) {
        var request = consumers.keySet().stream().filter(e -> e.context().equals(context)).findAny();
        if (request.isEmpty()) {
            return;
        }
        var processConsumer = consumers.get(request.get());
        consumers.remove(request.get());
        processConsumer.close();
    }

    @Override
    public boolean isSubscribe(String context) {
        return consumers.keySet().stream().anyMatch(e -> e.context().equals(context));
    }
}
