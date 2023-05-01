package com.fluytcloud.auth.datasources.keycloak;

import org.keycloak.OAuth2Constants;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.KeycloakBuilder;
import org.keycloak.admin.client.resource.RealmResource;

public class KeycloakConnection {

    private final RealmResource realmResource;

    public KeycloakConnection() {
        // todo ler url do keycloak das properties
        Keycloak keycloak = KeycloakBuilder.builder()
                .serverUrl("http://localhost:18080")
                .realm("fluyt")
                .grantType(OAuth2Constants.CLIENT_CREDENTIALS)
                .clientId("app-backend")
                .clientSecret("PmqhRiH6UVcsGp1P67OgO23PWRKasfJu")
                .build();
        realmResource = keycloak.realm("fluyt");
    }

    public RealmResource getRealmResource() {
        return realmResource;
    }

}
