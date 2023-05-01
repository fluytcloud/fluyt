package com.fluytcloud.security.interactors;

import io.quarkus.oidc.runtime.OidcJwtCallerPrincipal;
import io.quarkus.security.identity.SecurityIdentity;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;

@ApplicationScoped
public class SessionService {

    @Inject
    SecurityIdentity securityIdentity;

    public String getSessionId() {
        return ((OidcJwtCallerPrincipal) securityIdentity.getPrincipal())
                .getClaim("session_state").toString();
    }

}
