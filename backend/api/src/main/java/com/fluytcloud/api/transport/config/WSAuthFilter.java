package com.fluytcloud.api.transport.config;

import io.quarkus.vertx.web.RouteFilter;
import io.vertx.ext.web.RoutingContext;
import jakarta.inject.Singleton;

@Singleton
public class WSAuthFilter {

    @RouteFilter(401)
    void addAuthHeader(RoutingContext rc) {
        try {
            if (rc.request().headers().get("Sec-WebSocket-Protocol") != null) {
                String token = "Bearer " + rc.request().headers().get("Sec-WebSocket-Protocol").split(", ")[1];
                rc.request().headers().add("Authorization", token);
            }
        } finally {
            rc.next();
        }
    }
}
