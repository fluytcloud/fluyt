package com.fluytcloud.kubernetes.datasources;

import io.kubernetes.client.util.Streams;

import java.io.Closeable;
import java.io.IOException;
import java.io.OutputStream;
import java.util.function.Consumer;

public class TerminalProcessConsumer implements Runnable, Closeable {

    private final Process process;

    private final Consumer<String> consumer;

    private boolean running = true;

    public TerminalProcessConsumer(Process process, Consumer<String> consumer) {
        this.process = process;
        this.consumer = consumer;
    }

    @Override
    public void close() {
        running = false;
        process.destroy();
    }

    @Override
    public void run() {
        while (running) {
            try {
                Streams.copy(process.getInputStream(), new OutputStream() {
                    @Override
                    public void write(int b) throws IOException {
                        consumer.accept(String.valueOf((char) b));
                    }
                });
            } catch (IOException e) {
                consumer.accept(e.getMessage());
                close();
            }
        }
    }

    public Process getProcess() {
        return process;
    }

    public Consumer<String> getConsumer() {
        return consumer;
    }
}
