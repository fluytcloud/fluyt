package com.fluytcloud.kubernetes.transport.websocket;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fluytcloud.kubernetes.entities.TerminalRequest;
import com.fluytcloud.kubernetes.entities.TerminalResponse;
import com.fluytcloud.kubernetes.interactors.TerminalService;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.websocket.*;
import jakarta.websocket.server.PathParam;
import jakarta.websocket.server.ServerEndpoint;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@ServerEndpoint("/kubernetes/pod/terminal/{context}")
@ApplicationScoped
public class TerminalEndpoint {

    private final TerminalService terminalService;
    private final ObjectMapper objectMapper;
    private final Map<String, Session> sessions = new ConcurrentHashMap<>();

    public TerminalEndpoint(TerminalService terminalService, ObjectMapper objectMapper) {
        this.terminalService = terminalService;
        this.objectMapper = objectMapper;
    }

    @OnOpen
    public void onOpen(Session session, @PathParam("context") String context) {
        sessions.put(context, session);
    }

    @OnClose
    public void onClose(Session session, @PathParam("context") String context) {
        sessions.remove(context);
        terminalService.close(context);
    }

    @OnError
    public void onError(Session session, @PathParam("context") String context, Throwable throwable) {
        sessions.get(context).getAsyncRemote().sendObject(new TerminalResponse(context, throwable.getMessage()));
        sessions.remove(context);
        terminalService.close(context);
    }

    @OnMessage
    public void onMessage(String message, @PathParam("context") String context) throws JsonProcessingException {
        var request = objectMapper.readValue(message, TerminalRequest.class);
        if (!terminalService.isSubscribe(context)) {
            terminalService.subscribe(request, response -> {
                try {
                    sessions.get(context).getAsyncRemote().sendObject(objectMapper.writeValueAsString(response));
                } catch (JsonProcessingException e) {
                    sessions.get(context).getAsyncRemote().sendObject(e.getMessage());
                }
            });
        } else {
            terminalService.exec(request);
        }
    }
}
