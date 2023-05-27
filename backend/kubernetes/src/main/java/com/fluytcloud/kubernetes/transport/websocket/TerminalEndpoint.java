package com.fluytcloud.kubernetes.transport.websocket;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fluytcloud.auth.interactors.UserInfoService;
import com.fluytcloud.core.entities.UserInfoContext;
import com.fluytcloud.kubernetes.config.websocket.WebSocketSecurityConfigurator;
import com.fluytcloud.kubernetes.entities.TerminalRequest;
import com.fluytcloud.kubernetes.entities.TerminalResponse;
import com.fluytcloud.kubernetes.interactors.TerminalService;
import io.quarkus.security.Authenticated;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.websocket.*;
import jakarta.websocket.server.PathParam;
import jakarta.websocket.server.ServerEndpoint;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Authenticated
@ServerEndpoint(value = "/kubernetes/pod/terminal/{context}", configurator = WebSocketSecurityConfigurator.class)
@ApplicationScoped
public class TerminalEndpoint {

    private final TerminalService terminalService;
    private final ObjectMapper objectMapper;
    private final UserInfoService userInfoService;
    private final Map<String, Session> sessions = new ConcurrentHashMap<>();

    public TerminalEndpoint(TerminalService terminalService, ObjectMapper objectMapper, UserInfoService userInfoService) {
        this.terminalService = terminalService;
        this.objectMapper = objectMapper;
        this.userInfoService = userInfoService;
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
        userInfoService.get().ifPresent(UserInfoContext::setCurrentTenant);

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
