import { KeycloakService } from "keycloak-angular";
import {environment} from "../../../environments/environment";

export function initializeKeycloak(
  keycloak: KeycloakService
) {
  return () =>
    keycloak.init({
      config: {
        url: environment.keycloak,
        realm: 'fluyt',
        clientId: 'app-web',
      }, initOptions: {
        pkceMethod: 'S256',
        redirectUri: 'http://localhost:4200/',
        checkLoginIframe: false
      }
    });
}
